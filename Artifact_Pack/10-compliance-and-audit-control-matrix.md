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

**Owner discipline.** Each owner publishes evidence to the central audit-evidence repository indexed by Control ID; the governance body (Section 7) reviews exceptions and remediation timelines.

## 7. Audit Lifecycle

1. **Plan.** Governance body confirms framework set and scope (annual).
2. **Collect.** Owners publish evidence per cadence above.
3. **Sample.** Auditor selects sample per control (typically 25 events / 90-day window for continuous controls).
4. **Test.** Walk-through of sampled evidence; design + operating effectiveness.
5. **Report.** Findings logged with severity; remediation tracked to closure in the governance risk register ([Chapter 15. Observability Governance Charter and ARB Pack -> Section 4.2. Governance Risk Register](15-observability-governance-charter-and-arb-pack.md#42-governance-risk-register)).
6. **Remediate.** Owner closes finding; governance body verifies and signs off.

The **next-section number reservation** for sub-controls (e.g. OBS-C-01.1) is documented per audit cycle in the evidence repository.

## 8. Cross-References
- [Chapter 8. Observability Data Governance and Retention Policy](08-observability-data-governance-and-retention-policy.md) — retention rules audited here.
- [Chapter 9. Observability FinOps Standard](09-observability-finops-standard.md) — deletion / compaction mechanics evidenced here.
- [Chapter 15. Observability Governance Charter and ARB Pack -> Section 4.3. Framework Selection and Mapping](15-observability-governance-charter-and-arb-pack.md#43-framework-selection-and-mapping) — selects the frameworks mapped in Section 6.
- [Chapter 16. Observability ADR Decision Register](16-observability-adr-decision-register.md) — ADRs documenting compliance-driven decisions.
- [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) — technical controls behind OBS-C-11, -15, -16.
- [Chapter 26. Multi-Tenant and Customer-Site Deployment Model](26-multi-tenant-and-customer-site-deployment-model.md) — tenant isolation evidenced under OBS-C-12.

---

[↑ Back to TOC](toc.md)
