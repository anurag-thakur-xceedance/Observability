---
title: Observability Non-Functional Requirements Register
chapter: 28
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 28. Observability Non-Functional Requirements Register

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](27-multi-tenant-and-customer-site-deployment-model.md) | [Next Page](29-observability-long-term-archival-policy.md)

| **Document Owner** | CoE-Architecture |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **First Review** | 1-Aug-2026 |
| **Next Review Due** | 1-Nov-2026 |

---

## 28.0 Reader Guide
Use this chapter as the auditable NFR register for the observability platform. Architects, SREs, and auditors should use it to find the target, measurement method, and design reference for availability, performance, security, privacy, resilience, and operability requirements.

## 28.1 Purpose

This chapter consolidates the **non-functional requirements (NFRs)** for the Xceedance Observability Platform itself — treating the platform as a Tier 1 service with its own SLOs, security posture, and operational standards. NFRs are otherwise scattered across architecture, capacity, HA/DR, security, FinOps, and onboarding chapters; this register provides a single auditable view for ARB, internal audit, and customer-facing assurance.

## 28.2 Scope

In-scope: the observability platform components (OpenTelemetry Collector, Prometheus, Loki, Tempo, Grafana, AIOps layer, IaC pipeline, dashboard catalogue).

Out-of-scope: NFRs of the **observed** services (those are owned by each service team and tracked in their own SLO docs per [Chapter 25. SLO and Error-Budget Framework](25-slo-and-error-budget-framework.md)).

## 28.3 NFR Register

Each NFR has: ID, category, statement, target, measurement source, owner (TBD), and a cross-reference to the artefact where the design is detailed.

**How to read this register by domain:**
- **Availability / Reliability / Recoverability:** `NFR-AVL-*`, `NFR-REL-*`, `NFR-REC-*` cover uptime, error-budget enforcement, backup, restore, and DR outcomes.
- **Performance / Scalability / Capacity / Throughput:** `NFR-PRF-*`, `NFR-SCL-*`, `NFR-CAP-*`, `NFR-THR-*` cover query latency, ingest speed, active-series headroom, and scaling limits.
- **Security / Privacy / Compliance / Auditability:** `NFR-SEC-*`, `NFR-PRV-*`, `NFR-CMP-*`, `NFR-AUD-*` cover encryption, RBAC, PII handling, regulatory evidence, and audit trails.
- **Maintainability / Operability / Supportability / Deployability:** `NFR-MNT-*`, `NFR-OPR-*`, `NFR-SUP-*`, `NFR-DPL-*`, `NFR-CFG-*` cover upgrades, toil, support model, deployment speed, and configuration hygiene.
- **Interoperability / Portability / Usability / Internationalisation / Sustainability / Meta-observability:** `NFR-INT-*`, `NFR-PRT-*`, `NFR-USE-*`, `NFR-I18N-*`, `NFR-SUS-*`, `NFR-OBS-*` cover integrations, cross-environment portability, usability, localisation, efficiency, and self-monitoring.

| ID | Category | Requirement | Target / Threshold | Measured Via | Detail Reference |
|---|---|---|---|---|---|
| NFR-AVL-01 | Availability | Observability platform availability | 99.9% monthly | Grafana uptime SLO + synthetic probe | [Chapter 22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md) |
| NFR-AVL-02 | Availability | Telemetry ingestion availability | 99.95% monthly | Collector liveness + ingest success rate | [Chapter 3. Observability Reference Architecture -> Section 3.5 Telemetry Collection Layers](03-observability-reference-architecture.md#35-telemetry-collection-layers) |
| NFR-PRF-01 | Performance | Dashboard P95 query latency | ≤ 3 s | Grafana query logs | [Chapter 23. Capacity and Scale Model -> Section 23.7 Performance SLOs for the Platform Itself](23-capacity-and-scale-model.md#237-performance-slos-for-the-platform-itself) |
| NFR-PRF-02 | Performance | Alert firing-to-notification latency | P95 ≤ 90 s | Alertmanager + paging system | [Chapter 5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md) |
| NFR-PRF-03 | Performance | Telemetry end-to-end propagation (collector → store) | P95 ≤ 30 s | OTel pipeline metrics | [Chapter 23. Capacity and Scale Model](23-capacity-and-scale-model.md) |
| NFR-SCL-01 | Scalability | Horizontal scalability of collectors | Linear to 10× baseline | Load-test artefact | [Chapter 23. Capacity and Scale Model -> Section 23.4 Scale-Out Triggers](23-capacity-and-scale-model.md#234-scale-out-triggers) |
| NFR-SCL-02 | Scalability | Active series headroom per backend | ≥ 30% over peak | Prometheus `prometheus_tsdb_head_series` | [Chapter 23. Capacity and Scale Model -> Section 23.8 Cardinality Budget](23-capacity-and-scale-model.md#238-cardinality-budget) |
| NFR-REL-01 | Reliability | Mean Time Between Failures (platform) | ≥ 90 days | Platform incident log | [Chapter 22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md) |
| NFR-REL-02 | Reliability | Error-budget policy enforcement | Freezes feature work when consumed | Burn-rate alerts | [Chapter 25. SLO and Error-Budget Framework](25-slo-and-error-budget-framework.md) |
| NFR-REC-01 | Recoverability | Platform RTO | ≤ 30 min | DR runbook drill | [Chapter 22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md) |
| NFR-REC-02 | Recoverability | Platform RPO | ≤ 5 min for metrics, logs, and traces in flight; ≤ 1 h for dashboards and alert-rule state | DR runbook drill | [Chapter 22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md) |
| NFR-REC-03 | Recoverability | Archive restore SLA | ≤ 48 h for ≤ 1 TB | Archive runbook drill | [Chapter 29. Observability Long-Term Archival Policy](29-observability-long-term-archival-policy.md) |
| NFR-SEC-01 | Security | All telemetry encrypted in transit | mTLS 1.3 between collector and backend | Network policy audit | [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) |
| NFR-SEC-02 | Security | All telemetry encrypted at rest | AES-256 (provider-default or CMK) | Storage config audit | [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) |
| NFR-SEC-03 | Security | RBAC enforced on every dashboard, alert rule, and data source | 100% coverage | Quarterly access review | [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) |
| NFR-SEC-04 | Security | Critical-vulnerability remediation | ≤ 7 days from disclosure | CVE scanner output | [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md) |
| NFR-SEC-05 | Security | Threat-model coverage | Refreshed annually or on major change | ARB minutes | [Annexure C — Threat Model (STRIDE threat model)](annexure-c-threat-model.md) |
| NFR-PRV-01 | Privacy | PII redaction at source | 100% of regulated fields | Pre-flight log linter | [Chapter 18. Application Telemetry Standard -> Section 18.6 PII & Data Classification](18-application-telemetry-standard.md#186-pii-data-classification) |
| NFR-PRV-02 | Privacy | DPIA performed for any new telemetry containing personal data | Mandatory pre-go-live | DPIA register | [Chapter 9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md) |
| NFR-PRV-03 | Privacy | Right-to-erasure execution time | ≤ 30 days (GDPR Art. 17) | Erasure-request log | [Chapter 29. Observability Long-Term Archival Policy](29-observability-long-term-archival-policy.md) |
| NFR-CMP-01 | Compliance | SOC 2 Type II control coverage | All in-scope CC controls mapped | Control matrix evidence | [Chapter 11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md) |
| NFR-CMP-02 | Compliance | ISO 27001 Annex A control coverage | All in-scope clauses mapped | Control matrix evidence | [Chapter 11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md) |
| NFR-CMP-03 | Compliance | Audit-log immutability | Write-once for ≥ 1 year | Storage policy audit | [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) |
| NFR-MNT-01 | Maintainability | Platform dependency upgrade SLA | ≤ 90 days from upstream GA | Dependency-bot reports | [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md) |
| NFR-MNT-02 | Maintainability | Mean change-implementation lead time | ≤ 5 working days | Git → prod telemetry | DORA Four Keys |
| NFR-MNT-03 | Maintainability | Change failure rate | ≤ 15% | Platform incident log | DORA Four Keys |
| NFR-MNT-04 | Maintainability | Technical-debt KPI | Tracked, reviewed quarterly | Debt register | [Chapter 16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md) |
| NFR-OBS-01 | Meta-observability | Platform self-monitoring coverage | 100% of platform components emit telemetry | Self-monitoring dashboard | [Chapter 3. Observability Reference Architecture](03-observability-reference-architecture.md) |
| NFR-OBS-02 | Meta-observability | Telemetry pipeline drop rate alert | Alert if > 0.1% sustained 5 min | Collector metrics | [Chapter 3. Observability Reference Architecture](03-observability-reference-architecture.md) |
| NFR-PRT-01 | Portability | Stack runs unchanged across on-prem, customer-site, and cloud VM | One Compose definition, host-portable | Deployment matrix | [Chapter 27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md) |
| NFR-PRT-02 | Portability | OpenTelemetry-only ingestion path | No vendor-proprietary SDKs | Onboarding checklist | [Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md) |
| NFR-INT-01 | Interoperability | Outbound webhook integration with ITSM (ServiceNow / Jira) | Mandatory for Sev1–Sev2 alerts | Webhook config audit | [Chapter 5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md) |
| NFR-INT-02 | Interoperability | Outbound feed to SIEM | Security telemetry forwarded to SOC | Feed config audit | [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) |
| NFR-INT-03 | Interoperability | W3C Trace Context propagation | Mandatory between all services | Trace continuity report | [Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md) |
| NFR-USE-01 | Usability | Dashboard accessibility | WCAG 2.1 AA where browser-rendered | Annual review | [Chapter 6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md) |
| NFR-USE-02 | Usability | Alert message clarity standard | All alerts include: summary, runbook link, severity, owner | Alert linter | [Chapter 5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md) |
| NFR-USE-03 | Usability | Runbook authoring standard | Every Sev1–Sev2 alert linked to runbook (no runbook → no alert) | Pre-merge check | [Chapter 4. Domain Observability Runbooks Pack](04-domain-observability-runbooks-pack.md) |
| NFR-I18N-01 | Internationalisation | Alert / dashboard time-zone | UTC canonical; per-user display TZ | Grafana config | [Chapter 6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md) |
| NFR-I18N-02 | Internationalisation | Locale-aware number / date formatting in customer-facing reports | Configurable per tenant | Report template review | [Chapter 27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md) |
| NFR-CAP-01 | Capacity | Per-service active-series budget | Enforced at SDK + collector + backend | Cardinality KPI dashboard | [Chapter 23. Capacity and Scale Model -> Section 23.8 Cardinality Budget](23-capacity-and-scale-model.md#238-cardinality-budget) |
| NFR-CAP-02 | Capacity | Per-tenant log-volume cap | Enforced at collector | FinOps dashboard | [Chapter 10. Observability FinOps Standard](10-observability-finops-standard.md) |
| NFR-OPR-01 | Operability | Toil budget for platform team | ≤ 50% of team time | Weekly time-tracking | [Chapter 19. Observability Operating Model and Adoption Plan](19-observability-operating-model-and-adoption-plan.md) |
| NFR-OPR-02 | Operability | On-call rotation fairness | Max 1 week-in-4 per engineer | Roster export | [Chapter 13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md) |
| NFR-SUP-01 | Supportability | Vendor escalation contact list maintained | Reviewed quarterly | Vendor register | [Chapter 19. Observability Operating Model and Adoption Plan](19-observability-operating-model-and-adoption-plan.md) |
| NFR-SUP-02 | Supportability | OSS dependency support tier | Critical components on commercial support OR named OSS maintainer contact | Dependency register | [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md) |
| NFR-TST-01 | Testability | Synthetic probes for every Tier-1 user journey | 100% coverage | Synthetic-monitoring dashboard | [Chapter 4. Domain Observability Runbooks Pack -> Section 4.3 Application Observability Runbook (Pre-Login & Post-Login Execution Steps)](04-domain-observability-runbooks-pack.md#43-application-observability-runbook-pre-login-post-login-execution-steps) |
| NFR-TST-02 | Testability | Alert-rule unit tests | Mandatory before merge | CI pipeline | [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md) |
| NFR-TST-03 | Testability | Dashboard regression test on Grafana version upgrade | Mandatory pre-prod | CI pipeline | [Chapter 6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md) |
| NFR-AUD-01 | Auditability | All platform admin actions logged immutably | 100% | Audit log review | [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) |
| NFR-AUD-02 | Auditability | ADR record for every architectural decision | Mandatory | ADR register | [Chapter 17. Observability ADR Decision Register](17-observability-adr-decision-register.md) |
| NFR-SUS-01 | Sustainability | Carbon-per-GB-ingested KPI | Tracked, reduced YoY | FinOps + carbon dashboard | [Chapter 10. Observability FinOps Standard](10-observability-finops-standard.md) |
| NFR-SUS-02 | Sustainability | Sampling policy applied for sustainability | Tail-sampling enabled where lossless not required | Sampling config audit | [Chapter 3. Observability Reference Architecture -> Section 3.5.1 Sampling Strategy](03-observability-reference-architecture.md#351-sampling-strategy) |
| NFR-RES-01 | Resilience | Chaos-engineering programme on platform | At least 2 game-days per year | Game-day report | [Chapter 22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md) |
| NFR-RES-02 | Resilience | FMEA review for the platform | Annual | ARB minutes | [Annexure C — Threat Model (STRIDE threat model)](annexure-c-threat-model.md) |
| NFR-THR-01 | Throughput | Ingest throughput per collector | ≥ 50 k spans/s, ≥ 100 k log lines/s baseline | Load-test artefact | [Chapter 23. Capacity and Scale Model](23-capacity-and-scale-model.md) |
| NFR-INT-04 | Integrity | Telemetry tamper-evidence | Audit-trail signing on Sev1–Sev2 evidence | Signing pipeline | [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) |
| NFR-MUL-01 | Multi-tenancy | Tenant data isolation | Enforced at namespace + RBAC + storage prefix | Penetration test | [Chapter 27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md) |
| NFR-CFG-01 | Configurability | All config in Git | 100%; no hand-edits in production | Drift detector | [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md) |
| NFR-DPL-01 | Deployability | Mean deployment duration | ≤ 30 min for full-stack refresh | Deployment metrics | [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md) |
| NFR-DPL-02 | Deployability | Rollback time | ≤ 15 min | Deployment runbook | [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md) |

## 28.4 Verification Methods (Per NFR)

Each NFR in Section 4 has a concrete verification specification: the exact SLI/query/artefact that measures it, the evidence artefact produced, the test or audit procedure, the role accountable, the cadence at which evidence is refreshed, and the pass/fail criterion. This section is the audit-facing answer to "how do you know?" for each NFR.

Where a query language is shown, the language is named (PromQL / LogQL / TraceQL / KQL / SQL); thresholds are illustrative defaults pending environment calibration per [Chapter 4. Domain Observability Runbooks Pack -> Section 4.8 Calibration Note](04-domain-observability-runbooks-pack.md#48-calibration-note).

### 28.4.1 Availability (NFR-AVL-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-AVL-01 | PromQL: `1 - (sum_over_time(probe_success{job="grafana-blackbox"}[30d]) / count_over_time(probe_success{job="grafana-blackbox"}[30d]))` | Grafana SLO dashboard `platform-availability` panel + monthly export PDF | Synthetic blackbox-exporter probe every 30 s from 3 geo-locations; SLO computed on 30-day rolling window; monthly PDF generated and stored in audit bucket | SRE Lead | Continuous; monthly export | Availability ≥ 99.9% over preceding 30 days |
| NFR-AVL-02 | PromQL: `sum(rate(otelcol_receiver_accepted_spans[5m])) / (sum(rate(otelcol_receiver_accepted_spans[5m])) + sum(rate(otelcol_receiver_refused_spans[5m])))` and equivalent for metrics / logs | Collector ingest-availability dashboard + alert history export | Computed continuously per signal; quarterly review of alert history confirms no sustained breach > 5 min | SRE Lead | Continuous; quarterly review | Per-signal ingest success ≥ 99.95% monthly |

### 28.4.2 Performance (NFR-PRF-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-PRF-01 | PromQL: `histogram_quantile(0.95, sum by (le) (rate(grafana_http_request_duration_seconds_bucket{handler=~"/api/datasources/proxy.*"}[5m])))` | Grafana self-monitoring dashboard `dashboard-query-latency` | Computed continuously over 7-day rolling window; quarterly capacity review references this panel | Platform Lead | Continuous; quarterly review | P95 ≤ 3 s sustained |
| NFR-PRF-02 | PromQL: `histogram_quantile(0.95, rate(alertmanager_notification_latency_seconds_bucket[5m]))` | Alertmanager metrics panel + incident-timeline reconstruction for sampled Sev1 incidents | Continuous SLI; on each Sev1 incident, post-incident review reconstructs firing → notify timeline from `alertmanager_notification_latency_seconds` and paging system webhook timestamps | SRE Lead | Continuous; per-incident sampling | P95 ≤ 90 s |
| NFR-PRF-03 | PromQL: end-to-end propagation = `time() - max(otelcol_exporter_send_failed_spans_timestamp_seconds)` proxy; preferred: synthetic-trace timestamp-emit → search-result-visible delta measured by an independent prober | Synthetic-trace prober output table | Synthetic emits a span every 60 s with `prober.emit_ts`; a second job queries Tempo for that span every 60 s and records `find_ts - emit_ts` | Platform Lead | Continuous; monthly trend | P95 ≤ 30 s |

### 28.4.3 Scalability & Capacity (NFR-SCL-*, NFR-CAP-*, NFR-THR-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-SCL-01 | k6 load-test report comparing baseline vs. 10× ingest with N replica counts | Load-test report PDF in `reference-implementations/load-tests/` | Annual full load-test: ramp ingest 1× → 10× over 2 hours; measure CPU / RAM / ingest-success per replica count; confirm linear scaling | Platform Lead | Annual + on major version upgrade | Throughput scales ≥ 0.9 × linear up to 10× baseline |
| NFR-SCL-02 | PromQL: `(max(prometheus_tsdb_head_series) / on() group_left max(prometheus_tsdb_head_max_series_limit)) < 0.7` | Capacity dashboard `series-headroom` panel | Continuous alert at ≥ 70% utilisation; quarterly capacity review confirms 12-month forecast retains headroom | Platform Lead | Continuous; quarterly review | Headroom ≥ 30% at peak |
| NFR-CAP-01 | PromQL: `sum by (service) (prometheus_tsdb_head_series{service!=""}) > on() group_left service_tier_max_series` | Per-service cardinality report (weekly export from KPI dashboard) | Weekly job exports series-by-service; breaches generate Jira tickets to the owning service team per [Chapter 2. Enterprise Observability Standards Catalogue -> Section 2.3.4 Cardinality Governance](02-enterprise-observability-standards-catalog.md#234-cardinality-governance) | Platform Engineering | Weekly | Zero unresolved breaches > 14 days |
| NFR-CAP-02 | LogQL: `sum by (tenant) (rate({tenant=~".+"}[5m])) > on() group_left tenant_log_quota` | FinOps per-tenant dashboard | Continuous; breaches trigger collector-side rate-limit per tenant; monthly FinOps review surfaces repeat offenders | FinOps Lead | Continuous; monthly review | No sustained breach > 1 h without rate-limit applied |
| NFR-THR-01 | k6 load-test artefact `collector-throughput-baseline` | Load-test report in `reference-implementations/load-tests/` | Annual baseline test on reference VM SKU; injects synthetic spans + log lines until first sustained drop or queue-fill | Platform Lead | Annual + on collector version upgrade | ≥ 50k spans/s, ≥ 100k log lines/s without drops on reference SKU |

### 28.4.4 Reliability & Recoverability (NFR-REL-*, NFR-REC-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-REL-01 | Platform incident log: count of Sev1–Sev2 platform incidents per quarter; MTBF = `total_hours / incident_count` | Quarterly platform incident-log report | Compiled from Jira incident records tagged `component:observability-platform`; rolling 365-day window | SRE Lead | Quarterly | MTBF ≥ 90 days (rolling 365 d) |
| NFR-REL-02 | Error-budget burn detection: PromQL alert rule `slo:error_budget_burn_rate:fast > 14.4` triggers feature-work freeze | ARB minutes recording freeze invocations + lift dates | When burn-rate fires, ARB chair records freeze; lift requires burn-rate < 1 for 7 days + signed-off remediation plan | ARB Chair | Per-event | 100% of qualifying burn-rate events have recorded freeze + lift evidence |
| NFR-REC-01 | DR drill report measuring tabletop + active-failover RTO | DR drill report PDF | Quarterly: alternate between tabletop walkthrough and active failover in non-prod. Annual: at least one production-mirror full failover | SRE Lead | Quarterly | RTO ≤ 30 min in last drill |
| NFR-REC-02 | DR drill report measuring data-loss window post-failover | DR drill report PDF | During active failover, sample last-committed sample / log-line / span pre-failure vs. first-committed post-recovery | SRE Lead | Quarterly | RPO ≤ 5 min for metrics, logs, and traces; ≤ 1 h for dashboards and alert-rule state |
| NFR-REC-03 | Archive restore runbook drill report | Archive restore drill PDF in audit bucket | Semi-annual: restore a randomly chosen 1 TB cold-archive shard to a sandbox; measure submit → readable | Platform Lead + Compliance | Semi-annual | ≤ 48 h end-to-end |

### 28.4.5 Security (NFR-SEC-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-SEC-01 | Network-policy audit: scan ingress/egress policies for `tls_min_version: TLSv1.3` and mTLS enabled between every observability namespace | Network-policy audit report (auto-generated from kube-bench / Azure Policy / OPA scan) | Continuous Policy-as-Code check; quarterly manual review of exceptions | Security Architect | Continuous; quarterly review | 100% in-transit flows on mTLS 1.3 |
| NFR-SEC-02 | Storage-config audit: cloud-API query for encryption-at-rest setting on every blob container, disk, and database used by the platform | Cloud-resource compliance report (Azure Policy / AWS Config) | Continuous Policy-as-Code check; quarterly evidence export | Security Architect | Continuous; quarterly review | 100% storage resources encrypted (AES-256 default or CMK) |
| NFR-SEC-03 | Quarterly access review export from Grafana + Prometheus + Loki + Tempo + Alertmanager: list of users × roles × scopes | Access-review attestation document signed by data owner | Quarterly export reviewed by data owner per service; sign-off recorded in audit register | Security Architect | Quarterly | 100% objects (dashboard, alert rule, data source) have explicit RBAC; zero unattested principals |
| NFR-SEC-04 | CVE scanner output (Trivy / Grype) on every container image in the platform; aged-critical count = critical CVEs ≥ 7 days since first scan | Vulnerability dashboard + monthly CVE-aging report | Continuous scan in CI + nightly scan on running images; aged criticals raise Sev2 ticket | Platform Engineering | Continuous; monthly review | Zero critical CVEs aged > 7 days |
| NFR-SEC-05 | Threat-model review attestation in ARB minutes | ARB minutes + updated [Annexure C — Threat Model (STRIDE)](annexure-c-threat-model.md) | Annual scheduled review or trigger-based (new component, breach class change, major dependency); ARB records date and reviewer | Security Architect + ARB Chair | Annual + trigger-based | Last review ≤ 12 months old |

### 28.4.6 Privacy (NFR-PRV-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-PRV-01 | Pre-flight log-linter CI job + collector-side redaction processor metrics `otelcol_processor_redaction_redacted_total` | Linter CI logs + collector redaction metrics dashboard | Linter blocks merge on detection of regex-classified PII fields; collector redaction processor is mandatory for prod pipelines; quarterly sample-based audit on 100 random log lines | DPO + Security Architect | Continuous in CI; quarterly audit | Zero PII leakage on sample; zero linter bypasses in main branch |
| NFR-PRV-02 | DPIA register entry per new telemetry stream containing personal data | DPIA register (SharePoint / OneTrust) | Pre-go-live PRR gate ([Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md)) blocks onboarding without DPIA where personal data is in scope | DPO | Per onboarding | 100% of in-scope onboardings have DPIA before go-live |
| NFR-PRV-03 | Erasure-request log with `received_ts`, `executed_ts`; SLA = `executed_ts - received_ts` | Erasure-request log + monthly DSAR report | Each erasure request creates a ticket; ticket close requires evidence of erasure across hot/warm/cold tiers and archive; monthly DSAR report aggregates SLA performance | DPO | Continuous; monthly report | All requests closed ≤ 30 days |

### 28.4.7 Compliance (NFR-CMP-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-CMP-01 | Control-matrix coverage % from [Chapter 11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md) | SOC 2 Type II audit report | External auditor performs control-test sampling annually; internal pre-audit performed semi-annually using same procedures | Compliance Lead | Annual external + semi-annual internal | All in-scope CC controls mapped + tested; zero exceptions unresolved at audit close |
| NFR-CMP-02 | Control-matrix coverage % for ISO 27001 Annex A | ISO 27001 certification report | Surveillance audit annually; recertification every 3 years | Compliance Lead | Annual surveillance + 3-year recertification | All in-scope Annex A clauses mapped; surveillance audit closed with zero major non-conformities |
| NFR-CMP-03 | Storage policy attribute audit: `WORM=true`, `retention_years ≥ 1` on every audit-log container | Storage policy audit report | Continuous policy-as-code check on object-storage / immutable-blob configuration | Compliance Lead | Continuous; quarterly evidence export | 100% audit-log stores immutable for ≥ 1 year |

### 28.4.8 Maintainability (NFR-MNT-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-MNT-01 | Dependency-bot (Renovate / Dependabot) report: `days_since_upstream_GA` per dependency | Renovate dashboard + monthly dependency-aging report | Bot scans daily; PRs auto-opened on upstream GA; aging > 90 days raises Sev3 ticket | Platform Engineering | Continuous; monthly review | Zero dependencies aged > 90 days behind upstream GA |
| NFR-MNT-02 | DORA SLI: `deployment_lead_time = deploy_ts - commit_ts` median across last 90 days | DORA dashboard `lead-time` panel | Pipeline emits both timestamps to a DORA-metrics store; median computed weekly | Platform Lead | Continuous | Median ≤ 5 working days |
| NFR-MNT-03 | DORA SLI: `change_failure_rate = failed_deploys / total_deploys` over 90 days | DORA dashboard `failure-rate` panel | Deployment-tagged incidents (`incident.cause:deploy`) divided by total deploys in same window | Platform Lead | Continuous | ≤ 15% |
| NFR-MNT-04 | Technical-debt register count + classification; quarterly trend | Debt register exported from Jira + ARB minutes | Quarterly ARB review of debt register; new debt classified L1–L3; L1 (architectural) prioritised | ARB Chair | Quarterly | Trend stable or downward; no L1 debt > 2 quarters old |

### 28.4.9 Meta-Observability (NFR-OBS-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-OBS-01 | Inventory: list of platform components × telemetry emitted (metrics/logs/traces) | Self-monitoring coverage matrix in `reference-implementations/` | Quarterly self-audit: walk every platform component and confirm telemetry endpoints + dashboards | Platform Lead | Quarterly | 100% components emit at least 2 of 3 signals |
| NFR-OBS-02 | PromQL: `rate(otelcol_processor_dropped_spans[5m]) / rate(otelcol_processor_accepted_spans[5m]) > 0.001` sustained 5 min | Collector drop-rate alert + monthly drop-rate trend report | Continuous alert; monthly review of drop-rate trend by signal | SRE Lead | Continuous; monthly review | Zero unacknowledged drop-rate alerts; sustained drop rate ≤ 0.1% |

### 28.4.10 Portability & Interoperability (NFR-PRT-*, NFR-INT-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-PRT-01 | Deployment matrix: same Compose definition tested on on-prem, customer-site, cloud-VM | Deployment-matrix attestation per release | Each major release deploys reference Compose to all three target classes in test; matrix updated and signed off | Platform Lead | Per major release | All three targets pass deploy + smoke-test |
| NFR-PRT-02 | Onboarding checklist evidence: confirmation no vendor-proprietary SDK used | PRR checklist signed at onboarding ([Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md)) | PRR gate blocks onboarding when vendor SDK detected; quarterly audit samples 10 random onboardings | Platform Engineering | Per onboarding + quarterly audit | 100% onboardings use OTel SDK; zero proprietary-SDK exceptions without ADR |
| NFR-INT-01 | Webhook config audit: every Sev1–Sev2 alert route has at least one ITSM webhook | Alertmanager route-tree audit report | Auto-generated audit from Alertmanager config; alert linter blocks PRs that introduce Sev1–Sev2 rules without ITSM route | SRE Lead | Continuous in CI; quarterly evidence | 100% Sev1–Sev2 routes have ITSM webhook |
| NFR-INT-02 | SIEM feed config audit: confirm security-relevant streams (audit log, auth events) forwarded to SOC | SIEM ingest dashboard + monthly feed-health report | Continuous SIEM-side feed-health monitor; monthly attestation by SOC lead | Security Architect | Continuous; monthly attestation | Zero feed-health alerts > 1 h unack |
| NFR-INT-03 | Trace-continuity report: % of cross-service spans with parent in upstream service | TraceQL: `{ kind = "server" } && parent.kind = "client"` continuity ratio; dashboard panel | Sampled hourly; service-onboarding PRR includes trace-context test as gate item | Platform Engineering | Continuous; per onboarding | Continuity ≥ 95% for in-pack services |

### 28.4.11 Usability (NFR-USE-*) & Internationalisation (NFR-I18N-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-USE-01 | Annual accessibility audit (axe-core / WAVE) on top-20 dashboards | Accessibility audit report | Annual scan + manual review of top-20 dashboards against WCAG 2.1 AA; remediation tickets for findings | Grafana Platform Lead | Annual | Zero AA-level findings unresolved > 1 quarter |
| NFR-USE-02 | Alert-rule linter check: every alert has `summary`, `runbook_url`, `severity`, `service_owner` annotations | Alert linter CI report | Linter runs in CI; blocks merge on missing fields; weekly summary of bypass exceptions | SRE Lead | Continuous in CI | Zero linter bypasses in main branch |
| NFR-USE-03 | Pre-merge check: every new Sev1–Sev2 alert has a `runbook_url` resolving to a non-stub runbook page | Alert linter CI report | Linter resolves URL and inspects target document for minimum-content checklist (alert description, diagnostic steps, mitigation) | SRE Lead | Continuous in CI | 100% Sev1–Sev2 alerts have non-stub runbook |
| NFR-I18N-01 | Grafana config audit: `timezone=UTC` server-side + per-user TZ enabled | Grafana config attestation | Quarterly config-audit script confirms server TZ; user TZ feature flag enabled | Grafana Platform Lead | Quarterly | Server TZ = UTC; per-user TZ available |
| NFR-I18N-02 | Tenant report-template review: confirm locale settings configurable per tenant | Report-template review record | Annual review of customer-facing report templates per tenant | Multi-Tenancy Lead | Annual | All customer-facing reports honour tenant locale |

### 28.4.12 Operability & Supportability (NFR-OPR-*, NFR-SUP-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-OPR-01 | Weekly time-tracking export per platform engineer: toil hours / total hours | Toil report (monthly average) | Time tracking via team-chosen tool; toil categorisation per Google SRE definition; monthly aggregation | Operating-Model Owner | Monthly | Toil ≤ 50% averaged over rolling 90 days |
| NFR-OPR-02 | On-call roster fairness check: max consecutive weeks per engineer in last 12 weeks | Roster export (PagerDuty / Opsgenie) | Quarterly roster review; HR-supportable fairness metrics | Operating-Model Owner | Quarterly | No engineer on-call more than 1 week in 4 over rolling 12 weeks |
| NFR-SUP-01 | Vendor register attestation: each vendor has named contact + escalation path | Vendor register | Quarterly review by procurement + platform lead | Operating-Model Owner | Quarterly | 100% vendors with active contract have named escalation contact |
| NFR-SUP-02 | Dependency register attestation: each critical OSS dependency has commercial support OR named maintainer contact | Dependency register | Annual review; new critical-tier OSS dependency added via ADR | Platform Engineering | Annual | 100% critical dependencies have support designation |

### 28.4.13 Testability (NFR-TST-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-TST-01 | Synthetic-monitoring dashboard coverage: list of Tier-1 user journeys × synthetic probe enabled | Synthetic-monitoring coverage matrix | Quarterly self-audit; each new Tier-1 journey requires synthetic-probe creation at PRR | Platform Lead | Quarterly | 100% Tier-1 journeys covered |
| NFR-TST-02 | CI pipeline: alert-rule unit test stage present and passing | CI pipeline output for alert-rule repo | Mandatory CI stage runs `promtool test rules` / `loki-rule test`; merge blocked on failure | SRE Lead | Continuous in CI | 100% PRs to alert-rule repo pass unit-test stage |
| NFR-TST-03 | CI pipeline: dashboard regression test on Grafana version upgrade | Dashboard regression test report | On every Grafana minor / major upgrade in non-prod, run dashboard-render check against catalogue | Grafana Platform Lead | Per Grafana upgrade | Zero render regressions un-triaged at promote-to-prod gate |

### 28.4.14 Auditability (NFR-AUD-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-AUD-01 | Audit-log integrity report: hash-chain or signature validation over admin-action log | Audit-log integrity report | Continuous integrity check; quarterly tamper-evidence review by internal audit | Internal Audit | Continuous; quarterly review | Zero integrity-check failures |
| NFR-AUD-02 | ADR register completeness: every architecturally significant decision in last quarter has an ADR | ADR register from [Chapter 17. Observability ADR Decision Register](17-observability-adr-decision-register.md) | Quarterly ARB review compares architectural changes (commit log, RFC log) against ADR register | ARB Chair | Quarterly | Zero significant decisions without ADR |

### 28.4.15 Sustainability (NFR-SUS-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-SUS-01 | Carbon-per-GB-ingested = `tCO2e / GB_ingested` derived from cloud-provider sustainability API (Azure Emissions Impact) | Carbon dashboard `carbon-per-gb` panel + quarterly trend report | Continuous data feed from cloud sustainability API; quarterly trend computed against year-ago baseline | FinOps Lead | Continuous; quarterly review | YoY downward trend or stable; explicit ARB approval if trend reverses |
| NFR-SUS-02 | Sampling-config audit: tail-sampling enabled and effective rate ≥ target on non-lossless pipelines | Sampling config audit report | Continuous policy-as-code check on collector config; quarterly effectiveness audit on stored:received ratio | Platform Lead | Continuous; quarterly review | 100% non-lossless pipelines have tail-sampling; effective ratio within ±10% of target |

### 28.4.16 Resilience (NFR-RES-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-RES-01 | Game-day report count per year; report quality checklist | Game-day report folder in audit bucket | At least 2 game-days/year; each produces a written report with scenario, outcome, gaps, action register | SRE Lead | Semi-annual | ≥ 2 game-day reports in last 12 months; all actions tracked to closure |
| NFR-RES-02 | FMEA review attestation in ARB minutes | Updated FMEA matrix attached to [Annexure C — Threat Model (STRIDE)](annexure-c-threat-model.md) | Annual FMEA review by SRE + Security Architect; results presented to ARB | SRE Lead + Security Architect | Annual | Last FMEA ≤ 12 months old; residual H risks have mitigation plans |

### 28.4.17 Integrity & Multi-tenancy (NFR-INT-04, NFR-MUL-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-INT-04 | Signing pipeline log: confirms cryptographic signing of Sev1–Sev2 incident-evidence bundles | Signing pipeline audit report | Each Sev1–Sev2 incident produces a signed evidence bundle; auditor verifies signature on random samples | Internal Audit | Continuous; quarterly sample review | 100% Sev1–Sev2 evidence bundles signed and verifiable |
| NFR-MUL-01 | Penetration-test report covering tenant-isolation boundaries | Annual pentest report | Annual third-party pentest including tenant-isolation scenarios; findings tracked to closure | Security Architect | Annual | Zero high-severity tenant-isolation findings unresolved |

### 28.4.18 Configurability & Deployability (NFR-CFG-*, NFR-DPL-*)

| NFR | SLI / Measurement Query | Evidence Artefact | Verification Procedure | Owner | Cadence | Pass Criterion |
|---|---|---|---|---|---|---|
| NFR-CFG-01 | Drift detector (e.g. Terraform drift / kube-diff) report comparing live config vs. Git | Drift report dashboard + weekly summary | Continuous drift scan; any drift raises Sev3 ticket; quarterly evidence export | Platform Engineering | Continuous; quarterly review | Zero unresolved drift > 24 h |
| NFR-DPL-01 | Deployment-pipeline metric: `deploy_duration = end_ts - start_ts` median over 90 days | Deployment-metrics dashboard | Pipeline emits start / end timestamps; median computed weekly | Platform Lead | Continuous | Median ≤ 30 min |
| NFR-DPL-02 | Deployment-runbook drill: rollback duration measured in non-prod drill | Rollback drill report | Quarterly rollback drill in non-prod; record execution time | Platform Lead | Quarterly | Drill rollback ≤ 15 min |

### 28.4.19 Verification Evidence Storage

All evidence artefacts are stored in the **audit bucket** with the following structure:

```
audit/
  yyyy/
    qN/
      nfr-{ID}/
        evidence-{yyyy-mm-dd}.{pdf|json|csv}
        attestation-{yyyy-mm-dd}.md     (signed if applicable)
```

Retention is 7 years per [Chapter 29. Observability Long-Term Archival Policy](29-observability-long-term-archival-policy.md). The audit bucket is configured for tamper-evident immutability per NFR-CMP-03.

## 28.5 Evidence Cadence by Category

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

## 28.6 Change Control

Changes to this register require an ADR ([Chapter 17. Observability ADR Decision Register](17-observability-adr-decision-register.md)) when:

- A target threshold is relaxed.
- A new NFR is introduced that imposes platform-wide change.
- An NFR is retired.

## 28.7 Cross-References

- [Chapter 1. Xceedance Observability Strategy](01-xceedance-observability-strategy.md) — strategic principles underpinning the NFRs.
- [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md) — outcome KPIs derived from these NFRs.
- [Chapter 15. Observability Capability Assessment Framework](15-observability-capability-assessment-framework.md) — maturity scoring uses these NFRs as evidence.
- [Chapter 16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md) — governance approving NFR changes.
- [Chapter 29. Observability Long-Term Archival Policy](29-observability-long-term-archival-policy.md) — archival NFRs detailed.
- [Annexure C — Threat Model (STRIDE)](annexure-c-threat-model.md) — security threats mapped to NFR-SEC controls.

---

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](27-multi-tenant-and-customer-site-deployment-model.md) | [Next Page](29-observability-long-term-archival-policy.md)
