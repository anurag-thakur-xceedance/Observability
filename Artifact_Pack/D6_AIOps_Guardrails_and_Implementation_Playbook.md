# D6 — AIOps Guardrails & Implementation Playbook

> **Purpose:** AI-driven RCA / ticketing guardrails, interpretation, operations workflow.
> **Source Strategy Sections:** AI-Driven Observability Layer; AI-Driven Observability Key Metrics and Suggested Ranges; AI-Driven Observability Metrics; Interpreting the AI-Driven Metrics; Severity Policy for AI-Detected Events; Implementation Recommendations (AI).
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1.

---

## 1. Strategic Intent & Guardrails
The Agentic AI layer transforms observability from reactive to proactive by performing automated root-cause analysis (RCA), anomaly detection, and enriched incident-ticket creation against telemetry exposed by Prometheus, Loki, and Tempo.

**Guardrails (non-negotiable):**
- AI alerts only fire when **deviation crosses defined thresholds** AND **anomaly confidence ≥ 80%** for warnings, ≥ 90% for criticals.
- Auto-remediation is restricted to **pre-approved runbooks** with full audit trails.
- Operator validation is required for model retraining feedback loops.
- False-positive rate must remain below 5%; precision ≥ 90%; recall ≥ 85%.
- Detection latency must remain below 2 minutes from anomaly onset.

## 2. AI-Driven Observability Metrics

| Category | Metric | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|---|
| Anomaly Detection | Abnormal Latency Spikes | ±10% baseline | 10–25% deviation > 5 min | > 25% deviation > 2 min | Model forecasts expected P95 latency; > 25% implies probable incident or dependency slowdown. FP rate target < 5%. |
| Anomaly Detection | Unusual Traffic Patterns | ±15% | 15–30% deviation > 5 min | > 30% > 2 min or confidence > 95% | Early DDoS / load-imbalance detection. Precision ≥ 90%, recall ≥ 85%. |
| Correlation Analysis | Deployment vs Error Spike | r < 0.3 (weak) | 0.3–0.6 (moderate) | r > 0.6 (strong) | Strong positive r → recent deployments contributing to errors. Feed back into deployment practices. |
| Correlation Analysis | Scaling vs DB Saturation | r < 0.4 | 0.4–0.7 | r > 0.7 | Strong positive r → scaling events associated with DB saturation. Adjust scaling strategy / DB capacity. |

## 3. Interpreting the AI-Driven Metrics

| Element | Interpretation / Goal | Tuning Guidance |
|---|---|---|
| **Model Confidence** | Strength of detection (e.g. probability > 90%) | Use high-confidence thresholds for critical alerts to reduce noise; tune sensitivity per metric. |
| **Deviation Thresholds** | Percentage change from historical / expected baseline | Compute baselines over rolling windows (24 hours or same-day-of-week). |
| **Correlation Coefficient (r)** | Quantifies relationship between two event series (−1 to +1) | Use absolute value of r; higher means stronger correlation. Derive thresholds from historical data. |

## 4. Severity Policy for AI-Detected Events
Owned by **D4 §4.6**. Summary:

| Severity | Trigger | Action |
|---|---|---|
| Info / Normal | Deviation < warning OR confidence < 70% | Record event for model training; no alert. |
| Warning | Deviation crosses warning AND confidence ≥ 80% | Validate with human triage; check recent deployments / infra changes. |
| Critical | Critical threshold AND confidence ≥ 90%, OR correlation > 0.6 sustained | Automatic incident creation or rollback trigger. |

## 5. Implementation Recommendations

### 5.1 Data Sources
- Latency, error, and throughput metrics ingested from OpenTelemetry.
- External business event streams (deployments, scaling events, feature flags).

### 5.2 AI Models
- Moving-average methods.
- Seasonal-trend decomposition.
- ML-based outlier detection (e.g. **Prophet**, **Isolation Forest**).
- Selection criteria: explainability, retraining cost, false-positive control.

### 5.3 Visualization
- Predicted-vs-actual curves overlaid in Grafana (see **D5**).
- Anomaly deviation percentages and model confidence values shown on dashboards.

### 5.4 Success Criteria
- False-positive rate **< 5%**.
- Detection latency **< 2 minutes** from anomaly onset.
- Auto-correlation insights (e.g. deployment → error, scaling → load) routinely validated by operators for retraining.
- Anomalies precision **≥ 90%**, recall **≥ 85%**.

## 6. Feedback Loop & Continuous Improvement
- Operator validation outcomes feed retraining queues.
- AI accuracy is tracked month-over-month against operator feedback (see **D11** Phase 3 targets).
- Pre-approved auto-remediation actions are reviewed quarterly.

## 7. Cross-References
- **D1** — metric standards aligned with AI baseline calculations.
- **D4** — enterprise severity policy.
- **D5** — Grafana visualization of AI overlays.
- **D11** — Phase 3 KPI targets (MTTD < 1 min, automated tickets > 90%).
- **D12** — incident playbook integration with AI-generated tickets.
