---
title: Observability Roadmap Delivery Plan
chapter: 14
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 14. Observability Roadmap Delivery Plan

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](13-incident-response-playbook.md) | [Next Page](15-observability-capability-assessment-framework.md)

| **Document Owner** | CoE-Architecture |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **First Review** | 1-Aug-2026 |
| **Next Review Due** | 1-Nov-2026 |

---

## 14.1 Purpose
The maturity roadmap traces the journey from reactive monitoring to proactive, AI-driven observability. This plan turns the executive view into milestones, owners, and dependencies.

## 14.2 Phase 1 — Foundation (Months 1–3)
**Theme:** "Establish the Core — See What's Happening."

**Outcome:** Transition from "we don't know what's broken" to "we can see when something breaks."

| Objective | Description | Success Criteria |
|---|---|---|
| Deploy Core Stack | Install and configure Prometheus, Loki, Grafana | All components operational and accessible |
| Instrument Critical Services | Add OpenTelemetry instrumentation to top applications | Top 5 critical services emitting metrics, logs, traces |
| Basic Dashboards | Initial dashboards for system health, resource utilisation, app performance | Teams can view real-time status |
| Define Baseline Metrics | Establish what "normal" looks like for key KPIs | Documented baselines: CPU, memory, latency, error rate |
| Team Onboarding | Train ops + dev teams on dashboards | All relevant team members can navigate Grafana |

### 14.2.1 Phase 1 Targets

| Metric | Phase 1 Target |
|---|---|
| Mean Time to Detect (MTTD) | < 15 min |
| Mean Time to Resolution (MTTR) | ≤ 4 h |
| Services Instrumented | 20% |
| Alert Noise Ratio | > 35% non-actionable |
| Manual RCA Required | 100% |
| Automated Ticket Creation | 0% |

**At the end of Phase 1, a team should be able to:** see when something breaks on core dashboards, inspect basic metrics and logs for critical services, and use a single observability stack for day-to-day operations.

## 14.3 Phase 2 — Correlation & Alerting (Months 4–6)
**Theme:** "Connect the Dots — Understand Why It's Happening."

**Outcome:** From "something is broken" to "we understand why it broke and what else might be affected."

| Objective | Description | Success Criteria |
|---|---|---|
| Unified Telemetry Collection | OpenTelemetry Collector as central gateway for all telemetry | Single pipeline handling all telemetry types |
| Trace–Log–Metric Correlation | Link traces ↔ logs ↔ metrics via correlation IDs | Engineers jump from error log to associated trace in one click |
| Smart Alerting | Grafana Alerting with severity routing and noise reduction | Alert fatigue reduced; only actionable alerts reach on-call |
| Service Dependency Mapping | Visualise upstream/downstream service relationships | Clear topology maps |
| Distributed Tracing Rollout | Extend Tempo tracing to all production services | Full request-path visibility across microservices |
| Cross-Team Dashboards | Shared views breaking down silos | Single pane of glass accessible to all stakeholders |

### 14.3.1 Phase 2 Targets

| Metric | Phase 2 Target |
|---|---|
| Mean Time to Detect (MTTD) | < 5 min |
| Mean Time to Resolution (MTTR) | ≤ 30 min |
| Services Instrumented | 70% |
| Alert Noise Ratio | ≤ 20% non-actionable |
| Manual RCA Required | 50% |
| Automated Ticket Creation | 50% |

**At the end of Phase 2, a team should be able to:** jump from an alert to correlated traces/logs/metrics, understand likely blast radius, and run with smart alerting that mostly surfaces actionable issues.

## 14.4 Phase 3 — AI-Driven Intelligence (Months 7–12)
**Theme:** "Predict and Automate — Fix Before Users Notice."

**Outcome:** Achieve the strategy vision — observability transforms from "technical overhead into a competitive advantage" where teams "spend less time rectifying issues and more time shipping high-value features."

| Objective | Description | Success Criteria |
|---|---|---|
| Anomaly Detection | Deploy AI models for unusual-pattern detection without manual thresholds | System detects anomalies before traditional alerts |
| Automated RCA | AI agents analyse correlated telemetry to determine probable root cause | RCA reports generated within minutes of incident |
| Intelligent Ticket Creation | AI auto-creates tickets with context, impact, suggested remediation | Tickets contain all relevant info; no manual gathering |
| Predictive Alerting | ML forecasts capacity exhaustion, performance degradation | 30-min advance warning on predictable issues |
| Runbook Automation | AI recommendations connected to automated remediation for well-understood issues | Pre-approved fixes execute with audit trails |
| Feedback Loop Integration | Humans validate AI decisions, improving model accuracy | AI accuracy improves month-over-month |
| Business Impact Correlation | Link technical incidents to business KPIs (revenue, CX scores) | Executives receive business-context summaries |

### 14.4.1 Phase 3 Targets

| Metric | Phase 3 Target |
|---|---|
| Mean Time to Detect (MTTD) | < 1 min |
| Mean Time to Resolution (MTTR) | ≤ 15 min |
| Services Instrumented | 100% |
| Alert Noise Ratio | ≤ 10% non-actionable |
| Manual RCA Required | < 20% |
| Automated Ticket Creation | > 90% |

**At the end of Phase 3, a team should be able to:** rely on AI-assisted detection and RCA for most incidents, have incident tickets pre-populated with rich context, and proactively act on forecasted capacity and reliability risks.

## 14.5 Dependencies (Cross-Phase)
- [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md) — required to deploy stack consistently in Phase 1.
- [Chapter 18. Application Telemetry Standard](18-application-telemetry-standard.md) — required to instrument services consistently across phases.
- [Chapter 9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md) — required before significant telemetry volume in Phase 2.
- [Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md) — pre-condition for Phase 3 automation.
- [Chapter 16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md) — change control for each phase gate.

## 14.6 Risks (Initial)
- Tool consolidation may surface migration debt.
- AI false-positive rate may exceed 5% during Phase 3 ramp-up; mitigated by feedback-loop discipline ([Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md)).
- Cardinality / cost overruns mid-Phase 2 if [Chapter 9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md)/[Chapter 10. Observability FinOps Standard](10-observability-finops-standard.md) controls are not yet operational.

## 14.7 Cross-References
- [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md) — KPI scorecard with phase targets.
- [Chapter 15. Observability Capability Assessment Framework](15-observability-capability-assessment-framework.md) — capability assessment framework.
- [Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md) / [Chapter 18. Application Telemetry Standard](18-application-telemetry-standard.md) / [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md) / [Chapter 9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md) — dependent standards / policies.

---

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](13-incident-response-playbook.md) | [Next Page](15-observability-capability-assessment-framework.md)
