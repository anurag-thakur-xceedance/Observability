---
title: Observability FinOps Standard
chapter: 9
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 9. Observability FinOps Standard

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 9.1 Purpose
Lifecycle policies manage cost and performance of observability platforms. This standard defines the cost-management mechanics that operationalise the retention authorisations in [Chapter 8. Observability Data Governance and Retention Policy](08-observability-data-governance-and-retention-policy.md).

## 9.2 Storage Tier Model

| Tier | Contents | Typical Window | Media |
|---|---|---|---|
| **Hot** | Recent, high-value data: last 7–14 days of logs and traces; last 30 days of metrics | Days | Fast, high-cost media |
| **Warm** | Down-sampled metrics and compressed logs retained beyond hot windows | Weeks–Months | Mid-cost storage |
| **Cold / Archive** | Long-term RCA documents, audit reports, and selected aggregates | Months–Years | Object storage |

## 9.3 Down-Sampling and Aggregation
- **Metrics down-sampling:** raw → 1-minute → 5-minute aggregates after the hot period.
- **High-cardinality labels** removed or bucketed after a defined retention window.
- These measures reduce storage overhead while preserving trend and SLO visibility.

## 9.4 Cost Levers
- Hot/warm/cold tiering windows.
- Sampling strategy (head/tail) for traces.
- Cardinality controls (label bucketing, drop high-cardinality dimensions).
- Compression and codec selection for logs.
- Retention windows per service criticality.

## 9.5 Cost KPIs
- **Reduce observability tooling costs by 20–25%** in 12 months (executive target — see [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md)).
- Storage cost **per service over time** trending downward while maintaining required visibility.
- **Tool coverage rate > 90%** for unified stack despite cost reduction.

## 9.6 Value Tracking
- Cost-per-incident-resolved.
- Cost-per-instrumented-service.
- Storage cost vs. retention SLO compliance.
- Tool count consolidation (reduction of 30–40% over 12 months).

### 9.6.1 Unit Economics

The platform's cost story is told in **unit economics**: cost per signal, per service, per tier, per tenant. Aggregated cost numbers are necessary but not sufficient — only unit economics let the business decide where to invest, where to cut, and where to charge back.

### 9.6.2 Unit Cost Model

The total monthly platform cost **C** is decomposed by signal:

```
C  =  C_metrics  +  C_logs  +  C_traces  +  C_profiles  +  C_synthetic  +  C_compute  +  C_egress
```

Each signal cost is further decomposed into ingest, storage (hot + warm + cold), and query:

```
C_signal = C_ingest + C_storage_hot + C_storage_warm + C_storage_cold + C_query
```

### 9.6.3 Unit Cost Definitions

| Unit | Definition | Reporting Cadence | Used By |
|---|---|---|---|
| **$/active series/month** | Prometheus active series cost ÷ active series count | Monthly | Cardinality reviews ([Chapter 1. Enterprise Observability Standards Catalog -> Section 1.3.4 Cardinality Governance](01-enterprise-observability-standards-catalog.md#134-cardinality-governance)) |
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

### 9.6.4 Indicative Unit-Cost Benchmarks

The figures below are **indicative starting points** for an enterprise stack at moderate scale (low hundreds of services, multi-million active series). Calibrate to your environment after one billing cycle.

| Unit | Indicative Range | Action if Above Range |
|---|---|---|
| $/active series/month | $0.0008 – $0.0015 | Cardinality reduction; bucket high-cardinality labels |
| $/GB ingested logs | $0.40 – $0.80 | Log sampling; structured-log enforcement; drop `DEBUG` in prod |
| $/million spans ingested | $0.30 – $0.70 | Tighten tail-sampling; drop healthcheck spans |
| $/service/month (T1) | $200 – $600 | Investigate dominant signal; cardinality + sampling levers |
| $/service/month (T4) | $20 – $80 | Verify the service is on baseline kit, not over-instrumented |

### 9.6.5 Cost Attribution

Every cost is attributable to a `service.name` and `tenant.id`:
- **Metrics:** active series labelled with `service` map cleanly; recording rules and federation must preserve service label.
- **Logs:** `service` is a required Loki stream label per [Chapter 1](01-enterprise-observability-standards-catalog.md).
- **Traces:** `service.name` is mandatory per OTel semantic conventions; tail-sampler preserves it.
- **Compute:** Collector compute is shared; allocated by ingest volume share per service.

The attribution model is the basis for **chargeback / showback** in Section 6.2.

### 9.6.6 Showback vs. Chargeback Decision

| Mode | Description | When to Use |
|---|---|---|
| **Showback** | Service teams see their cost; platform pays the bill | Phase 1 / 2 — focuses on awareness; avoids political friction during adoption |
| **Chargeback** | Service teams bear their cost in their budget | Phase 3 — when the unit-cost model is mature, audit-ready, and disputes are rare |

The decision to move from showback to chargeback is an ARB decision recorded in [Chapter 16](16-observability-adr-decision-register.md).

### 9.6.7 Optimisation Playbook

A repeatable set of moves the FinOps + Platform Ops team executes when a unit cost trends adverse. Every move is **measured against the unit cost** to confirm impact.

### 9.6.8 The Top-5 Levers (in order of impact)

| Lever | Typical Saving | Risk | Owner |
|---|---|---|---|
| **1. Cardinality reduction** | 20–40% on metrics cost | Loss of dimension granularity | Service Owner + Platform Ops |
| **2. Log volume reduction** (DEBUG drops, structured-only) | 15–30% on logs cost | Reduced forensic depth | Service Owner |
| **3. Tail-sampling tuning** | 30–50% on trace cost | Risk of missing rare patterns; mitigated by 100% error retention | SRE + AIOps |
| **4. Hot-tier window shortening** | 10–20% on storage cost | Slower investigation of older data | Platform Ops |
| **5. Tier-aware retention** (T4 services have shorter windows) | 5–15% overall | Per-service negotiation | Service Owner + Governance |

### 9.6.9 Optimisation Cycle

```
Monthly review:
  1. Compute unit costs (Section 6.1.2)
  2. Rank top-3 services by total cost
  3. Rank top-3 unit-cost outliers (services exceeding indicative ranges)
  4. Identify dominant signal per outlier
  5. Apply lever (Section 6.2.1) appropriate to the signal
  6. Measure unit cost in next cycle; rollback if no improvement
```

### 9.6.10 Optimisation Anti-Patterns

- **Cutting retention without consulting incident response.** Long incidents need long telemetry windows; rule of thumb: retain hot ≥ p95 incident duration + 50%.
- **Aggressive head-sampling in T1.** Misses rare-but-important patterns; prefer tail-sampling that preserves errors and slow traces.
- **Removing labels without measuring.** Always model cardinality reduction before applying — some labels look high-cardinality but contribute little to cost (sparse).
- **Optimising during incident.** Freeze optimisation activity during active incidents and during the change-freeze windows in [Chapter 7. IaC for Observability Standard (Docker Compose + PowerShell) -> Section 7.7.1 Change Management](07-iac-for-observability-standard.md#771-change-management).
- **One-off "spring cleaning"**. Optimisation must be cyclical (Section 6.2.2) — single events drift back within a quarter.

### 9.6.11 Forecast and Budget Model

Inputs and outputs of the FinOps planning cycle.

### 9.6.12 Forecast Inputs

| Input | Source | Update Cadence |
|---|---|---|
| Service onboarding pipeline | [Chapter 25](25-service-onboarding-and-instrumentation-kits.md) | Monthly |
| Service tier distribution | [Chapter 1. Enterprise Observability Standards Catalog -> Section 1.4.1 Service Tiering Model](01-enterprise-observability-standards-catalog.md#141-service-tiering-model) | Quarterly |
| Cardinality budget headroom | [Chapter 1. Enterprise Observability Standards Catalog -> Section 1.3.4 Cardinality Governance](01-enterprise-observability-standards-catalog.md#134-cardinality-governance) | Monthly |
| Capacity sizing model | [Chapter 22](22-capacity-and-scale-model.md) | Quarterly |
| Tenant onboarding pipeline | [Chapter 26](26-multi-tenant-and-customer-site-deployment-model.md) | Monthly |
| Vendor unit-rate changes | Contracts | As-changed |

### 9.6.13 Budget Envelope

Three rolling envelopes are tracked:

- **Annual envelope.** Approved at fiscal-year start; the upper bound for total platform spend.
- **Quarterly envelope.** Annual envelope ÷ 4, ±10% flex for seasonal variation.
- **Monthly envelope.** Quarterly envelope ÷ 3; breach triggers FinOps review.

### 9.6.14 Variance Response

| Variance | Response |
|---|---|
| ≤ ±5% | Normal; logged in monthly report |
| +5% to +10% | FinOps review; identify drivers; activate top-1 optimisation lever |
| +10% to +20% | ARB notification; activate top-3 levers; consider Normal-class change freeze |
| > +20% | Emergency ARB; escalate to executive; consider service onboarding freeze |
| Negative variance > 10% | Investigate under-instrumentation (false economy); review against telemetry quality SLIs ([Chapter 11. Observability KPI Scorecard -> Section 11.6.1 Telemetry Data Quality SLIs](11-observability-kpi-scorecard.md#1161-telemetry-data-quality-slis)) |

### 9.6.15 Twelve-Month Worked Cost Model

This worked model takes the **Medium reference deployment** (see [Chapter 22. Capacity and Scale Model -> Section 22.3 Worked Sizing Examples](22-capacity-and-scale-model.md#223-worked-sizing-examples)) and projects 12 months of cost evolution including organic growth, optimisation interventions, and budget variance. Numbers are illustrative for Azure West Europe pricing class (2026-Q1) and must be re-baselined per estate.

### 9.6.16 Starting Position (Month 0)

| Dimension | Month 0 |
|---|---|
| Services onboarded | 150 (T1: 15, T2: 35, T3: 60, T4: 40) |
| Active metric series | 1.46M |
| Log volume (raw) | 16 GB/day |
| Span ingest rate | 15k/s |
| Stored spans (post-sampling) | 1.2k/s |
| Hot retention: metrics / logs / traces | 30 d / 30 d / 7 d |
| Monthly spend | $1,280 |
| Service tier targets (annual envelope) | T1 $400, T2 $200, T3 $80, T4 $30 |

### 9.6.17 Planning Assumptions

| Assumption | Value | Source |
|---|---|---|
| Service onboarding rate | +8 services/month avg | [Chapter 25](25-service-onboarding-and-instrumentation-kits.md) pipeline |
| Tier mix of new services | T1: 5%, T2: 20%, T3: 50%, T4: 25% | Historical onboarding ratio |
| Underlying log-volume growth per service | +5%/quarter | Application chattiness drift |
| Vendor unit-rate change | +0% (locked reserved-instance contract) | Vendor contract |
| Optimisation intervention #1 (Month 4) | Cardinality reduction — drop 3 high-cardinality labels on top-10 metrics | Section 6.2.1 Lever 1 |
| Optimisation intervention #2 (Month 7) | DEBUG log drop in prod for T3/T4 services | Section 6.2.1 Lever 2 |
| Optimisation intervention #3 (Month 10) | Tail-sampling tightening from 8% to 5% stored | Section 6.2.1 Lever 3 |
| Annual envelope | $18,000 | Approved at FY start |
| Quarterly envelope | $4,500 (with ±10% flex → $4,050–$4,950) | Annual / 4 |
| Monthly envelope | $1,500 | Quarterly / 3 |

### 9.6.18 Month-by-Month Projection

Notation: **growth** = baseline growth without intervention; **intervention** = month an optimisation lever is applied; **net spend** = actual monthly cost after intervention; **cum.** = year-to-date cumulative.

| Month | Services | Active Series | Logs (GB/day) | Spans Stored (/s) | Driver | Net Spend | Cum. | Monthly Envelope | Variance vs. Envelope |
|---|---|---|---|---|---|---|---|---|---|
| M1 | 158 | 1.54M | 16.8 | 1.26k | organic growth | $1,335 | $1,335 | $1,500 | -11.0% (under) |
| M2 | 166 | 1.62M | 17.6 | 1.32k | organic growth | $1,390 | $2,725 | $1,500 | -7.3% (under) |
| M3 | 174 | 1.70M | 18.5 | 1.39k | organic growth + Q-end log drift | $1,460 | $4,185 | $1,500 | -2.7% (within ±5%) |
| M4 | 182 | 1.59M | 19.4 | 1.46k | **intervention 1: cardinality −22% on metrics** | $1,395 | $5,580 | $1,500 | -7.0% (under) |
| M5 | 190 | 1.66M | 20.4 | 1.52k | organic growth | $1,450 | $7,030 | $1,500 | -3.3% (within ±5%) |
| M6 | 198 | 1.73M | 21.4 | 1.59k | organic growth | $1,510 | $8,540 | $1,500 | +0.7% (within ±5%) |
| M7 | 206 | 1.80M | 16.5 | 1.66k | **intervention 2: DEBUG drop −23% on logs** | $1,420 | $9,960 | $1,500 | -5.3% (under) |
| M8 | 214 | 1.87M | 17.3 | 1.73k | organic growth | $1,475 | $11,435 | $1,500 | -1.7% (within ±5%) |
| M9 | 222 | 1.94M | 18.2 | 1.79k | organic growth + Q-end log drift | $1,545 | $12,980 | $1,500 | +3.0% (within ±5%) |
| M10 | 230 | 2.01M | 19.1 | 1.17k | **intervention 3: tail-sample 8%→5% on traces** | $1,490 | $14,470 | $1,500 | -0.7% (within ±5%) |
| M11 | 238 | 2.08M | 20.1 | 1.22k | organic growth | $1,555 | $16,025 | $1,500 | +3.7% (within ±5%) |
| M12 | 246 | 2.16M | 21.1 | 1.27k | organic growth | $1,625 | $17,650 | $1,500 | +8.3% (variance review) |

**Year-end position:** $17,650 cumulative against the $18,000 annual envelope → **−1.9% variance**. Achieved while growing service count by 64% (150 → 246) and active series by 48% (1.46M → 2.16M).

### 9.6.19 Cost Decomposition (Month 12)

| Signal | Ingest | Storage Hot | Storage Warm | Storage Cold | Query | Total | Share |
|---|---|---|---|---|---|---|---|
| Metrics | $145 | $290 | $90 | $25 | $60 | $610 | 37.5% |
| Logs | $180 | $115 | $45 | $20 | $50 | $410 | 25.2% |
| Traces | $90 | $135 | $30 | $10 | $25 | $290 | 17.8% |
| Profiles | $15 | $12 | $5 | $3 | $5 | $40 | 2.5% |
| Synthetic | $20 | $5 | — | — | $5 | $30 | 1.8% |
| Compute (shared, allocated) | — | — | — | — | — | $180 | 11.1% |
| Egress | — | — | — | — | — | $65 | 4.0% |
| **Total** | **$450** | **$557** | **$170** | **$58** | **$145** | **$1,625** | **100%** |

Observations:
- **Metrics dominate at 37.5%** despite cardinality reduction; this is normal for a service estate with strong RED-metric coverage. Next lever: shorten hot window from 30 d → 20 d.
- **Storage outweighs ingest** ($785 vs. $450) — primary FinOps focus should remain tier-window and retention, not ingest throttling.
- **Egress at 4%** is healthy; would rise if cross-region replication were added (currently single-region per [Chapter 21](21-observability-platform-ha-and-dr-design.md)).

### 9.6.20 Unit Cost Trajectory

| Unit | M0 | M4 (post-int. 1) | M7 (post-int. 2) | M10 (post-int. 3) | M12 | Trend |
|---|---|---|---|---|---|---|
| $/active series/month | $0.00088 | $0.00088 → $0.00077 | $0.00073 | $0.00069 | $0.00071 | -19% |
| $/GB ingested logs | $0.55 | $0.55 | $0.55 → $0.49 | $0.49 | $0.50 | -9% |
| $/M spans ingested | $0.42 | $0.42 | $0.42 | $0.42 → $0.34 | $0.34 | -19% |
| $/service/month (T1) | $415 | $395 | $370 | $355 | $360 | -13% |
| $/service/month (T4) | $32 | $31 | $26 | $25 | $25 | -22% |
| $/service/month (blended) | $8.50 | $7.65 | $6.90 | $6.50 | $6.60 | -22% |

Every unit cost trends downward while absolute spend grows — the canonical FinOps signature of a healthy maturing platform.

### 9.6.21 Variance Response Triggered

Reviewing the projection against Section 6.3.3 variance bands:
- **M12 at +8.3%** monthly variance falls in the +5% to +10% band → **FinOps review** at the M13 cycle to identify drivers and activate the top-1 optimisation lever (likely metrics hot-window shortening). No ARB escalation required.
- No month breached the +10% band, so no ARB notification was triggered in-year.
- No month showed negative variance > 10%, so no under-instrumentation false-economy investigation was triggered.

### 9.6.22 Sensitivity Analysis

How robust is the year-end position to assumption changes?

| Scenario | Year-End Variance | Triggers |
|---|---|---|
| Baseline (above) | −1.9% (under) | M12 monthly +8.3% → FinOps review |
| Onboarding rate +50% (+12/month) | +6.4% (over) | M9 onward in +5–10% band; ARB notification at M11 |
| No optimisation interventions | +13.8% (over) | ARB notification at M6; emergency ARB at M11 |
| Vendor unit-rate +10% mid-year | +4.2% (over) | M7 onward in +5–10% band; activate top-3 levers |
| Tail-sampling intervention delayed 3 months | +1.1% (over) | M11 in +5–10% band; one-cycle FinOps review |
| Cardinality intervention saves 30% (not 22%) | −5.8% (under) | Investigate under-instrumentation per Section 6.3.3 |

The model's largest risk is **deferring the optimisation cadence**: a single skipped intervention shifts year-end by ~3–5%; skipping all three pushes the platform into a guaranteed ARB-escalation path by mid-year.

### 9.6.23 Reconciliation with Capacity Plan

| Item | FinOps Month 12 | Capacity Plan ([Chapter 22. Capacity and Scale Model -> Section 22.3 Worked Sizing Examples](22-capacity-and-scale-model.md#223-worked-sizing-examples)) | Comment |
|---|---|---|---|
| Services | 246 | 150 (baseline) | Growth absorbed; capacity headroom still adequate per Ch 22 Step 10 |
| Active series | 2.16M | 1.46M | Approaches Prometheus RAM trigger at ~73% → Mimir migration ADR due M14 |
| Log volume | 21 GB/day raw | 16 GB/day | Within 58× Loki headroom — no action |
| Span ingest | 15k/s (unchanged at gateway; intervention reduced storage not ingest) | 15k/s | Still at 1.4× headroom on Tempo — watch |

The reconciliation surfaces the **Mimir migration trigger** earlier than calendar-driven planning would, justifying the FinOps + Capacity joint review cadence specified in Section 6.3.1.

## 9.7 Deletion & Compaction Monitoring
Retention rules are configured in storage backends (Prometheus, Loki, Tempo, object storage). Deletion and compaction jobs are monitored to enforce policy and regulations (e.g. GDPR-aligned deletion timelines). See [Chapter 8. Observability Data Governance and Retention Policy -> Section 8.7 Deletion and Retention Enforcement](08-observability-data-governance-and-retention-policy.md#87-deletion-and-retention-enforcement), [Chapter 10. Compliance and Audit Control Matrix](10-compliance-and-audit-control-matrix.md).

## 9.8 Cross-References
- [Chapter 1. Enterprise Observability Standards Catalog](01-enterprise-observability-standards-catalog.md) — cardinality budgets and tier model that drive cost (Section 6.1, Section 6.2).
- [Chapter 8. Observability Data Governance and Retention Policy](08-observability-data-governance-and-retention-policy.md) — retention policy this standard implements cost-side.
- [Chapter 10. Compliance and Audit Control Matrix](10-compliance-and-audit-control-matrix.md) — compliance constraints on what can be deleted / archived.
- [Chapter 11. Observability KPI Scorecard -> Section 11.6.1 Telemetry Data Quality SLIs](11-observability-kpi-scorecard.md#1161-telemetry-data-quality-slis) — quality SLIs that bound cost cuts.
- [Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md) — governance approval for tiering and chargeback changes.
- [Chapter 22. Capacity and Scale Model](22-capacity-and-scale-model.md) — capacity inputs to Section 6.3 forecast.
- [Chapter 25. Service Onboarding and Instrumentation Kits](25-service-onboarding-and-instrumentation-kits.md) — onboarding pipeline feeding Section 6.3 forecast.
- [Chapter 26. Multi-Tenant and Customer-Site Deployment Model](26-multi-tenant-and-customer-site-deployment-model.md) — per-tenant cost attribution (Section 6.1.4, Section 6.1.5).

---

[↑ Back to TOC](toc.md)
