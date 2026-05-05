# Observability Extraction Table

## Destination Artifacts (D1-D19)

| ID | New Document | Purpose |
|---|---|---|
| D1 | Enterprise Observability Standards Catalog | Canonical standards for telemetry, metric definitions, naming, labels, thresholds |
| D2 | Observability Reference Architecture | Target architecture, component roles, collection layers, multi-cloud design |
| D3 | Domain Observability Runbooks Pack | Practical runbooks for Infra/App/DB/Network/Scaling domains |
| D4 | Alerting & Incident Severity Policy | Enterprise policy for severities, routing, escalation, action model |
| D5 | Grafana Platform Standard & Visualization Playbook | Dashboard, visualization, and Grafana operating standards |
| D6 | AIOps Guardrails & Implementation Playbook | AI-driven RCA/ticketing guardrails, interpretation, operations workflow |
| D7 | IaC for Observability Standard (OpenTelemetry + Pulumi) | IaC patterns, controls, deployment model, and platform KPIs |
| D8 | Observability Data Governance & Retention Policy | Data lifecycle, retention tiers, governance controls, ownership |
| D9 | Observability FinOps Standard | Cost lifecycle, optimization model, value tracking |
| D10 | Compliance & Audit Control Matrix | SOC2/ISO/GDPR mapped controls and evidence requirements |
| D11 | Observability KPI Scorecard | Outcome metrics and measurable success criteria |
| D12 | Incident Response Playbook (Telemetry to Resolution) | End-to-end incident sequence and response workflow |
| D13 | Observability Roadmap Delivery Plan | Execution plan for phases, milestones, and dependencies |
| D14 | Observability Capability Assessment Framework | Maturity scoring model and assessment criteria |
| D15 | Observability Governance Charter & ARB Pack | Governance model, review cadence, decision rights |
| D16 | Observability ADR / Decision Register | Decision log with rationale and traceability |
| D17 | Application Telemetry Standard | Pre-login/post-login telemetry requirements and conventions |
| D18 | Observability Operating Model & Adoption Plan | Roles, culture, change/adoption model, continuous improvement process |
| D19 | Observability Data Model Specification | Formal schema/model for logs, metrics, traces, entities, relationships |

## Section Alignment (including mixed split guidance)

| Section Header | Disposition | Keep In Strategy | Extract To |
|---|---|---|---|
| Executive Summary | KEEP | Full section | None |
| Business Objectives & KPI’s | MIXED | Objectives narrative | D11 |
| Standardise Telemetry Data The 5 Pillars | EXTRACT | None | D1 |
| Build the Technical Foundation | MIXED | Strategic intent/principles | D2 |
| Foster an Observability Culture | EXTRACT | None | D18 |
| Continuous Improvement | MIXED | Principle/intent | D18, D11 |
| Observability Strategy – High Level Architecture | MIXED | One-page strategy architecture | D2 |
| Core Open-Source Observability Stack | EXTRACT | None | D2 |
| Telemetry Collection Layers | EXTRACT | None | D2 |
| Infrastructure Observability | EXTRACT | None | D3 |
| Application Telemetry (Pre-Login / Post-Login) | MIXED | Requirement summary | D17 |
| Pre-Login Telemetry | EXTRACT | None | D17, D3 |
| Post-Login Telemetry | EXTRACT | None | D17, D3 |
| Alerting Guidelines | EXTRACT | None | D4 |
| Database Observability | EXTRACT | None | D3 |
| Database Observability Metrics and Ranges | EXTRACT | None | D1, D3 |
| Suggested Alerting Policy Guidelines | EXTRACT | None | D4 |
| Network and Latency Observability | EXTRACT | None | D3 |
| Network & Latency Observability Metrics | EXTRACT | None | D1, D3 |
| Severity Policy (Network section) | EXTRACT | None | D4 |
| Implementation Tips | EXTRACT | None | D3 |
| Scaling and Performance Observability | MIXED | Outcome and strategic posture | D3 |
| Scaling and Performance Observability Metrics | EXTRACT | None | D1, D3 |
| Severity / Action Policy | EXTRACT | None | D4 |
| Implementation Notes | EXTRACT | None | D3 |
| Grafana Observability Layer | MIXED | Role of Grafana in strategy | D5 |
| Key Metrics and Suggested Ranges (Grafana) | EXTRACT | None | D1, D5 |
| Recommended Alerting Policy (Grafana) | EXTRACT | None | D4, D5 |
| Implementation & Visualization Tips (Grafana) | EXTRACT | None | D5 |
| AI-Driven Observability Layer | MIXED | Strategic intent and governance guardrails | D6 |
| AI-Driven Observability: Key Metrics and Suggested Ranges | EXTRACT | None | D6, D1 |
| Interpreting the AI-Driven Metrics | EXTRACT | None | D6 |
| Severity Policy for AI-Detected Events | EXTRACT | None | D4, D6 |
| Implementation Recommendations (AI) | EXTRACT | None | D6 |
| Infrastructure as a Code Role in OpenTelemetry Deployment | MIXED | Strategic policy position | D7 |
| Key Metrics for Infrastructure-as-Code Role in OpenTelemetry Deployments | EXTRACT | None | D7, D11 |
| Severity Policy (IaC section) | EXTRACT | None | D4 |
| Implementation & Visualization Tips (IaC) | EXTRACT | None | D7 |
| Multi-Cloud Observability Design | MIXED | Design principles and strategy stance | D2 |
| Observability Data Model | EXTRACT | None | D19 |
| Governance and Data Strategy | MIXED | Governance narrative and intent | D8, D15 |
| Telemetry retention tiers | EXTRACT | None | D8 |
| Worked Example: Applying Retention Policy | EXTRACT | None | D8 |
| Governance Model | EXTRACT | None | D15 |
| Lifecycle Management and Cost Optimisation | EXTRACT | None | D9 |
| 11.5 Compliance and Auditability | EXTRACT | None | D10 |
| Success Criteria for Governance and Data Strategy | EXTRACT | None | D11 |
| End-to-End Incident Sequence | EXTRACT | None | D12 |
| Maturity Roadmap | MIXED | Executive roadmap view | D13 |
| Phase 1: Foundation (Months 1-3) | EXTRACT | None | D13 |
| Phase 2: Correlation & Alerting (Months 4-6) | EXTRACT | None | D13 |
| Phase 3: AI-Driven Intelligence (Months 7-12) | EXTRACT | None | D13 |
| Maturity Assessment Framework | EXTRACT | None | D14 |
| Final Architecture Summary | KEEP | Full section | None |
| Architecture Governance and Review | MIXED | High-level governance narrative | D15 |
| Decision Log | EXTRACT | None | D16 |
| Appendix | MIXED | Light references and glossary | D1, D3, D5, D6, D8 |
