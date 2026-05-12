---
title: Observability Capability Assessment Framework
chapter: 14
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 14. Observability Capability Assessment Framework

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 1. Purpose
Assesses observability maturity against the phase plan in [Chapter 13. Observability Roadmap Delivery Plan](13-observability-roadmap-delivery-plan.md). Outputs feed the executive scorecard ([Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md)).

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
7. **Cultural Adoption** — cross-team usage, training completion (links to [Chapter 18. Observability Operating Model and Adoption Plan](18-observability-operating-model-and-adoption-plan.md)).

## 4. Scoring Method
- Each dimension scored against Phase 1 / 2 / 3 thresholds.
- Aggregate maturity = weighted blend; weights agreed by governance body ([Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md)).
- Reviewed quarterly; recalibrated against actual production data.

## 5. Inputs
- KPI scorecard ([Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md)).
- Incident review records ([Chapter 12. Incident Response Playbook](12-incident-response-playbook.md)).
- IaC platform metrics ([Chapter 7. IaC for Observability Standard](7-iac-for-observability-standard.md)).
- Compliance / audit reports ([Chapter 10. Compliance and Audit Control Matrix](10-compliance-and-audit-control-matrix.md)).

## 6. Outputs
- Quarterly maturity report.
- Phase-gate readiness recommendation (proceed / hold / remediate).
- Inputs to [Chapter 13. Observability Roadmap Delivery Plan](13-observability-roadmap-delivery-plan.md) plan adjustments.

## 7. Cross-References
- [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md) — KPI source.
- [Chapter 13. Observability Roadmap Delivery Plan](13-observability-roadmap-delivery-plan.md) — phase plan being assessed.
- [Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md) — governance body that ratifies phase gates.
- [Chapter 18. Observability Operating Model and Adoption Plan](18-observability-operating-model-and-adoption-plan.md) — cultural / adoption inputs.

---

[↑ Back to TOC](toc.md)
