---
title: Observability Operating Model and Adoption Plan
chapter: 19
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 19. Observability Operating Model and Adoption Plan

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](18-application-telemetry-standard.md) | [Next Page](20-observability-data-model-specification.md)

| **Document Owner** | CoE-Architecture |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **First Review** | 1-Aug-2026 |
| **Next Review Due** | 1-Nov-2026 |

---

## 19.0 Reader Guide
Use this chapter to understand the people, roles, training, and adoption practices needed to make the platform useful. Service owners should focus on responsibilities and adoption KPIs; CoP and governance participants should focus on cadence, artefacts, and phase-gate inputs.

## 19.1 Purpose
Observability is as much about **people and processes** as tools. This document captures the operating model and adoption plan that turns the platform into a capability.

## 19.2 Cultural Principles
- **Cross-functional collaboration.** Silos between DevOps, SRE, and business teams are reduced; responsibility for system health is shared.
- **Training and education.** Investment in team skills ensures effective use of observability tools and accurate interpretation of data.
- **Actionable alerting.** Intelligent thresholds reduce alert fatigue; each alert is associated with a clear response playbook (see [Chapter 5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md), [Chapter 4. Domain Observability Runbooks Pack](04-domain-observability-runbooks-pack.md)).

## 19.3 Roles & Responsibilities

| Role | Primary Focus |
|---|---|
| Service / Application Owner | Owns service-specific telemetry conformance ([Chapter 18. Application Telemetry Standard](18-application-telemetry-standard.md)) and SLOs. *Day in the life:* reviews service dashboards and error budgets, decides which telemetry gaps to close before the next release. |
| SRE / Platform Ops | Operates the platform ([Chapter 3. Observability Reference Architecture](03-observability-reference-architecture.md)), runs runbooks ([Chapter 4. Domain Observability Runbooks Pack](04-domain-observability-runbooks-pack.md)), maintains dashboards ([Chapter 6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md)). *Day in the life:* triages alerts, tunes thresholds, and keeps the observability stack healthy and up to date. |
| Incident Commander | Coordinates Critical incidents ([Chapter 13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md)). *Day in the life:* assembles the right people during a Sev-1, runs comms updates, and ensures a PIR is completed. |
| Data Governance Lead | Owns retention, classification, RBAC ([Chapter 9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md), [Chapter 16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md)). *Day in the life:* reviews schema changes, validates PII controls, and approves retention adjustments. |
| AIOps Lead | Owns AIOps guardrails and model lifecycle ([Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md)). *Day in the life:* monitors AI model performance, decides when to retrain or rollback, and aligns AI experiments with risk appetite. |
| Governance Body | Owns standards, retention, policy approvals ([Chapter 16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md)). *Day in the life:* reviews maturity reports, approves phase gates, and arbitrates trade-offs between cost, risk, and observability coverage. |
| Product / Business | Consumes business-impact dashboards; provides outcome KPI input ([Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md)). *Day in the life:* looks at business KPIs tied to observability (e.g. quote conversion, FNOL latency) and prioritises improvements with engineering. |

## 19.4 Adoption Plan (Aligned to Roadmap)

### 19.4.1 Phase 1 — Foundation
- Onboard top-5 critical services per [Chapter 18. Application Telemetry Standard](18-application-telemetry-standard.md).
- Train all relevant team members on Grafana navigation.
- Establish baseline KPIs ([Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md)).

### 19.4.2 Phase 2 — Correlation & Alerting
- Roll out shared dashboards and topology views.
- Establish on-call rotation aligned to [Chapter 5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md) severities.
- Reduce alert noise to **<= 20% non-actionable alerts** through tuning (see [Chapter 6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md)).

### 19.4.3 Phase 3 — AI-Driven Intelligence
- Operationalise AIOps feedback loops; operators routinely validate AI outputs.
- Mature post-incident review process; PIR records reused in risk reviews.
- Embed business-impact storytelling in incident communications.

### 19.4.4 Community of Practice

The Observability **Community of Practice (CoP)** is the working-level forum that operationalises governance below the ARB. It is the primary mechanism by which standards from [Chapter 2. Enterprise Observability Standards Catalogue](02-enterprise-observability-standards-catalog.md) and decisions from [Chapter 16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md) become **lived practice** across services.

**Charter.** The CoP is **advisory and educational**, not a decision body. Decision authority remains with the ARB / governance body per [Chapter 16. Observability Governance Charter and ARB Pack -> Section 16.3 Decision Rights](16-observability-governance-charter-and-arb-pack.md#163-decision-rights).

**Membership.**
- **Core (standing).** Platform Ops lead, SRE lead, AIOps lead, Data Governance lead, Service Onboarding lead.
- **Rotating (one-quarter terms).** Two service-team representatives drawn from currently-onboarding services (CoP rotation reduces single-points-of-knowledge — risk **GOV-R-10** in [Chapter 16. Observability Governance Charter and ARB Pack -> Section 16.4.2 Governance Risk Register](16-observability-governance-charter-and-arb-pack.md#1642-governance-risk-register)).
- **Open.** Any engineer may attend any CoP session.

**Cadence.**

| Activity | Cadence | Format | Owner |
|---|---|---|---|
| CoP working session | Bi-weekly, 60 min | Open agenda; demos, problem-solving, RFC review | Rotating chair |
| Onboarding office hours | Weekly, 30 min | Drop-in clinic for teams in PRR ([Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md)) | Onboarding lead |
| Standards RFC review | Ad-hoc | RFC posted ≥ 5 business days before review | Author + Platform Ops |
| Quarterly showcase | Quarterly, 90 min | Wins, anti-patterns, KPI movement | Rotating chair |
| Annual conference / unconf | Annual, full day | Internal event; external speakers welcome | Platform Ops |

**Artefacts the CoP owns or curates.**
- **Pattern library.** Worked examples for telemetry kits ([Chapter 26. Service Onboarding and Instrumentation Kits -> Section 26.3 Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md#263-instrumentation-kits)), dashboard templates ([Chapter 6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md)), SLO definitions ([Chapter 25. SLO and Error-Budget Framework](25-slo-and-error-budget-framework.md)).
- **Anti-pattern register.** Misuses encountered in PRR or in production; published with remediation guidance.
- **RFC log.** Drafts headed for ADRs in [Chapter 17. Observability ADR Decision Register](17-observability-adr-decision-register.md).
- **Champions list.** A "Champion" per service team — a named engineer accountable for that team's adherence to standards and the local point-of-contact for the CoP.

**RFC → ADR escalation flow.**

```
RFC (CoP)  ──5 BD review──▶  Sponsor (Platform Ops or SRE lead)  ──▶  ARB
   │                                                                  │
   └──── declined / parked ◀──── insufficient evidence ◀───────────────┘
```

An RFC that the CoP recommends becomes a sponsored proposal to the ARB; the ARB ratifies it as an ADR. RFCs that fail to gain CoP traction are parked with a written rationale.

**Success indicators (specific to the CoP).**
- ≥ 1 active **Champion** per onboarded service.
- ≥ 70% of services represented in any rolling 90-day window of CoP attendance.
- Median RFC time-to-decision ≤ 30 days.
- Anti-pattern register growth ≥ 1 entry per quarter (a healthy CoP surfaces issues; zero entries signals disengagement, not perfection).

## 19.5 Continuous Improvement Process
The strategy is regularly reassessed and refined as the technology landscape and business needs evolve.

| Activity | Cadence | Owner |
|---|---|---|
| Audit data quality, alert effectiveness, tool ROI | Quarterly | Governance body ([Chapter 16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md)) |
| Calibrate thresholds against 95th-percentile normal behaviour | Quarterly | SRE / Service owners |
| Retraining / tuning AI models from operator feedback | Monthly | AIOps lead ([Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md)) |
| KPI scorecard review | Monthly | Governance body |
| Roadmap phase-gate readiness | Quarterly | Governance body / ARB ([Chapter 16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md)) |

## 19.6 Training Curriculum (Initial)
- Grafana basics (dashboards, exploration, alerts).
- Reading logs (Loki) and traces (Tempo) and correlating to metrics.
- Domain runbooks ([Chapter 4. Domain Observability Runbooks Pack](04-domain-observability-runbooks-pack.md)) — one module per domain.
- Incident response workflow ([Chapter 13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md)).
- AIOps interpretation ([Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md)) — for senior on-call.

## 19.7 Success Indicators
- Refer to [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md) for the full KPI set and targets. This chapter focuses on **how roles and practices drive those KPIs** (e.g. service onboarding, CoP activity, training completion).

### 19.7.1 Adoption KPIs

The headline indicators in Section 8 are operationalised below as **leading** (predict success) and **lagging** (confirm success) KPIs. All are reported on the scorecard in [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md).

| KPI | Type | Definition | Target | Owner | Source |
|---|---|---|---|---|---|
| Service onboarding rate | Leading | Services passing PRR per quarter | ≥ 8 / quarter (Phase 2+) | Onboarding lead | [Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md) |
| Conformance score (portfolio) | Leading | % of services scoring ≥ 90% on PRR scorecard | ≥ 90% | Service Owners | PRR dashboard |
| Champions coverage | Leading | % of onboarded services with a named Champion (Section 5.1) | 100% | CoP chair | CoP register |
| Training completion | Leading | % of on-call engineers completing curriculum (Section 7) | ≥ 95% | Platform Ops | LMS export |
| Dashboard self-service rate | Leading | % of dashboards created by service teams (vs platform team) | ≥ 60% by end Phase 2 | SRE | Grafana audit |
| Alert noise ratio | Leading | non-actionable alerts / total alerts | ≤ 20% by end Phase 2 | SRE | Alertmanager export |
| MTTD (Critical) | Lagging | p50 time from incident start to first alert | ≤ 5 min | SRE | [Chapter 13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md) |
| MTTR (Critical) | Lagging | p50 time from alert to resolution | ≤ 60 min by end Phase 2 | Incident Commander | [Chapter 13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md) |
| SLO attainment rate | Lagging | % of T1 services meeting SLO over rolling 30 days | ≥ 95% | Service Owners | [Chapter 25. SLO and Error-Budget Framework](25-slo-and-error-budget-framework.md) |
| Engineering time on features | Lagging | % capacity (per team timesheet / planning data) | ≥ 70% by Phase 3 | Engineering leads | Planning tool |
| War-room frequency | Lagging | Critical-incident war rooms per month | Trending down quarter-on-quarter | Incident Commander | [Chapter 13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md) |
| Cross-team resolution rate | Lagging | % of incidents resolved without escalation outside owning team | ≥ 70% within 6 months | SRE | [Chapter 13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md) |
| Telemetry cost per service (T1) | Lagging | $ / month / T1 service | Within ±10% of plan | FinOps | [Chapter 10. Observability FinOps Standard](10-observability-finops-standard.md) |
| Adoption NPS | Lagging | Engineer net-promoter score for the platform | ≥ +30 | CoP chair | Annual survey |

**Reporting cadence.** Leading KPIs are reviewed monthly by the CoP and reported quarterly to the governance body. Lagging KPIs are reviewed quarterly and form the input to phase-gate decisions ([Chapter 14. Observability Roadmap Delivery Plan](14-observability-roadmap-delivery-plan.md)).

**Phase-gate criteria.** Movement from Phase N to Phase N+1 requires:
- All Phase N leading KPIs at target for two consecutive quarters.
- ≥ 50% of Phase N lagging KPIs at target.
- No open governance risks ([Chapter 16. Observability Governance Charter and ARB Pack -> Section 16.4.2 Governance Risk Register](16-observability-governance-charter-and-arb-pack.md#1642-governance-risk-register)) at **High** or **Critical**.
- Explicit ARB sign-off recorded as an ADR.

## 19.8 Cross-References

See also:
- [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md) — productivity and adoption KPIs (sourced from Section 8.1).
- [Chapter 14. Observability Roadmap Delivery Plan](14-observability-roadmap-delivery-plan.md) — phase plan this adoption mirrors; phase-gate criteria in Section 8.1 feed roadmap gates.
- [Chapter 15. Observability Capability Assessment Framework](15-observability-capability-assessment-framework.md) — cultural-adoption inputs to maturity scoring.
- [Chapter 16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md) — governance ownership of operating model changes; CoP (Section 5.1) escalates RFCs to ARB.
- [Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md) — PRR gate that the CoP supports through office hours.

---

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](18-application-telemetry-standard.md) | [Next Page](20-observability-data-model-specification.md)
