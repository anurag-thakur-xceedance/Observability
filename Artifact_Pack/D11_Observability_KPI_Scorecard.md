# D11 — Observability KPI Scorecard

> **Purpose:** Outcome metrics and measurable success criteria for the observability strategy.
> **Source Strategy Sections:** Business Objectives & KPI's (metric definitions/thresholds/scorecard mechanics); Continuous Improvement (measurement model); Key Metrics for IaC in OpenTelemetry Deployments (executive roll-up); Success Criteria for Governance and Data Strategy; Maturity Assessment Framework (executive roll-up of phase targets); Appendix — KPIs and Metrics Table; Additional Objectives and KPIs.
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1.

---

## 1. Purpose
This scorecard is the canonical place to track outcome KPIs for the observability strategy. It rolls up technical, governance, and business metrics into a single executive view.

## 2. Core Outcome KPIs

| Objective | KPI / Metric | Type | Target / Range | Success Criteria |
|---|---|---|---|---|
| Reduce Downtime | Mean Time to Resolution (MTTR) | Operational | Reduce average MTTR by 50% in 6 months (e.g. 180 → 90 min) | Sustained lower MTTR; > 80% incidents resolved without escalation |
| Operational Efficiency | Cross-Team Incident Resolution Rate; # Tools Consolidated | Collaboration / Efficiency | ≥ 70% cross-team resolution within 6 months; reduce tool count 30–40% in 12 months | Seamless team coordination; fewer war-room sessions; tool cost savings |
| Customer Impact / Reliability | System Availability (Uptime); Performance Incident Lead Time | Service Reliability | Uptime ≥ 99.9%; anomalies → incidents in < 5 minutes | Reduced user-impact incidents; improved end-user experience |
| Cost Optimization | Monthly Tooling & Integration Spend; Tool Coverage Rate | Financial / Operational | Reduce tooling cost 20–25% in 12 months; coverage > 90% for unified stack | Consolidated systems, lower cost without visibility loss |
| Application Reliability | Error Rate; Deployment Success Rate | Technical Quality | Error rate < 1% per 1,000 requests; deployment success > 95% | Fewer rollbacks; stable production |
| Engineering Productivity | Time on Feature vs. Issue Rectification; Feature Delivery Velocity | Productivity / Innovation | ≥ 70% engineering time on new features; +15–20% delivery velocity in 9 months | Higher value output; sustained reduction in reactive work |
| Data Standardization | % systems emitting consistent telemetry | Data Integrity | 100% of critical services on OpenTelemetry | Unified single pane of glass |

## 3. Resilience & Coverage KPIs

| Objective | KPI / Metric | Type | Target | Success Criteria |
|---|---|---|---|---|
| Business Continuity | Recovery Point Objective (RPO) | Data Protection | ≤ 15 min for critical systems | Minimal data loss during outages |
| Business Continuity | Recovery Time Objective (RTO) | Service Restoration | ≤ 60 min for Tier 1 services | Restoration within SLA |
| System Scalability | Resource Utilization (CPU / mem / throughput) | Performance | ≤ 70–75% average utilisation | Stable performance under scaling |
| Alert Quality | Signal-to-Noise Ratio | Monitoring Quality | ≥ 80% actionable alerts | Reduced alert fatigue |
| Root Cause Efficiency | % of Incidents with Root Cause Identified | Incident Mgmt | ≥ 90% | Continuous learning |
| Data Completeness | Telemetry Coverage % | Observability Accuracy | ≥ 95% services standardised | Full visibility across product/infra |
| Compliance & Auditability | Compliance Audit Pass Rate | Governance | 100% adherence | No audit failures or violations |

## 4. Governance Success KPIs (from Governance & Data Strategy)
- 100% of production services emit telemetry that conforms to the approved schema.
- Retention policy adherence rate ≥ 99% across metrics, logs, traces, and RCA repositories.
- No audit failures attributable to observability data handling.
- Reduction in storage cost per service over time while maintaining required visibility.
- Demonstrable reuse of RCA summaries in post-incident reviews and risk assessments.

## 5. Platform KPIs Roll-Up (from D7 — Docker Compose + PowerShell)
- Collector Deployment Success Rate ≥ 99%.
- Service Telemetry Coverage (OTel SDK) ≥ 95%.
- Cross-Host Config Parity ≥ 95%.
- Stack Provision Time (cold start) ≤ 5 min per host.
- Stack Update Time (image pull + restart) ≤ 2 min per service.
- Health-Check Pass Rate post-deployment = 100%.

## 6. Maturity Phase Targets (from D14 / Roadmap)

| Metric | Phase 1 Target | Phase 2 Target | Phase 3 Target |
|---|---|---|---|
| Mean Time to Detect (MTTD) | < 15 min | < 5 min | < 1 min |
| Mean Time to Resolution (MTTR) | Hours | 30 min | Minutes |
| Services Instrumented | 20% | 70% | 100% |
| Alert Noise Ratio | High | Moderate | Low (< 10% false positives) |
| Manual RCA Required | 100% | 50% | < 20% |
| Automated Ticket Creation | 0% | 50% | > 90% |

## 7. Reporting Cadence
- KPI scorecard reviewed **monthly** at the observability governance body (see **D15**).
- Phase-target progress reviewed at **quarterly** ARB.
- Incident-driven adjustments raised through **D16** (ADRs).

## 8. Cross-References
- **D7** — IaC platform KPIs roll-up.
- **D8 / D9 / D10** — governance, FinOps, compliance KPIs feeding here.
- **D13** — roadmap phase plan that drives phase targets.
- **D14** — capability assessment framework feeding maturity scoring.
