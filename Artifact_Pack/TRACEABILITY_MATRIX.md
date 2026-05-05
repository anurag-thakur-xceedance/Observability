# Traceability Matrix — Source Sections ↔ Target Artifacts

> Generated as part of the observability strategy decomposition.
> **Source:** `Observability-Strategy.docx` v0.1 (27 April 2026), annotations from `Observability-Strategy_Annotated_v2.docx`.
> **Mapping basis:** `Observability_Extraction_Plan.xlsx` (`Section Mapping` sheet) and `Observability_Extraction_Table.md`.

---

## A. Source Section → Target Artifact(s)

| # | Source Section | Disposition | Target Artifact(s) | Notes |
|---:|---|---|---|---|
| 1 | Executive Summary | KEEP | — | Stays in strategy doc. |
| 2 | Business Objectives & KPI's | MIXED | D11 | Narrative kept; metric definitions/thresholds/scorecard mechanics → D11. |
| 3 | Standardise Telemetry Data — The 5 Pillars | EXTRACT | D1 | Pillar definitions in D1 §2. |
| 4 | Build the Technical Foundation | MIXED | D2 | Strategic intent kept; architecture mechanics → D2. |
| 5 | Foster an Observability Culture | EXTRACT | D18 | Culture/operating model. |
| 6 | Continuous Improvement | MIXED | D18, D11 | Process cadence → D18; measurement model → D11. |
| 7 | Observability Strategy – High Level Architecture | MIXED | D2 | One-page view kept; detailed architecture → D2. |
| 8 | Core Open-Source Observability Stack | EXTRACT | D2 | Stack table in D2 §4. |
| 9 | Telemetry Collection Layers | EXTRACT | D2 | Collection layer model in D2 §5. |
| 10 | Infrastructure Observability | EXTRACT | D3 | Runbook in D3 §2. |
| 11 | Application Telemetry (Pre/Post-Login) | MIXED | D17 | High-level requirement summary kept; standards → D17. |
| 12 | Pre-Login Telemetry | EXTRACT | D17, D3 | Standards → D17 §3; runbook → D3 §3.1. |
| 13 | Post-Login Telemetry | EXTRACT | D17, D3 | Standards → D17 §4; runbook → D3 §3.2. |
| 14 | Alerting Guidelines | EXTRACT | D4 | Policy in D4. |
| 15 | Database Observability | EXTRACT | D3 | Runbook in D3 §4. |
| 16 | Database Observability Metrics and Ranges | EXTRACT | D1, D3 | Standards in D1 §7; runbook usage in D3 §4. |
| 17 | Suggested Alerting Policy Guidelines | EXTRACT | D4 | Consolidated in D4. |
| 18 | Network and Latency Observability | EXTRACT | D3 | Runbook in D3 §5. |
| 19 | Network & Latency Observability Metrics | EXTRACT | D1, D3 | Standards in D1 §8; runbook in D3 §5. |
| 20 | Severity Policy (Network) | EXTRACT | D4 | D4 §4.3. |
| 21 | Implementation Tips (Network) | EXTRACT | D3 | D3 §5.3. |
| 22 | Scaling and Performance Observability | MIXED | D3 | Posture kept; implementation → D3 §6. |
| 23 | Scaling and Performance Observability Metrics | EXTRACT | D1, D3 | Standards in D1 §9; runbook in D3 §6. |
| 24 | Severity / Action Policy (Scaling) | EXTRACT | D4 | D4 §4.4. |
| 25 | Implementation Notes (Scaling) | EXTRACT | D3 | D3 §6.3. |
| 26 | Grafana Observability Layer | MIXED | D5 | Strategic role kept; platform standards → D5. |
| 27 | Key Metrics and Suggested Ranges (Grafana) | EXTRACT | D1, D5 | Standards in D1 §10; viz in D5 §4. |
| 28 | Recommended Alerting Policy (Grafana) | EXTRACT | D4, D5 | Policy in D4; Grafana implementation in D5 §5. |
| 29 | Implementation & Visualization Tips (Grafana) | EXTRACT | D5 | D5 §6. |
| 30 | AI-Driven Observability Layer | MIXED | D6 | Intent + guardrails kept; implementation → D6. |
| 31 | AI-Driven Observability Key Metrics and Ranges | EXTRACT | D6, D1 | D6 §2; aligned in D1 §11. |
| 32 | AI-Driven Observability Metrics | EXTRACT | D6 | Embedded in D6 §2. |
| 33 | Interpreting the AI-Driven Metrics | EXTRACT | D6 | D6 §3. |
| 34 | Severity Policy for AI-Detected Events | EXTRACT | D4, D6 | D4 §4.6; D6 §4. |
| 35 | Implementation Recommendations (AI) | EXTRACT | D6 | D6 §5. |
| 36 | IaC Role in OpenTelemetry Deployment | MIXED | D7 | Strategic policy kept; patterns/controls → D7. |
| 37 | Key Metrics for IaC Role in OTel Deployments | EXTRACT | D7, D11 | Platform KPIs in D7 §4; roll-up in D11 §5. |
| 38 | Severity Policy (IaC) | EXTRACT | D4 | D4 §4.7. |
| 39 | Implementation & Visualization Tips (IaC) | EXTRACT | D7 | D7 §6. |
| 40 | Multi-Cloud Observability Design | MIXED | D2 | Superseded by host-portable Compose model in D2 §6; multi-cloud K8s posture retired. |
| 41 | Observability Data Model | EXTRACT | D19 | Data model spec in D19. |
| 42 | Governance and Data Strategy | MIXED | D8, D15 | Narrative kept; data controls → D8; governance model → D15. |
| 43 | Telemetry retention tiers | EXTRACT | D8 | D8 §3. |
| 44 | Worked Example: Applying Retention Policy | EXTRACT | D8 | D8 §4. |
| 45 | Governance Model | EXTRACT | D15 | D15 §3, §6. |
| 46 | Lifecycle Management and Cost Optimisation | EXTRACT | D9 | D9 §2–§4. |
| 47 | 11.5 Compliance and Auditability | EXTRACT | D10 | D10 §2–§5. |
| 48 | Success Criteria for Governance and Data Strategy | EXTRACT | D11 | D11 §4. |
| 49 | End-to-End Incident Sequence | EXTRACT | D12 | D12 §2. |
| 50 | Maturity Roadmap | MIXED | D13 | Executive view kept; milestones → D13. |
| 51 | Phase 1: Foundation (Months 1–3) | EXTRACT | D13 | D13 §2. |
| 52 | Phase 2: Correlation & Alerting (Months 4–6) | EXTRACT | D13 | D13 §3. |
| 53 | Phase 3: AI-Driven Intelligence (Months 7–12) | EXTRACT | D13 | D13 §4. |
| 54 | Maturity Assessment Framework | EXTRACT | D14 | D14 §2–§3. |
| 55 | Final Architecture Summary | KEEP | — | Stays in strategy. |
| 56 | Architecture Governance and Review | MIXED | D15 | Narrative kept; mechanics → D15 §4. |
| 57 | Decision Log | EXTRACT | D16 | Register in D16. |
| 58 | Appendix | MIXED | D1, D3, D5, D6, D8 | Glossary kept; heavy tables distributed. |

---

## B. Target Artifact → Source Section(s)

| Artifact | Title | Source Sections (by # above) |
|---|---|---|
| **D1** | Enterprise Observability Standards Catalog | 3 (5 Pillars), 16, 19, 23, 27 (also referenced in 31), 58 (Appendix tables) |
| **D2** | Observability Reference Architecture | 4, 7, 8, 9, 40 |
| **D3** | Domain Observability Runbooks Pack | 10, 12, 13, 15, 16, 18, 19, 21, 22, 23, 25, 58 |
| **D4** | Alerting & Incident Severity Policy | 14, 17, 20, 24, 28, 34, 38 |
| **D5** | Grafana Platform Standard & Visualization Playbook | 26, 27, 28, 29, 58 |
| **D6** | AIOps Guardrails & Implementation Playbook | 30, 31, 32, 33, 34, 35, 58 |
| **D7** | IaC for Observability Standard (PowerShell + Docker Compose) | 36, 37, 39 |
| **D8** | Observability Data Governance & Retention Policy | 42, 43, 44, 58 |
| **D9** | Observability FinOps Standard | 46 |
| **D10** | Compliance & Audit Control Matrix | 47 |
| **D11** | Observability KPI Scorecard | 2, 6, 37, 48, 54 |
| **D12** | Incident Response Playbook | 49 |
| **D13** | Observability Roadmap Delivery Plan | 50, 51, 52, 53 |
| **D14** | Observability Capability Assessment Framework | 54 |
| **D15** | Observability Governance Charter & ARB Pack | 42, 45, 56 |
| **D16** | Observability ADR / Decision Register | 57 |
| **D17** | Application Telemetry Standard | 11, 12, 13 |
| **D18** | Observability Operating Model & Adoption Plan | 5, 6 |
| **D19** | Observability Data Model Specification | 41 |
