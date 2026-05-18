---
title: Observability Capability Assessment Framework
chapter: 15
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 15. Observability Capability Assessment Framework

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Reviewed Date | Status |
|---|---|---|---|---|
| 0.1 | TBD | Internal |  | Draft |
---

## 15.1 Purpose
Assesses observability maturity against the phase plan in [14. Observability Roadmap Delivery Plan](14-observability-roadmap-delivery-plan.md). Outputs feed the executive scorecard ([12. Observability KPI Scorecard](12-observability-kpi-scorecard.md)).

## 15.2 Maturity Phase Scorecard

| Metric | Phase 1 Target | Phase 2 Target | Phase 3 Target |
|---|---|---|---|
| Mean Time to Detect (MTTD) | < 15 minutes | < 5 minutes | < 1 minute |
| Mean Time to Resolution (MTTR) | Hours | 30 minutes | Minutes |
| Services Instrumented | 20% | 70% | 100% |
| Alert Noise Ratio | High | Moderate | Low (< 10% false positives) |
| Manual RCA Required | 100% | 50% | < 20% |
| Automated Ticket Creation | 0% | 50% | > 90% |

## 15.3 Assessment Dimensions
1. **Coverage** — % of services emitting standardised telemetry.
2. **Detection** — MTTD, alert quality, false-positive rate.
3. **Diagnosis** — % incidents with identified root cause; RCA cycle time.
4. **Remediation** — % automated, MTTR, rollback safety.
5. **Governance** — schema compliance, retention adherence, audit pass rate.
6. **Cost Efficiency** — cost per service trend, tool consolidation.
7. **Cultural Adoption** — cross-team usage, training completion (links to [19. Observability Operating Model and Adoption Plan](19-observability-operating-model-and-adoption-plan.md)).

## 15.4 Scoring Method
- Each dimension scored against Phase 1 / 2 / 3 thresholds.
- Aggregate maturity = weighted blend; weights agreed by governance body ([16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md)).
- Reviewed quarterly; recalibrated against actual production data.

## 15.5 Inputs
- KPI scorecard ([12. Observability KPI Scorecard](12-observability-kpi-scorecard.md)).
- Incident review records ([13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md)).
- IaC platform metrics ([8. IaC for Observability Standard (Docker Compose + PowerShell)](08-iac-for-observability-standard.md)).
- Compliance / audit reports ([11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md)).

## 15.6 Outputs
- Quarterly maturity report.
- Phase-gate readiness recommendation (proceed / hold / remediate).
- Inputs to [14. Observability Roadmap Delivery Plan](14-observability-roadmap-delivery-plan.md) plan adjustments.

## 15.7 Cross-References
- [12. Observability KPI Scorecard](12-observability-kpi-scorecard.md) — KPI source.
- [14. Observability Roadmap Delivery Plan](14-observability-roadmap-delivery-plan.md) — phase plan being assessed.
- [16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md) — governance body that ratifies phase gates.
- [19. Observability Operating Model and Adoption Plan](19-observability-operating-model-and-adoption-plan.md) — cultural / adoption inputs.

---

[↑ Back to TOC](toc.md)
