# D5 — Grafana Platform Standard & Visualization Playbook

> **Purpose:** Dashboard, visualization, and Grafana operating standards.
> **Source Strategy Sections:** Grafana Observability Layer; Key Metrics and Suggested Ranges (Grafana); Recommended Alerting Policy (Grafana implementation); Implementation & Visualization Tips (Grafana).
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1.

---

## 1. Purpose
Defines how Grafana is operated as the primary visualization and alerting platform, and how dashboards are structured to provide the "single pane of glass" stated in the strategy.

## 2. Role of Grafana in the Strategy
Grafana provides visualization and alerting by connecting to Prometheus (metrics), Loki (logs), and Tempo (traces) as data sources. Dashboards, exploratory queries, and alerts are configured within Grafana to present a unified, single-pane-of-glass view of system health, performance, and reliability.

## 3. Dashboard Structure (Three-Layer Model)

| Layer | Scope | Audience |
|---|---|---|
| **Infrastructure** | System reliability overview — host health, container health, network | SRE / Platform Ops |
| **Application** | Service health and trace-driven metrics — latency, errors, throughput | App engineering, on-call |
| **Business** | Customer-impact KPIs — login/payment success rates, conversion latencies | Product, Operations leadership |

## 4. Key Metrics & Suggested Ranges (Visualization)
Full thresholds in **D1 §10**. Summary:

| Layer | Metric | Healthy | Warning | Critical |
|---|---|---|---|---|
| Infra | Host Health (services Up) | 100% Up | < 99% > 5 min | < 97% / multi-service loss |
| Infra | Host Utilization | 40–70% | > 75% > 5 min | > 90% / OOM |
| Infra | Network Saturation | < 60% | 60–80% > 5 min | > 80% > 2 min or drops > 0.5% |
| App | API Latency (P95/P99) | < 300 ms | 300–800 ms sustained | > 800 ms > 2 min |
| App | Error Rates | < 0.2% | 0.2–1% > 5 min | > 1% > 2 min or > 3% spike |
| App | Request Throughput | Baseline trend | ±10% deviation | ±20% sustained 10 min |
| Business | Login Success | ≥ 99% | 98–99% sustained | < 98% or failures > 3% |
| Business | Payment Success | ≥ 98% | 96–98% sustained | < 96% > 2 min |
| Business | Checkout Latency (P95) | < 2 s | 2–3 s sustained | > 3 s > 2 min |

## 5. Recommended Alerting Policy (Grafana Implementation)
Severity model is owned by **D4**. Grafana implementation specifics:

- Alert rules are defined as code (GitOps) and version-controlled.
- Severity-based routing via contact points & notification policies.
- Group, dedupe, and silence rules tuned to preserve signal-to-noise ≥ 80%.
- Each alert references a runbook URL (linking to **D3** / **D12**).

| Severity | Trigger Definition | Response Expectation |
|---|---|---|
| Info / Normal | Within healthy range or brief transient spikes | Observe trend; log for baselining only. |
| Warning | Above warning threshold for ≥ 5 min rolling window | Investigate within normal support hours; check dependency or resource limits. |
| Critical | Above critical threshold for ≥ 2 min or repeated within 10 min | Immediate incident response; probable user or business impact. |

## 6. Implementation & Visualization Tips
- **Dashboards structure:** Infra → Application → Business (top-down).
- **Percentile-based latency.** Always track **P95 and P99**, never rely solely on averages.
- **Correlate metrics.** High API latency + elevated error rates typically indicates backend/DB issue. High API latency + healthy DB latency typically indicates app-side or runtime contention.
- **Use panels.** Combine **gauges** (current state) with **time-series** panels (trend).
- **Anomaly overlays.** Predicted-vs-actual curves and anomaly deviation values rendered alongside live data (see **D6**).
- **Standardise dashboard library.** Per-domain template dashboards (Infra/App/DB/Network/Scaling/AI) cloned per service rather than hand-built.

## 7. Calibration
Industry-standard starting ranges. After a few weeks of live data, calibrate so warning ≈ 95th-percentile normal behaviour and critical ≈ user impact / SLA breach.

## 8. Cross-References
- **D1** — metric standards and thresholds.
- **D2** — Grafana's role in the reference architecture.
- **D4** — enterprise severity policy.
- **D6** — AI overlays in Grafana.
- **D11** — KPI scorecard rendered through Grafana.
