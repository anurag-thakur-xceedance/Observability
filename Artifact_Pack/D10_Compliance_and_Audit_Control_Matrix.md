# D10 — Compliance & Audit Control Matrix

> **Purpose:** Mapped controls and evidence requirements (SOC2 / ISO / GDPR-aligned) for observability data handling.
> **Source Strategy Sections:** 11.5 Compliance and Auditability.
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1.

---

## 1. Purpose
Observability data is governed so that regulatory and internal compliance requirements are met. This matrix captures the controls, evidence, and reporting cadence.

## 2. Audit Trails
- **Administrative actions** on observability platforms (configuration changes, retention updates, access-policy modifications) are logged and retained.
- **Changes to alert rules, dashboards, and SLO definitions** are version-controlled (e.g. via GitOps).
- Every administrative change is traceable to a user identity and a change ticket.

## 3. Regulatory Alignment
- Retention durations and storage locations aligned with corporate policies and relevant regulations (e.g. financial services, data-protection rules).
- **Periodic audits verify that telemetry does not contain prohibited data types** (such as unmasked PII).
- Where applicable, GDPR-aligned deletion timelines are enforced via automated retention rules in storage backends (see **D8**, **D9**).

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

> Mapping to specific frameworks (SOC2 CC, ISO 27001 Annex A, GDPR Articles) is a follow-up activity — flagged as a **decision required** in the handover report.

## 6. Cross-References
- **D8** — retention rules audited here.
- **D9** — deletion / compaction mechanics evidenced here.
- **D15** — governance body owning the controls.
- **D16** — ADRs documenting compliance-driven decisions.
