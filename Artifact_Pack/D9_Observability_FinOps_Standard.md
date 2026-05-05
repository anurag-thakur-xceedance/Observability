# D9 — Observability FinOps Standard

> **Purpose:** Cost lifecycle, optimisation model, value tracking for the observability platform.
> **Source Strategy Sections:** Lifecycle Management and Cost Optimisation.
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1.

---

## 1. Purpose
Lifecycle policies are used to manage the cost and performance of observability platforms. This standard defines the cost-management mechanics that operationalise the retention authorisations from **D8**.

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
- **Reduce observability tooling costs by 20–25%** in 12 months (executive target — see **D11**).
- Storage cost **per service over time** trending downward while maintaining required visibility.
- **Tool coverage rate > 90%** for unified stack despite cost reduction.

## 6. Value Tracking
- Cost-per-incident-resolved.
- Cost-per-instrumented-service.
- Storage cost vs. retention SLO compliance.
- Tool count consolidation (reduction of 30–40% over 12 months).

## 7. Deletion & Compaction Monitoring
Retention rules configured in storage backends (Prometheus, Loki, Tempo, object storage). Deletion jobs and compaction processes monitored to ensure compliance with policy and regulations (e.g. GDPR-aligned deletion timelines when applicable). Cross-reference: **D8 §7**, **D10**.

## 8. Cross-References
- **D8** — retention policy this standard implements cost-side.
- **D10** — compliance constraints on what can be deleted / archived.
- **D11** — cost optimisation KPIs.
- **D15** — governance approval for tiering changes.
