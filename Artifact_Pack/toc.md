---
title: Observability Artifact Pack — Table of Contents
chapter: TOC
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# Observability Artifact Pack — Table of Contents

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

## [README — Observability Artifact Pack](readme.md)

- [Overview](readme.md#overview)
- [How to Read This Pack](readme.md#how-to-read-this-pack)
- [Pack Structure at a Glance](readme.md#pack-structure-at-a-glance)
- [Conventions](readme.md#conventions)
- [Maintenance](readme.md#maintenance)
- [Status and Open Items](readme.md#status-and-open-items)

## [Xceedance Observability Strategy](00-observability-strategy.md)

- [0.1 Executive Summary](00-observability-strategy.md#01-executive-summary)
- [0.2 Vision, Mission, and Guiding Principles](00-observability-strategy.md#02-vision-mission-and-guiding-principles)
- [0.3 Business Objectives & KPIs (Narrative)](00-observability-strategy.md#03-business-objectives-kpis-narrative)
- [0.4 High-Level Architecture (One-Page View)](00-observability-strategy.md#04-high-level-architecture-one-page-view)

## [1. Enterprise Observability Standards Catalog](01-enterprise-observability-standards-catalog.md)

- [1.1 Scope and Intent](01-enterprise-observability-standards-catalog.md#11-scope-and-intent)
- [1.2 The Five Pillars of Telemetry](01-enterprise-observability-standards-catalog.md#12-the-five-pillars-of-telemetry)
- [1.3 Naming and Labelling Standards](01-enterprise-observability-standards-catalog.md#13-naming-and-labelling-standards)
- [1.4 Infrastructure Telemetry Standards](01-enterprise-observability-standards-catalog.md#14-infrastructure-telemetry-standards)
- [1.5 Application Telemetry Standards (Pre-Login)](01-enterprise-observability-standards-catalog.md#15-application-telemetry-standards-pre-login)
- [1.6 Application Telemetry Standards (Post-Login)](01-enterprise-observability-standards-catalog.md#16-application-telemetry-standards-post-login)
- [1.7 Database Telemetry Standards](01-enterprise-observability-standards-catalog.md#17-database-telemetry-standards)
- [1.8 Network & Latency Telemetry Standards](01-enterprise-observability-standards-catalog.md#18-network-latency-telemetry-standards)
- [1.9 Scaling & Performance Telemetry Standards](01-enterprise-observability-standards-catalog.md#19-scaling-performance-telemetry-standards)
- [1.10 Grafana Visualization Layer Standards](01-enterprise-observability-standards-catalog.md#110-grafana-visualization-layer-standards)
- [1.11 AI-Driven Telemetry Standards](01-enterprise-observability-standards-catalog.md#111-ai-driven-telemetry-standards)
- [1.12 Calibration Guidance](01-enterprise-observability-standards-catalog.md#112-calibration-guidance)
- [1.13 Cross-References](01-enterprise-observability-standards-catalog.md#113-cross-references)

## [2. Observability Reference Architecture](02-observability-reference-architecture.md)

- [2.1 Architectural Principles](02-observability-reference-architecture.md#21-architectural-principles)
- [2.2 High-Level Architecture (Logical View)](02-observability-reference-architecture.md#22-high-level-architecture-logical-view)
- [2.3 Core Concepts](02-observability-reference-architecture.md#23-core-concepts)
- [2.4 Core Open-Source Stack](02-observability-reference-architecture.md#24-core-open-source-stack)
- [2.5 Telemetry Collection Layers](02-observability-reference-architecture.md#25-telemetry-collection-layers)
- [2.6 Host-Portable Deployment Design](02-observability-reference-architecture.md#26-host-portable-deployment-design)
- [2.7 Pipeline Processing](02-observability-reference-architecture.md#27-pipeline-processing)
- [2.8 Cross-References](02-observability-reference-architecture.md#28-cross-references)

## [3. Domain Observability Runbooks Pack](03-domain-observability-runbooks-pack.md)

- [3.1 Purpose](03-domain-observability-runbooks-pack.md#31-purpose)
- [3.2 Infrastructure Observability Runbook](03-domain-observability-runbooks-pack.md#32-infrastructure-observability-runbook)
- [3.3 Application Observability Runbook (Pre-Login & Post-Login Execution Steps)](03-domain-observability-runbooks-pack.md#33-application-observability-runbook-pre-login-post-login-execution-steps)
- [3.4 Database Observability Runbook](03-domain-observability-runbooks-pack.md#34-database-observability-runbook)
- [3.5 Network & Latency Observability Runbook](03-domain-observability-runbooks-pack.md#35-network-latency-observability-runbook)
- [3.6 Scaling & Performance Runbook](03-domain-observability-runbooks-pack.md#36-scaling-performance-runbook)
- [3.7 Query Examples and Decision Trees (Per Domain)](03-domain-observability-runbooks-pack.md#37-query-examples-and-decision-trees-per-domain)
- [3.8 Calibration Note](03-domain-observability-runbooks-pack.md#38-calibration-note)
- [3.9 Cross-References](03-domain-observability-runbooks-pack.md#39-cross-references)

## [4. Alerting and Incident Severity Policy](04-alerting-and-incident-severity-policy.md)

- [4.1 Purpose](04-alerting-and-incident-severity-policy.md#41-purpose)
- [4.2 Principles](04-alerting-and-incident-severity-policy.md#42-principles)
- [4.3 Standard Severity Model](04-alerting-and-incident-severity-policy.md#43-standard-severity-model)
- [4.4 Domain-Specific Triggers (Reference)](04-alerting-and-incident-severity-policy.md#44-domain-specific-triggers-reference)
- [4.5 Alert Routing & Escalation](04-alerting-and-incident-severity-policy.md#45-alert-routing-escalation)
- [4.6 Calibration Guidance](04-alerting-and-incident-severity-policy.md#46-calibration-guidance)
- [4.7 Cross-References](04-alerting-and-incident-severity-policy.md#47-cross-references)

## [5. Grafana Platform Standard and Visualization Playbook](05-grafana-platform-standard-and-visualization-playbook.md)

- [5.1 Purpose](05-grafana-platform-standard-and-visualization-playbook.md#51-purpose)
- [5.2 Role of Grafana in the Strategy](05-grafana-platform-standard-and-visualization-playbook.md#52-role-of-grafana-in-the-strategy)
- [5.3 Dashboard Structure (Three-Layer Model)](05-grafana-platform-standard-and-visualization-playbook.md#53-dashboard-structure-three-layer-model)
- [5.4 Key Metrics & Suggested Ranges (Visualization)](05-grafana-platform-standard-and-visualization-playbook.md#54-key-metrics-suggested-ranges-visualization)
- [5.5 Recommended Alerting Policy (Grafana Implementation)](05-grafana-platform-standard-and-visualization-playbook.md#55-recommended-alerting-policy-grafana-implementation)
- [5.6 Implementation & Visualization Tips](05-grafana-platform-standard-and-visualization-playbook.md#56-implementation-visualization-tips)
- [5.7 Calibration](05-grafana-platform-standard-and-visualization-playbook.md#57-calibration)
- [5.8 Cross-References](05-grafana-platform-standard-and-visualization-playbook.md#58-cross-references)

## [6. AIOps Guardrails and Implementation Playbook](06-aiops-guardrails-and-implementation-playbook.md)

- [6.1 Strategic Intent & Guardrails](06-aiops-guardrails-and-implementation-playbook.md#61-strategic-intent-guardrails)
- [6.2 AI-Driven Observability Metrics](06-aiops-guardrails-and-implementation-playbook.md#62-ai-driven-observability-metrics)
- [6.3 Interpreting the AI-Driven Metrics](06-aiops-guardrails-and-implementation-playbook.md#63-interpreting-the-ai-driven-metrics)
- [6.4 Severity Policy for AI-Detected Events](06-aiops-guardrails-and-implementation-playbook.md#64-severity-policy-for-ai-detected-events)
- [6.5 Implementation Recommendations](06-aiops-guardrails-and-implementation-playbook.md#65-implementation-recommendations)
- [6.6 Feedback Loop & Continuous Improvement](06-aiops-guardrails-and-implementation-playbook.md#66-feedback-loop-continuous-improvement)
- [6.7 MLOps Lifecycle for AIOps Models](06-aiops-guardrails-and-implementation-playbook.md#67-mlops-lifecycle-for-aiops-models)
- [6.8 AI Safety, Explainability, and LLM Data Leakage](06-aiops-guardrails-and-implementation-playbook.md#68-ai-safety-explainability-and-llm-data-leakage)
- [6.9 Worked Examples — Filled Model Cards and Prompt Registry](06-aiops-guardrails-and-implementation-playbook.md#69-worked-examples-filled-model-cards-and-prompt-registry)
- [6.10 Cross-References](06-aiops-guardrails-and-implementation-playbook.md#610-cross-references)

## [7. IaC for Observability Standard (Docker Compose + PowerShell)](07-iac-for-observability-standard.md)

- [7.1 Strategic Policy Position](07-iac-for-observability-standard.md#71-strategic-policy-position)
- [7.2 Scope](07-iac-for-observability-standard.md#72-scope)
- [7.3 Implementation Patterns](07-iac-for-observability-standard.md#73-implementation-patterns)
- [7.4 Platform KPIs (Deployment via PowerShell + Docker Compose)](07-iac-for-observability-standard.md#74-platform-kpis-deployment-via-powershell-docker-compose)
- [7.5 Severity Policy (Deployment-Specific)](07-iac-for-observability-standard.md#75-severity-policy-deployment-specific)
- [7.6 Implementation & Visualization](07-iac-for-observability-standard.md#76-implementation-visualization)
- [7.7 Calibration](07-iac-for-observability-standard.md#77-calibration)
- [7.8 Cross-References](07-iac-for-observability-standard.md#78-cross-references)

## [8. Observability Data Governance and Retention Policy](08-observability-data-governance-and-retention-policy.md)

- [8.1 Purpose](08-observability-data-governance-and-retention-policy.md#81-purpose)
- [8.2 Scope](08-observability-data-governance-and-retention-policy.md#82-scope)
- [8.3 Telemetry Retention Tiers](08-observability-data-governance-and-retention-policy.md#83-telemetry-retention-tiers)
- [8.4 Worked Example: Applying Retention Policy](08-observability-data-governance-and-retention-policy.md#84-worked-example-applying-retention-policy)
- [8.5 Data Classification](08-observability-data-governance-and-retention-policy.md#85-data-classification)
- [8.6 Data Quality and Standards](08-observability-data-governance-and-retention-policy.md#86-data-quality-and-standards)
- [8.7 Deletion and Retention Enforcement](08-observability-data-governance-and-retention-policy.md#87-deletion-and-retention-enforcement)
- [8.8 Lifecycle Mechanics (linked to FinOps)](08-observability-data-governance-and-retention-policy.md#88-lifecycle-mechanics-linked-to-finops)
- [8.9 Success Criteria](08-observability-data-governance-and-retention-policy.md#89-success-criteria)
- [8.10 Cross-References](08-observability-data-governance-and-retention-policy.md#810-cross-references)

## [9. Observability FinOps Standard](09-observability-finops-standard.md)

- [9.1 Purpose](09-observability-finops-standard.md#91-purpose)
- [9.2 Storage Tier Model](09-observability-finops-standard.md#92-storage-tier-model)
- [9.3 Down-Sampling and Aggregation](09-observability-finops-standard.md#93-down-sampling-and-aggregation)
- [9.4 Cost Levers](09-observability-finops-standard.md#94-cost-levers)
- [9.5 Cost KPIs](09-observability-finops-standard.md#95-cost-kpis)
- [9.6 Value Tracking](09-observability-finops-standard.md#96-value-tracking)
- [9.7 Deletion & Compaction Monitoring](09-observability-finops-standard.md#97-deletion-compaction-monitoring)
- [9.8 Cross-References](09-observability-finops-standard.md#98-cross-references)

## [10. Compliance and Audit Control Matrix](10-compliance-and-audit-control-matrix.md)

- [10.1 Purpose](10-compliance-and-audit-control-matrix.md#101-purpose)
- [10.2 Audit Trails](10-compliance-and-audit-control-matrix.md#102-audit-trails)
- [10.3 Regulatory Alignment](10-compliance-and-audit-control-matrix.md#103-regulatory-alignment)
- [10.4 Reporting](10-compliance-and-audit-control-matrix.md#104-reporting)
- [10.5 Control Matrix (Initial)](10-compliance-and-audit-control-matrix.md#105-control-matrix-initial)
- [10.6 Framework Mapping](10-compliance-and-audit-control-matrix.md#106-framework-mapping)
- [10.7 Audit-Evidence Catalogue](10-compliance-and-audit-control-matrix.md#107-audit-evidence-catalogue)
- [10.8 Audit Lifecycle](10-compliance-and-audit-control-matrix.md#108-audit-lifecycle)
- [10.9 Cross-References](10-compliance-and-audit-control-matrix.md#109-cross-references)

## [11. Observability KPI Scorecard](11-observability-kpi-scorecard.md)

- [11.1 Purpose](11-observability-kpi-scorecard.md#111-purpose)
- [11.2 Core Outcome KPIs](11-observability-kpi-scorecard.md#112-core-outcome-kpis)
- [11.3 Resilience & Coverage KPIs](11-observability-kpi-scorecard.md#113-resilience-coverage-kpis)
- [11.4 Governance Success KPIs (from Governance & Data Strategy)](11-observability-kpi-scorecard.md#114-governance-success-kpis-from-governance-data-strategy)
- [11.5 Platform KPIs Roll-Up (from IaC Standard — Docker Compose + PowerShell)](11-observability-kpi-scorecard.md#115-platform-kpis-roll-up-from-iac-standard-docker-compose-powershell)
- [11.6 Maturity Phase Targets (from Capability Assessment / Roadmap)](11-observability-kpi-scorecard.md#116-maturity-phase-targets-from-capability-assessment-roadmap)
- [11.7 Reporting Cadence](11-observability-kpi-scorecard.md#117-reporting-cadence)
- [11.8 Cross-References](11-observability-kpi-scorecard.md#118-cross-references)

## [12. Incident Response Playbook (Telemetry to Resolution)](12-incident-response-playbook.md)

- [12.1 Purpose](12-incident-response-playbook.md#121-purpose)
- [12.2 End-to-End Incident Sequence (Logical Flow)](12-incident-response-playbook.md#122-end-to-end-incident-sequence-logical-flow)
- [12.3 Roles](12-incident-response-playbook.md#123-roles)
- [12.4 Incident Severity Mapping](12-incident-response-playbook.md#124-incident-severity-mapping)
- [12.5 Diagnosis Aids](12-incident-response-playbook.md#125-diagnosis-aids)
- [12.6 Post-Incident Review (PIR)](12-incident-response-playbook.md#126-post-incident-review-pir)
- [12.7 Success Criteria](12-incident-response-playbook.md#127-success-criteria)
- [12.8 Cross-References](12-incident-response-playbook.md#128-cross-references)

## [13. Observability Roadmap Delivery Plan](13-observability-roadmap-delivery-plan.md)

- [13.1 Purpose](13-observability-roadmap-delivery-plan.md#131-purpose)
- [13.2 Phase 1 — Foundation (Months 1–3)](13-observability-roadmap-delivery-plan.md#132-phase-1-foundation-months-13)
- [13.3 Phase 2 — Correlation & Alerting (Months 4–6)](13-observability-roadmap-delivery-plan.md#133-phase-2-correlation-alerting-months-46)
- [13.4 Phase 3 — AI-Driven Intelligence (Months 7–12)](13-observability-roadmap-delivery-plan.md#134-phase-3-ai-driven-intelligence-months-712)
- [13.5 Dependencies (Cross-Phase)](13-observability-roadmap-delivery-plan.md#135-dependencies-cross-phase)
- [13.6 Risks (Initial)](13-observability-roadmap-delivery-plan.md#136-risks-initial)
- [13.7 Cross-References](13-observability-roadmap-delivery-plan.md#137-cross-references)

## [14. Observability Capability Assessment Framework](14-observability-capability-assessment-framework.md)

- [14.1 Purpose](14-observability-capability-assessment-framework.md#141-purpose)
- [14.2 Maturity Phase Scorecard](14-observability-capability-assessment-framework.md#142-maturity-phase-scorecard)
- [14.3 Assessment Dimensions](14-observability-capability-assessment-framework.md#143-assessment-dimensions)
- [14.4 Scoring Method](14-observability-capability-assessment-framework.md#144-scoring-method)
- [14.5 Inputs](14-observability-capability-assessment-framework.md#145-inputs)
- [14.6 Outputs](14-observability-capability-assessment-framework.md#146-outputs)
- [14.7 Cross-References](14-observability-capability-assessment-framework.md#147-cross-references)

## [15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md)

- [15.1 Purpose](15-observability-governance-charter-and-arb-pack.md#151-purpose)
- [15.2 Governance Body](15-observability-governance-charter-and-arb-pack.md#152-governance-body)
- [15.3 Decision Rights](15-observability-governance-charter-and-arb-pack.md#153-decision-rights)
- [15.4 Architecture Review Board (ARB) Pack](15-observability-governance-charter-and-arb-pack.md#154-architecture-review-board-arb-pack)
- [15.5 Review Cadence](15-observability-governance-charter-and-arb-pack.md#155-review-cadence)
- [15.6 Data Classification & Access Governance](15-observability-governance-charter-and-arb-pack.md#156-data-classification-access-governance)
- [15.7 Audit & Reporting](15-observability-governance-charter-and-arb-pack.md#157-audit-reporting)
- [15.8 Cross-References](15-observability-governance-charter-and-arb-pack.md#158-cross-references)

## [16. Observability ADR Decision Register](16-observability-adr-decision-register.md)

- [16.1 Purpose](16-observability-adr-decision-register.md#161-purpose)
- [16.2 ADR Index (Initial)](16-observability-adr-decision-register.md#162-adr-index-initial)
- [16.3 ADR Template](16-observability-adr-decision-register.md#163-adr-template)
- [16.4 ADR Bodies (Full Records)](16-observability-adr-decision-register.md#164-adr-bodies-full-records)
- [16.5 Cross-References](16-observability-adr-decision-register.md#165-cross-references)

## [17. Application Telemetry Standard](17-application-telemetry-standard.md)

- [17.1 Purpose](17-application-telemetry-standard.md#171-purpose)
- [17.2 Scope](17-application-telemetry-standard.md#172-scope)
- [17.3 Pre-Login Telemetry (Required Fields & Standards)](17-application-telemetry-standard.md#173-pre-login-telemetry-required-fields-standards)
- [17.4 Post-Login Telemetry (Required Fields & Standards)](17-application-telemetry-standard.md#174-post-login-telemetry-required-fields-standards)
- [17.5 Naming Conventions](17-application-telemetry-standard.md#175-naming-conventions)
- [17.6 PII & Data Classification](17-application-telemetry-standard.md#176-pii-data-classification)
- [17.7 Conformance](17-application-telemetry-standard.md#177-conformance)
- [17.8 Cross-References](17-application-telemetry-standard.md#178-cross-references)

## [18. Observability Operating Model and Adoption Plan](18-observability-operating-model-and-adoption-plan.md)

- [18.1 Purpose](18-observability-operating-model-and-adoption-plan.md#181-purpose)
- [18.2 Cultural Principles](18-observability-operating-model-and-adoption-plan.md#182-cultural-principles)
- [18.3 Roles & Responsibilities](18-observability-operating-model-and-adoption-plan.md#183-roles-responsibilities)
- [18.4 Adoption Plan (Aligned to Roadmap)](18-observability-operating-model-and-adoption-plan.md#184-adoption-plan-aligned-to-roadmap)
- [18.5 Continuous Improvement Process](18-observability-operating-model-and-adoption-plan.md#185-continuous-improvement-process)
- [18.6 Training Curriculum (Initial)](18-observability-operating-model-and-adoption-plan.md#186-training-curriculum-initial)
- [18.7 Success Indicators](18-observability-operating-model-and-adoption-plan.md#187-success-indicators)
- [18.8 Cross-References](18-observability-operating-model-and-adoption-plan.md#188-cross-references)

## [19. Observability Data Model Specification](19-observability-data-model-specification.md)

- [19.1 Purpose](19-observability-data-model-specification.md#191-purpose)
- [19.2 Telemetry Signal Types](19-observability-data-model-specification.md#192-telemetry-signal-types)
- [19.3 Core Entities (Initial Inventory)](19-observability-data-model-specification.md#193-core-entities-initial-inventory)
- [19.4 Relationships (Logical)](19-observability-data-model-specification.md#194-relationships-logical)
- [19.5 Correlation Identifiers](19-observability-data-model-specification.md#195-correlation-identifiers)
- [19.6 Schema Conventions](19-observability-data-model-specification.md#196-schema-conventions)
- [19.7 PII & Sensitive Data](19-observability-data-model-specification.md#197-pii-sensitive-data)
- [19.8 Canonical JSON Schemas, ERD, and OTel Crosswalk](19-observability-data-model-specification.md#198-canonical-json-schemas-erd-and-otel-crosswalk)
- [19.9 Cross-References](19-observability-data-model-specification.md#199-cross-references)

## [20. Business Capability and Value-Stream Mapping](20-business-capability-and-value-stream-mapping.md)

- [20.1 Why This Chapter Exists](20-business-capability-and-value-stream-mapping.md#201-why-this-chapter-exists)
- [20.2 Business Capability Map (Insurance Reference)](20-business-capability-and-value-stream-mapping.md#202-business-capability-map-insurance-reference)
- [20.3 Value-Stream View](20-business-capability-and-value-stream-mapping.md#203-value-stream-view)
- [20.4 Outcome → KPI → SLO → SLI → Telemetry Traceability](20-business-capability-and-value-stream-mapping.md#204-outcome-kpi-slo-sli-telemetry-traceability)
- [20.5 Capability-to-Artifact Mapping](20-business-capability-and-value-stream-mapping.md#205-capability-to-artifact-mapping)
- [20.6 Stakeholder Value Statements](20-business-capability-and-value-stream-mapping.md#206-stakeholder-value-statements)
- [20.7 Cross-References](20-business-capability-and-value-stream-mapping.md#207-cross-references)

## [21. Observability Platform HA and DR Design](21-observability-platform-ha-and-dr-design.md)

- [21.1 HA / DR Posture](21-observability-platform-ha-and-dr-design.md#211-ha-dr-posture)
- [21.2 Component HA Matrix](21-observability-platform-ha-and-dr-design.md#212-component-ha-matrix)
- [21.3 Reference HA Topology (Compose, Single Region)](21-observability-platform-ha-and-dr-design.md#213-reference-ha-topology-compose-single-region)
- [21.4 Persistence and Backup](21-observability-platform-ha-and-dr-design.md#214-persistence-and-backup)
- [21.5 DR Patterns](21-observability-platform-ha-and-dr-design.md#215-dr-patterns)
- [21.6 Failure Modes and Mitigations](21-observability-platform-ha-and-dr-design.md#216-failure-modes-and-mitigations)
- [21.7 Self-Monitoring (Meta-Monitor)](21-observability-platform-ha-and-dr-design.md#217-self-monitoring-meta-monitor)
- [21.8 DR Drill Cadence](21-observability-platform-ha-and-dr-design.md#218-dr-drill-cadence)
- [21.9 Cross-References](21-observability-platform-ha-and-dr-design.md#219-cross-references)

## [22. Capacity and Scale Model](22-capacity-and-scale-model.md)

- [22.1 Capacity Drivers](22-capacity-and-scale-model.md#221-capacity-drivers)
- [22.2 Reference Deployment Sizes](22-capacity-and-scale-model.md#222-reference-deployment-sizes)
- [22.3 Worked Sizing Examples](22-capacity-and-scale-model.md#223-worked-sizing-examples)
- [22.4 Scale-Out Triggers](22-capacity-and-scale-model.md#224-scale-out-triggers)
- [22.5 Sizing Calculator (heuristic)](22-capacity-and-scale-model.md#225-sizing-calculator-heuristic)
- [22.6 Cost Projection (illustrative, Azure pricing class)](22-capacity-and-scale-model.md#226-cost-projection-illustrative-azure-pricing-class)
- [22.7 Performance SLOs for the Platform Itself](22-capacity-and-scale-model.md#227-performance-slos-for-the-platform-itself)
- [22.8 Cardinality Budget](22-capacity-and-scale-model.md#228-cardinality-budget)
- [22.9 Cross-References](22-capacity-and-scale-model.md#229-cross-references)

### [23 Appendix A. Threat Model (STRIDE)](23-appendix-a-threat-model.md)

- [23A.1 Purpose](23-appendix-a-threat-model.md#23a1-purpose)
- [23A.2 Methodology](23-appendix-a-threat-model.md#23a2-methodology)
- [23A.3 In-Scope Components](23-appendix-a-threat-model.md#23a3-in-scope-components)
- [23A.4 STRIDE Threat Matrix](23-appendix-a-threat-model.md#23a4-stride-threat-matrix)
- [23A.5 Residual Risk Summary](23-appendix-a-threat-model.md#23a5-residual-risk-summary)
- [23A.6 Open Threats / Action Register](23-appendix-a-threat-model.md#23a6-open-threats-action-register)
- [23A.7 Cross-References](23-appendix-a-threat-model.md#23a7-cross-references)

## [23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md)

- [23.1 Threat Model (STRIDE)](23-observability-platform-security-architecture.md#231-threat-model-stride)
- [23.2 Authentication and Authorisation](23-observability-platform-security-architecture.md#232-authentication-and-authorisation)
- [23.3 Encryption](23-observability-platform-security-architecture.md#233-encryption)
- [23.4 PII Redaction (Concrete Mechanisms)](23-observability-platform-security-architecture.md#234-pii-redaction-concrete-mechanisms)
- [23.5 Audit Trail](23-observability-platform-security-architecture.md#235-audit-trail)
- [23.6 Secrets Management](23-observability-platform-security-architecture.md#236-secrets-management)
- [23.7 Supply-Chain Security](23-observability-platform-security-architecture.md#237-supply-chain-security)
- [23.8 Egress and Data-Residency Controls](23-observability-platform-security-architecture.md#238-egress-and-data-residency-controls)
- [23.9 Hardening Baseline](23-observability-platform-security-architecture.md#239-hardening-baseline)
- [23.10 Cross-References](23-observability-platform-security-architecture.md#2310-cross-references)

## [24. SLO and Error-Budget Framework](24-slo-and-error-budget-framework.md)

- [24.1 Why an SLO Framework](24-slo-and-error-budget-framework.md#241-why-an-slo-framework)
- [24.2 SLI Categories (Choose 1–3 per Service)](24-slo-and-error-budget-framework.md#242-sli-categories-choose-13-per-service)
- [24.3 SLO Target Derivation](24-slo-and-error-budget-framework.md#243-slo-target-derivation)
- [24.4 Error Budget](24-slo-and-error-budget-framework.md#244-error-budget)
- [24.5 Multi-Window Multi-Burn-Rate Alerting](24-slo-and-error-budget-framework.md#245-multi-window-multi-burn-rate-alerting)
- [24.6 Error-Budget Policy](24-slo-and-error-budget-framework.md#246-error-budget-policy)
- [24.7 SLO Authoring Workflow](24-slo-and-error-budget-framework.md#247-slo-authoring-workflow)
- [24.8 Tooling Decision](24-slo-and-error-budget-framework.md#248-tooling-decision)
- [24.9 Alert Quality Scorecard (per service)](24-slo-and-error-budget-framework.md#249-alert-quality-scorecard-per-service)
- [24.10 Cross-References](24-slo-and-error-budget-framework.md#2410-cross-references)

## [25. Service Onboarding and Instrumentation Kits](25-service-onboarding-and-instrumentation-kits.md)

- [25.1 Onboarding Workflow (Service Owner View)](25-service-onboarding-and-instrumentation-kits.md#251-onboarding-workflow-service-owner-view)
- [25.2 Production-Readiness Review (PRR) Gate](25-service-onboarding-and-instrumentation-kits.md#252-production-readiness-review-prr-gate)
- [25.3 Instrumentation Kits](25-service-onboarding-and-instrumentation-kits.md#253-instrumentation-kits)
- [25.4 Role-Based Training](25-service-onboarding-and-instrumentation-kits.md#254-role-based-training)
- [25.5 Knowledge Base](25-service-onboarding-and-instrumentation-kits.md#255-knowledge-base)
- [25.6 Adoption KPIs (rolling)](25-service-onboarding-and-instrumentation-kits.md#256-adoption-kpis-rolling)
- [25.7 Cross-References](25-service-onboarding-and-instrumentation-kits.md#257-cross-references)

## [26. Multi-Tenant and Customer-Site Deployment Model](26-multi-tenant-and-customer-site-deployment-model.md)

- [26.1 Deployment Topologies](26-multi-tenant-and-customer-site-deployment-model.md#261-deployment-topologies)
- [26.2 Tenant Identity Model](26-multi-tenant-and-customer-site-deployment-model.md#262-tenant-identity-model)
- [26.3 Tenant Labelling Enforcement](26-multi-tenant-and-customer-site-deployment-model.md#263-tenant-labelling-enforcement)
- [26.4 Per-Tenant Data Isolation Guarantees](26-multi-tenant-and-customer-site-deployment-model.md#264-per-tenant-data-isolation-guarantees)
- [26.5 Data-Residency](26-multi-tenant-and-customer-site-deployment-model.md#265-data-residency)
- [26.6 Trace Continuity Across Customer / Xceedance Boundary](26-multi-tenant-and-customer-site-deployment-model.md#266-trace-continuity-across-customer-xceedance-boundary)
- [26.7 Per-Customer-Site DR](26-multi-tenant-and-customer-site-deployment-model.md#267-per-customer-site-dr)
- [26.8 Operational Boundaries (Who Operates What)](26-multi-tenant-and-customer-site-deployment-model.md#268-operational-boundaries-who-operates-what)
- [26.9 Tenant Onboarding Checklist](26-multi-tenant-and-customer-site-deployment-model.md#269-tenant-onboarding-checklist)
- [26.10 Cross-References](26-multi-tenant-and-customer-site-deployment-model.md#2610-cross-references)

## [27. Observability Non-Functional Requirements Register](27-observability-non-functional-requirements.md)

- [27.1 Purpose](27-observability-non-functional-requirements.md#271-purpose)
- [27.2 Scope](27-observability-non-functional-requirements.md#272-scope)
- [27.3 NFR Register](27-observability-non-functional-requirements.md#273-nfr-register)
- [27.4 Verification Methods (Per NFR)](27-observability-non-functional-requirements.md#274-verification-methods-per-nfr)
- [27.5 Evidence Cadence by Category](27-observability-non-functional-requirements.md#275-evidence-cadence-by-category)
- [27.6 Change Control](27-observability-non-functional-requirements.md#276-change-control)
- [27.7 Cross-References](27-observability-non-functional-requirements.md#277-cross-references)

## [28. Observability Long-Term Archival Policy](28-observability-long-term-archival-policy.md)

- [28.1 Purpose](28-observability-long-term-archival-policy.md#281-purpose)
- [28.2 Scope](28-observability-long-term-archival-policy.md#282-scope)
- [28.3 Archival Categories](28-observability-long-term-archival-policy.md#283-archival-categories)
- [28.4 Retention Schedule (Worked View)](28-observability-long-term-archival-policy.md#284-retention-schedule-worked-view)
- [28.5 Storage Architecture](28-observability-long-term-archival-policy.md#285-storage-architecture)
- [28.6 Data Lifecycle](28-observability-long-term-archival-policy.md#286-data-lifecycle)
- [28.7 Privacy Treatment Before Archival](28-observability-long-term-archival-policy.md#287-privacy-treatment-before-archival)
- [28.8 Access Control](28-observability-long-term-archival-policy.md#288-access-control)
- [28.9 Legal Hold](28-observability-long-term-archival-policy.md#289-legal-hold)
- [28.10 Right to Erasure (GDPR Art. 17)](28-observability-long-term-archival-policy.md#2810-right-to-erasure-gdpr-art-17)
- [28.11 Chain of Custody (Forensic / Legal)](28-observability-long-term-archival-policy.md#2811-chain-of-custody-forensic-legal)
- [28.12 Cost Model](28-observability-long-term-archival-policy.md#2812-cost-model)
- [28.13 Data Residency](28-observability-long-term-archival-policy.md#2813-data-residency)
- [28.14 Roles & Responsibilities (Summary)](28-observability-long-term-archival-policy.md#2814-roles-responsibilities-summary)
- [28.15 KPIs](28-observability-long-term-archival-policy.md#2815-kpis)
- [28.16 Cross-References](28-observability-long-term-archival-policy.md#2816-cross-references)

## [29. Observability Programme Risk Register](29-observability-programme-risk-register.md)

- [29.1 Purpose](29-observability-programme-risk-register.md#291-purpose)
- [29.2 Scope](29-observability-programme-risk-register.md#292-scope)
- [29.3 Rating Scheme](29-observability-programme-risk-register.md#293-rating-scheme)
- [29.4 Risk Register (Top Programme Risks)](29-observability-programme-risk-register.md#294-risk-register-top-programme-risks)
- [29.5 Risk Categories (Reference)](29-observability-programme-risk-register.md#295-risk-categories-reference)
- [29.6 Operating the Register](29-observability-programme-risk-register.md#296-operating-the-register)
- [29.7 Known Limitations of v0.1](29-observability-programme-risk-register.md#297-known-limitations-of-v01)
- [29.8 Cross-References](29-observability-programme-risk-register.md#298-cross-references)

## [Annexure A — Acronyms & Definitions](annexure-a-acronyms.md)


## [Annexure B — Concepts Glossary](annexure-b-concepts-glossary.md)


## [Handover Report — Observability Strategy Decomposition](handover-report.md)

- [1. Created Files](handover-report.md#1-created-files)
- [2. Sections Processed](handover-report.md#2-sections-processed)
- [2.1. Enterprise Hardening Pass (2026-05-07)](handover-report.md#21-enterprise-hardening-pass-2026-05-07)
- [2.2. P1 Expert-Review Pass (2026-05-12)](handover-report.md#22-p1-expert-review-pass-2026-05-12)
- [2.3. P2 Depth-and-Asset Pass (2026-05-12)](handover-report.md#23-p2-depth-and-asset-pass-2026-05-12)
- [3. Sections Pending](handover-report.md#3-sections-pending)
- [4. Decisions Required](handover-report.md#4-decisions-required)
- [5. Recommended Next Step](handover-report.md#5-recommended-next-step)
- [Guardrail Compliance Summary](handover-report.md#guardrail-compliance-summary)

## [Traceability Matrix — Source Sections ↔ Target Artifacts](traceability-matrix.md)

- [A. Source Section → Target Artifact(s)](traceability-matrix.md#a-source-section-target-artifacts)
- [B. Target Artifact → Source Section(s)](traceability-matrix.md#b-target-artifact-source-sections)
- [C. Gap-Fill Artifacts → Source Strategy Sections (Implicit)](traceability-matrix.md#c-gap-fill-artifacts-source-strategy-sections-implicit)
- [D. P3. Tiered-Close Gap-Fill (Planned)](traceability-matrix.md#d-p3-tiered-close-gap-fill-planned)

---

Generated by 	ools/regen_toc.ps1. Do not edit by hand — re-run the script after any heading change.
