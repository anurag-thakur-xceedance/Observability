---
title: Observability Operating Model and Adoption Plan
chapter: 18
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 18. Observability Operating Model and Adoption Plan

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 18.1 Purpose
Observability is as much about **people and processes** as tools. This document captures the operating model and adoption plan that turns the platform into a capability.

## 18.2 Cultural Principles
- **Cross-Functional Collaboration.** Silos between DevOps, SRE, and business teams are reduced; responsibility for system health is shared.
- **Training & Education.** Investment in team skills ensures effective use of observability tools and accurate interpretation of data.
- **Actionable Alerting.** Intelligent thresholds reduce alert fatigue; each alert is associated with a clear response playbook (see [Chapter 4. Alerting and Incident Severity Policy](04-alerting-and-incident-severity-policy.md), [Chapter 3. Domain Observability Runbooks Pack](03-domain-observability-runbooks-pack.md)).

## 18.3 Roles & Responsibilities

| Role | Primary Focus |
|---|---|
| Service / Application Owner | Owns service-specific telemetry conformance ([Chapter 17. Application Telemetry Standard](17-application-telemetry-standard.md)) and SLOs |
| SRE / Platform Ops | Operates the platform ([Chapter 2. Observability Reference Architecture](02-observability-reference-architecture.md)), runs runbooks ([Chapter 3. Domain Observability Runbooks Pack](03-domain-observability-runbooks-pack.md)), maintains dashboards ([Chapter 5. Grafana Platform Standard and Visualization Playbook](05-grafana-platform-standard-and-visualization-playbook.md)) |
| Incident Commander | Coordinates Critical incidents ([Chapter 12. Incident Response Playbook](12-incident-response-playbook.md)) |
| Data Governance Lead | Owns retention, classification, RBAC ([Chapter 8. Observability Data Governance and Retention Policy](08-observability-data-governance-and-retention-policy.md), [Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md)) |
| AIOps Lead | Owns AIOps guardrails and model lifecycle ([Chapter 6. AIOps Guardrails and Implementation Playbook](06-aiops-guardrails-and-implementation-playbook.md)) |
| Governance Body | Owns standards, retention, policy approvals ([Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md)) |
| Product / Business | Consumes business-impact dashboards; provides outcome KPI input ([Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md)) |

## 18.4 Adoption Plan (Aligned to Roadmap)

### 18.4.1 Phase 1 — Foundation
- Onboard top-5 critical services per [Chapter 17. Application Telemetry Standard](17-application-telemetry-standard.md).
- Train all relevant team members on Grafana navigation.
- Establish baseline KPIs ([Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md)).

### 18.4.2 Phase 2 — Correlation & Alerting
- Roll out shared dashboards and topology views.
- Establish on-call rotation aligned to [Chapter 4. Alerting and Incident Severity Policy](04-alerting-and-incident-severity-policy.md) severities.
- Reduce alert noise to "moderate" through tuning (see [Chapter 5. Grafana Platform Standard and Visualization Playbook](05-grafana-platform-standard-and-visualization-playbook.md)).

### 18.4.3 Phase 3 — AI-Driven Intelligence
- Operationalise AIOps feedback loops; operators routinely validate AI outputs.
- Mature post-incident review process; PIR records reused in risk reviews.
- Embed business-impact storytelling in incident communications.

### 18.4.4 Community of Practice

The Observability **Community of Practice (CoP)** is the working-level forum that operationalises governance below the ARB. It is the primary mechanism by which standards from [Chapter 1](01-enterprise-observability-standards-catalog.md) and decisions from [Chapter 15](15-observability-governance-charter-and-arb-pack.md) become **lived practice** across services.

**Charter.** The CoP is **advisory and educational**, not a decision body. Decision authority remains with the ARB / governance body per [Chapter 15. Observability Governance Charter and ARB Pack -> Section 15.3 Decision Rights](15-observability-governance-charter-and-arb-pack.md#153-decision-rights).

**Membership.**
- **Core (standing).** Platform Ops lead, SRE lead, AIOps lead, Data Governance lead, Service Onboarding lead.
- **Rotating (one-quarter terms).** Two service-team representatives drawn from currently-onboarding services (CoP rotation reduces single-points-of-knowledge — risk **GOV-R-10** in [Chapter 15. Observability Governance Charter and ARB Pack -> Section 15.4.2 Governance Risk Register](15-observability-governance-charter-and-arb-pack.md#1542-governance-risk-register)).
- **Open.** Any engineer may attend any CoP session.

**Cadence.**

| Activity | Cadence | Format | Owner |
|---|---|---|---|
| CoP working session | Bi-weekly, 60 min | Open agenda; demos, problem-solving, RFC review | Rotating chair |
| Onboarding office hours | Weekly, 30 min | Drop-in clinic for teams in PRR ([Chapter 25](25-service-onboarding-and-instrumentation-kits.md)) | Onboarding lead |
| Standards RFC review | Ad-hoc | RFC posted ≥ 5 business days before review | Author + Platform Ops |
| Quarterly showcase | Quarterly, 90 min | Wins, anti-patterns, KPI movement | Rotating chair |
| Annual conference / unconf | Annual, full day | Internal event; external speakers welcome | Platform Ops |

**Artefacts the CoP owns or curates.**
- **Pattern library.** Worked examples for telemetry kits ([Chapter 25. Service Onboarding and Instrumentation Kits -> Section 25.3 Instrumentation Kits](25-service-onboarding-and-instrumentation-kits.md#253-instrumentation-kits)), dashboard templates ([Chapter 5. Grafana Platform Standard and Visualization Playbook](05-grafana-platform-standard-and-visualization-playbook.md)), SLO definitions ([Chapter 24. SLO and Error-Budget Framework](24-slo-and-error-budget-framework.md)).
- **Anti-pattern register.** Misuses encountered in PRR or in production; published with remediation guidance.
- **RFC log.** Drafts headed for ADRs in [Chapter 16](16-observability-adr-decision-register.md).
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

## 18.5 Continuous Improvement Process
The strategy is regularly reassessed and refined as the technology landscape and business needs evolve.

| Activity | Cadence | Owner |
|---|---|---|
| Audit data quality, alert effectiveness, tool ROI | Quarterly | Governance body ([Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md)) |
| Calibrate thresholds against 95th-percentile normal behaviour | Quarterly | SRE / Service owners |
| Retraining / tuning AI models from operator feedback | Monthly | AIOps lead ([Chapter 6. AIOps Guardrails and Implementation Playbook](06-aiops-guardrails-and-implementation-playbook.md)) |
| KPI scorecard review | Monthly | Governance body |
| Roadmap phase-gate readiness | Quarterly | Governance body / ARB ([Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md)) |

## 18.6 Training Curriculum (Initial)
- Grafana basics (dashboards, exploration, alerts).
- Reading logs (Loki) and traces (Tempo) and correlating to metrics.
- Domain runbooks ([Chapter 3. Domain Observability Runbooks Pack](03-domain-observability-runbooks-pack.md)) — one module per domain.
- Incident response workflow ([Chapter 12. Incident Response Playbook](12-incident-response-playbook.md)).
- AIOps interpretation ([Chapter 6. AIOps Guardrails and Implementation Playbook](06-aiops-guardrails-and-implementation-playbook.md)) — for senior on-call.

## 18.7 Success Indicators
- ≥ 70% engineering time on new feature work (vs. issue rectification) by end of Phase 3 (see [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md)).
- Cross-team incident resolution rate ≥ 70% within 6 months.
- Reduced "war-room" sessions; demonstrable cross-functional ownership.

### 18.7.1 Adoption KPIs

The headline indicators in Section 7 are operationalised below as **leading** (predict success) and **lagging** (confirm success) KPIs. All are reported on the scorecard in [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md).

| KPI | Type | Definition | Target | Owner | Source |
|---|---|---|---|---|---|
| Service onboarding rate | Leading | Services passing PRR per quarter | ≥ 8 / quarter (Phase 2+) | Onboarding lead | [Chapter 25](25-service-onboarding-and-instrumentation-kits.md) |
| Conformance score (portfolio) | Leading | % of services scoring ≥ 90% on PRR scorecard | ≥ 90% | Service Owners | PRR dashboard |
| Champions coverage | Leading | % of onboarded services with a named Champion (Section 4.1) | 100% | CoP chair | CoP register |
| Training completion | Leading | % of on-call engineers completing curriculum (Section 6) | ≥ 95% | Platform Ops | LMS export |
| Dashboard self-service rate | Leading | % of dashboards created by service teams (vs platform team) | ≥ 60% by end Phase 2 | SRE | Grafana audit |
| Alert noise ratio | Leading | non-actionable alerts / total alerts | ≤ 20% by end Phase 2 | SRE | Alertmanager export |
| MTTD (Critical) | Lagging | p50 time from incident start to first alert | ≤ 5 min | SRE | [Chapter 12](12-incident-response-playbook.md) |
| MTTR (Critical) | Lagging | p50 time from alert to resolution | ≤ 60 min by end Phase 2 | Incident Commander | [Chapter 12](12-incident-response-playbook.md) |
| SLO attainment rate | Lagging | % of T1 services meeting SLO over rolling 30 days | ≥ 95% | Service Owners | [Chapter 24](24-slo-and-error-budget-framework.md) |
| Engineering time on features | Lagging | % capacity (per team timesheet / planning data) | ≥ 70% by Phase 3 | Engineering leads | Planning tool |
| War-room frequency | Lagging | Critical-incident war rooms per month | Trending down quarter-on-quarter | Incident Commander | [Chapter 12](12-incident-response-playbook.md) |
| Cross-team resolution rate | Lagging | % of incidents resolved without escalation outside owning team | ≥ 70% within 6 months | SRE | [Chapter 12](12-incident-response-playbook.md) |
| Telemetry cost per service (T1) | Lagging | $ / month / T1 service | Within ±10% of plan | FinOps | [Chapter 9](09-observability-finops-standard.md) |
| Adoption NPS | Lagging | Engineer net-promoter score for the platform | ≥ +30 | CoP chair | Annual survey |

**Reporting cadence.** Leading KPIs are reviewed monthly by the CoP and reported quarterly to the governance body. Lagging KPIs are reviewed quarterly and form the input to phase-gate decisions ([Chapter 13](13-observability-roadmap-delivery-plan.md)).

**Phase-gate criteria.** Movement from Phase N to Phase N+1 requires:
- All Phase N leading KPIs at target for two consecutive quarters.
- ≥ 50% of Phase N lagging KPIs at target.
- No open governance risks ([Chapter 15. Observability Governance Charter and ARB Pack -> Section 15.4.2 Governance Risk Register](15-observability-governance-charter-and-arb-pack.md#1542-governance-risk-register)) at **High** or **Critical**.
- Explicit ARB sign-off recorded as an ADR.

## 18.8 Cross-References
- [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md) — productivity and adoption KPIs (sourced from Section 7.1).
- [Chapter 13. Observability Roadmap Delivery Plan](13-observability-roadmap-delivery-plan.md) — phase plan this adoption mirrors; phase-gate criteria in Section 7.1 feed roadmap gates.
- [Chapter 14. Observability Capability Assessment Framework](14-observability-capability-assessment-framework.md) — cultural-adoption inputs to maturity scoring.
- [Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md) — governance ownership of operating model changes; CoP (Section 4.1) escalates RFCs to ARB.
- [Chapter 25. Service Onboarding and Instrumentation Kits](25-service-onboarding-and-instrumentation-kits.md) — PRR gate that the CoP supports through office hours.

---

[↑ Back to TOC](toc.md)
