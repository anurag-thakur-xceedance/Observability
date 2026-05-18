---
title: Observability Reference Architecture
chapter: 2
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 2. Observability Reference Architecture

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 1. Architectural Principles
- **Centralised Data Collection.** All telemetry consolidated in a unified platform to break down silos and enable cross-pillar correlation.
- **Open Standards.** Vendor-neutral instrumentation (OpenTelemetry) to avoid lock-in and simplify integration.
- **Tool Selection.** Grafana selected as primary visualization and alerting tool based on scalability, ease of use, and cost.
- **Host-Portable Delivery.** Same Docker Compose definition runs on any Linux/Windows host with Docker Engine — on-prem, customer site, or cloud VM.
- **Single Pane of Glass.** Unified view across infra, application, and business layers.
- **Reproducible Deployment.** PowerShell-driven IaC with version-controlled Compose files, configs, dashboards, and alert rules.
- **Deployment-Model Awareness.** Universal observability — consistent logs + metrics + traces + events across all runtimes — is implemented in a model-aware manner, not one-size-fits-all. Deployment topology (on-prem, customer site, cloud VM) directly shapes what can be instrumented, the context that can be captured, and where telemetry can be stored or processed; trace continuity, data ownership, and cost control follow from those choices.
- **Application / Infrastructure Convergence.** Application-stack tooling has been pre-selected and the infrastructure stack is broadly guided by Azure-native capabilities; this architecture brings application and infrastructure insights together into a single pane of glass within those constraints.

## 2. High-Level Architecture (Logical View)

<img src="assets/diagrams/observability-pipeline-architecture.jpg" alt="Observability pipeline architecture showing applications and infrastructure telemetry flowing through the OpenTelemetry SDK and Collector into Prometheus, Loki, and Tempo, then into the Grafana observability layer, alerting, AI observability actions, root cause analysis, and incident management." width="1100">

```mermaid
flowchart LR
    APP[Applications] --> SDK[OpenTelemetry SDK]

    subgraph INPUTS[Inputs]
        INFRA[Infrastructure Metrics]
        NET[Network Telemetry]
        DB[Database Telemetry]
        K8S[Kubernetes / VM Telemetry]
    end

    subgraph STORAGE[Storage]
        COL[OpenTelemetry Collector]
        PROM[Prometheus]
        LOKI[Loki]
        TEMPO[Tempo]
    end

    subgraph VIZ[Visualization]
        GRAF[Grafana Observability Layer]
        DASH[Dashboards]
        ALERT[Alerting Engine]
    end

    subgraph ACT[Actions]
        AI[AI Observability Agent]
        RCA[Initial Root Cause Analysis]
        TICKET[Automated Ticket Creation]
    end

    INC[Incident Management System]

    SDK --> COL
    INFRA --> COL
    NET --> COL
    DB --> COL
    K8S --> COL

    COL --> PROM
    COL --> LOKI
    COL --> TEMPO

    PROM --> GRAF
    LOKI --> GRAF
    TEMPO --> GRAF

    GRAF --> DASH
    GRAF --> ALERT
    GRAF --> AI

    ALERT --> AI
    AI --> RCA
    AI --> TICKET
    RCA --> INC

    classDef box fill:#eaf2ff,stroke:#4a7bd1,color:#111,stroke-width:1px
    classDef group fill:#fff,stroke:#bbb,color:#111,stroke-width:1px
    class APP,SDK,INFRA,NET,DB,K8S,COL,PROM,LOKI,TEMPO,GRAF,DASH,ALERT,AI,RCA,TICKET,INC box
```

The entire backend (Collector, Prometheus, Loki, Tempo, Grafana, exporters) is a **Docker Compose** project, provisioned and managed by **PowerShell** scripts. See [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md).

## 3. Core Concepts

| Component | Role |
|---|---|
| OpenTelemetry Collector | Universal telemetry gateway: receives metrics/logs/traces from instrumented services and exporters, performs processing/enrichment, forwards to backends. Standardises ingestion and simplifies pipeline management. |
| Prometheus | Stores and queries metrics for performance, capacity, and health monitoring. |
| Loki | Stores structured logs; enables efficient querying and correlation with metrics/traces. |
| Tempo | Stores distributed traces; provides end-to-end visibility into request flows and dependencies. |
| Grafana | Dashboards, exploration views, and visual analytics across metrics, logs, and traces. |
| Agentic AI Layer | Consumes telemetry via APIs from Prometheus/Loki/Tempo to perform automated RCA, anomaly detection, and enriched incident-ticket generation. |
| Docker Compose | Declarative deployment unit for the observability stack — one Compose project per environment. |
| PowerShell | Orchestrator and IaC layer: provisions hosts, renders configs, runs `docker compose` lifecycle, validates health, emits deployment telemetry. |

## 4. Core Open-Source Stack

| Layer | Tool | Role |
|---|---|---|
| Telemetry Standard | OpenTelemetry | Unified instrumentation standard for metrics, logs, traces |
| Telemetry Gateway | OpenTelemetry Collector | Central pipeline receiving, processing, exporting telemetry |
| Metrics Storage | Prometheus | Infra and application metrics |
| Logs Storage | Loki | Structured logs |
| Traces Storage | Tempo | Distributed traces |
| Visualization | Grafana | Dashboards, exploration, analytics |
| Host Observability | Node Exporter | OS-level metrics (CPU/mem/disk/net) on every host |
| Container Observability | cAdvisor | Per-container CPU/memory/I/O metrics |
| Network Monitoring | Host-level network metrics via Node Exporter; network probes / synthetic checks via Blackbox Exporter | Network reachability, latency, packet loss |
| DB Observability | Postgres / MySQL exporter | DB query/latency/connection/error metrics |
| Alerting | Grafana Alerting / Alertmanager | Alert rules, routing, notifications |
| Deployment Unit | Docker Compose | Declarative stack definition |
| Automation / IaC | PowerShell | Provisioning, lifecycle, validation, telemetry export |
| Profiling | Pyroscope | Continuous CPU / memory / heap profiles (5th pillar) |
| Synthetic Monitoring | Blackbox Exporter / k6 | Black-box probes for HTTP, TCP, DNS, ICMP, TLS |
| Real User Monitoring (RUM) | OpenTelemetry Browser SDK | Front-end Core Web Vitals + user-journey spans |
| Auto-Instrumentation (eBPF) | Beyla (or equivalent) | Code-free L4/L7 visibility for legacy / unmodifiable services |
| Service Catalog (CMDB bridge) | Backstage / ServiceNow CMDB integration | Authoritative service identity (`service.name`, `tier`, `team`) |
| Paging / On-Call | PagerDuty / Opsgenie / Squadcast | Alert escalation and rotation management |
| Identity / Auth | Corporate IdP (OIDC / SAML) + Vault PKI | User SSO + service mTLS |
| Secrets | HashiCorp Vault / Azure Key Vault | Component credentials and bearer tokens |
| Schema Registry | OpenTelemetry semantic conventions + internal extension registry | Naming/labelling conformance |

All components are open-source or vendor-neutral; commercial choices (paging, IdP, Vault) are pluggable per [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md).

### 4.1. eBPF for Legacy and Non-Intrusive Instrumentation
For legacy services, vendor-supplied components, or any workload where code-level instrumentation is impractical, eBPF-based auto-instrumentation (e.g., Grafana **Beyla**, or Cilium Tetragon for security signals) provides language-agnostic visibility into HTTP, gRPC, and SQL traffic at the kernel level.

**Decision:** Beyla is recommended as a complementary layer beside the OpenTelemetry SDK kits in [Chapter 25](25-service-onboarding-and-instrumentation-kits.md) — formalised in **ADR-012** in [Chapter 16](16-observability-adr-decision-register.md).

**Use cases:**
- Vendor-supplied components without source-code access.
- Phase 1 instrumentation while SDK rollout is in progress.
- "Free" service-to-service visibility for non-priority services that do not justify SDK effort.

**Constraints:**
- Linux only (eBPF dependency).
- Less attribute fidelity than SDK instrumentation.
- Custom business attributes still require SDK.

## 5. Telemetry Collection Layers
Telemetry is captured across four major layers:

1. **Infrastructure (Host + Container).** Host-level metrics via Node Exporter; container-level metrics via cAdvisor. Logs collected by the OpenTelemetry Collector or a log-shipping agent (e.g. Promtail).
2. **Application.** Pre-login (auth/MFA/API gateway) and post-login (transactions, dependencies, journeys). OpenTelemetry SDK in each service exports OTLP to the Collector. See [Chapter 17. Application Telemetry Standard](17-application-telemetry-standard.md) for application telemetry standards.
3. **Database.** Query, lock, connection, and replication telemetry via dedicated exporters as Compose services.
4. **Network & Latency.** Host-level network counters (packet drops, retransmits) plus active probes (Blackbox Exporter) for cross-service latency, DNS, and reachability.

A fifth, emerging layer — **Profiles** (Pyroscope-style stack-trace profiling) — is a near-term extension. See [Chapter 1. Enterprise Observability Standards Catalog](01-enterprise-observability-standards-catalog.md).

### 5.1. Sampling Strategy

| Signal | Approach | Rate (default) | Rationale |
|---|---|---|---|
| Metrics | No sampling — full fidelity at scrape interval | 100% | Aggregated by definition; sampling defeats the purpose |
| Logs | Volume control via structured-log policy + level filtering | INFO+ in prod | Fine-grained by service tier (see [Chapter 1. Enterprise Observability Standards Catalog -> Section 4.1. Service Tiering Model](01-enterprise-observability-standards-catalog.md#41-service-tiering-model)) |
| Traces (head-based, baseline) | `parentbased_traceidratio` at SDK | T1 10%, T2 5%, T3 1%, T4 0.1% | Decision propagates with `traceparent`; lightweight |
| Traces (tail-based, gateway) | Tail sampling at gateway Collector | 100% of errors + 100% of slow (> P95) + N% of normal | Captures the interesting traces; downsamples the rest |

**Decision** formalised in **ADR-013**.

## 6. Host-Portable Deployment Design
The same Docker Compose definition runs in every environment (development, test, staging, production; on-prem, customer-hosted, or cloud VM). The model deliberately avoids any single cloud's container-orchestration platform.

**Advantages:**
- **Centralized Dashboards.** Unified Grafana view regardless of where the stack runs.
- **Unified Telemetry Schema.** Same metric names, labels, log fields, trace attributes everywhere.
- **Cross-Host Incident Visibility.** Incidents that span hosts / sites remain visible in a single context.
- **Low Operational Surface.** No control plane to operate beyond Docker Engine itself.

**Design constraints (see [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) for KPIs):**
- **Cross-host config parity ≥ 95%** between hosts of the same tier.
- **Image / Compose version alignment 100%** within a tier.
- **Health-check pass rate 100%** post-deployment.
- All deployment is reproducible from Git via PowerShell scripts.

### 6.1. Network Topology and Trust Boundaries
```
┌──────────────────────────────────────────────────────────────────────┐
│  Service / Customer Network Zone                                     │
│  ┌──────────┐   ┌──────────┐   ┌──────────┐                          │
│  │ Service  │   │ Service  │   │ Service  │   (instrumented w/ SDK)  │
│  └────┬─────┘   └────┬─────┘   └────┬─────┘                          │
│       │ OTLP/mTLS    │              │                                │
│       └──────────────┴──────────────┘                                │
│                      │                                               │
│  ┌───────────────────▼──────────────────┐                            │
│  │  Edge OTel Collector  (per host)     │  ← attribute enrich, redact│
│  └───────────────────┬──────────────────┘                            │
└──────────────────────┼───────────────────────────────────────────────┘
                       │ TLS 1.3 + bearer token
                       │ ─── trust boundary ───
┌──────────────────────▼───────────────────────────────────────────────┐
│  Observability Platform Zone (DMZ-like)                              │
│  ┌─────────────────────────────────────┐                             │
│  │  Gateway OTel Collector (HA pair)   │  ← tenant injection, tail   │
│  │                                     │     sampling, redaction     │
│  └────────┬────────────────────────────┘                             │
│           │                                                          │
│  ┌────────▼─────┐ ┌─────────┐ ┌───────┐ ┌──────────┐                 │
│  │  Prometheus  │ │  Loki   │ │ Tempo │ │ Pyroscope│                 │
│  └────────┬─────┘ └────┬────┘ └───┬───┘ └────┬─────┘                 │
│           │            │          │          │                       │
│  ┌────────▼────────────▼──────────▼──────────▼──────┐                │
│  │  Grafana (HA pair)  +  Alertmanager (3-cluster)  │                │
│  └────────┬─────────────────────────────────────────┘                │
└───────────┼──────────────────────────────────────────────────────────┘
            │ OIDC + MFA
┌───────────▼──────────────────────────────────────────────────────────┐
│  User Zone (Devs / SRE / Ops / Auditors / Execs)                     │
└──────────────────────────────────────────────────────────────────────┘
                       │  egress allow-list
                       ▼
              [ Pager / SIEM / LLM ]
```
**Trust boundaries:**
- **Service ↔ Edge Collector:** mTLS, service identity.
- **Edge ↔ Gateway:** TLS + bearer token (per-host or per-tenant).
- **Gateway ↔ Backends:** TLS + service auth.
- **User ↔ Grafana:** OIDC SSO + MFA.
- **Platform ↔ Egress:** allow-list to known third parties; redaction enforced.

Detailed control catalogue in [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md).

## 7. Pipeline Processing

### 7.1 Pipeline Roles
- **Edge Collector (per host or per service):** receive (OTLP, file, syslog), enrich (resource attributes), redact (PII at source), batch, export to gateway.
- **Gateway Collector (HA, central):** authenticate, inject authoritative tenant ID, apply tail-sampling for traces, route per signal type to backends.
- **Backends:** durable storage and query.

### 7.2 Backpressure and Reliability
- `memory_limiter` aborts ingestion when memory exceeds 80% — prevents OOM.
- `sending_queue` with `file_storage` persists telemetry across collector restarts.
- `retry_on_failure` with exponential backoff handles transient backend outages.
- **`otelcol_processor_dropped_spans`** is a meta-monitor alert (see [Chapter 21 Section 7. Self-Monitoring](21-observability-platform-ha-and-dr-design.md#7-self-monitoring-meta-monitor)).

### 7.3 Schema Validation and Cardinality Controls
- Cardinality enforcement per [Chapter 1. Enterprise Observability Standards Catalog -> Section 3.4. Cardinality Governance](01-enterprise-observability-standards-catalog.md#34-cardinality-governance).
- Required-attribute enforcement: `attributes/required` processor pattern rejects telemetry missing any of `service.name`, `tier`, `tenant_id`.
- Recording rules in Prometheus / Mimir track per-service active-series count.

## 8. Cross-References
- [Chapter 1. Enterprise Observability Standards Catalog](01-enterprise-observability-standards-catalog.md) — telemetry standards consumed by this architecture.
- [Chapter 5. Grafana Platform Standard and Visualization Playbook](05-grafana-platform-standard-and-visualization-playbook.md) — Grafana platform standards and dashboard playbook.
- [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) — Docker Compose + PowerShell deployment standard.
- [Chapter 8. Observability Data Governance and Retention Policy](08-observability-data-governance-and-retention-policy.md) — data lifecycle and retention applied to backends.
- [Chapter 19. Observability Data Model Specification](19-observability-data-model-specification.md) — formal data model for entities/relationships across pillars.
- [Chapter 21. Observability Platform HA and DR Design](21-observability-platform-ha-and-dr-design.md) — HA topology overlaid on this architecture.
- [Chapter 22. Capacity and Scale Model](22-capacity-and-scale-model.md) — sizing and scale-out triggers.
- [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) — auth, encryption, redaction, supply-chain.
- [Chapter 26. Multi-Tenant and Customer-Site Deployment Model](26-multi-tenant-and-customer-site-deployment-model.md) — multi-tenant and customer-site topologies.

---

[↑ Back to TOC](toc.md)
