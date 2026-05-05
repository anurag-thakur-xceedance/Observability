# D14 — Observability Capability Assessment Framework

> **Purpose:** Maturity scoring model and assessment criteria.
> **Source Strategy Sections:** Maturity Assessment Framework.
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1.

---

## 1. Purpose
Provides a structured way to assess current observability maturity and progress against the phase plan in **D13**. Outputs feed the executive scorecard (**D11**).

## 2. Maturity Phase Scorecard

| Metric | Phase 1 Target | Phase 2 Target | Phase 3 Target |
|---|---|---|---|
| Mean Time to Detect (MTTD) | < 15 minutes | < 5 minutes | < 1 minute |
| Mean Time to Resolution (MTTR) | Hours | 30 minutes | Minutes |
| Services Instrumented | 20% | 70% | 100% |
| Alert Noise Ratio | High | Moderate | Low (< 10% false positives) |
| Manual RCA Required | 100% | 50% | < 20% |
| Automated Ticket Creation | 0% | 50% | > 90% |

## 3. Assessment Dimensions
1. **Coverage** — % of services emitting standardised telemetry.
2. **Detection** — MTTD, alert quality, false-positive rate.
3. **Diagnosis** — % incidents with identified root cause; RCA cycle time.
4. **Remediation** — % automated, MTTR, rollback safety.
5. **Governance** — schema compliance, retention adherence, audit pass rate.
6. **Cost Efficiency** — cost per service trend, tool consolidation.
7. **Cultural Adoption** — cross-team usage, training completion (links to **D18**).

## 4. Scoring Method
- Each dimension scored against Phase 1 / 2 / 3 thresholds.
- Aggregate maturity = weighted blend; weights agreed by governance body (**D15**).
- Reviewed quarterly; recalibrated against actual production data.

## 5. Inputs
- KPI scorecard (**D11**).
- Incident review records (**D12**).
- IaC platform metrics (**D7**).
- Compliance / audit reports (**D10**).

## 6. Outputs
- Quarterly maturity report.
- Phase-gate readiness recommendation (proceed / hold / remediate).
- Inputs to **D13** plan adjustments.

## 7. Cross-References
- **D11** — KPI source.
- **D13** — phase plan being assessed.
- **D15** — governance body that ratifies phase gates.
- **D18** — cultural / adoption inputs.
