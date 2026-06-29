---
title: Compliance and Audit Control Matrix
chapter: 11
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 11. Compliance and Audit Control Matrix

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](10-observability-finops-standard.md) | [Next Page](12-observability-kpi-scorecard.md)

| **Document Owner** | CoE-Architecture |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **First Review** | 1-Aug-2026 |
| **Next Review Due** | 1-Nov-2026 |

---

## 11.0 Reader Guide
This chapter is written for auditors **and** engineers. If you are an engineer, focus on:
- **Which controls you own.** Look for rows tagged `[ENG]` in the Owner column; these are implementation responsibilities (e.g. retention config, RBAC, redaction).
- **Where to find evidence.** The Evidence column tells you which systems and artefacts (dashboards, configs, logs) back each control.
- **How often this matters.** Use the evidence cadence notes in Section 11.6 to understand when you will be asked for proof.

## 11.1 Purpose
Observability data is governed to meet regulatory and internal compliance. This matrix captures controls, evidence, and reporting cadence.

## 11.2 Audit Trails
- **Administrative actions** on observability platforms (configuration changes, retention updates, access-policy modifications) are logged and retained.
- **Changes to alert rules, dashboards, and SLO definitions** are version-controlled (e.g. via GitOps).
- Every administrative change is traceable to a user identity and a change ticket.

## 11.3 Regulatory Alignment
- Retention durations and storage locations aligned with corporate policies and relevant regulations (e.g. financial services, data-protection rules).
- **Periodic audits verify that telemetry does not contain prohibited data types** (such as unmasked PII).
- Where applicable, GDPR-aligned deletion timelines are enforced via automated retention rules in storage backends (see [Chapter 9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md), [Chapter 10. Observability FinOps Standard](10-observability-finops-standard.md)).

## 11.4 Reporting
Compliance and governance reports are generated on a regular schedule and shared with appropriate stakeholders. Examples:

- **Telemetry retention adherence** report.
- **Access review status** report.
- **Critical service SLO compliance** report.

## 11.5 Control Matrix (Initial)

| Control ID | Owner | Evidence | Frequency | Source / Driver |
|---|---|---|---|---|
| OBS-C-01 | [ENG] Platform Ops | Admin actions on observability platforms are logged; audit log export, sample review | Continuous | Internal / SOC2 |
| OBS-C-02 | [ENG] SRE | Alert rules, dashboards, and SLOs version-controlled in Git; repo history, signed commits | Continuous | Internal |
| OBS-C-03 | [ENG] Data Governance | PII not stored in logs/traces; masking at source/pipeline; pipeline config review, scan results | Quarterly | GDPR |
| OBS-C-04 | [ENG] Platform Ops | Retention durations meet policy minimums and maxima; backend retention configs | Quarterly | GDPR / internal |
| OBS-C-05 | [ENG] Identity | RBAC enforced on Grafana / Loki / Prometheus; role assignments, access-review report | Quarterly | SOC2 / ISO 27001 |
| OBS-C-06 | [GOV] Data Governance | Periodic audit verifies no prohibited data types; audit findings and remediation log | Annual | GDPR |
| OBS-C-07 | [GOV] Governance Body | Compliance reports issued on schedule; report distribution list and timestamps | Quarterly | Internal |
| OBS-C-08 | [ENG] Platform Ops | Deletion / compaction jobs monitored for compliance; job success metrics, alert evidence | Continuous | GDPR |
| OBS-C-09 | [ENG] Service Owner | Service telemetry conformance ≥ 90% (PRR gate, [Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md)); PRR scorecard, conformance dashboard | At PRR / Quarterly | Internal |
| OBS-C-10 | [ENG] Platform Ops | Cardinality budget enforced at gateway ([Chapter 2. Enterprise Observability Standards Catalogue -> Section 2.3.4 Cardinality Governance](02-enterprise-observability-standards-catalog.md#234-cardinality-governance)); gateway processor config; reject-rate metric | Continuous | Internal |
| OBS-C-11 | [ENG] Platform Ops | mTLS between collectors and backends ([Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md)); cert inventory; expiry alerts | Continuous | SOC2 / ISO |
| OBS-C-12 | [ENG] Platform Ops | Tenant isolation verified for multi-tenant deployments ([Chapter 27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md)); tenant-label policy report; cross-tenant query test | Quarterly | Internal / customer contract |
| OBS-C-13 | [ENG] SRE | DR drill executed at planned cadence ([Chapter 22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md)); drill report, RTO/RPO measurements | Annual | SOC2 (Availability) |
| OBS-C-14 | [ENG] AIOps Lead | AIOps model approval and shadow-mode evidence before production ([Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md)); model card; shadow-mode metrics | Per model / Quarterly | Internal / model risk |
| OBS-C-15 | [ENG] Platform Ops | SBOM produced and signed for platform components ([Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md)); SBOM artefacts; cosign attestations | Per release | Supply chain |
| OBS-C-16 | [ENG] Platform Ops | Container images scanned and signed before deployment; scan reports; admission-controller logs | Per release | Supply chain / SOC2 |
| OBS-C-17 | [ENG] Platform Ops | Backup integrity verified for stateful telemetry stores; restore-test reports | Annual | SOC2 (Availability) |

> Mapping to specific frameworks (SOC2 CC, ISO 27001 Annex A, GDPR Articles) is detailed in Section 7.

## 11.6 Framework Mapping

The framework set is selected and governed by [Chapter 16. Observability Governance Charter and ARB Pack -> Section 16.4.3 Framework Selection and Mapping](16-observability-governance-charter-and-arb-pack.md#1643-framework-selection-and-mapping). This table maps each control above to the specific framework clauses that consume its evidence.

| Control ID | SOC 2 (TSC 2017) | ISO/IEC 27001:2022 Annex A | GDPR Article | NIST CSF 2.0 |
|---|---|---|---|---|
| OBS-C-01 | CC7.2, CC7.3 | A.8.15 (Logging), A.8.16 (Monitoring) | Art. 32 | DE.CM-1, DE.CM-3 |
| OBS-C-02 | CC8.1 | A.8.32 (Change management) | Art. 25 | PR.IP-3 |
| OBS-C-03 | CC6.7, P4.1 | A.5.34 (Privacy and PII) | Art. 5(1)(c), Art. 25 | PR.DS-5 |
| OBS-C-04 | CC6.5, P4.2 | A.5.33 (Records), A.8.10 (Deletion) | Art. 5(1)(e), Art. 17 | PR.IP-6 |
| OBS-C-05 | CC6.1, CC6.3 | A.5.15 (Access control), A.8.3 | Art. 32 | PR.AC-4 |
| OBS-C-06 | CC4.1, P4.3 | A.5.34, A.8.34 | Art. 5(2) | DE.CM-8 |
| OBS-C-07 | CC2.2, CC4.2 | A.5.36 (Compliance) | Art. 30 | ID.GV-3 |
| OBS-C-08 | CC6.5 | A.8.10 | Art. 17 | PR.IP-6 |
| OBS-C-09 | CC8.1 | A.5.37 (Operating procedures) | — | ID.GV-1 |
| OBS-C-10 | A1.1 (Availability) | A.8.6 (Capacity) | — | ID.RA-4 |
| OBS-C-11 | CC6.7 | A.8.24 (Cryptography) | Art. 32(1)(a) | PR.DS-2 |
| OBS-C-12 | CC6.1 | A.5.15, A.8.3 | Art. 28 (processor) | PR.AC-5 |
| OBS-C-13 | A1.2, A1.3 | A.5.30 (ICT readiness), A.8.13 (Backup) | — | RC.RP-1 |
| OBS-C-14 | CC1.4, CC8.1 | A.5.37 | Art. 22 (automated decisions) | ID.RA-1 |
| OBS-C-15 | CC8.1 | A.5.21 (Supply chain), A.8.30 | — | ID.SC-2 |
| OBS-C-16 | CC8.1, CC7.1 | A.8.28 (Secure coding), A.8.29 | — | PR.IP-2 |
| OBS-C-17 | A1.2 | A.8.13, A.8.14 | — | PR.IP-4 |

**Evidence cadence.** Each control's evidence is collected at one of three cadences:
- **Continuous** (e.g. OBS-C-01 audit logs, OBS-C-10 reject metrics) — sampled by auditors at any time.
- **Quarterly** (e.g. OBS-C-04 retention review, OBS-C-05 access review).
- **Annual** (e.g. OBS-C-13 DR drill, OBS-C-15 SBOM attestation refresh, OBS-C-17 backup-restore drill).

**Owner discipline.** Each owner publishes evidence to the central audit-evidence repository indexed by Control ID; the governance body (Section 9) reviews exceptions and remediation timelines.

### 11.6.1 Financial-Services and Operational-Resilience Mapping

The frameworks above (SOC 2, ISO/IEC 27001, GDPR, NIST CSF) cover general-purpose information-security and privacy obligations. For regulated financial-services workloads, the following additional frameworks consume the same control evidence. Applicability is set by [Chapter 16. Observability Governance Charter and ARB Pack -> Section 16.4.3 Framework Selection and Mapping](16-observability-governance-charter-and-arb-pack.md#1643-framework-selection-and-mapping); only the rows whose jurisdiction applies to the operating entity need be evidenced.

| Control ID | EU DORA (Reg. 2022/2554) | NAIC Model Bulletin #674 (Insurer AI Use) | APRA CPS 234 (Information Security) |
|---|---|---|---|
| OBS-C-01 | Art. 9 (ICT risk management — monitoring); Art. 17 (ICT-related incident reporting) | Section 5 (Governance & Risk Management) — audit trails | Para. 23 (Incident management); Para. 36 (Audit trail) |
| OBS-C-02 | Art. 8 (Identification — asset/config inventory); Art. 9 (Protection — change control) | Section 5.4 (Documentation of AI system changes) | Para. 27 (Change management) |
| OBS-C-03 | Art. 9(4)(d) (Data integrity); Art. 28 (Third-party data risk where telemetry leaves jurisdiction) | Section 5.2 (Data governance — sensitive-data handling in AI inputs/outputs) | Para. 21–22 (Information asset classification) |
| OBS-C-04 | Art. 12 (Backup and restoration — retention bounds) | Section 5.5 (Recordkeeping minimums for AI decisions) | Para. 27 (Information lifecycle) |
| OBS-C-05 | Art. 9(2)(c) (Access management) | Section 5.3 (Access to AI systems and training data) | Para. 24 (Access management) |
| OBS-C-06 | Art. 13 (Learning and evolving — internal audit) | Section 5.6 (Periodic AI system validation) | Para. 35 (Internal audit) |
| OBS-C-07 | Art. 5 (Governance — board reporting); Art. 17–19 (Incident reporting cadence) | Section 5.7 (Reporting to senior leadership and regulators) | Para. 13 (Board oversight reporting) |
| OBS-C-08 | Art. 12 (Backup integrity — deletion verification) | Section 5.5 (Recordkeeping integrity) | Para. 27 (Information lifecycle) |
| OBS-C-09 | Art. 8 (Asset onboarding readiness) | Section 5.4 (Pre-deployment AI system review) | Para. 23 (Information-security capability) |
| OBS-C-10 | Art. 11 (Operational continuity — capacity) | — | Para. 30 (Capacity and performance) |
| OBS-C-11 | Art. 9(4)(a) (Cryptography and key management) | Section 5.3 (Secure transmission of AI data) | Para. 25 (Information-security controls — cryptography) |
| OBS-C-12 | Art. 28 (Third-party / tenant risk); Art. 9 (Logical segregation) | Section 5.3 (Tenant separation in shared AI platforms) | Para. 25 (Segregation); Para. 36(c) (Third-party assurance) |
| OBS-C-13 | Art. 11 (Response and recovery); Art. 24–27 (Digital operational resilience testing — TLPT and scenario testing) | Section 5.8 (Continuity for AI services) | Para. 32 (Testing of controls); Para. 33 (Incident response) |
| OBS-C-14 | Art. 9 (Protection of ICT systems supporting AI); Art. 17 (Incident reporting where AI failure is material) | **Sections 4.1–4.7 (Entire AI governance lifecycle — primary mapping)** | Para. 23 (Capability commensurate with information-asset criticality) |
| OBS-C-15 | Art. 28 (ICT third-party risk — supply chain) | Section 5.4 (Third-party AI component disclosure) | Para. 36 (Third-party information-security assurance) |
| OBS-C-16 | Art. 9 (Protection — secure development) | Section 5.4 (AI-component vulnerability management) | Para. 25 (Vulnerability management) |
| OBS-C-17 | Art. 11–12 (Recovery and backup verification) | Section 5.8 (Restoration of AI services and training data) | Para. 32 (Testing); Para. 33 (Incident response) |

**Jurisdictional applicability.**
- **EU DORA** applies to in-scope EU financial entities and their critical ICT third-party providers from 17 January 2025; observability evidence supports Articles 5–14 (ICT risk management framework) and 17–23 (incident reporting and resilience testing).
- **NAIC Model Bulletin #674** applies in US states that adopt it (adoption is state-by-state). Where adopted, every AIOps capability in [Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md) that influences underwriting, claims, or consumer-facing decisions is in scope and OBS-C-14 is the primary control.
- **APRA CPS 234** applies to APRA-regulated entities (banks, insurers, superannuation funds in Australia) and their related parties; observability evidence supports the information-security capability, incident notification, and third-party assurance requirements.

**Limitation.** This mapping is synthesis-grade and reflects the published text of each framework. It has **not** been validated by external counsel or the entity's compliance function. Before relying on it for a regulatory submission, the governance body (Section 9) must commission an SME review per [Chapter 30. Observability Programme Risk Register](30-observability-programme-risk-register.md) risk R-09.

## 11.7 Audit-Evidence Catalogue

This catalogue is the bridge between Section 6 controls and the systems that produce their evidence. It tells an auditor exactly **where** each artefact lives, **what format** it takes, and **how long** it is retained — without which "evidence" is a verbal claim. Paths under `audit-evidence/` are S3/Azure Blob prefixes in the WORM evidence bucket established in [Chapter 24. Observability Platform Security Architecture -> Section 24.5 Audit Trail](24-observability-platform-security-architecture.md#245-audit-trail).

| Control | Evidence Artefact | Producing System | Storage Path | Format | Retention |
|---|---|---|---|---|---|
| OBS-C-01 | Admin-action audit log export | Grafana, Prometheus, Loki, Alertmanager admin APIs | `audit-evidence/admin-actions/{system}/{yyyy}/{mm}/` | NDJSON, signed | 7 years (WORM) |
| OBS-C-02 | Git commit history + signed-tag manifest for alerts/dashboards/SLOs | GitOps repo (`observability-config`) | Repo itself + monthly snapshot `audit-evidence/gitops-snapshots/` | Git bundle, GPG-signed tags | 7 years |
| OBS-C-03 | Pipeline redaction config + monthly PII-scan report | OTel Collector config; pii-scan job | `audit-evidence/pii/{yyyy}-{mm}/` | YAML config + scan-report PDF | 3 years (PII-scan); config in Git indefinitely |
| OBS-C-04 | Backend retention configuration snapshot | Prometheus, Loki, Tempo configs | `audit-evidence/retention-configs/{yyyy}-Q{n}/` | YAML snapshot | 7 years |
| OBS-C-05 | Quarterly access-review attestation | IdP (Azure AD / Okta) + Grafana/Prom/Loki/Tempo RBAC exports | `audit-evidence/access-reviews/{yyyy}-Q{n}/` | CSV + signed attestation PDF | 7 years |
| OBS-C-06 | Audit-findings register + remediation log | Internal audit tool | `audit-evidence/audits/{yyyy}/` | Issue export (CSV/JSON) | 7 years |
| OBS-C-07 | Distribution-list confirmations + timestamps | Compliance reporting job | `audit-evidence/reports/{report_name}/{yyyy}-{mm}/` | PDF + email-receipt log | 3 years |
| OBS-C-08 | Deletion/compaction job success metrics + alert history | Prometheus job metrics; Alertmanager history | `audit-evidence/retention-jobs/{yyyy}-Q{n}/` | Metric export + alert log | 3 years |
| OBS-C-09 | PRR scorecard + telemetry-conformance dashboard export | PRR tool; Grafana | `audit-evidence/prr/{service}/{yyyy}-Q{n}/` | JSON scorecard + dashboard PNG | 5 years |
| OBS-C-10 | Gateway processor config + reject-rate metric snapshot | OTel Collector; Prometheus | `audit-evidence/cardinality/{yyyy}-Q{n}/` | YAML + PromQL export | 3 years |
| OBS-C-11 | Certificate inventory + expiry-alert history | Cert manager; Alertmanager | `audit-evidence/tls/{yyyy}-Q{n}/` | CSV + alert log | 5 years |
| OBS-C-12 | Tenant-label policy report + cross-tenant query test results | Multi-tenancy enforcer; test harness | `audit-evidence/tenancy/{yyyy}-Q{n}/` | Policy YAML + test-run JSON | 7 years |
| OBS-C-13 | DR-drill report (RTO/RPO measured) | DR runbook output | `audit-evidence/dr-drills/{yyyy}-Q{n}/` | Markdown report + screenshots | 7 years |
| OBS-C-14 | Model card; shadow-mode metrics; ARB approval record; prompt-registry diff; LLM audit log per [Chapter 7. AIOps Guardrails and Implementation Playbook -> Section 7.9 Worked Examples — Filled Model Cards and Prompt Registry](07-aiops-guardrails-and-implementation-playbook.md#79-worked-examples-filled-model-cards-and-prompt-registry) | MLflow / model registry; AIOps audit pipeline | `audit-evidence/aiops/{model_id}/{version}/`; LLM audit at `audit-evidence/llm/{yyyy}-{mm}/` | YAML model card + JSON metrics + signed ARB minute; LLM audit NDJSON | 7 years; LLM audit per Section 10.3.6 (default 90 days, 7 years for production templates) |
| OBS-C-15 | SBOM (CycloneDX) + Sigstore attestation | Build pipeline (cosign) | `audit-evidence/sbom/{component}/{version}/` | CycloneDX JSON + .sig | Lifetime of image + 3 years |
| OBS-C-16 | Vulnerability-scan report + admission-controller decision log | Trivy/Grype; OPA admission controller | `audit-evidence/image-scans/{component}/{version}/` | SARIF + decision log | 3 years |
| OBS-C-17 | Restore-test report (backup integrity verified) | Backup tooling | `audit-evidence/backup-restore/{yyyy}-Q{n}/` | Markdown report + checksum log | 7 years |

**WORM enforcement.** All paths under `audit-evidence/` reside in an object-lock bucket (S3 Object Lock Compliance mode / Azure Immutable Blob in time-based mode) with retention equal to the longest control retention plus a one-year buffer. Cryptographic-erasure attestation for tenant-scoped evidence on tenant offboarding is governed by P3 deliverable K1 (see traceability matrix Section D).

**Auditor self-service.** Read-only auditor access is granted via a scoped role that can list and download but not modify or delete under `audit-evidence/`. The role and its grants are themselves evidenced under OBS-C-05.

## 11.8 Audit Lifecycle

1. **Plan.** Governance body confirms framework set and scope (annual).
2. **Collect.** Owners publish evidence per cadence above.
3. **Sample.** Auditor selects sample per control (typically 25 events / 90-day window for continuous controls).
4. **Test.** Walk-through of sampled evidence; design + operating effectiveness.
5. **Report.** Findings logged with severity; remediation tracked to closure in the governance risk register ([Chapter 16. Observability Governance Charter and ARB Pack -> Section 16.4.2 Governance Risk Register](16-observability-governance-charter-and-arb-pack.md#1642-governance-risk-register)).
6. **Remediate.** Owner closes finding; governance body verifies and signs off.

The **next-section number reservation** for sub-controls (e.g. OBS-C-01.1) is documented per audit cycle in the evidence repository.

## 11.9 Cross-References

See also:
- [Chapter 9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md) — retention rules audited here.
- [Chapter 10. Observability FinOps Standard](10-observability-finops-standard.md) — deletion / compaction mechanics evidenced here.
- [Chapter 16. Observability Governance Charter and ARB Pack -> Section 16.4.3 Framework Selection and Mapping](16-observability-governance-charter-and-arb-pack.md#1643-framework-selection-and-mapping) — selects the frameworks mapped in Section 7.
- [Chapter 17. Observability ADR Decision Register](17-observability-adr-decision-register.md) — ADRs documenting compliance-driven decisions.
- [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) — technical controls behind OBS-C-11, -15, -16.
- [Chapter 27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md) — tenant isolation evidenced under OBS-C-12.

---

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](10-observability-finops-standard.md) | [Next Page](12-observability-kpi-scorecard.md)
