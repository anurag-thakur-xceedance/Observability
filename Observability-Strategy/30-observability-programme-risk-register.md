---
title: Observability Programme Risk Register
chapter: 30
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 30. Observability Programme Risk Register

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Reviewed Date | Status |
|---|---|---|---|---|
| 0.1 | TBD | Internal |  | Draft |
---

## 30.1 Purpose

This register consolidates the portfolio-level risks for the observability programme into a single artefact. Individual chapters surface risk fragments inside their own scope (for example AIOps guardrail risks in [7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md), retention and erasure risks in [9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md), and platform security risks in [24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md)); this chapter rolls them up so that the ARB and the programme sponsor have one view of the top risks across all chapters.

## 30.2 Scope

- Risks that have programme-level impact: budget, regulatory standing, customer commitments, ability to operate the platform, or ability to ship the agent capability.
- Risks that span more than one chapter and therefore have no natural home in a single standard.
- Risks identified during P1 and P2 of the artefact pack build that remain open at handover.

Out-of-scope: operational incident risk (handled in [5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md) and [13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md)), and per-service application risks (owned by service teams, not the platform).

## 30.3 Rating Scheme

### 30.3.1 Likelihood

| Score | Label | Definition |
|---|---|---|
| 1 | Rare | Has not occurred in comparable programmes; would require an unusual combination of conditions. |
| 2 | Unlikely | Could occur but no current signal; mitigations are in early design. |
| 3 | Possible | Active precursors observed; mitigations partly in place. |
| 4 | Likely | Already occurring in some form, or will without further mitigation. |
| 5 | Almost certain | Already materialising; visible in current evidence. |

### 30.3.2 Impact

| Score | Label | Definition |
|---|---|---|
| 1 | Negligible | Absorbed by normal operations; no customer or regulator impact. |
| 2 | Minor | Localised rework; internal cost only; no customer impact. |
| 3 | Moderate | Customer-visible degradation or audit finding (low / medium); recoverable inside one quarter. |
| 4 | Major | Multi-quarter remediation, regulator notification, or material customer SLA breach. |
| 5 | Severe | Regulatory enforcement action, programme cancellation, or loss of authorisation to operate. |

### 30.3.3 Risk Score

`Risk = Likelihood x Impact` (1 to 25). Bands:

- 1–4 Low
- 5–9 Medium
- 10–14 High
- 15–25 Critical

Residual rating is the score after the documented mitigation is in place and operating as intended.

## 30.4 Risk Register (Top Programme Risks)

Each row is a programme-level risk. `R-ID` is stable across revisions of this register. `Source` points to the chapter(s) where the underlying detail is documented.

| R-ID | Risk | Category | L | I | Score | Owner | Mitigation Summary | Residual L | Residual I | Residual | Source |
|---|---|---|---|---|---|---|---|---|---|---|
| R-01 | Cardinality explosion in metrics tier exceeds capacity model and drives unplanned cost or platform instability. | FinOps / Capacity | 4 | 4 | 16 | Platform Lead | Cardinality governance per [Chapter 2. Enterprise Observability Standards Catalog -> Section 2.3.4 Cardinality Governance](02-enterprise-observability-standards-catalog.md#234-cardinality-governance); capacity model in [23. Capacity and Scale Model](23-capacity-and-scale-model.md); FinOps guardrails in [10. Observability FinOps Standard](10-observability-finops-standard.md). | 2 | 3 | 6 | Ch 1, Ch 9, Ch 22 |
| R-02 | AIOps agent produces a confidently-wrong recommendation that is acted on and causes a customer-visible incident. | AI / Safety | 3 | 4 | 12 | AIOps Lead | Shadow-mode rollout for `rca-hypothesis-v1`; human-in-the-loop on all change-adjacent agents; guardrails in [7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md). | 2 | 3 | 6 | Ch 6 |
| R-03 | PII or other restricted data leaks into telemetry and is retained beyond lawful basis. | Privacy / Compliance | 3 | 5 | 15 | Data Protection Officer | Field-level classification and redaction per [Chapter 18. Application Telemetry Standard -> Section 18.6 PII & Data Classification](18-application-telemetry-standard.md#186-pii-data-classification); retention and erasure in [9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md) and [Chapter 29. Observability Long-Term Archival Policy -> Section 29.10 Right to Erasure (GDPR Art. 17)](29-observability-long-term-archival-policy.md#2910-right-to-erasure-gdpr-art-17). | 2 | 4 | 8 | Ch 8, Ch 17, Ch 28 |
| R-04 | Long-term archive is not tamper-evident in a way that satisfies regulator or auditor evidence requirements. | Compliance / Audit | 3 | 4 | 12 | Compliance Officer | WORM storage with object-lock Compliance mode and signed sidecar manifests per [Chapter 29. Observability Long-Term Archival Policy -> Section 29.5.3 Integrity & Tamper Evidence](29-observability-long-term-archival-policy.md#2953-integrity-tamper-evidence). Archival format specification (Parquet/Iceberg/Delta) and rehydration SLO are listed as a known gap in [Handover Report](handover-report.md). | 2 | 3 | 6 | Ch 28 |
| R-05 | DR runbook for the observability platform is not exercised, so a real DR event exceeds RTO/RPO. | Reliability / DR | 3 | 4 | 12 | SRE Lead | DR design in [22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md); DR-exercise cadence (at least annual) tracked in [13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md). Exercise evidence is collected in the compliance evidence catalogue (see [Chapter 11. Compliance and Audit Control Matrix -> Section 11.7 Audit-Evidence Catalogue](11-compliance-and-audit-control-matrix.md#117-audit-evidence-catalogue)). | 2 | 3 | 6 | Ch 12, Ch 21 |
| R-06 | Single-vendor lock-in on the telemetry backend (metrics, logs, or traces) blocks a future repricing or migration. | Vendor / Architecture | 3 | 3 | 9 | Platform Lead | OpenTelemetry-native instrumentation per [18. Application Telemetry Standard](18-application-telemetry-standard.md) and [20. Observability Data Model Specification](20-observability-data-model-specification.md); ADRs that record vendor selection and the exit option per [17. Observability ADR Decision Register](17-observability-adr-decision-register.md). | 2 | 3 | 6 | Ch 16, Ch 17, Ch 19 |
| R-07 | Observability cost grows faster than the business it supports and forces sampling/retention cuts mid-year. | FinOps | 4 | 3 | 12 | FinOps Lead | Unit-cost guardrails and the cost model in [Chapter 10. Observability FinOps Standard -> Section 10.6.15 Twelve-Month Worked Cost Model](10-observability-finops-standard.md#10615-twelve-month-worked-cost-model); quarterly tier-rebalancing review per [Chapter 29. Observability Long-Term Archival Policy -> Section 29.12 Cost Model](29-observability-long-term-archival-policy.md#2912-cost-model). | 2 | 3 | 6 | Ch 9, Ch 28 |
| R-08 | Skills gap on the platform team (OpenTelemetry, query languages, AIOps prompt engineering) slows delivery or causes outages. | People / Capability | 4 | 3 | 12 | Platform Lead | Skills matrix and training plan in [19. Observability Operating Model and Adoption Plan](19-observability-operating-model-and-adoption-plan.md); pairing rules for AIOps work in [7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md). | 3 | 3 | 9 | Ch 6, Ch 18 |
| R-09 | Adoption of the telemetry standard by service teams stalls, so observability coverage remains uneven and SLOs are unreliable. | Adoption / Governance | 4 | 3 | 12 | ARB Chair | Onboarding checklist and named-journeys coverage in [26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md); ARB conformance review per [16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md). | 3 | 2 | 6 | Ch 15, Ch 25 |
| R-10 | Regulatory change (DORA, NAIC Model #674, APRA CPS 234, or equivalent) introduces obligations the current control set does not satisfy. | Regulatory | 3 | 4 | 12 | Compliance Officer | Sector-regulation mapping in [Chapter 11. Compliance and Audit Control Matrix -> Section 11.6 Framework Mapping](11-compliance-and-audit-control-matrix.md#116-framework-mapping); ARB-tracked horizon scan reviewed quarterly. | 2 | 3 | 6 | Ch 10, Ch 15 |
| R-11 | Customer-site / on-prem deployments diverge from the SaaS platform standard, so a single evidence story cannot be told to auditors. | Multi-tenant / Compliance | 3 | 3 | 9 | Platform Lead | Deployment-topology constraints in [3. Observability Reference Architecture](03-observability-reference-architecture.md); customer-site addendum process in [27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md). | 2 | 3 | 6 | Ch 2, Ch 26 |
| R-12 | Security incident (credential leak, supply-chain compromise, or collector tampering) on the observability path goes undetected. | Security | 2 | 5 | 10 | Security Lead | Threat model and controls in [24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md); audit-logging requirements in [11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md); integrity controls in [Chapter 29. Observability Long-Term Archival Policy -> Section 29.5.3 Integrity & Tamper Evidence](29-observability-long-term-archival-policy.md#2953-integrity-tamper-evidence). | 1 | 4 | 4 | Ch 10, Ch 23, Ch 28 |
| R-13 | Schema drift between application emitters, the OpenTelemetry Collector, and the storage backends silently breaks dashboards, alerts, and AIOps inputs. | Data Quality | 4 | 3 | 12 | Platform Lead | Canonical schemas, ERD, and OTel crosswalk in [Chapter 20. Observability Data Model Specification -> Section 20.8 Canonical JSON Schemas, ERD, and OTel Crosswalk](20-observability-data-model-specification.md#208-canonical-json-schemas-erd-and-otel-crosswalk); conformance gate in [26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md). | 2 | 3 | 6 | Ch 25, Ch 19 |
| R-14 | Programme cannot demonstrate ROI within the first 12 months and loses executive sponsorship or budget. | Strategic | 3 | 4 | 12 | Programme Sponsor | Outcome metrics and value tree in [14. Observability Roadmap Delivery Plan](14-observability-roadmap-delivery-plan.md); quarterly value report to ARB; FinOps view in [10. Observability FinOps Standard](10-observability-finops-standard.md). | 2 | 3 | 6 | Ch 13, Ch 9, Ch 15 |
| R-15 | Documentation rot: standards drift from the running platform, so the artefact pack becomes a reference no one trusts. | Governance | 4 | 3 | 12 | ARB Chair | Versioned chapter front matter with `next_review` dates; ARB-owned review cycle per [16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md); traceability matrix kept current per [Traceability Matrix](traceability-matrix.md). | 2 | 2 | 4 | Ch 15 |

## 30.5 Risk Categories (Reference)

| Category | Description | Typical Owner |
|---|---|---|
| AI / Safety | Risks specific to AIOps agents, model behaviour, and human-AI handoff. | AIOps Lead |
| Adoption / Governance | Risks to standards being followed across service teams. | ARB Chair |
| Compliance / Audit | Risks to evidence integrity and audit-readiness. | Compliance Officer |
| Data Quality | Risks to schema, semantics, and consistency of telemetry. | Platform Lead |
| FinOps / Capacity | Risks to unit cost, capacity envelope, and budget. | FinOps Lead |
| Governance | Risks to the operating model and to the durability of the standards. | ARB Chair |
| Multi-tenant / Compliance | Risks unique to mixed SaaS plus customer-site topologies. | Platform Lead |
| People / Capability | Risks from skills, staffing, or capacity of the platform team. | Platform Lead |
| Privacy / Compliance | Risks to lawful basis, residency, and data-subject rights. | Data Protection Officer |
| Regulatory | Risks from change in external regulation. | Compliance Officer |
| Reliability / DR | Risks to availability and disaster-recovery posture. | SRE Lead |
| Security | Risks to confidentiality, integrity, and trust in the telemetry path. | Security Lead |
| Strategic | Risks to programme sponsorship, scope, or business case. | Programme Sponsor |
| Vendor / Architecture | Risks from supplier choice and architectural coupling. | Platform Lead |
| FinOps | Cost-trajectory risks. | FinOps Lead |

## 30.6 Operating the Register

- Owner: ARB Chair owns this register; named risk owners own the individual rows.
- Review cadence: quarterly at ARB; ad-hoc on any Sev 1 incident, audit finding, or regulatory change.
- Change control: new risk IDs are append-only; closed risks are retained with `status: Closed` and the closure date — they are not deleted.
- Inputs: incident postmortems, audit findings, FinOps reviews, AIOps eval reports, and the rolling horizon scan from Compliance.
- Outputs: ARB minutes, quarterly programme report to the sponsor, and the evidence catalogue entry referenced in [Chapter 11. Compliance and Audit Control Matrix -> Section 11.7 Audit-Evidence Catalogue](11-compliance-and-audit-control-matrix.md#117-audit-evidence-catalogue).

## 30.7 Known Limitations of v0.1

- Likelihood and impact scores in Section 5 are **synthesis-grade** estimates produced during pack authoring; they require SME validation before being used to drive investment decisions.
- A small number of mitigations point to handover-known gaps (for example archival format specification and rehydration SLO under R-04, and the full DORA / NAIC #674 / APRA CPS 234 control mapping under R-10). Those gaps are listed in [Handover Report](handover-report.md) under "Known Gaps for Engineering Phase" and are expected to close during P3 engineering work.
- The register is intentionally narrow at v0.1 — top programme risks only — so that the ARB has a usable artefact on day one. Per-chapter and per-service risk detail remains in the originating chapters.

## 30.8 Cross-References

- [14. Observability Roadmap Delivery Plan](14-observability-roadmap-delivery-plan.md) — programme objectives and value tree referenced by R-14.
- [7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md) — AI-safety mitigations for R-02 and R-08.
- [9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md) — retention and erasure mitigations for R-03.
- [10. Observability FinOps Standard](10-observability-finops-standard.md) — cost mitigations for R-01 and R-07.
- [11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md) — control mappings and evidence catalogue feeding R-04, R-10, and R-12.
- [13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md) — operational incident handling distinct from this register.
- [16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md) — ARB ownership of this register.
- [18. Application Telemetry Standard](18-application-telemetry-standard.md) — PII handling for R-03.
- [20. Observability Data Model Specification](20-observability-data-model-specification.md) — schema controls for R-13.
- [22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md) — DR controls for R-05.
- [23. Capacity and Scale Model](23-capacity-and-scale-model.md) — capacity controls for R-01.
- [24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) — security controls for R-12.
- [19. Observability Operating Model and Adoption Plan](19-observability-operating-model-and-adoption-plan.md) — skills and staffing controls for R-08.
- [28. Observability Non-Functional Requirements Register](28-observability-non-functional-requirements.md) — NFRs that underpin several rows.
- [29. Observability Long-Term Archival Policy](29-observability-long-term-archival-policy.md) — integrity, restore, and erasure controls for R-03, R-04, R-07, and R-12.

---

[↑ Back to TOC](toc.md)
