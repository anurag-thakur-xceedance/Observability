# Traceability Matrix — Source Sections ↔ Target Artifacts

[↑ Back to TOC](TOC.md)


> Generated as part of the observability strategy decomposition.
> **Source:** `Observability-Strategy.docx` v0.1 (27 April 2026), annotations from `Observability-Strategy_Annotated_v2.docx`.
> **Mapping basis:** `Observability_Extraction_Plan.xlsx` (`Section Mapping` sheet) and `Observability_Extraction_Table.md`.

---

## A. Source Section → Target Artifact(s)

In the table below, the **Target Artifact(s)** column uses short numeric labels (1–19) for compactness; each label resolves to the artifact in [Section B](#b-target-artifact-source-sections) below, where every artifact title is hyperlinked.

| # | Source Section | Disposition | Target Artifact(s) | Notes |
|---:|---|---|---|---|
| 1 | Executive Summary | KEEP | — | Stays in strategy doc. |
| 2 | Business Objectives & KPI's | MIXED | 11 | Narrative kept; metric definitions/thresholds/scorecard mechanics → artifact 11. |
| 3 | Standardise Telemetry Data — The 5 Pillars | EXTRACT | 1 | Pillar definitions in artifact 1 Section 2. |
| 4 | Build the Technical Foundation | MIXED | 2 | Strategic intent kept; architecture mechanics → artifact 2. |
| 5 | Foster an Observability Culture | EXTRACT | 18 | Culture/operating model. |
| 6 | Continuous Improvement | MIXED | 18, 11 | Process cadence → artifact 18; measurement model → artifact 11. |
| 7 | Observability Strategy – High Level Architecture | MIXED | 2 | One-page view kept; detailed architecture → artifact 2. |
| 8 | Core Open-Source Observability Stack | EXTRACT | 2 | Stack table in artifact 2 Section 4. |
| 9 | Telemetry Collection Layers | EXTRACT | 2 | Collection layer model in artifact 2 Section 5. |
| 10 | Infrastructure Observability | EXTRACT | 3 | Runbook in artifact 3 Section 2. |
| 11 | Application Telemetry (Pre/Post-Login) | MIXED | 17 | High-level requirement summary kept; standards → artifact 17. |
| 12 | Pre-Login Telemetry | EXTRACT | 17, 3 | Standards → artifact 17 Section 3; runbook → artifact 3 Section 3.1. |
| 13 | Post-Login Telemetry | EXTRACT | 17, 3 | Standards → artifact 17 Section 4; runbook → artifact 3 Section 3.2. |
| 14 | Alerting Guidelines | EXTRACT | 4 | Policy in artifact 4. |
| 15 | Database Observability | EXTRACT | 3 | Runbook in artifact 3 Section 4. |
| 16 | Database Observability Metrics and Ranges | EXTRACT | 1, 3 | Standards in artifact 1 Section 7; runbook usage in artifact 3 Section 4. |
| 17 | Suggested Alerting Policy Guidelines | EXTRACT | 4 | Consolidated in artifact 4. |
| 18 | Network and Latency Observability | EXTRACT | 3 | Runbook in artifact 3 Section 5. |
| 19 | Network & Latency Observability Metrics | EXTRACT | 1, 3 | Standards in artifact 1 Section 8; runbook in artifact 3 Section 5. |
| 20 | Severity Policy (Network) | EXTRACT | 4 | Artifact 4 Section 4.3. |
| 21 | Implementation Tips (Network) | EXTRACT | 3 | Artifact 3 Section 5.3. |
| 22 | Scaling and Performance Observability | MIXED | 3 | Posture kept; implementation → artifact 3 Section 6. |
| 23 | Scaling and Performance Observability Metrics | EXTRACT | 1, 3 | Standards in artifact 1 Section 9; runbook in artifact 3 Section 6. |
| 24 | Severity / Action Policy (Scaling) | EXTRACT | 4 | Artifact 4 Section 4.4. |
| 25 | Implementation Notes (Scaling) | EXTRACT | 3 | Artifact 3 Section 6.3. |
| 26 | Grafana Observability Layer | MIXED | 5 | Strategic role kept; platform standards → artifact 5. |
| 27 | Key Metrics and Suggested Ranges (Grafana) | EXTRACT | 1, 5 | Standards in artifact 1 Section 10; viz in artifact 5 Section 4. |
| 28 | Recommended Alerting Policy (Grafana) | EXTRACT | 4, 5 | Policy in artifact 4; Grafana implementation in artifact 5 Section 5. |
| 29 | Implementation & Visualization Tips (Grafana) | EXTRACT | 5 | Artifact 5 Section 6. |
| 30 | AI-Driven Observability Layer | MIXED | 6 | Intent + guardrails kept; implementation → artifact 6. |
| 31 | AI-Driven Observability Key Metrics and Ranges | EXTRACT | 6, 1 | Artifact 6 Section 2; aligned in artifact 1 Section 11. |
| 32 | AI-Driven Observability Metrics | EXTRACT | 6 | Embedded in artifact 6 Section 2. |
| 33 | Interpreting the AI-Driven Metrics | EXTRACT | 6 | Artifact 6 Section 3. |
| 34 | Severity Policy for AI-Detected Events | EXTRACT | 4, 6 | Artifact 4 Section 4.6; artifact 6 Section 4. |
| 35 | Implementation Recommendations (AI) | EXTRACT | 6 | Artifact 6 Section 5. |
| 36 | IaC Role in OpenTelemetry Deployment | MIXED | 7 | Strategic policy kept; patterns/controls → artifact 7. |
| 37 | Key Metrics for IaC Role in OTel Deployments | EXTRACT | 7, 11 | Platform KPIs in artifact 7 Section 4; roll-up in artifact 11 Section 5. |
| 38 | Severity Policy (IaC) | EXTRACT | 4 | Artifact 4 Section 4.7. |
| 39 | Implementation & Visualization Tips (IaC) | EXTRACT | 7 | Artifact 7 Section 6. |
| 40 | Multi-Cloud Observability Design | MIXED | 2 | Superseded by host-portable Compose model in artifact 2 Section 6; multi-cloud K8s posture retired. |
| 41 | Observability Data Model | EXTRACT | 19 | Data model spec in artifact 19. |
| 42 | Governance and Data Strategy | MIXED | 8, 15 | Narrative kept; data controls → artifact 8; governance model → artifact 15. |
| 43 | Telemetry retention tiers | EXTRACT | 8 | Artifact 8 Section 3. |
| 44 | Worked Example: Applying Retention Policy | EXTRACT | 8 | Artifact 8 Section 4. |
| 45 | Governance Model | EXTRACT | 15 | Artifact 15 Section 3, Section 6. |
| 46 | Lifecycle Management and Cost Optimisation | EXTRACT | 9 | Artifact 9 Section 2–Section 4. |
| 47 | 11.5 Compliance and Auditability | EXTRACT | 10 | Artifact 10 Section 2–Section 5. |
| 48 | Success Criteria for Governance and Data Strategy | EXTRACT | 11 | Artifact 11 Section 4. |
| 49 | End-to-End Incident Sequence | EXTRACT | 12 | Artifact 12 Section 2. |
| 50 | Maturity Roadmap | MIXED | 13 | Executive view kept; milestones → artifact 13. |
| 51 | Phase 1: Foundation (Months 1–3) | EXTRACT | 13 | Artifact 13 Section 2. |
| 52 | Phase 2: Correlation & Alerting (Months 4–6) | EXTRACT | 13 | Artifact 13 Section 3. |
| 53 | Phase 3: AI-Driven Intelligence (Months 7–12) | EXTRACT | 13 | Artifact 13 Section 4. |
| 54 | Maturity Assessment Framework | EXTRACT | 14 | Artifact 14 Section 2–Section 3. |
| 55 | Final Architecture Summary | KEEP | — | Stays in strategy. |
| 56 | Architecture Governance and Review | MIXED | 15 | Narrative kept; mechanics → artifact 15 Section 4. |
| 57 | Decision Log | EXTRACT | 16 | Register in artifact 16. |
| 58 | Appendix | MIXED | 1, 3, 5, 6, 8 | Glossary kept; heavy tables distributed. |

---

## B. Target Artifact → Source Section(s)

| # | Artifact | Source Sections (by # above) |
|---:|---|---|
| 1 | [Enterprise Observability Standards Catalog](1.%20Enterprise%20Observability%20Standards%20Catalog.md) | 3 (5 Pillars), 16, 19, 23, 27 (also referenced in 31), 58 (Appendix tables) |
| 2 | [Observability Reference Architecture](2.%20Observability%20Reference%20Architecture.md) | 4, 7, 8, 9, 40 |
| 3 | [Domain Observability Runbooks Pack](3.%20Domain%20Observability%20Runbooks%20Pack.md) | 10, 12, 13, 15, 16, 18, 19, 21, 22, 23, 25, 58 |
| 4 | [Alerting and Incident Severity Policy](4.%20Alerting%20and%20Incident%20Severity%20Policy.md) | 14, 17, 20, 24, 28, 34, 38 |
| 5 | [Grafana Platform Standard and Visualization Playbook](5.%20Grafana%20Platform%20Standard%20and%20Visualization%20Playbook.md) | 26, 27, 28, 29, 58 |
| 6 | [AIOps Guardrails and Implementation Playbook](6.%20AIOps%20Guardrails%20and%20Implementation%20Playbook.md) | 30, 31, 32, 33, 34, 35, 58 |
| 7 | [IaC for Observability Standard (Docker Compose + PowerShell)](7.%20IaC%20for%20Observability%20Standard.md) | 36, 37, 39 |
| 8 | [Observability Data Governance and Retention Policy](8.%20Observability%20Data%20Governance%20and%20Retention%20Policy.md) | 42, 43, 44, 58 |
| 9 | [Observability FinOps Standard](9.%20Observability%20FinOps%20Standard.md) | 46 |
| 10 | [Compliance and Audit Control Matrix](10.%20Compliance%20and%20Audit%20Control%20Matrix.md) | 47 |
| 11 | [Observability KPI Scorecard](11.%20Observability%20KPI%20Scorecard.md) | 2, 6, 37, 48, 54 |
| 12 | [Incident Response Playbook](12.%20Incident%20Response%20Playbook.md) | 49 |
| 13 | [Observability Roadmap Delivery Plan](13.%20Observability%20Roadmap%20Delivery%20Plan.md) | 50, 51, 52, 53 |
| 14 | [Observability Capability Assessment Framework](14.%20Observability%20Capability%20Assessment%20Framework.md) | 54 |
| 15 | [Observability Governance Charter and ARB Pack](15.%20Observability%20Governance%20Charter%20and%20ARB%20Pack.md) | 42, 45, 56 |
| 16 | [Observability ADR Decision Register](16.%20Observability%20ADR%20Decision%20Register.md) | 57 |
| 17 | [Application Telemetry Standard](17.%20Application%20Telemetry%20Standard.md) | 11, 12, 13 |
| 18 | [Observability Operating Model and Adoption Plan](18.%20Observability%20Operating%20Model%20and%20Adoption%20Plan.md) | 5, 6 |
| 19 | [Observability Data Model Specification](19.%20Observability%20Data%20Model%20Specification.md) | 41 |

---

[↑ Back to TOC](TOC.md)
