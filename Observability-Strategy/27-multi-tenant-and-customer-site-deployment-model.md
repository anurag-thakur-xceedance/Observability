---
title: Multi-Tenant and Customer-Site Deployment Model
chapter: 27
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 27. Multi-Tenant and Customer-Site Deployment Model

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](26-service-onboarding-and-instrumentation-kits.md) | [Next Page](28-observability-non-functional-requirements.md)

| **Document Owner** | CoE-Architecture |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **First Review** | 1-Aug-2026 |
| **Next Review Due** | 1-Nov-2026 |

---

## 27.1 Deployment Topologies

### 27.1.1 Topology A — Single-Tenant On-Premise at Customer Site
```
[Customer-managed network]
   ┌──────────────────────────────────────────┐
   │  Customer Site                           │
   │  ┌────────────────────────────────────┐  │
   │  │ Customer Services (instrumented)   │  │
   │  └─────────────┬──────────────────────┘  │
   │                │ OTLP                    │
   │  ┌─────────────▼──────────────────────┐  │
   │  │ Observability Stack (per [Chapter 3]) │  │
   │  │ - OTel Collector edge + gateway    │  │
   │  │ - Prometheus, Loki, Tempo          │  │
   │  │ - Grafana                          │  │
   │  │ - Alertmanager                     │  │
   │  └─────────────┬──────────────────────┘  │
   │                │ (optional, redacted)    │
   └────────────────┼─────────────────────────┘
                    │ TLS + mTLS + bearer
                    ▼
   ┌──────────────────────────────────────────┐
   │  Xceedance Central Aggregation           │
   │  (tenant-scoped read; no PII)            │
   └──────────────────────────────────────────┘
```
- Telemetry **never leaves the customer site** by default.
- Only redacted, aggregated signals flow upstream if contractually allowed.
- Customer holds the keys (encryption-at-rest with customer-managed KMS).

### 27.1.2 Topology B — Xceedance-Hosted Multi-Tenant (Shared Stack)
```
[Xceedance shared cloud / colo]
   ┌──────────────────────────────────────────┐
   │  Tenant-A services    Tenant-B services  │
   │       │                    │             │
   │       └──────┬─────────────┘             │
   │              │ OTLP + tenant token        │
   │  ┌───────────▼────────────────────────┐  │
   │  │ Observability Stack — multi-tenant │  │
   │  │ - Gateway: tag X-Scope-OrgID       │  │
   │  │ - Loki / Mimir / Tempo: tenant-aware│ │
   │  │ - Grafana: per-tenant org/folder   │  │
   │  └────────────────────────────────────┘  │
   └──────────────────────────────────────────┘
```
- Tenancy is enforced **in the gateway** (auth → tenant ID → header injection).
- Storage backends are tenant-aware (`X-Scope-OrgID` for Loki/Mimir/Tempo).
- Cross-tenant queries are blocked at Grafana data-source level.

### 27.1.3 Topology C — Hybrid (Customer-Site + Xceedance Aggregation)
- Customer-site stack handles all PII-bearing telemetry.
- Per-tenant redacted aggregates are forwarded (Prometheus remote-write, Loki Promtail with redaction, sampled traces).
- Xceedance central tier is a "service-of-services" view across the customer estate.

## 27.2 Tenant Identity Model

| Element | Definition | Example |
|---|---|---|
| **Tenant ID** | Stable customer identifier | `customer-acme` |
| **Tenant Class** | Operational profile | `tenant_class=enterprise` / `mid` / `smb` |
| **Tenant Region** | Data-residency anchor | `eu-west-1`, `us-east-1`, `in-south-1` |
| **Environment** | Within-tenant boundary | `prod`, `uat`, `dev` |
| **Service** | Workload-level | `quote-engine` |
| **Team** | Owner | `quote-platform` |
| **Tier** | Service criticality | `T1` |

Required resource attributes on every span / metric / log:
```
service.name, service.version, deployment.environment, team, tier, tenant_id, tenant_class, region
```

## 27.3 Tenant Labelling Enforcement
Three layers of defence:
1. **SDK / kit defaults** ([Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md)) inject required attributes from environment.
2. **Edge OTel Collector** rejects telemetry missing required attributes (using `attributes/required` processor pattern).
3. **Gateway OTel Collector** overrides client-supplied tenant_id with the tenant ID derived from the authenticated bearer token / mTLS cert (defence against client-side tampering).

```yaml
processors:
  attributes/required_tenant:
    actions:
      - key: tenant_id
        action: extract
        from_attribute: auth.tenant   # gateway-injected from auth
      - key: tenant_id
        action: upsert  # forces server-side value
```

## 27.4 Per-Tenant Data Isolation Guarantees

| Layer | Mechanism | Guarantee |
|---|---|---|
| Auth | OIDC / mTLS with tenant-bound credentials | Cannot impersonate another tenant |
| Ingest | Gateway injects authoritative tenant_id | Cannot inject false tenant ID |
| Storage | `X-Scope-OrgID` per tenant in Loki/Mimir/Tempo | Tenant data physically separated |
| Query | Grafana data source per tenant org; org-scoped folders | UI cannot read across tenants |
| Backup | Object-storage prefix per tenant; per-tenant lifecycle policies | Backup boundaries respected |
| Encryption | Tenant-specific KMS key for restricted classifications | Cryptographic isolation |
| Audit | Audit events tagged with tenant_id | Auditable per tenant |

## 27.5 Data-Residency
- Telemetry stores in tenant region by default.
- Cross-region replication only for DR within the same residency boundary unless contractually allowed.
- Customer-site Topology A is the strongest residency posture.
- Egress allow-list ([Chapter 24. Observability Platform Security Architecture -> Section 24.8 Egress and Data-Residency Controls](24-observability-platform-security-architecture.md#248-egress-and-data-residency-controls)) blocks unauthorised cross-border transfer.

## 27.6 Trace Continuity Across Customer / Xceedance Boundary

W3C Trace Context (`traceparent`, `tracestate`) is propagated across the boundary, but with redaction.

```
Customer-site service A                         Xceedance service B
  │  span: process_quote                        │
  │  attrs: customer.ssn=*** (redacted at edge) │
  ├──HTTP─traceparent: 00-<trace_id>-<span_id>──▶
  │                                             │  span: rate_lookup
  │                                             │  attrs: tenant_id=customer-acme
  │  tracestate: tenant=customer-acme;          │
  │              residency=eu                   │
```

Rules:
- Trace IDs are preserved end-to-end (joinable by `trace_id` in both stores).
- Span attributes containing PII are redacted **at customer-site edge collector** before export.
- `tracestate` carries tenant and residency hints so Xceedance Tempo applies correct routing.
- Sampling decisions made at customer site are honoured downstream (`parentbased_traceidratio`).

## 27.7 Per-Customer-Site DR
| Pattern | Use Case | RTO | RPO |
|---|---|---|---|
| **Local snapshot + restore** | Customer-site standalone | ≤ 4 h | ≤ 1 h |
| **Cross-region within residency** | Regulated tenants requiring HA | ≤ 30 min | ≤ 5 min |
| **Forward-only to Xceedance central** | Loss-tolerant tenants | ≤ 24 h (rebuild from last forward) | varies |

DR runbook per customer site is templated and parameterised in [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md).

## 27.8 Operational Boundaries (Who Operates What)
| Component | Customer site | Xceedance shared |
|---|---|---|
| Deployment stack lifecycle | Xceedance Platform Engineering (with customer change-window approval) | Xceedance Platform Engineering |
| Configuration changes | Xceedance, via Git PR + customer change board | Xceedance, via Git PR + ARB |
| Dashboard authoring | Xceedance + customer (per RBAC) | Xceedance |
| Alert authoring | Xceedance authors; customer reviews | Xceedance |
| On-call | Xceedance follow-the-sun; customer escalation contact | Xceedance |
| Audit / access review | Customer infosec quarterly review | Xceedance ARB quarterly |

## 27.9 Tenant Onboarding Checklist
| Step | Owner |
|---|---|
| Tenant registered (ID, class, region, residency) | Platform Engineering |
| Auth credentials issued (mTLS cert / bearer token) | Security |
| Tenant-scoped Grafana org and folders created | Platform Engineering |
| Per-tenant retention overrides recorded | Data Governance |
| Per-tenant KMS key provisioned (if required) | Security |
| Per-tenant runbook escalation contacts captured | SRE |
| First service onboarded per [Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md) | Service Owner |
| Tenant-scoped dashboard reviewed with customer | Customer Operations + Customer |

## 27.10 Cross-References
- [Chapter 3. Observability Reference Architecture](03-observability-reference-architecture.md) — base topology.
- [Chapter 18. Application Telemetry Standard](18-application-telemetry-standard.md) — required tenant attributes on telemetry.
- [Chapter 20. Observability Data Model Specification](20-observability-data-model-specification.md) — `tenant_class`, `tenant_id` namespace.
- [Chapter 22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md) — DR patterns, including customer-site DR.
- [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) — auth, encryption, egress controls.
- [Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md) — kit injection of tenant attributes.

---

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](26-service-onboarding-and-instrumentation-kits.md) | [Next Page](28-observability-non-functional-requirements.md)
