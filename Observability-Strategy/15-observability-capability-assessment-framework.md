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

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](14-observability-roadmap-delivery-plan.md) | [Next Page](16-observability-governance-charter-and-arb-pack.md)

| **Document Owner** | CoE-Architecture |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **First Review** | 1-Aug-2026 |
| **Next Review Due** | 1-Nov-2026 |

---

## 15.1 Purpose
Assesses observability maturity against the phase plan in [Chapter 14. Observability Roadmap Delivery Plan](14-observability-roadmap-delivery-plan.md). Outputs feed the executive scorecard ([Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md)).

## 15.2 Maturity Phase Scorecard

| Metric | Phase 1 Target | Phase 2 Target | Phase 3 Target |
|---|---|---|---|
| Mean Time to Detect (MTTD) | < 15 minutes | < 5 minutes | < 1 minute |
| Mean Time to Resolution (MTTR) | <= 4 hours | <= 30 minutes | <= 15 minutes |
| Services Instrumented | 20% | 70% | 100% |
| Alert Noise Ratio | > 35% non-actionable | <= 20% non-actionable | <= 10% non-actionable |
| Manual RCA Required | 100% | 50% | < 20% |
| Automated Ticket Creation | 0% | 50% | > 90% |

## 15.3 Assessment Dimensions
1. **Coverage** — % of services emitting standardised telemetry.
2. **Detection** — MTTD, alert quality, false-positive rate.
3. **Diagnosis** — % incidents with identified root cause; RCA cycle time.
4. **Remediation** — % automated, MTTR, rollback safety.
5. **Governance** — schema compliance, retention adherence, audit pass rate.
6. **Cost Efficiency** — cost per service trend, tool consolidation.
7. **Cultural Adoption** — cross-team usage, training completion (links to [Chapter 19. Observability Operating Model and Adoption Plan](19-observability-operating-model-and-adoption-plan.md)).

## 15.4 Scoring Method
- Each dimension scored against Phase 1 / 2 / 3 thresholds.
- Aggregate maturity = weighted blend; weights agreed by governance body ([Chapter 16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md)).
- Reviewed quarterly; recalibrated against actual production data.

## 15.5 Inputs
- KPI scorecard ([Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md)).
- Incident review records ([Chapter 13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md)).
- IaC platform metrics ([Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md)).
- Compliance / audit reports ([Chapter 11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md)).

## 15.6 Outputs
- Quarterly maturity report.
- Phase-gate readiness recommendation (proceed / hold / remediate).
- Inputs to [Chapter 14. Observability Roadmap Delivery Plan](14-observability-roadmap-delivery-plan.md) plan adjustments.

## 15.7 Cross-References
- [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md) — KPI source.
- [Chapter 14. Observability Roadmap Delivery Plan](14-observability-roadmap-delivery-plan.md) — phase plan being assessed.
- [Chapter 16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md) — governance body that ratifies phase gates.
- [Chapter 19. Observability Operating Model and Adoption Plan](19-observability-operating-model-and-adoption-plan.md) — cultural / adoption inputs.

---

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](14-observability-roadmap-delivery-plan.md) | [Next Page](16-observability-governance-charter-and-arb-pack.md)
