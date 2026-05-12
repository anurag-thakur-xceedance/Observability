---
title: Observability KPI Scorecard
chapter: 11
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 11. Observability KPI Scorecard

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 1. Purpose
The canonical place to track outcome KPIs for the observability strategy — rolling up technical, governance, and business metrics into one executive view.

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

## 5. Platform KPIs Roll-Up (from IaC Standard — Docker Compose + PowerShell)
- Collector Deployment Success Rate ≥ 99%.
- Service Telemetry Coverage (OTel SDK) ≥ 95%.
- Cross-Host Config Parity ≥ 95%.
- Stack Provision Time (cold start) ≤ 5 min per host.
- Stack Update Time (image pull + restart) ≤ 2 min per service.
- Health-Check Pass Rate post-deployment = 100%.

## 6. Maturity Phase Targets (from Capability Assessment / Roadmap)

| Metric | Phase 1 Target | Phase 2 Target | Phase 3 Target |
|---|---|---|---|
| Mean Time to Detect (MTTD) | < 15 min | < 5 min | < 1 min |
| Mean Time to Resolution (MTTR) | Hours | 30 min | Minutes |
| Services Instrumented | 20% | 70% | 100% |
| Alert Noise Ratio | High | Moderate | Low (< 10% false positives) |
| Manual RCA Required | 100% | 50% | < 20% |
| Automated Ticket Creation | 0% | 50% | > 90% |

## 6.1. Telemetry Data Quality SLIs

The observability platform is itself a tier-1 service whose **inputs** (the telemetry from instrumented services) and **outputs** (the data available to query) must meet quality SLIs. Without these SLIs, every other KPI in this scorecard is built on sand. Sourced from [Chapter 1. Enterprise Observability Standards Catalog -> Section 3.1. Cardinality Governance](01-enterprise-observability-standards-catalog.md#31-cardinality-governance), [Chapter 8. Observability Data Governance and Retention Policy](08-observability-data-governance-and-retention-policy.md), and [Chapter 21. Observability Platform HA and DR Design -> Section 7. Self-Monitoring (Meta-Monitor)](21-observability-platform-ha-and-dr-design.md#7-self-monitoring-meta-monitor).

### 6.1.1 Ingest Quality SLIs

| SLI | Definition | Target | Measurement |
|---|---|---|---|
| **Ingest success rate** | Accepted spans/metrics/log lines ÷ submitted | ≥ 99.9% | Collector receiver counters |
| **Ingest latency (p95)** | Time from emit at SDK to availability at backend | ≤ 30 s metrics, ≤ 60 s logs/traces | Synthetic probe end-to-end |
| **Drop rate (queue overflow)** | Items dropped due to backpressure ÷ total | ≤ 0.01% | OTel Collector internal metrics |
| **Schema-conformance rate** | Spans/metrics with all required attributes ÷ total | ≥ 99% | Pipeline validator |
| **PII-leakage rate (post-redaction)** | Items containing redaction-pattern hits after pipeline | 0 | Sampled audit scan |

### 6.1.2 Storage Quality SLIs

| SLI | Definition | Target | Measurement |
|---|---|---|---|
| **Retention adherence** | Items retained per policy window ÷ items expected | ≥ 99% | Retention-job report |
| **Cardinality budget consumption** | Active series ÷ approved budget | ≤ 85% steady-state | Prometheus active-series metric |
| **Compaction lag** | Time behind real-time for compaction (Loki, Tempo) | ≤ 1 hour | Backend internal metrics |
| **Index integrity** | Successful query rate for known-good queries | 100% | Synthetic canary queries |
| **Backup currency** | Hours since last successful backup | ≤ 24 hours | Backup job timestamps |

### 6.1.3 Query Quality SLIs

| SLI | Definition | Target | Measurement |
|---|---|---|---|
| **Query success rate** | Queries returning a result ÷ total queries | ≥ 99.5% | Backend query logs |
| **Query latency (p95)** | Wall-clock time for canonical dashboard panel queries | ≤ 3 s | Grafana datasource probe |
| **Cross-signal correlation success** | Trace IDs that resolve a trace + linked logs | ≥ 95% | Sampled correlation probe |
| **Exemplar availability** | Metric series with attached trace exemplars ÷ targeted series | ≥ 80% | Prometheus exemplar API |

### 6.1.4 Data Freshness SLIs

| SLI | Definition | Target | Measurement |
|---|---|---|---|
| **Metric freshness** | Lag between sample emission and queryability | ≤ 30 s | Synthetic probe |
| **Log freshness** | Lag between log emission and queryability | ≤ 60 s | Synthetic probe |
| **Trace freshness** | Lag between span finish and trace assembly | ≤ 60 s | Synthetic probe |
| **Dashboard freshness** | "Last update" timestamp shown on every dashboard | Visible on every panel | Grafana template |

### 6.1.5 Error Budget for Telemetry Quality

The platform itself runs SLOs against Section 6.1.1–6.1.4 SLIs, with a **30-day error budget**, modelled per [Chapter 24. SLO and Error-Budget Framework](24-slo-and-error-budget-framework.md). When the platform's own error budget burns:
- **50% burn**: Platform Ops freezes all Normal-class changes ([Chapter 7. IaC for Observability Standard -> Section 7.1. Change Management](07-iac-for-observability-standard.md#71-change-management)).
- **75% burn**: ARB notified; emergency review.
- **100% burn**: All non-Emergency changes paused until budget recovers.

This binds platform reliability to platform feature velocity in exactly the same way services are bound — the platform team eats its own dog food.

### 6.1.6 Reporting

Section 6.1 SLIs appear on the **Platform Health** dashboard, viewable to all engineers, and on the executive scorecard with a single "Telemetry Quality" composite (worst-of approach: the composite shows the worst-performing SLI category to avoid masking issues by averaging).

## 7. Reporting Cadence
- KPI scorecard reviewed **monthly** at the observability governance body (see [Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md)).
- Phase-target progress reviewed at **quarterly** ARB.
- Incident-driven adjustments raised through [Chapter 16. Observability ADR Decision Register](16-observability-adr-decision-register.md) (ADRs).

## 8. Cross-References
- [Chapter 1. Enterprise Observability Standards Catalog -> Section 3.1. Cardinality Governance](01-enterprise-observability-standards-catalog.md#31-cardinality-governance) — feeds Section 6.1.2 cardinality SLI.
- [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) — IaC platform KPIs roll-up.
- [Chapter 8. Observability Data Governance and Retention Policy](08-observability-data-governance-and-retention-policy.md) / [Chapter 9. Observability FinOps Standard](09-observability-finops-standard.md) / [Chapter 10. Compliance and Audit Control Matrix](10-compliance-and-audit-control-matrix.md) — governance, FinOps, compliance KPIs feeding here.
- [Chapter 13. Observability Roadmap Delivery Plan](13-observability-roadmap-delivery-plan.md) — roadmap phase plan that drives phase targets.
- [Chapter 14. Observability Capability Assessment Framework](14-observability-capability-assessment-framework.md) — capability assessment framework feeding maturity scoring.
- [Chapter 18. Observability Operating Model and Adoption Plan -> Section 7.1. Adoption KPIs](18-observability-operating-model-and-adoption-plan.md#71-adoption-kpis) — adoption KPIs sourced into this scorecard.
- [Chapter 21. Observability Platform HA and DR Design](21-observability-platform-ha-and-dr-design.md) — self-monitoring drives Section 6.1 measurements.
- [Chapter 24. SLO and Error-Budget Framework](24-slo-and-error-budget-framework.md) — framework for Section 6.1.5 platform error budget.

---

[↑ Back to TOC](toc.md)
