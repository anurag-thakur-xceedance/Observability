---
title: Compliance and Audit Control Matrix
chapter: 10
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 10. Compliance and Audit Control Matrix

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 1. Purpose
Observability data is governed to meet regulatory and internal compliance. This matrix captures controls, evidence, and reporting cadence.

## 2. Audit Trails
- **Administrative actions** on observability platforms (configuration changes, retention updates, access-policy modifications) are logged and retained.
- **Changes to alert rules, dashboards, and SLO definitions** are version-controlled (e.g. via GitOps).
- Every administrative change is traceable to a user identity and a change ticket.

## 3. Regulatory Alignment
- Retention durations and storage locations aligned with corporate policies and relevant regulations (e.g. financial services, data-protection rules).
- **Periodic audits verify that telemetry does not contain prohibited data types** (such as unmasked PII).
- Where applicable, GDPR-aligned deletion timelines are enforced via automated retention rules in storage backends (see [Chapter 8. Observability Data Governance and Retention Policy](08-observability-data-governance-and-retention-policy.md), [Chapter 9. Observability FinOps Standard](09-observability-finops-standard.md)).

## 4. Reporting
Compliance and governance reports are generated on a regular schedule and shared with appropriate stakeholders. Examples:

- **Telemetry retention adherence** report.
- **Access review status** report.
- **Critical service SLO compliance** report.

## 5. Control Matrix (Initial)

| Control ID | Control Description | Source / Driver | Evidence | Owner |
|---|---|---|---|---|
| OBS-C-01 | Admin actions on observability platforms are logged | Internal / SOC2 | Audit log export, sample review | Platform Ops |
| OBS-C-02 | Alert rules, dashboards, and SLOs version-controlled in Git | Internal | Repo history, signed commits | SRE |
| OBS-C-03 | PII not stored in logs/traces; masking at source/pipeline | GDPR | Pipeline config review, scan results | Data Governance |
| OBS-C-04 | Retention durations meet policy minimums and maxima | GDPR / internal | Backend retention configs | Platform Ops |
| OBS-C-05 | RBAC enforced on Grafana / Loki / Prometheus | SOC2 / ISO 27001 | Role assignments, access-review report | Identity |
| OBS-C-06 | Periodic audit verifies no prohibited data types | GDPR | Audit findings and remediation log | Data Governance |
| OBS-C-07 | Compliance reports issued on schedule | Internal | Report distribution list and timestamps | Governance Body |
| OBS-C-08 | Deletion / compaction jobs monitored for compliance | GDPR | Job success metrics, alert evidence | Platform Ops |
| OBS-C-09 | Service telemetry conformance ≥ 90% (PRR gate, [Chapter 25](25-service-onboarding-and-instrumentation-kits.md)) | Internal | PRR scorecard, conformance dashboard | Service Owner |
| OBS-C-10 | Cardinality budget enforced at gateway ([Chapter 1. Enterprise Observability Standards Catalog -> Section 3.1. Cardinality Governance](01-enterprise-observability-standards-catalog.md#31-cardinality-governance)) | Internal | Gateway processor config; reject-rate metric | Platform Ops |
| OBS-C-11 | mTLS between collectors and backends ([Chapter 23](23-observability-platform-security-architecture.md)) | SOC2 / ISO | Cert inventory; expiry alerts | Platform Ops |
| OBS-C-12 | Tenant isolation verified for multi-tenant deployments ([Chapter 26](26-multi-tenant-and-customer-site-deployment-model.md)) | Internal / customer contract | Tenant-label policy report; cross-tenant query test | Platform Ops |
| OBS-C-13 | DR drill executed at planned cadence ([Chapter 21](21-observability-platform-ha-and-dr-design.md)) | SOC2 (Availability) | Drill report, RTO/RPO measurements | SRE |
| OBS-C-14 | AIOps model approval and shadow-mode evidence before production ([Chapter 6](06-aiops-guardrails-and-implementation-playbook.md)) | Internal / model risk | Model card; shadow-mode metrics | AIOps Lead |
| OBS-C-15 | SBOM produced and signed for platform components ([Chapter 23](23-observability-platform-security-architecture.md)) | Supply chain | SBOM artefacts; cosign attestations | Platform Ops |
| OBS-C-16 | Container images scanned and signed before deployment | Supply chain / SOC2 | Scan reports; admission-controller logs | Platform Ops |
| OBS-C-17 | Backup integrity verified for stateful telemetry stores | SOC2 (Availability) | Restore-test reports | Platform Ops |

> Mapping to specific frameworks (SOC2 CC, ISO 27001 Annex A, GDPR Articles) is detailed in Section 6.

## 6. Framework Mapping

The framework set is selected and governed by [Chapter 15. Observability Governance Charter and ARB Pack -> Section 4.3. Framework Selection and Mapping](15-observability-governance-charter-and-arb-pack.md#43-framework-selection-and-mapping). This table maps each control above to the specific framework clauses that consume its evidence.

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

**Owner discipline.** Each owner publishes evidence to the central audit-evidence repository indexed by Control ID; the governance body (Section 8) reviews exceptions and remediation timelines.

### 6.1 Financial-Services and Operational-Resilience Mapping

The frameworks above (SOC 2, ISO/IEC 27001, GDPR, NIST CSF) cover general-purpose information-security and privacy obligations. For regulated financial-services workloads, the following additional frameworks consume the same control evidence. Applicability is set by [Chapter 15. Observability Governance Charter and ARB Pack -> Section 4.3. Framework Selection and Mapping](15-observability-governance-charter-and-arb-pack.md#43-framework-selection-and-mapping); only the rows whose jurisdiction applies to the operating entity need be evidenced.

| Control ID | EU DORA (Reg. 2022/2554) | NAIC Model Bulletin #674 (Insurer AI Use) | APRA CPS 234 (Information Security) |
|---|---|---|---|
| OBS-C-01 | Art. 9 (ICT risk management — monitoring); Art. 17 (ICT-related incident reporting) | Section 4 (Governance & Risk Management) — audit trails | Para. 23 (Incident management); Para. 36 (Audit trail) |
| OBS-C-02 | Art. 8 (Identification — asset/config inventory); Art. 9 (Protection — change control) | Section 4.4 (Documentation of AI system changes) | Para. 27 (Change management) |
| OBS-C-03 | Art. 9(4)(d) (Data integrity); Art. 28 (Third-party data risk where telemetry leaves jurisdiction) | Section 4.2 (Data governance — sensitive-data handling in AI inputs/outputs) | Para. 21–22 (Information asset classification) |
| OBS-C-04 | Art. 12 (Backup and restoration — retention bounds) | Section 4.5 (Recordkeeping minimums for AI decisions) | Para. 27 (Information lifecycle) |
| OBS-C-05 | Art. 9(2)(c) (Access management) | Section 4.3 (Access to AI systems and training data) | Para. 24 (Access management) |
| OBS-C-06 | Art. 13 (Learning and evolving — internal audit) | Section 4.6 (Periodic AI system validation) | Para. 35 (Internal audit) |
| OBS-C-07 | Art. 5 (Governance — board reporting); Art. 17–19 (Incident reporting cadence) | Section 4.7 (Reporting to senior leadership and regulators) | Para. 13 (Board oversight reporting) |
| OBS-C-08 | Art. 12 (Backup integrity — deletion verification) | Section 4.5 (Recordkeeping integrity) | Para. 27 (Information lifecycle) |
| OBS-C-09 | Art. 8 (Asset onboarding readiness) | Section 4.4 (Pre-deployment AI system review) | Para. 23 (Information-security capability) |
| OBS-C-10 | Art. 11 (Operational continuity — capacity) | — | Para. 30 (Capacity and performance) |
| OBS-C-11 | Art. 9(4)(a) (Cryptography and key management) | Section 4.3 (Secure transmission of AI data) | Para. 25 (Information-security controls — cryptography) |
| OBS-C-12 | Art. 28 (Third-party / tenant risk); Art. 9 (Logical segregation) | Section 4.3 (Tenant separation in shared AI platforms) | Para. 25 (Segregation); Para. 36(c) (Third-party assurance) |
| OBS-C-13 | Art. 11 (Response and recovery); Art. 24–27 (Digital operational resilience testing — TLPT and scenario testing) | Section 4.8 (Continuity for AI services) | Para. 32 (Testing of controls); Para. 33 (Incident response) |
| OBS-C-14 | Art. 9 (Protection of ICT systems supporting AI); Art. 17 (Incident reporting where AI failure is material) | **Sections 4.1–4.7 (Entire AI governance lifecycle — primary mapping)** | Para. 23 (Capability commensurate with information-asset criticality) |
| OBS-C-15 | Art. 28 (ICT third-party risk — supply chain) | Section 4.4 (Third-party AI component disclosure) | Para. 36 (Third-party information-security assurance) |
| OBS-C-16 | Art. 9 (Protection — secure development) | Section 4.4 (AI-component vulnerability management) | Para. 25 (Vulnerability management) |
| OBS-C-17 | Art. 11–12 (Recovery and backup verification) | Section 4.8 (Restoration of AI services and training data) | Para. 32 (Testing); Para. 33 (Incident response) |

**Jurisdictional applicability.**
- **EU DORA** applies to in-scope EU financial entities and their critical ICT third-party providers from 17 January 2025; observability evidence supports Articles 5–14 (ICT risk management framework) and 17–23 (incident reporting and resilience testing).
- **NAIC Model Bulletin #674** applies in US states that adopt it (adoption is state-by-state). Where adopted, every AIOps capability in [Chapter 6. AIOps Guardrails and Implementation Playbook](06-aiops-guardrails-and-implementation-playbook.md) that influences underwriting, claims, or consumer-facing decisions is in scope and OBS-C-14 is the primary control.
- **APRA CPS 234** applies to APRA-regulated entities (banks, insurers, superannuation funds in Australia) and their related parties; observability evidence supports the information-security capability, incident notification, and third-party assurance requirements.

**Limitation.** This mapping is synthesis-grade and reflects the published text of each framework. It has **not** been validated by external counsel or the entity's compliance function. Before relying on it for a regulatory submission, the governance body (Section 8) must commission an SME review per [Chapter 29. Observability Programme Risk Register](29-observability-programme-risk-register.md) risk R-09.

## 7. Audit-Evidence Catalogue

This catalogue is the bridge between Section 5 controls and the systems that produce their evidence. It tells an auditor exactly **where** each artefact lives, **what format** it takes, and **how long** it is retained — without which "evidence" is a verbal claim. Paths under `audit-evidence/` are S3/Azure Blob prefixes in the WORM evidence bucket established in [Chapter 23. Observability Platform Security Architecture -> Section 5. Audit Trail](23-observability-platform-security-architecture.md#5-audit-trail).

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
| OBS-C-14 | Model card; shadow-mode metrics; ARB approval record; prompt-registry diff; LLM audit log per [Chapter 6. AIOps Guardrails and Implementation Playbook -> Section 9.3.6 Audit Logging](06-aiops-guardrails-and-implementation-playbook.md#9-worked-examples-filled-model-cards-and-prompt-registry) | MLflow / model registry; AIOps audit pipeline | `audit-evidence/aiops/{model_id}/{version}/`; LLM audit at `audit-evidence/llm/{yyyy}-{mm}/` | YAML model card + JSON metrics + signed ARB minute; LLM audit NDJSON | 7 years; LLM audit per Section 9.3.6 (default 90 days, 7 years for production templates) |
| OBS-C-15 | SBOM (CycloneDX) + Sigstore attestation | Build pipeline (cosign) | `audit-evidence/sbom/{component}/{version}/` | CycloneDX JSON + .sig | Lifetime of image + 3 years |
| OBS-C-16 | Vulnerability-scan report + admission-controller decision log | Trivy/Grype; OPA admission controller | `audit-evidence/image-scans/{component}/{version}/` | SARIF + decision log | 3 years |
| OBS-C-17 | Restore-test report (backup integrity verified) | Backup tooling | `audit-evidence/backup-restore/{yyyy}-Q{n}/` | Markdown report + checksum log | 7 years |

**WORM enforcement.** All paths under `audit-evidence/` reside in an object-lock bucket (S3 Object Lock Compliance mode / Azure Immutable Blob in time-based mode) with retention equal to the longest control retention plus a one-year buffer. Cryptographic-erasure attestation for tenant-scoped evidence on tenant offboarding is governed by P3 deliverable K1 (see traceability matrix Section D).

**Auditor self-service.** Read-only auditor access is granted via a scoped role that can list and download but not modify or delete under `audit-evidence/`. The role and its grants are themselves evidenced under OBS-C-05.

## 8. Audit Lifecycle

1. **Plan.** Governance body confirms framework set and scope (annual).
2. **Collect.** Owners publish evidence per cadence above.
3. **Sample.** Auditor selects sample per control (typically 25 events / 90-day window for continuous controls).
4. **Test.** Walk-through of sampled evidence; design + operating effectiveness.
5. **Report.** Findings logged with severity; remediation tracked to closure in the governance risk register ([Chapter 15. Observability Governance Charter and ARB Pack -> Section 4.2. Governance Risk Register](15-observability-governance-charter-and-arb-pack.md#42-governance-risk-register)).
6. **Remediate.** Owner closes finding; governance body verifies and signs off.

The **next-section number reservation** for sub-controls (e.g. OBS-C-01.1) is documented per audit cycle in the evidence repository.

## 9. Cross-References
- [Chapter 8. Observability Data Governance and Retention Policy](08-observability-data-governance-and-retention-policy.md) — retention rules audited here.
- [Chapter 9. Observability FinOps Standard](09-observability-finops-standard.md) — deletion / compaction mechanics evidenced here.
- [Chapter 15. Observability Governance Charter and ARB Pack -> Section 4.3. Framework Selection and Mapping](15-observability-governance-charter-and-arb-pack.md#43-framework-selection-and-mapping) — selects the frameworks mapped in Section 6.
- [Chapter 16. Observability ADR Decision Register](16-observability-adr-decision-register.md) — ADRs documenting compliance-driven decisions.
- [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) — technical controls behind OBS-C-11, -15, -16.
- [Chapter 26. Multi-Tenant and Customer-Site Deployment Model](26-multi-tenant-and-customer-site-deployment-model.md) — tenant isolation evidenced under OBS-C-12.

---

[↑ Back to TOC](toc.md)
