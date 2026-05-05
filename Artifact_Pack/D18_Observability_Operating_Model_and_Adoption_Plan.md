# D18 — Observability Operating Model & Adoption Plan

> **Purpose:** Roles, culture, change/adoption model, continuous improvement process.
> **Source Strategy Sections:** Foster an Observability Culture; Continuous Improvement (process cadence portion).
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1.

---

## 1. Purpose
Observability is as much about **people and processes** as it is about tools. This document captures the operating model and adoption plan that turns the technical platform into an organisational capability.

## 2. Cultural Principles
- **Cross-Functional Collaboration.** Silos between DevOps, SRE, and business teams are reduced; responsibility for system health is shared.
- **Training & Education.** Investment in team skills ensures effective use of observability tools and accurate interpretation of data.
- **Actionable Alerting.** Intelligent thresholds reduce alert fatigue; each alert is associated with a clear response playbook (see **D4**, **D3**).

## 3. Roles & Responsibilities

| Role | Primary Focus |
|---|---|
| Service / Application Owner | Owns service-specific telemetry conformance (D17) and SLOs |
| SRE / Platform Ops | Operates the platform (D2), runs runbooks (D3), maintains dashboards (D5) |
| Incident Commander | Coordinates Critical incidents (D12) |
| Data Governance Lead | Owns retention, classification, RBAC (D8, D15) |
| AIOps Lead | Owns AIOps guardrails and model lifecycle (D6) |
| Governance Body | Owns standards, retention, policy approvals (D15) |
| Product / Business | Consumes business-impact dashboards; provides outcome KPI input (D11) |

## 4. Adoption Plan (Aligned to Roadmap D13)

### Phase 1 — Foundation
- Onboard top-5 critical services per **D17**.
- Train all relevant team members on Grafana navigation.
- Establish baseline KPIs (D11).

### Phase 2 — Correlation & Alerting
- Roll out shared dashboards and topology views.
- Establish on-call rotation aligned to **D4** severities.
- Reduce alert noise to "moderate" through tuning (see **D5**).

### Phase 3 — AI-Driven Intelligence
- Operationalise AIOps feedback loops; operators routinely validate AI outputs.
- Mature post-incident review process; PIR records reused in risk reviews.
- Embed business-impact storytelling in incident communications.

## 5. Continuous Improvement Process
The strategy is regularly reassessed and refined as the technology landscape and business needs evolve.

| Activity | Cadence | Owner |
|---|---|---|
| Audit data quality, alert effectiveness, tool ROI | Quarterly | Governance body (D15) |
| Calibrate thresholds against 95th-percentile normal behaviour | Quarterly | SRE / Service owners |
| Retraining / tuning AI models from operator feedback | Monthly | AIOps lead (D6) |
| KPI scorecard review | Monthly | Governance body |
| Roadmap phase-gate readiness | Quarterly | Governance body / ARB (D15) |

## 6. Training Curriculum (Initial)
- Grafana basics (dashboards, exploration, alerts).
- Reading logs (Loki) and traces (Tempo) and correlating to metrics.
- Domain runbooks (D3) — one module per domain.
- Incident response workflow (D12).
- AIOps interpretation (D6) — for senior on-call.

## 7. Success Indicators
- ≥ 70% engineering time on new feature work (vs. issue rectification) by end of Phase 3 (see **D11**).
- Cross-team incident resolution rate ≥ 70% within 6 months.
- Reduced "war-room" sessions; demonstrable cross-functional ownership.

## 8. Cross-References
- **D11** — productivity and adoption KPIs.
- **D13** — phase plan this adoption mirrors.
- **D14** — cultural-adoption inputs to maturity scoring.
- **D15** — governance ownership of operating model changes.
