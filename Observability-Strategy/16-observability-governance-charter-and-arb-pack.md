---
title: Observability Governance Charter and ARB Pack
chapter: 16
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 16. Observability Governance Charter and ARB Pack

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](15-observability-capability-assessment-framework.md) | [Next Page](17-observability-adr-decision-register.md)

| **Document Owner** | CoE-Architecture |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **First Review** | 1-Aug-2026 |
| **Next Review Due** | 1-Nov-2026 |

---

## 16.0 Reader Guide
Use this chapter to understand who has decision rights and how observability standards are governed. Architects should focus on ARB mechanics and ADR escalation; service and platform teams should use the RACI matrix to understand responsibilities.

## 16.1 Purpose
Defines who governs observability standards, retention, access, and architecture decisions, and the cadence at which they are reviewed.

## 16.2 Governance Body
- An **observability governance body** (e.g. an architecture or SRE governance group) owns telemetry standards, retention policies, and access controls.
- Policies are reviewed on a **fixed cadence (quarterly)** or following major incidents / regulatory changes.

## 16.3 Decision Rights

| Domain | Decision Right |
|---|---|
| Telemetry standards ([Chapter 2. Enterprise Observability Standards Catalogue](02-enterprise-observability-standards-catalog.md), [Chapter 18. Application Telemetry Standard](18-application-telemetry-standard.md), [Chapter 20. Observability Data Model Specification](20-observability-data-model-specification.md)) | Governance body approves; standards owners draft. |
| Retention policy ([Chapter 9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md)) | Governance body approves; data governance lead drafts. |
| Access control ([Chapter 9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md) RBAC) | Identity / Security with governance body endorsement. |
| Cost / FinOps levers ([Chapter 10. Observability FinOps Standard](10-observability-finops-standard.md)) | Platform Ops with governance body sign-off above threshold. |
| Alerting & severity ([Chapter 5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md)) | SRE / Incident Mgmt with governance body endorsement. |
| AIOps guardrails ([Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md)) | AI lead + governance body co-approval. |
| IaC standard ([Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md)) | Platform Ops; ARB endorsement for cross-cloud changes. |
| Roadmap phase gates ([Chapter 14. Observability Roadmap Delivery Plan](14-observability-roadmap-delivery-plan.md)) | Governance body / ARB. |

## 16.4 Architecture Review Board (ARB) Pack

The strategy doc retains the high-level governance narrative (review status). Detailed ARB mechanics live here.

**Board definitions (plain language):**
- **ARB (Architecture Review Board):** senior architects and platform leads who review and approve significant architecture and platform changes.
- **Exception Panel:** small group (ARB subset plus risk/compliance) that reviews proposed deviations from approved standards.
- **SDG (Service / Design Governance):** service-design forum (architects + senior engineers) that reviews service-level designs and onboarding to ensure they meet observability and platform requirements.
- **Change Board:** change-advisory board (SRE, Platform Ops, Incident Management) that approves production changes, especially those affecting reliability or compliance.

| ID | Board | Purpose | Review Type |
|---|---|---|---|
| 1 | ARB | Architecture review | TBD |
| 2 | Exception Panel | Deviations | N/A (per source) |
| 3 | SDG | Service / design governance | TBD |
| 4 | Change Board | Change approval | TBD |

> Source state: **Not Seen** for all four boards (per the strategy doc Architecture Governance and Review table). Action: schedule reviews — **decision required**.

### 16.4.1 RACI Matrix

The decision-rights table (Section 4) names the **A**ccountable role only. The full RACI for routine activities is below. R = Responsible (does the work), A = Accountable (one per row, owns the outcome), C = Consulted (two-way), I = Informed (one-way).

| Activity | Service Owner | SRE / Platform Ops | Data Governance | AIOps Lead | Identity / Security | Governance Body / ARB | FinOps |
|---|---|---|---|---|---|---|---|
| Define service SLO ([Chapter 25. SLO and Error-Budget Framework](25-slo-and-error-budget-framework.md)) | A,R | C | I | I | I | C | I |
| Approve new telemetry standard ([Chapter 2. Enterprise Observability Standards Catalogue](02-enterprise-observability-standards-catalog.md)) | C | R | C | I | C | A | I |
| Approve cardinality-budget exception ([Chapter 2. Enterprise Observability Standards Catalog -> Section 2.3.4 Cardinality Governance](02-enterprise-observability-standards-catalog.md#234-cardinality-governance)) | R | C | I | I | I | A | C |
| Onboard new service (PRR gate, [Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md)) | A,R | R | C | I | C | I | I |
| Change retention policy ([Chapter 9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md)) | I | R | A,R | I | C | C | C |
| Promote AIOps model to production ([Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md)) | C | R | C | A,R | I | C | I |
| Approve cross-cloud platform change ([Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md)) | I | R | I | I | C | A | C |
| Update RBAC role definitions | I | R | C | I | A,R | C | I |
| Approve cost-optimisation lever above threshold ([Chapter 10. Observability FinOps Standard](10-observability-finops-standard.md)) | C | R | I | I | I | A | R |
| Ratify ADR ([Chapter 17. Observability ADR Decision Register](17-observability-adr-decision-register.md)) | C | C | C | C | C | A,R | C |
| Quarterly governance review (Section 6) | I | C | C | C | C | A,R | C |
| Post-incident governance review ([Chapter 13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md)) | R | R | C | C | C | A | I |
| Approve customer-tenant onboarding ([Chapter 27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md)) | C | R | C | I | C | A | C |
| HA / DR drill execution ([Chapter 22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md)) | I | A,R | I | I | I | I | I |

**Conventions.**
- Exactly one **A** per row.
- **R** may co-exist with **A** when the accountable role also performs the work.
- Disagreements between two **C** roles are escalated to the **A** role; if **A** is unable to resolve, escalation goes to ARB.

### 16.4.2 Governance Risk Register

Tracked risks to the **governance** function itself (separate from operational platform risks, which live in service-level risk registers). Reviewed at every quarterly cadence.

| Risk ID | Risk | Likelihood | Impact | Owner | Mitigation | Trigger / KRI |
|---|---|---|---|---|---|---|
| GOV-R-01 | Standards drift: services bypass `1.` standards under delivery pressure | Med | High | Governance Body | PRR gate ([Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md)); compliance scan ([Chapter 11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md) OBS-C-09) | Conformance score < 90% (KPI in [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md)) |
| GOV-R-02 | Cardinality breach destabilises platform | Med | High | Platform Ops | Budget enforcement at gateway ([Chapter 2. Enterprise Observability Standards Catalog -> Section 2.3.4 Cardinality Governance](02-enterprise-observability-standards-catalog.md#234-cardinality-governance)); reject-on-breach policy | Active series > 90% of budget |
| GOV-R-03 | Retention misconfiguration causes GDPR breach | Low | Critical | Data Governance | Automated retention checks (OBS-C-04); quarterly audit | Retention drift detected by job |
| GOV-R-04 | RBAC role explosion / least-privilege erosion | High | Med | Identity | Quarterly access review (Section 7); role-template enforcement | Roles per user > 5; unreviewed roles > 30 days |
| GOV-R-05 | ADR backlog: decisions made informally, not recorded | High | Med | ARB | ADR-required gate at ARB; ADR log review at every cadence | ADRs created per quarter < changes per quarter |
| GOV-R-06 | AIOps model drift / silent failure | Med | High | AIOps Lead | Model lifecycle controls ([Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md)); shadow-mode validation | Precision drop > 10% week-on-week |
| GOV-R-07 | Vendor lock-in to a single backend | Med | Med | ARB | OTel-only ingestion ([ADR-001](17-observability-adr-decision-register.md)); annual portability test | Vendor-specific code in services |
| GOV-R-08 | Telemetry cost overruns above approved envelope | Med | Med | FinOps | Unit-economics dashboards ([Chapter 10. Observability FinOps Standard](10-observability-finops-standard.md)); tier-based sampling | Cost per service > 110% of plan |
| GOV-R-09 | Governance body decisions delayed beyond cadence | Med | Med | Governance Body | Async ADR review; emergency ARB convening rule (within 5 business days) | Open ADRs aged > 30 days |
| GOV-R-10 | Loss of platform skills / single-point-of-knowledge | Med | High | Platform Ops | CoP rotation ([Chapter 19. Observability Operating Model and Adoption Plan -> Section 19.4.4 Community of Practice](19-observability-operating-model-and-adoption-plan.md#1944-community-of-practice)); runbook coverage ≥ 95% | Bus factor < 2 for any critical component |

### 16.4.3 Framework Selection and Mapping

Compliance frameworks the governance body **explicitly** recognises and maps to. Selection prioritises the regulatory profile of insurance / financial services and the lowest-cost evidence path.

| Framework | Scope | Status | Mapping Strategy |
|---|---|---|---|
| **SOC 2 Type II** | Security, Availability, Confidentiality | Primary | Full control mapping; annual audit. See [Chapter 11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md) Section 7. |
| **ISO/IEC 27001:2022** | Information security management | Primary | Annex A controls A.5–A.18 mapped to OBS-C-* controls. |
| **GDPR** (EU) | Personal data protection | Primary | Articles 5, 17, 25, 32, 33 mapped; PII redaction enforced ([Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md)). |
| **NIST CSF 2.0** | Cyber risk framework | Reference | Used to structure risk register (Section 5.2); not audited against. |
| **PCI DSS v4.0** | Payment card data | Conditional | Applied only to services handling cardholder data; observability data must not contain PAN. |
| **HIPAA** | US healthcare | Out of scope | Not applicable to current portfolio; revisit if US health-data services are onboarded. |
| **DORA** (EU financial) | Operational resilience | Emerging | Watch-list. ICT third-party risk reporting will require trace continuity ([Chapter 27. Multi-Tenant and Customer-Site Deployment Model -> Section 27.5 Data-Residency](27-multi-tenant-and-customer-site-deployment-model.md#275-data-residency)). |
| **NIS2** (EU) | Network and info security | Emerging | Watch-list for EU operations. |

The framework selection is reviewed annually. New frameworks may be added by ADR.

## 16.5 Review Cadence
- **Quarterly:** policy and standards review; phase-gate readiness assessment.
- **Post-Incident:** governance review when major incidents trigger systemic changes (links to [Chapter 13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md) / [Chapter 17. Observability ADR Decision Register](17-observability-adr-decision-register.md)).
- **Regulatory-Driven:** ad-hoc reviews triggered by changes in applicable regulations.

## 16.6 Data Classification & Access Governance
(Inherited from strategy "Governance Model")

- **Data Classification:** public / internal / confidential.
- **PII** prohibited in logs/traces wherever possible; masking/tokenisation/redaction enforced at source or in pipeline.
- **RBAC** in Grafana, Loki, Prometheus.
- **Least-privilege** enforced:
  - **Operations / SRE** — broad read access to production telemetry.
  - **Development** — service-specific access.
  - **Business** — curated dashboards and reports only.
- **Periodic access reviews** to remove stale or excessive permissions.

## 16.7 Audit & Reporting
Coordinates with [Chapter 11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md) for audit evidence and [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md) for governance KPIs (retention adherence, audit pass rate).

## 16.8 Cross-References

See also:
- [Chapter 9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md) — data governance policy enforced under this charter.
- [Chapter 11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md) — compliance evidence; framework mapping (Section 5.3) consumed there.
- [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md) — governance success KPIs.
- [Chapter 17. Observability ADR Decision Register](17-observability-adr-decision-register.md) — ADRs ratified by this body.
- [Chapter 19. Observability Operating Model and Adoption Plan -> Section 19.4.4 Community of Practice](19-observability-operating-model-and-adoption-plan.md#1944-community-of-practice) — CoP that operationalises governance below the ARB.
- [Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md) — PRR gate enforcing standards approved by Section 4.

---

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](15-observability-capability-assessment-framework.md) | [Next Page](17-observability-adr-decision-register.md)
