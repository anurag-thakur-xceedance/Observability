---
title: Observability ADR Decision Register
chapter: 17
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 17. Observability ADR Decision Register

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Reviewed Date | Status |
|---|---|---|---|---|
| 0.1 | TBD | Internal |  | Draft |
---

## 17.1 Purpose
Formal Architecture Decision Records (ADRs) for significant observability decisions. Each ADR captures context, options considered, decision, and consequences.

## 17.2 ADR Index (Initial)

| ID | Title | Status | Source |
|---|---|---|---|
| ADR-000 | Observability Strategy Principles (10 principles) | Accepted | [Chapter 1. Xceedance Observability Strategy -> Section 1.2 Vision, Mission, and Guiding Principles](01-xceedance-observability-strategy.md#12-vision-mission-and-guiding-principles) |
| ADR-001 | Adopt OpenTelemetry as universal telemetry standard | Implicit (in strategy) → ratify | Strategy section "Build the Technical Foundation" |
| ADR-002 | Select Grafana as primary visualisation and alerting tool | Implicit → ratify | Strategy section "Build the Technical Foundation" |
| ADR-003 | Use Prometheus / Loki / Tempo as backends | Implicit → ratify | Strategy section "High-Level Architecture" |
| ADR-004 | Adopt containerized deployment with environment-specific automation and orchestration | Accepted (revised) | [8. IaC for Observability Standard](08-iac-for-observability-standard.md); Strategy section "IaC Role in OpenTelemetry Deployment" |
| ADR-005 | Adopt deployment-model-aware containerized delivery across on-prem, customer site, cloud VM, and managed clusters | Accepted (revised) | [Chapter 3. Observability Reference Architecture -> Section 3.6 Containerized Deployment Design](03-observability-reference-architecture.md#36-containerized-deployment-design); [8. IaC for Observability Standard](08-iac-for-observability-standard.md) |
| ADR-006 | Tiered retention (hot / warm / cold) with metrics 30–90d, logs 7–30d, traces 7d, RCA 1y | Implicit → ratify | Strategy section "Telemetry retention tiers" |
| ADR-007 | AIOps guardrails: FP < 5%, detection latency < 2 min | Implicit → ratify | Strategy section "AI-Driven Observability — Success criteria" |
| ADR-008 | Adopt Sloth as SLO-rule generator | Proposed | [Chapter 25. SLO and Error-Budget Framework -> Section 25.8 Tooling Decision](25-slo-and-error-budget-framework.md#258-tooling-decision) |
| ADR-009 | Service Tiering Model (T1–T4) with per-tier policy deltas | Proposed | [Chapter 2. Enterprise Observability Standards Catalogue -> Section 2.4.1 Service Tiering Model](02-enterprise-observability-standards-catalog.md#241-service-tiering-model) |
| ADR-010 | Cardinality Budget (per-service, enforced at SDK + collector + backend) | Proposed | [Chapter 2. Enterprise Observability Standards Catalogue -> Section 2.3.4 Cardinality Governance](02-enterprise-observability-standards-catalog.md#234-cardinality-governance) |
| ADR-011 | Multi-tenant data-isolation model with gateway-injected `tenant_id` | Proposed | [Chapter 27. Multi-Tenant and Customer-Site Deployment Model -> Section 27.3 Tenant Labelling Enforcement](27-multi-tenant-and-customer-site-deployment-model.md#273-tenant-labelling-enforcement) |
| ADR-012 | Auto-instrumentation via eBPF (Beyla) for legacy / unmodifiable services | Proposed | [Chapter 3. Observability Reference Architecture -> Section 3.4.1 eBPF for Legacy and Non-Intrusive Instrumentation](03-observability-reference-architecture.md#341-ebpf-for-legacy-and-non-intrusive-instrumentation) |
| ADR-013 | Tail-based sampling at gateway with 100%-error retention | Proposed | [Chapter 3. Observability Reference Architecture -> Section 3.5.1 Sampling Strategy](03-observability-reference-architecture.md#351-sampling-strategy) |
| ADR-014 | HA topology: Prometheus pair, Alertmanager 3-cluster, Loki/Tempo + object storage, Grafana × 2 with external Postgres | Proposed | [Chapter 22. Observability Platform HA and DR Design -> Section 22.3 Reference HA Topology (Compose, Single Region)](22-observability-platform-ha-and-dr-design.md#223-reference-ha-topology-compose-single-region) |
| ADR-015 | Compliance framework adoption: SOC 2 Type II + ISO 27001 + GDPR baseline (DORA where applicable) | Proposed | [11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md) |
| ADR-016 | LLM telemetry-data handling: redact-before-prompt; on-prem / Azure OpenAI tenancy only; no third-party LLM access to raw telemetry | Proposed | [Chapter 7. AIOps Guardrails and Implementation Playbook -> Section 7.8 AI Safety, Explainability, and LLM Data Leakage](07-aiops-guardrails-and-implementation-playbook.md#78-ai-safety-explainability-and-llm-data-leakage) |

> Source decision-log table in the strategy is currently empty (only headings — `Id | Review Group | Decision`). Existing decisions need to be ratified; that is flagged as a **decision required** in the handover report.

## 17.3 ADR Template

When to write an ADR:
- Any decision that constrains future choices, costs significant effort to reverse, or is visible across multiple teams.
- Any deviation from these principles (per ADR-000).
- Any vendor or open-source tool selection that becomes architectural.
- Any change to security, retention, residency, or governance posture.

```
ADR-NNN: <Title>

Status: Proposed | Accepted | Superseded by ADR-MMM | Deprecated
Date: YYYY-MM-DD
Authors: <name(s)>
Reviewers: <ARB / SRE Director / Security / etc.>
Supersedes: <ADR-XXX or "—">
Related: <ADR-XXX, Chapter N>

## Context
What is the problem? What is the current state? What constraints apply?
What forces (technical, business, regulatory) are at play?

## Options Considered
- Option A — description; pros; cons
- Option B — description; pros; cons
- Option C — description; pros; cons

## Decision
Selected option and the rationale that distinguishes it.

## Consequences
- Positive: ...
- Negative: ...
- Follow-on actions:
  - <action> — owner — date
  - <action> — owner — date

## Linked Artifacts
- Chapter N. Title — section impacted
- Service catalogue entries impacted
- Runbook updates required
```

## 17.4 ADR Bodies (Full Records)

### 17.4.1 ADR-000: Observability Strategy Principles (10 principles)

- **Status**: Accepted
- **Date**: 2026-04-27
- **Authors**: A. Thakur
- **Reviewers**: ARB
- **Supersedes**: —
- **Related**: [Chapter 1. Xceedance Observability Strategy -> Section 1.2 Vision, Mission, and Guiding Principles](01-xceedance-observability-strategy.md#12-vision-mission-and-guiding-principles)

**Context.** Without explicit guiding principles, downstream decisions diverge across teams and customer sites. We need an enduring north star to evaluate every architectural and operational decision against.

**Options Considered.**
- (A) No formal principles — let each team decide. Pros: low friction; Cons: drift, no audit basis, governance impossible.
- (B) Adopt OpenTelemetry's design principles verbatim. Pros: industry-standard; Cons: not Xceedance-specific (deployment-model awareness, multi-tenant, cost economics).
- (C) Author 10 Xceedance-specific principles aligned with strategy. Pros: directly auditable, scoped to our context; Cons: maintenance.

**Decision.** Option C. Adopt 10 principles covering: OTel-first; one platform; deployment-model awareness; data-as-product; cost-aware telemetry; SLO-driven alerting; AI with guardrails; security & compliance by design; GitOps for everything; humans in the loop.

**Consequences.**
- (+) All subsequent ADRs measured against these 10 principles — gives objective rationale.
- (+) Audit trail for governance reviews.
- (-) Principle drift over time requires periodic re-ratification.
- Follow-on: review annually at ARB — owner ARB Chair — Q1 each year.

**Linked Artifacts.** Chapter 0; Chapter 15 (governance ratification).

---

### 17.4.2 ADR-001: Adopt OpenTelemetry as the universal telemetry standard

- **Status**: Accepted (ratified from implicit)
- **Date**: 2026-05-07
- **Authors**: A. Thakur
- **Reviewers**: ARB, SRE Director
- **Supersedes**: —
- **Related**: [3. Observability Reference Architecture](03-observability-reference-architecture.md), [18. Application Telemetry Standard](18-application-telemetry-standard.md), [20. Observability Data Model Specification](20-observability-data-model-specification.md)

**Context.** Xceedance operates across heterogeneous languages (.NET, Java, Node.js, Python, Go), cloud and on-premise hosts, and multiple customer sites. A common telemetry standard is required to avoid vendor lock-in, fragmentation, and per-stack tooling sprawl.

**Options Considered.**
- (A) Vendor agent per backend (Datadog Agent, New Relic Agent, Splunk UF). Pros: turnkey; Cons: vendor lock-in, per-language SDK quality drift, multi-backend cost.
- (B) Roll our own telemetry SDKs. Pros: full control; Cons: enormous effort, no community, no semantic-convention alignment.
- (C) OpenTelemetry SDK + Collector. Pros: CNCF-graduated, vendor-neutral, mature semantic conventions, broad language support, single export point; Cons: configuration complexity, some SDKs still maturing.

**Decision.** Option C. OpenTelemetry is the **only** sanctioned instrumentation pathway for new services and the migration target for existing ones. Vendor agents are deprecated for telemetry purposes (kept only where vendor-specific telemetry, e.g. cloud-resource metrics, cannot otherwise be obtained).

**Consequences.**
- (+) Single mental model and SDK per language for service teams.
- (+) Backend portability: can swap Prometheus/Loki/Tempo for managed equivalents (Mimir, GrafanaCloud) without re-instrumenting services.
- (-) OTel Collector becomes a Tier-1 dependency on the critical path of every service.
- Follow-on: complete migration of legacy agents by end of Phase 2 — owner Platform Lead — 2026-Q4.

**Linked Artifacts.** Chapter 2, Chapter 17, Chapter 19, Chapter 25 (onboarding kits).

---

### 17.4.3 ADR-002: Select Grafana as primary visualisation and alerting tool

- **Status**: Accepted (ratified from implicit)
- **Date**: 2026-05-07
- **Authors**: A. Thakur
- **Reviewers**: ARB
- **Supersedes**: —
- **Related**: [6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md)

**Context.** Visualisation and alerting are the human surface of observability. We need one consistent UI across metrics/logs/traces, with strong correlation, RBAC, multi-tenancy, and dashboards-as-code support.

**Options Considered.**
- (A) Backend-native UIs (Prometheus UI + Kibana + Jaeger UI). Pros: zero-cost, native; Cons: three UIs, no correlation, weak RBAC.
- (B) Vendor SaaS (Datadog, New Relic, Dynatrace). Pros: turnkey; Cons: cost at our scale, data-residency concerns, lock-in.
- (C) Grafana OSS / Enterprise. Pros: unified UI across Prom/Loki/Tempo, RBAC, correlation links, dashboards-as-code via JSON + Grizzly; Cons: alerting feature gaps in OSS, requires self-hosting.

**Decision.** Option C. Grafana (OSS for non-tenant-facing, Enterprise where commercial RBAC/auditing required by customer contract).

**Consequences.**
- (+) One UI to train staff on; correlation across signals.
- (+) Dashboards versioned in Git (per Chapter 5, Section 8.1).
- (-) Grafana itself becomes a Tier-1 component; HA design needed (per ADR-014).
- Follow-on: ratify OSS-vs-Enterprise per tenant tier — owner Platform Lead — 2026-Q3.

**Linked Artifacts.** Chapter 5; ADR-014 (HA).

---

### 17.4.4 ADR-003: Use Prometheus / Loki / Tempo as backends

- **Status**: Accepted (ratified from implicit)
- **Date**: 2026-05-07
- **Authors**: A. Thakur
- **Reviewers**: ARB
- **Supersedes**: —
- **Related**: [3. Observability Reference Architecture](03-observability-reference-architecture.md), [9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md)

**Context.** Once OpenTelemetry is the wire format (ADR-001), backends must be chosen for each signal type. Options range from single-vendor to mixed open-source.

**Options Considered.**
- (A) Single-vendor TSDB+log+trace (Elastic Stack). Pros: integrated; Cons: cost, weaker trace story, licence drift.
- (B) Cloud-native managed (CloudWatch, Azure Monitor). Pros: turnkey; Cons: lock-in, cost, weak cross-cloud story.
- (C) Prometheus (metrics) + Loki (logs) + Tempo (traces). Pros: signal-optimal, OTel-native ingest, cheap object-store backed (Loki/Tempo), Grafana correlation built-in; Cons: three components to operate.

**Decision.** Option C. Prometheus for metrics, Loki for logs, Tempo for traces.

**Consequences.**
- (+) Best-of-breed per signal; community-supported migration paths (Mimir, GrafanaCloud) if scale demands.
- (+) Object-store (S3-compatible) is the canonical durable store — fits host-portable deployment (ADR-005).
- (-) Three operational targets (vs one); mitigated by a unified platform standard and shared telemetry contracts.
- Follow-on: define cardinality budget (ADR-010) and retention tiers (ADR-006).

**Linked Artifacts.** Chapter 2, Chapter 8, Chapter 23.

---

### 17.4.5 ADR-004: Adopt containerized deployment with environment-specific automation and orchestration

- **Status**: Accepted (revised)
- **Date**: 2026-05-04
- **Authors**: A. Thakur
- **Reviewers**: ARB, SRE Director
- **Supersedes**: Earlier single-tool deployment direction in source `v0.1` strategy.
- **Related**: [8. IaC for Observability Standard](08-iac-for-observability-standard.md), ADR-005

**Context.** The original strategy leaned toward a single deployment toolchain. Two issues surfaced: (1) customer-site and internal environments do not share one universal runtime; (2) observability standards should remain portable across containerized deployment models rather than tied to one tooling choice.

**Options Considered.**
- (A) Standardise on one cluster-centric orchestrator. Pros: strong scaling primitives; Cons: poor fit for some customer and legacy environments.
- (B) Standardise on one host-level container toolchain. Pros: simpler for some environments; Cons: underfits managed-cluster estates.
- (C) **Containerized deployment with environment-specific orchestration and automation**. Pros: preserves portability, supports internal AKS and non-AKS environments, and keeps standards focused on telemetry contracts rather than one tool; Cons: requires stronger governance to avoid drift.

**Decision.** Option C. The observability platform is delivered as containers, while orchestration and deployment automation remain environment-specific and governed by common standards.

**Consequences.**
- (+) Internal AKS-style deployment remains acceptable.
- (+) Customer-site and non-clustered environments remain supported.
- (-) Governance must define which platform-specific features are optional versus normative.
- (-) More than one automation path may exist, so validation and policy gates must stay strong.
- Follow-on: author the IaC standard — owner Platform Lead — done (Chapter 8).

**Linked Artifacts.** Chapter 7; ADR-005 (deployment model).

---

### 17.4.6 ADR-005: Deployment-model-aware containerized delivery

- **Status**: Accepted (revised)
- **Date**: 2026-05-04
- **Authors**: A. Thakur
- **Reviewers**: ARB
- **Supersedes**: Earlier deployment posture that over-specified one runtime model.
- **Related**: [Chapter 3. Observability Reference Architecture -> Section 3.6 Containerized Deployment Design](03-observability-reference-architecture.md#36-containerized-deployment-design), [27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md), ADR-004

**Context.** Xceedance customer base spans cloud-only, hybrid, on-prem-only, air-gapped customer sites, and internal managed-cluster estates. A single deployment posture does not fit all of them cleanly.

**Options Considered.**
- (A) Multi-cloud Kubernetes only. Pros: cloud-scale; Cons: excludes or complicates some customer-site and host-based estates.
- (B) Fully different per-environment stacks. Pros: optimised per environment; Cons: 2× maintenance, drift, audit pain.
- (C) **One containerized observability standard with deployment-model-aware implementation**. Pros: consistent telemetry and governance across environments; Cons: requires discipline to keep implementations aligned.

**Decision.** Option C. The observability standard stays consistent across environments, while deployment implementation can vary by runtime and operational context.

**Consequences.**
- (+) One observability standard, one telemetry contract, one governance model.
- (+) Internal AKS deployments and customer-site deployments can both conform.
- (-) Platform-specific implementations need continuous parity checks.
- Follow-on: per-tenant variant testing on at least 3 host types — owner Platform Lead — 2026-Q3.

**Linked Artifacts.** Chapter 2, Section 7; Chapter 27.

---

### 17.4.7 ADR-006: Tiered retention (hot / warm / cold) with policy schedule

- **Status**: Accepted (ratified from implicit)
- **Date**: 2026-05-07
- **Authors**: A. Thakur
- **Reviewers**: ARB, Data Governance, Compliance
- **Supersedes**: —
- **Related**: [9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md), [29. Observability Long-Term Archival Policy](29-observability-long-term-archival-policy.md)

**Context.** Telemetry volumes grow without bound; retention policy must balance forensic value, regulatory obligation, and cost.

**Options Considered.**
- (A) Single retention per signal class. Pros: simple; Cons: cost-optimal only at one point on the trade-off.
- (B) **Tiered hot/warm/cold + archival** per signal. Pros: cost-optimal; Cons: more lifecycle automation.
- (C) Always-archive everything. Pros: forensic; Cons: cost unjustifiable.

**Decision.** Option B. Metrics: 30d hot / 90d cold / archival for audit-relevant series. Logs: 7d hot / 30d cold. Traces: 7d hot (sampled). RCA records: 1y minimum. Audit logs: per Ch 28 archival policy.

**Consequences.**
- (+) Cost-controlled.
- (+) Auditable retention windows per signal.
- (-) Lifecycle automation must be implemented and monitored.
- Follow-on: retention KPIs in Chapter 11, Section 7.1 — owner Platform Lead — done.

**Linked Artifacts.** Chapter 8, Chapter 29.

---

### 17.4.8 ADR-007: AIOps guardrails (FP < 5%, detection latency < 2 min)

- **Status**: Accepted (ratified from implicit)
- **Date**: 2026-05-07
- **Authors**: A. Thakur
- **Reviewers**: ARB, AIOps Lead
- **Supersedes**: —
- **Related**: [7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md)

**Context.** AI-driven alerting without measurable guardrails risks alert fatigue and erosion of on-call trust.

**Options Considered.**
- (A) Unbounded AIOps — let models alert freely. Cons: alert fatigue, low signal-to-noise.
- (B) **Explicit guardrails** with measurable thresholds (FP rate, detection latency, model drift, decision auditability). Pros: trust-building, measurable.
- (C) No AIOps. Cons: misses Xceedance differentiator.

**Decision.** Option B. False-positive rate < 5%, detection latency < 2 min p95, monthly model-quality review, human-in-the-loop for any auto-remediation, full decision audit log.

**Consequences.**
- (+) On-call confidence in AI alerts.
- (+) Quantitative basis for model retirement / retraining.
- (-) Requires ground-truth labelling pipeline.
- Follow-on: MLOps lifecycle (Chapter 6, Section 8) — owner AIOps Lead — done.

**Linked Artifacts.** Chapter 6; Chapter 11 (KPIs).

---

### 17.4.9 ADR-008: Adopt Sloth as SLO-rule generator

- **Status**: Proposed
- **Date**: 2026-05-07
- **Authors**: A. Thakur
- **Reviewers**: SRE Director
- **Supersedes**: —
- **Related**: [Chapter 25. SLO and Error-Budget Framework -> Section 25.8 Tooling Decision](25-slo-and-error-budget-framework.md#258-tooling-decision)

**Context.** Authoring multi-window multi-burn-rate alert rules by hand is error-prone and inconsistent across services.

**Options Considered.**
- (A) Hand-authored Prometheus rules per service. Cons: error-prone, drift.
- (B) **Sloth** (OpenSLO YAML → Prometheus rules). Pros: declarative, standardised, OSS, generates burn-rate alerts.
- (C) Pyrra. Pros: K8s-native; Cons: K8s-only, conflicts with ADR-004.
- (D) OpenSLO + custom generator. Pros: tailored; Cons: maintenance.

**Decision.** Option B (Sloth). Generates Prom rules from OpenSLO definitions.

**Consequences.**
- (+) Consistent SLO rules across all services.
- (+) Declarative YAML reviewable in Git.
- (-) Adds tool dependency.
- Follow-on: pilot with 3 Tier-1 services — owner SRE Director — 2026-Q3.

**Linked Artifacts.** Chapter 25.

---

### 17.4.10 ADR-009: Service Tiering Model (T1–T4)

- **Status**: Proposed
- **Date**: 2026-05-07
- **Authors**: A. Thakur
- **Reviewers**: ARB, Service Owners
- **Supersedes**: —
- **Related**: [Chapter 2. Enterprise Observability Standards Catalogue -> Section 2.4.1 Service Tiering Model](02-enterprise-observability-standards-catalog.md#241-service-tiering-model)

**Context.** Uniform observability standards across all services is wasteful (low-tier services don't need 99.99% SLOs) and dangerous (Tier-1 services need stricter policies than the average).

**Options Considered.**
- (A) Uniform standards. Cons: misallocated effort.
- (B) **Four-tier model T1 (revenue-critical) → T4 (sandbox)** with per-tier deltas in SLO targets, retention, alerting cadence, on-call coverage.
- (C) Continuous criticality score. Pros: granular; Cons: hard to operationalise.

**Decision.** Option B. T1/T2/T3/T4 with explicit per-tier policy deltas (Chapter 1, Section 5.1).

**Consequences.**
- (+) Effort proportionate to criticality.
- (+) Clear PRR criteria per tier (Ch 25).
- (-) Tier-creep risk (everything becomes T1) — mitigated by ARB review.
- Follow-on: classify the current 40+ services — owner Service Owners — 2026-Q3.

**Linked Artifacts.** Chapter 1, Chapter 26.

---

### 17.4.11 ADR-010: Cardinality Budget (per-service, enforced at SDK + collector + backend)

- **Status**: Proposed
- **Date**: 2026-05-07
- **Authors**: A. Thakur
- **Reviewers**: ARB, Platform Lead
- **Supersedes**: —
- **Related**: [Chapter 2. Enterprise Observability Standards Catalogue -> Section 2.3.4 Cardinality Governance](02-enterprise-observability-standards-catalog.md#234-cardinality-governance), [Chapter 23. Capacity and Scale Model -> Section 23.8 Cardinality Budget](23-capacity-and-scale-model.md#238-cardinality-budget)

**Context.** Uncontrolled label cardinality is the #1 cause of Prometheus outages and cost overruns.

**Options Considered.**
- (A) No enforcement, react to incidents. Cons: too late.
- (B) **Per-service cardinality budget enforced at three layers**: SDK (attribute allow-list), Collector (metric_relabel drop-rules), backend (limits.yaml).
- (C) Backend-only limits. Pros: simple; Cons: services discover the limit by being throttled in production.

**Decision.** Option B. Each service declares its cardinality budget at onboarding (PRR gate); enforced and monitored.

**Consequences.**
- (+) Predictable cost and stability.
- (+) Forces conversation about which labels matter at onboarding time.
- (-) Per-service budget tuning effort.
- Follow-on: instrument budget-utilisation dashboard — owner Platform Lead — 2026-Q3.

**Linked Artifacts.** Chapter 1, Chapter 22, Chapter 26.

---

### 17.4.12 ADR-011: Multi-tenant data isolation with gateway-injected `tenant_id`

- **Status**: Proposed
- **Date**: 2026-05-07
- **Authors**: A. Thakur
- **Reviewers**: Security, Data Governance, ARB
- **Supersedes**: —
- **Related**: [Chapter 27. Multi-Tenant and Customer-Site Deployment Model -> Section 27.3 Tenant Labelling Enforcement](27-multi-tenant-and-customer-site-deployment-model.md#273-tenant-labelling-enforcement)

**Context.** Multiple customer tenants share the platform. Cross-tenant data leakage is unacceptable; client-supplied tenant labels cannot be trusted.

**Options Considered.**
- (A) Trust client-supplied tenant label. Cons: trivially spoofable.
- (B) **Edge-gateway injection** of `tenant_id` from authenticated session/cert, overriding any client value.
- (C) Per-tenant separate stacks. Pros: hard isolation; Cons: cost, ops burden.

**Decision.** Option B for shared-tenant tiers; Option C reserved for tenants with regulatory or contractual hard-isolation needs.

**Consequences.**
- (+) Strong tenant-isolation guarantee.
- (+) RBAC and dashboards naturally tenant-scoped.
- (-) Gateway becomes critical path — needs HA (ADR-014).
- Follow-on: mTLS + cert-bound tenant_id pilot — owner Security Lead — 2026-Q3.

**Linked Artifacts.** Chapter 23, Chapter 23 Appendix A (STRIDE), Chapter 27.

---

### 17.4.13 ADR-012: Auto-instrumentation via eBPF (Beyla) for legacy services

- **Status**: Proposed
- **Date**: 2026-05-07
- **Authors**: A. Thakur
- **Reviewers**: Platform Lead
- **Supersedes**: —
- **Related**: [Chapter 3. Observability Reference Architecture -> Section 3.4.1 eBPF for Legacy and Non-Intrusive Instrumentation](03-observability-reference-architecture.md#341-ebpf-for-legacy-and-non-intrusive-instrumentation)

**Context.** Some services cannot be re-instrumented (vendor-supplied, frozen-binary, regulatory-frozen). Without telemetry they remain dark.

**Options Considered.**
- (A) Skip legacy services. Cons: blind spots in critical journeys.
- (B) Sidecar log scraping. Pros: simple; Cons: logs only, no traces.
- (C) **eBPF auto-instrumentation (Grafana Beyla)**. Pros: zero code change, RED metrics + basic traces; Cons: Linux-only, kernel-version dependent, limited HTTP/gRPC coverage.

**Decision.** Option C where eligible (Linux, kernel ≥ 5.8); Option B as fallback.

**Consequences.**
- (+) Coverage of previously-dark services.
- (-) Operational complexity (kernel compatibility matrix).
- Follow-on: maintain support matrix — owner Platform Lead — ongoing.

**Linked Artifacts.** Chapter 3.

---

### 17.4.14 ADR-013: Tail-based sampling at gateway with 100%-error retention

- **Status**: Proposed
- **Date**: 2026-05-07
- **Authors**: A. Thakur
- **Reviewers**: Platform Lead, FinOps
- **Supersedes**: —
- **Related**: [Chapter 3. Observability Reference Architecture -> Section 3.5.1 Sampling Strategy](03-observability-reference-architecture.md#351-sampling-strategy)

**Context.** Full-trace ingestion is cost-prohibitive at scale; naive head-sampling discards error traces probabilistically — exactly the ones we need.

**Options Considered.**
- (A) Head-sampling at SDK. Cons: errors dropped.
- (B) No sampling. Cons: cost.
- (C) **Tail-based sampling at gateway** — buffer full trace, decide post-completion, keep 100% errors + slow + sampled-baseline.
- (D) Probabilistic sampling with error-boost. Cons: still drops some errors.

**Decision.** Option C. Tail-sampler at gateway OTel Collector with policies: keep all errors, keep all p95-latency-exceeders, sample 10% baseline.

**Consequences.**
- (+) Error traces always retained — best for diagnosis.
- (+) Cost controlled.
- (-) Gateway memory pressure for trace buffering — capacity-planned in Ch 22.
- Follow-on: validate buffer sizing — owner Platform Lead — 2026-Q3.

**Linked Artifacts.** Chapter 2, Chapter 23.

---

### 17.4.15 ADR-014: HA topology (Prometheus pair, AM 3-cluster, Loki/Tempo + object store, Grafana × 2 + external Postgres)

- **Status**: Proposed
- **Date**: 2026-05-07
- **Authors**: A. Thakur
- **Reviewers**: SRE Director, ARB
- **Supersedes**: —
- **Related**: [Chapter 22. Observability Platform HA and DR Design -> Section 22.3 Reference HA Topology (Compose, Single Region)](22-observability-platform-ha-and-dr-design.md#223-reference-ha-topology-compose-single-region)

**Context.** Observability is itself Tier-1; an outage of the platform blinds the SRE org during incidents — the worst time.

**Options Considered.**
- (A) Single instance per component. Cons: any host failure blinds the org.
- (B) **Per-component HA**: Prom in pair (each scrapes independently), Alertmanager in 3-node cluster (gossip), Loki/Tempo backed by object store (replicated), Grafana × 2 fronted by load-balancer with external Postgres for shared session state.
- (C) Active-passive failover only. Pros: simpler; Cons: cold failover MTTR too high.

**Decision.** Option B per component, with regional-pair for DR.

**Consequences.**
- (+) Platform survives single-host failure with zero RPO.
- (-) Configuration complexity; deployment variants per role.
- Follow-on: HA verification chaos test quarterly — owner SRE Director — ongoing.

**Linked Artifacts.** Chapter 21, Chapter 22 (capacity sizing).

---

### 17.4.16 ADR-015: Compliance framework adoption (SOC 2 Type II + ISO 27001 + GDPR + DORA-where-applicable)

- **Status**: Proposed
- **Date**: 2026-05-07
- **Authors**: A. Thakur
- **Reviewers**: Compliance, Legal, ARB
- **Supersedes**: —
- **Related**: [11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md)

**Context.** Xceedance serves regulated industries (insurance, financial services). Compliance framework choice gates customer onboarding and audit readiness.

**Options Considered.**
- (A) Customer-by-customer attestations. Cons: doesn't scale.
- (B) **Common baseline (SOC 2 II + ISO 27001 + GDPR)** + additional regulations layered per customer sector (HIPAA, PCI DSS, DORA, NIS2).
- (C) Top-tier-only (ISO 27001 only). Cons: insufficient for many customer contracts.

**Decision.** Option B. SOC 2 II + ISO 27001 + GDPR as the baseline; sector-specific overlays where contractually required.

**Consequences.**
- (+) Single audit programme covers majority of customers.
- (+) Sector overlays bolt onto the baseline rather than restart.
- (-) Annual external audit cost.
- Follow-on: control matrix in Ch 10 with concrete IDs — owner Compliance Lead — 2026-Q3.

**Linked Artifacts.** Chapter 10, Chapter 23, Chapter 29.

---

### 17.4.17 ADR-016: LLM telemetry-data handling (redact-before-prompt, tenanted LLM only, no third-party access to raw telemetry)

- **Status**: Proposed
- **Date**: 2026-05-07
- **Authors**: A. Thakur
- **Reviewers**: Security, Compliance, Data Governance, ARB
- **Supersedes**: —
- **Related**: [Chapter 7. AIOps Guardrails and Implementation Playbook -> Section 7.8 AI Safety, Explainability, and LLM Data Leakage](07-aiops-guardrails-and-implementation-playbook.md#78-ai-safety-explainability-and-llm-data-leakage), Chapter 23 Appendix A residual risk **C7-I**

**Context.** AIOps RCA and summarisation use LLMs. Telemetry can contain PII, customer-confidential data, and regulated data classes. STRIDE threat model (Ch 23 Appendix A) flagged **C7-I LLM prompt leakage** as a residual High risk.

**Options Considered.**
- (A) Public LLM API (OpenAI public, Anthropic public). Cons: data egress, no contractual data-handling guarantee for telemetry classes.
- (B) **Redact-before-prompt + tenanted LLM (Azure OpenAI in our tenant, or on-prem-hosted OSS model)**. Pros: data stays in our control plane; redaction removes residual PII before prompt construction.
- (C) No LLM. Cons: forfeits AIOps maturity goals (Phase 3).

**Decision.** Option B. (1) Telemetry passes through a redaction pipeline (same patterns as Chapter 23, Section 5 — PII redaction) **before** entering any prompt template; (2) only Azure OpenAI in Xceedance tenancy or on-prem-hosted OSS models are sanctioned; (3) prompt + response are logged to the audit trail; (4) no telemetry leaves the observability VPC for any third-party LLM.

**Consequences.**
- (+) Closes C7-I residual risk.
- (+) Compliance defensible (GDPR Art. 28 processor, ISO A.8.16 data egress controls).
- (-) Higher cost than public APIs.
- (-) Some advanced public-model capabilities unavailable.
- Follow-on: prompt-sanitisation standard (deliverable in Ch 6 or new Ch 29) — owner AIOps Lead + Security — 2026-Q3.

**Linked Artifacts.** Chapter 6, Chapter 23, Chapter 23 Appendix A, Chapter 27 (NFR-SEC-*).

---

## 17.5 Cross-References
- [3. Observability Reference Architecture](03-observability-reference-architecture.md) / [6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md) / [8. IaC for Observability Standard](08-iac-for-observability-standard.md) — architectural decisions implemented.
- [16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md) — governance body that ratifies ADRs.

---

[↑ Back to TOC](toc.md)
