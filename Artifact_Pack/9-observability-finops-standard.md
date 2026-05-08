# 9. Observability FinOps Standard

[↑ Back to TOC](toc.md)

---

## 1. Purpose
Lifecycle policies manage cost and performance of observability platforms. This standard defines the cost-management mechanics that operationalise the retention authorisations in [Chapter 8. Observability Data Governance and Retention Policy](8-observability-data-governance-and-retention-policy.md).

## 2. Storage Tier Model

| Tier | Contents | Typical Window | Media |
|---|---|---|---|
| **Hot** | Recent, high-value data: last 7–14 days of logs and traces; last 30 days of metrics | Days | Fast, high-cost media |
| **Warm** | Down-sampled metrics and compressed logs retained beyond hot windows | Weeks–Months | Mid-cost storage |
| **Cold / Archive** | Long-term RCA documents, audit reports, and selected aggregates | Months–Years | Object storage |

## 3. Down-Sampling and Aggregation
- **Metrics down-sampling:** raw → 1-minute → 5-minute aggregates after the hot period.
- **High-cardinality labels** removed or bucketed after a defined retention window.
- These measures reduce storage overhead while preserving trend and SLO visibility.

## 4. Cost Levers
- Hot/warm/cold tiering windows.
- Sampling strategy (head/tail) for traces.
- Cardinality controls (label bucketing, drop high-cardinality dimensions).
- Compression and codec selection for logs.
- Retention windows per service criticality.

## 5. Cost KPIs
- **Reduce observability tooling costs by 20–25%** in 12 months (executive target — see [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md)).
- Storage cost **per service over time** trending downward while maintaining required visibility.
- **Tool coverage rate > 90%** for unified stack despite cost reduction.

## 6. Value Tracking
- Cost-per-incident-resolved.
- Cost-per-instrumented-service.
- Storage cost vs. retention SLO compliance.
- Tool count consolidation (reduction of 30–40% over 12 months).

## 6.1. Unit Economics

The platform's cost story is told in **unit economics**: cost per signal, per service, per tier, per tenant. Aggregated cost numbers are necessary but not sufficient — only unit economics let the business decide where to invest, where to cut, and where to charge back.

### 6.1.1 Unit Cost Model

The total monthly platform cost **C** is decomposed by signal:

```
C  =  C_metrics  +  C_logs  +  C_traces  +  C_profiles  +  C_synthetic  +  C_compute  +  C_egress
```

Each signal cost is further decomposed into ingest, storage (hot + warm + cold), and query:

```
C_signal = C_ingest + C_storage_hot + C_storage_warm + C_storage_cold + C_query
```

### 6.1.2 Unit Cost Definitions

| Unit | Definition | Reporting Cadence | Used By |
|---|---|---|---|
| **$/active series/month** | Prometheus active series cost ÷ active series count | Monthly | Cardinality reviews ([Chapter 1. Enterprise Observability Standards Catalog -> Section 3.1. Cardinality Governance](1-enterprise-observability-standards-catalog.md#31-cardinality-governance)) |
| **$/GB-day metrics (hot)** | Hot metrics storage cost ÷ GB-days | Monthly | Tier-window calibration |
| **$/GB ingested logs** | Loki ingest cost ÷ GB ingested | Monthly | Log-volume conversations with service teams |
| **$/GB-day logs (hot)** | Hot logs storage cost ÷ GB-days | Monthly | Tier-window calibration |
| **$/million spans ingested** | Tempo ingest cost ÷ M spans | Monthly | Sampling-rate decisions |
| **$/GB-day traces (hot)** | Hot trace storage cost ÷ GB-days | Monthly | Sampling + retention decisions |
| **$/service/month (T1)** | All-signal cost / number of T1 services | Monthly | Service-tier benchmark |
| **$/service/month (T2)** | As above for T2 | Monthly | Service-tier benchmark |
| **$/service/month (T3)** | As above for T3 | Monthly | Service-tier benchmark |
| **$/service/month (T4)** | As above for T4 | Monthly | Service-tier benchmark |
| **$/incident** | Total cost ÷ incidents in window | Monthly | Cost-effectiveness |
| **$/tenant/month** | Per-tenant attributed cost | Monthly | Multi-tenant chargeback ([Chapter 26](26-multi-tenant-and-customer-site-deployment-model.md)) |
| **$/engineer/month** | Total cost ÷ engineers using the platform | Monthly | Platform productivity metric |

### 6.1.3 Indicative Unit-Cost Benchmarks

The figures below are **indicative starting points** for an enterprise stack at moderate scale (low hundreds of services, multi-million active series). Calibrate to your environment after one billing cycle.

| Unit | Indicative Range | Action if Above Range |
|---|---|---|
| $/active series/month | $0.0008 – $0.0015 | Cardinality reduction; bucket high-cardinality labels |
| $/GB ingested logs | $0.40 – $0.80 | Log sampling; structured-log enforcement; drop `DEBUG` in prod |
| $/million spans ingested | $0.30 – $0.70 | Tighten tail-sampling; drop healthcheck spans |
| $/service/month (T1) | $200 – $600 | Investigate dominant signal; cardinality + sampling levers |
| $/service/month (T4) | $20 – $80 | Verify the service is on baseline kit, not over-instrumented |

### 6.1.4 Cost Attribution

Every cost is attributable to a `service.name` and `tenant.id`:
- **Metrics:** active series labelled with `service` map cleanly; recording rules and federation must preserve service label.
- **Logs:** `service` is a required Loki stream label per [Chapter 1](1-enterprise-observability-standards-catalog.md).
- **Traces:** `service.name` is mandatory per OTel semantic conventions; tail-sampler preserves it.
- **Compute:** Collector compute is shared; allocated by ingest volume share per service.

The attribution model is the basis for **chargeback / showback** in Section 6.2.

### 6.1.5 Showback vs. Chargeback Decision

| Mode | Description | When to Use |
|---|---|---|
| **Showback** | Service teams see their cost; platform pays the bill | Phase 1 / 2 — focuses on awareness; avoids political friction during adoption |
| **Chargeback** | Service teams bear their cost in their budget | Phase 3 — when the unit-cost model is mature, audit-ready, and disputes are rare |

The decision to move from showback to chargeback is an ARB decision recorded in [Chapter 16](16-observability-adr-decision-register.md).

## 6.2. Optimisation Playbook

A repeatable set of moves the FinOps + Platform Ops team executes when a unit cost trends adverse. Every move is **measured against the unit cost** to confirm impact.

### 6.2.1 The Top-5 Levers (in order of impact)

| Lever | Typical Saving | Risk | Owner |
|---|---|---|---|
| **1. Cardinality reduction** | 20–40% on metrics cost | Loss of dimension granularity | Service Owner + Platform Ops |
| **2. Log volume reduction** (DEBUG drops, structured-only) | 15–30% on logs cost | Reduced forensic depth | Service Owner |
| **3. Tail-sampling tuning** | 30–50% on trace cost | Risk of missing rare patterns; mitigated by 100% error retention | SRE + AIOps |
| **4. Hot-tier window shortening** | 10–20% on storage cost | Slower investigation of older data | Platform Ops |
| **5. Tier-aware retention** (T4 services have shorter windows) | 5–15% overall | Per-service negotiation | Service Owner + Governance |

### 6.2.2 Optimisation Cycle

```
Monthly review:
  1. Compute unit costs (Section 6.1.2)
  2. Rank top-3 services by total cost
  3. Rank top-3 unit-cost outliers (services exceeding indicative ranges)
  4. Identify dominant signal per outlier
  5. Apply lever (Section 6.2.1) appropriate to the signal
  6. Measure unit cost in next cycle; rollback if no improvement
```

### 6.2.3 Optimisation Anti-Patterns

- **Cutting retention without consulting incident response.** Long incidents need long telemetry windows; rule of thumb: retain hot ≥ p95 incident duration + 50%.
- **Aggressive head-sampling in T1.** Misses rare-but-important patterns; prefer tail-sampling that preserves errors and slow traces.
- **Removing labels without measuring.** Always model cardinality reduction before applying — some labels look high-cardinality but contribute little to cost (sparse).
- **Optimising during incident.** Freeze optimisation activity during active incidents and during the change-freeze windows in [Chapter 7. IaC for Observability Standard -> Section 7.1. Change Management](7-iac-for-observability-standard.md#71-change-management).
- **One-off "spring cleaning"**. Optimisation must be cyclical (Section 6.2.2) — single events drift back within a quarter.

## 6.3. Forecast and Budget Model

Inputs and outputs of the FinOps planning cycle.

### 6.3.1 Forecast Inputs

| Input | Source | Update Cadence |
|---|---|---|
| Service onboarding pipeline | [Chapter 25](25-service-onboarding-and-instrumentation-kits.md) | Monthly |
| Service tier distribution | [Chapter 1. Enterprise Observability Standards Catalog -> Section 4.1. Service Tiering Model](1-enterprise-observability-standards-catalog.md#41-service-tiering-model) | Quarterly |
| Cardinality budget headroom | [Chapter 1. Enterprise Observability Standards Catalog -> Section 3.1. Cardinality Governance](1-enterprise-observability-standards-catalog.md#31-cardinality-governance) | Monthly |
| Capacity sizing model | [Chapter 22](22-capacity-and-scale-model.md) | Quarterly |
| Tenant onboarding pipeline | [Chapter 26](26-multi-tenant-and-customer-site-deployment-model.md) | Monthly |
| Vendor unit-rate changes | Contracts | As-changed |

### 6.3.2 Budget Envelope

Three rolling envelopes are tracked:

- **Annual envelope.** Approved at fiscal-year start; the upper bound for total platform spend.
- **Quarterly envelope.** Annual envelope ÷ 4, ±10% flex for seasonal variation.
- **Monthly envelope.** Quarterly envelope ÷ 3; breach triggers FinOps review.

### 6.3.3 Variance Response

| Variance | Response |
|---|---|
| ≤ ±5% | Normal; logged in monthly report |
| +5% to +10% | FinOps review; identify drivers; activate top-1 optimisation lever |
| +10% to +20% | ARB notification; activate top-3 levers; consider Normal-class change freeze |
| > +20% | Emergency ARB; escalate to executive; consider service onboarding freeze |
| Negative variance > 10% | Investigate under-instrumentation (false economy); review against telemetry quality SLIs ([Chapter 11. Observability KPI Scorecard -> Section 6.1. Telemetry Data Quality SLIs](11-observability-kpi-scorecard.md#61-telemetry-data-quality-slis)) |

## 7. Deletion & Compaction Monitoring
Retention rules are configured in storage backends (Prometheus, Loki, Tempo, object storage). Deletion and compaction jobs are monitored to enforce policy and regulations (e.g. GDPR-aligned deletion timelines). See [Chapter 8. Observability Data Governance and Retention Policy -> Section 7. Deletion and Retention Enforcement](8-observability-data-governance-and-retention-policy.md#7-deletion-and-retention-enforcement), [Chapter 10. Compliance and Audit Control Matrix](10-compliance-and-audit-control-matrix.md).

## 8. Cross-References
- [Chapter 1. Enterprise Observability Standards Catalog](1-enterprise-observability-standards-catalog.md) — cardinality budgets and tier model that drive cost (Section 6.1, Section 6.2).
- [Chapter 8. Observability Data Governance and Retention Policy](8-observability-data-governance-and-retention-policy.md) — retention policy this standard implements cost-side.
- [Chapter 10. Compliance and Audit Control Matrix](10-compliance-and-audit-control-matrix.md) — compliance constraints on what can be deleted / archived.
- [Chapter 11. Observability KPI Scorecard -> Section 6.1. Telemetry Data Quality SLIs](11-observability-kpi-scorecard.md#61-telemetry-data-quality-slis) — quality SLIs that bound cost cuts.
- [Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md) — governance approval for tiering and chargeback changes.
- [Chapter 22. Capacity and Scale Model](22-capacity-and-scale-model.md) — capacity inputs to Section 6.3 forecast.
- [Chapter 25. Service Onboarding and Instrumentation Kits](25-service-onboarding-and-instrumentation-kits.md) — onboarding pipeline feeding Section 6.3 forecast.
- [Chapter 26. Multi-Tenant and Customer-Site Deployment Model](26-multi-tenant-and-customer-site-deployment-model.md) — per-tenant cost attribution (Section 6.1.4, Section 6.1.5).

---

[↑ Back to TOC](toc.md)
