---
title: Observability Non-Functional Requirements Register
chapter: 27
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 27. Observability Non-Functional Requirements Register

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 1. Purpose

This chapter consolidates the **non-functional requirements (NFRs)** for the Xceedance Observability Platform itself — treating the platform as a Tier 1 service with its own SLOs, security posture, and operational standards. NFRs are otherwise scattered across architecture, capacity, HA/DR, security, FinOps, and onboarding chapters; this register provides a single auditable view for ARB, internal audit, and customer-facing assurance.

## 2. Scope

In-scope: the observability platform components (OpenTelemetry Collector, Prometheus, Loki, Tempo, Grafana, AIOps layer, IaC pipeline, dashboard catalogue).

Out-of-scope: NFRs of the **observed** services (those are owned by each service team and tracked in their own SLO docs per [Chapter 24. SLO and Error-Budget Framework](24-slo-and-error-budget-framework.md)).

## 3. NFR Register

Each NFR has: ID, category, statement, target, measurement source, owner (TBD), and a cross-reference to the artefact where the design is detailed.

| ID | Category | Requirement | Target / Threshold | Measured Via | Detail Reference |
|---|---|---|---|---|---|
| NFR-AVL-01 | Availability | Observability platform availability | 99.9% monthly | Grafana uptime SLO + synthetic probe | [Chapter 21. Observability Platform HA and DR Design](21-observability-platform-ha-and-dr-design.md) |
| NFR-AVL-02 | Availability | Telemetry ingestion availability | 99.95% monthly | Collector liveness + ingest success rate | [Chapter 2. Observability Reference Architecture -> Section 5. Telemetry Collection Layers](02-observability-reference-architecture.md#5-telemetry-collection-layers) |
| NFR-PRF-01 | Performance | Dashboard P95 query latency | ≤ 3 s | Grafana query logs | [Chapter 22. Capacity and Scale Model -> Section 7. Performance SLOs for the Platform Itself](22-capacity-and-scale-model.md#7-performance-slos-for-the-platform-itself) |
| NFR-PRF-02 | Performance | Alert firing-to-notification latency | P95 ≤ 90 s | Alertmanager + paging system | [Chapter 4. Alerting and Incident Severity Policy](04-alerting-and-incident-severity-policy.md) |
| NFR-PRF-03 | Performance | Telemetry end-to-end propagation (collector → store) | P95 ≤ 30 s | OTel pipeline metrics | [Chapter 22. Capacity and Scale Model](22-capacity-and-scale-model.md) |
| NFR-SCL-01 | Scalability | Horizontal scalability of collectors | Linear to 10× baseline | Load-test artefact | [Chapter 22. Capacity and Scale Model -> Section 4. Scale-Out Triggers](22-capacity-and-scale-model.md#4-scale-out-triggers) |
| NFR-SCL-02 | Scalability | Active series headroom per backend | ≥ 30% over peak | Prometheus `prometheus_tsdb_head_series` | [Chapter 22. Capacity and Scale Model -> Section 8. Cardinality Budget](22-capacity-and-scale-model.md#8-cardinality-budget) |
| NFR-REL-01 | Reliability | Mean Time Between Failures (platform) | ≥ 90 days | Platform incident log | [Chapter 21. Observability Platform HA and DR Design](21-observability-platform-ha-and-dr-design.md) |
| NFR-REL-02 | Reliability | Error-budget policy enforcement | Freezes feature work when consumed | Burn-rate alerts | [Chapter 24. SLO and Error-Budget Framework](24-slo-and-error-budget-framework.md) |
| NFR-REC-01 | Recoverability | Platform RTO | ≤ 4 h | DR runbook drill | [Chapter 21. Observability Platform HA and DR Design](21-observability-platform-ha-and-dr-design.md) |
| NFR-REC-02 | Recoverability | Platform RPO | ≤ 15 min (metrics), ≤ 5 min (logs) | DR runbook drill | [Chapter 21. Observability Platform HA and DR Design](21-observability-platform-ha-and-dr-design.md) |
| NFR-REC-03 | Recoverability | Archive restore SLA | ≤ 48 h for ≤ 1 TB | Archive runbook drill | [Chapter 28. Observability Long-Term Archival Policy](28-observability-long-term-archival-policy.md) |
| NFR-SEC-01 | Security | All telemetry encrypted in transit | mTLS 1.3 between collector and backend | Network policy audit | [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) |
| NFR-SEC-02 | Security | All telemetry encrypted at rest | AES-256 (provider-default or CMK) | Storage config audit | [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) |
| NFR-SEC-03 | Security | RBAC enforced on every dashboard, alert rule, and data source | 100% coverage | Quarterly access review | [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) |
| NFR-SEC-04 | Security | Critical-vulnerability remediation | ≤ 7 days from disclosure | CVE scanner output | [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) |
| NFR-SEC-05 | Security | Threat-model coverage | Refreshed annually or on major change | ARB minutes | [Chapter 23 Appendix A. Threat Model](23-appendix-a-threat-model.md) |
| NFR-PRV-01 | Privacy | PII redaction at source | 100% of regulated fields | Pre-flight log linter | [Chapter 17. Application Telemetry Standard -> Section 6. PII & Data Classification](17-application-telemetry-standard.md#6-pii-data-classification) |
| NFR-PRV-02 | Privacy | DPIA performed for any new telemetry containing personal data | Mandatory pre-go-live | DPIA register | [Chapter 8. Observability Data Governance and Retention Policy](08-observability-data-governance-and-retention-policy.md) |
| NFR-PRV-03 | Privacy | Right-to-erasure execution time | ≤ 30 days (GDPR Art. 17) | Erasure-request log | [Chapter 28. Observability Long-Term Archival Policy](28-observability-long-term-archival-policy.md) |
| NFR-CMP-01 | Compliance | SOC 2 Type II control coverage | All in-scope CC controls mapped | Control matrix evidence | [Chapter 10. Compliance and Audit Control Matrix](10-compliance-and-audit-control-matrix.md) |
| NFR-CMP-02 | Compliance | ISO 27001 Annex A control coverage | All in-scope clauses mapped | Control matrix evidence | [Chapter 10. Compliance and Audit Control Matrix](10-compliance-and-audit-control-matrix.md) |
| NFR-CMP-03 | Compliance | Audit-log immutability | Write-once for ≥ 1 year | Storage policy audit | [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) |
| NFR-MNT-01 | Maintainability | Platform dependency upgrade SLA | ≤ 90 days from upstream GA | Dependency-bot reports | [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) |
| NFR-MNT-02 | Maintainability | Mean change-implementation lead time | ≤ 5 working days | Git → prod telemetry | DORA Four Keys |
| NFR-MNT-03 | Maintainability | Change failure rate | ≤ 15% | Platform incident log | DORA Four Keys |
| NFR-MNT-04 | Maintainability | Technical-debt KPI | Tracked, reviewed quarterly | Debt register | [Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md) |
| NFR-OBS-01 | Meta-observability | Platform self-monitoring coverage | 100% of platform components emit telemetry | Self-monitoring dashboard | [Chapter 2. Observability Reference Architecture](02-observability-reference-architecture.md) |
| NFR-OBS-02 | Meta-observability | Telemetry pipeline drop rate alert | Alert if > 0.1% sustained 5 min | Collector metrics | [Chapter 2. Observability Reference Architecture](02-observability-reference-architecture.md) |
| NFR-PRT-01 | Portability | Stack runs unchanged across on-prem, customer-site, and cloud VM | One Compose definition, host-portable | Deployment matrix | [Chapter 26. Multi-Tenant and Customer-Site Deployment Model](26-multi-tenant-and-customer-site-deployment-model.md) |
| NFR-PRT-02 | Portability | OpenTelemetry-only ingestion path | No vendor-proprietary SDKs | Onboarding checklist | [Chapter 25. Service Onboarding and Instrumentation Kits](25-service-onboarding-and-instrumentation-kits.md) |
| NFR-INT-01 | Interoperability | Outbound webhook integration with ITSM (ServiceNow / Jira) | Mandatory for Sev1–Sev2 alerts | Webhook config audit | [Chapter 4. Alerting and Incident Severity Policy](04-alerting-and-incident-severity-policy.md) |
| NFR-INT-02 | Interoperability | Outbound feed to SIEM | Security telemetry forwarded to SOC | Feed config audit | [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) |
| NFR-INT-03 | Interoperability | W3C Trace Context propagation | Mandatory between all services | Trace continuity report | [Chapter 25. Service Onboarding and Instrumentation Kits](25-service-onboarding-and-instrumentation-kits.md) |
| NFR-USE-01 | Usability | Dashboard accessibility | WCAG 2.1 AA where browser-rendered | Annual review | [Chapter 5. Grafana Platform Standard and Visualization Playbook](05-grafana-platform-standard-and-visualization-playbook.md) |
| NFR-USE-02 | Usability | Alert message clarity standard | All alerts include: summary, runbook link, severity, owner | Alert linter | [Chapter 4. Alerting and Incident Severity Policy](04-alerting-and-incident-severity-policy.md) |
| NFR-USE-03 | Usability | Runbook authoring standard | Every Sev1–Sev2 alert linked to runbook (no runbook → no alert) | Pre-merge check | [Chapter 3. Domain Observability Runbooks Pack](03-domain-observability-runbooks-pack.md) |
| NFR-I18N-01 | Internationalisation | Alert / dashboard time-zone | UTC canonical; per-user display TZ | Grafana config | [Chapter 5. Grafana Platform Standard and Visualization Playbook](05-grafana-platform-standard-and-visualization-playbook.md) |
| NFR-I18N-02 | Internationalisation | Locale-aware number / date formatting in customer-facing reports | Configurable per tenant | Report template review | [Chapter 26. Multi-Tenant and Customer-Site Deployment Model](26-multi-tenant-and-customer-site-deployment-model.md) |
| NFR-CAP-01 | Capacity | Per-service active-series budget | Enforced at SDK + collector + backend | Cardinality KPI dashboard | [Chapter 22. Capacity and Scale Model -> Section 8. Cardinality Budget](22-capacity-and-scale-model.md#8-cardinality-budget) |
| NFR-CAP-02 | Capacity | Per-tenant log-volume cap | Enforced at collector | FinOps dashboard | [Chapter 9. Observability FinOps Standard](09-observability-finops-standard.md) |
| NFR-OPR-01 | Operability | Toil budget for platform team | ≤ 50% of team time | Weekly time-tracking | [Chapter 18. Observability Operating Model and Adoption Plan](18-observability-operating-model-and-adoption-plan.md) |
| NFR-OPR-02 | Operability | On-call rotation fairness | Max 1 week-in-4 per engineer | Roster export | [Chapter 12. Incident Response Playbook](12-incident-response-playbook.md) |
| NFR-SUP-01 | Supportability | Vendor escalation contact list maintained | Reviewed quarterly | Vendor register | [Chapter 18. Observability Operating Model and Adoption Plan](18-observability-operating-model-and-adoption-plan.md) |
| NFR-SUP-02 | Supportability | OSS dependency support tier | Critical components on commercial support OR named OSS maintainer contact | Dependency register | [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) |
| NFR-TST-01 | Testability | Synthetic probes for every Tier-1 user journey | 100% coverage | Synthetic-monitoring dashboard | [Chapter 3. Domain Observability Runbooks Pack -> Section 3. Application Observability Runbook (Pre-Login & Post-Login Execution Steps)](03-domain-observability-runbooks-pack.md#3-application-observability-runbook-pre-login-post-login-execution-steps) |
| NFR-TST-02 | Testability | Alert-rule unit tests | Mandatory before merge | CI pipeline | [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) |
| NFR-TST-03 | Testability | Dashboard regression test on Grafana version upgrade | Mandatory pre-prod | CI pipeline | [Chapter 5. Grafana Platform Standard and Visualization Playbook](05-grafana-platform-standard-and-visualization-playbook.md) |
| NFR-AUD-01 | Auditability | All platform admin actions logged immutably | 100% | Audit log review | [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) |
| NFR-AUD-02 | Auditability | ADR record for every architectural decision | Mandatory | ADR register | [Chapter 16. Observability ADR Decision Register](16-observability-adr-decision-register.md) |
| NFR-SUS-01 | Sustainability | Carbon-per-GB-ingested KPI | Tracked, reduced YoY | FinOps + carbon dashboard | [Chapter 9. Observability FinOps Standard](09-observability-finops-standard.md) |
| NFR-SUS-02 | Sustainability | Sampling policy applied for sustainability | Tail-sampling enabled where lossless not required | Sampling config audit | [Chapter 2. Observability Reference Architecture -> Section 5.1. Sampling Strategy](02-observability-reference-architecture.md#51-sampling-strategy) |
| NFR-RES-01 | Resilience | Chaos-engineering programme on platform | At least 2 game-days per year | Game-day report | [Chapter 21. Observability Platform HA and DR Design](21-observability-platform-ha-and-dr-design.md) |
| NFR-RES-02 | Resilience | FMEA review for the platform | Annual | ARB minutes | [Chapter 23 Appendix A. Threat Model](23-appendix-a-threat-model.md) |
| NFR-THR-01 | Throughput | Ingest throughput per collector | ≥ 50 k spans/s, ≥ 100 k log lines/s baseline | Load-test artefact | [Chapter 22. Capacity and Scale Model](22-capacity-and-scale-model.md) |
| NFR-INT-04 | Integrity | Telemetry tamper-evidence | Audit-trail signing on Sev1–Sev2 evidence | Signing pipeline | [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) |
| NFR-MUL-01 | Multi-tenancy | Tenant data isolation | Enforced at namespace + RBAC + storage prefix | Penetration test | [Chapter 26. Multi-Tenant and Customer-Site Deployment Model](26-multi-tenant-and-customer-site-deployment-model.md) |
| NFR-CFG-01 | Configurability | All config in Git | 100%; no hand-edits in production | Drift detector | [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) |
| NFR-DPL-01 | Deployability | Mean deployment duration | ≤ 30 min for full-stack refresh | Deployment metrics | [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) |
| NFR-DPL-02 | Deployability | Rollback time | ≤ 15 min | Deployment runbook | [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) |

## 4. Verification & Evidence

| NFR Category | Primary Evidence | Review Cadence | Reviewer |
|---|---|---|---|
| Availability / Reliability / Recoverability | SLO dashboards + DR drill reports | Quarterly | SRE lead |
| Security / Privacy / Compliance | Control-matrix evidence + audit reports | Semi-annual | CISO / DPO |
| Performance / Scalability / Capacity / Throughput | Load-test artefacts + capacity dashboard | Quarterly | Platform lead |
| Maintainability / Testability / Deployability | DORA metrics dashboard | Monthly | Platform lead |
| Operability / Supportability | Toil report + vendor register | Quarterly | Operating-model owner |
| Auditability / Integrity | Audit-log integrity report | Quarterly | Internal audit |
| Usability / I18N | Annual UX review | Annual | Grafana platform lead |
| Sustainability | Carbon-per-GB trend | Quarterly | FinOps lead |
| Resilience | Game-day reports + FMEA | Annual | SRE lead |
| Multi-tenancy / Portability / Interoperability / Configurability | Architecture review minutes | Annual | ARB |

## 5. Change Control

Changes to this register require an ADR ([Chapter 16. Observability ADR Decision Register](16-observability-adr-decision-register.md)) when:

- A target threshold is relaxed.
- A new NFR is introduced that imposes platform-wide change.
- An NFR is retired.

## 6. Cross-References

- [Chapter 0. Xceedance Observability Strategy](00-observability-strategy-revised.md) — strategic principles underpinning the NFRs.
- [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md) — outcome KPIs derived from these NFRs.
- [Chapter 14. Observability Capability Assessment Framework](14-observability-capability-assessment-framework.md) — maturity scoring uses these NFRs as evidence.
- [Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md) — governance approving NFR changes.
- [Chapter 28. Observability Long-Term Archival Policy](28-observability-long-term-archival-policy.md) — archival NFRs detailed.
- [Chapter 23 Appendix A. Threat Model](23-appendix-a-threat-model.md) — security threats mapped to NFR-SEC controls.

---

[↑ Back to TOC](toc.md)
