---
title: Observability Artifact Pack — Table of Contents
chapter: TOC
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# Observability Artifact Pack — Table of Contents

| Version | Owner | Classification | Reviewed Date | Status |
|---|---|---|---|---|
| 0.1 | TBD | Internal |  | Draft |
## [README — Observability Artifact Pack](readme.md)

- [Overview](readme.md#overview)
- [How to Read This Pack](readme.md#how-to-read-this-pack)
- [Pack Structure at a Glance](readme.md#pack-structure-at-a-glance)
- [Conventions](readme.md#conventions)
- [Maintenance](readme.md#maintenance)
- [Status and Open Items](readme.md#status-and-open-items)

## [1. Xceedance Observability Strategy](01-xceedance-observability-strategy.md)

- [1.1 Executive Summary](01-xceedance-observability-strategy.md#11-executive-summary)
- [1.2 Vision, Mission, and Guiding Principles](01-xceedance-observability-strategy.md#12-vision-mission-and-guiding-principles)
- [1.3 Business Objectives & KPIs (Narrative)](01-xceedance-observability-strategy.md#13-business-objectives-kpis-narrative)
- [1.4 High-Level Architecture (One-Page View)](01-xceedance-observability-strategy.md#14-high-level-architecture-one-page-view)

## [2. Enterprise Observability Standards Catalog](02-enterprise-observability-standards-catalog.md)

- [2.1 Scope and Intent](02-enterprise-observability-standards-catalog.md#21-scope-and-intent)
- [2.2 The Five Pillars of Telemetry](02-enterprise-observability-standards-catalog.md#22-the-five-pillars-of-telemetry)
- [2.3 Naming and Labelling Standards](02-enterprise-observability-standards-catalog.md#23-naming-and-labelling-standards)
- [2.4 Infrastructure Telemetry Standards](02-enterprise-observability-standards-catalog.md#24-infrastructure-telemetry-standards)
- [2.5 Application Telemetry Standards (Pre-Login)](02-enterprise-observability-standards-catalog.md#25-application-telemetry-standards-pre-login)
- [2.6 Application Telemetry Standards (Post-Login)](02-enterprise-observability-standards-catalog.md#26-application-telemetry-standards-post-login)
- [2.7 Database Telemetry Standards](02-enterprise-observability-standards-catalog.md#27-database-telemetry-standards)
- [2.8 Network & Latency Telemetry Standards](02-enterprise-observability-standards-catalog.md#28-network-latency-telemetry-standards)
- [2.9 Scaling & Performance Telemetry Standards](02-enterprise-observability-standards-catalog.md#29-scaling-performance-telemetry-standards)
- [2.10 Grafana Visualization Layer Standards](02-enterprise-observability-standards-catalog.md#210-grafana-visualization-layer-standards)
- [2.11 AI-Driven Telemetry Standards](02-enterprise-observability-standards-catalog.md#211-ai-driven-telemetry-standards)
- [2.12 Calibration Guidance](02-enterprise-observability-standards-catalog.md#212-calibration-guidance)
- [2.13 Cross-References](02-enterprise-observability-standards-catalog.md#213-cross-references)

## [3. Observability Reference Architecture](03-observability-reference-architecture.md)

- [3.1 Architectural Principles](03-observability-reference-architecture.md#31-architectural-principles)
- [3.2 High-Level Architecture (Logical View)](03-observability-reference-architecture.md#32-high-level-architecture-logical-view)
- [3.3 Core Concepts](03-observability-reference-architecture.md#33-core-concepts)
- [3.4 Core Open-Source Stack](03-observability-reference-architecture.md#34-core-open-source-stack)
- [3.5 Telemetry Collection Layers](03-observability-reference-architecture.md#35-telemetry-collection-layers)
- [3.6 Host-Portable Deployment Design](03-observability-reference-architecture.md#36-host-portable-deployment-design)
- [3.7 Pipeline Processing](03-observability-reference-architecture.md#37-pipeline-processing)
- [3.8 Cross-References](03-observability-reference-architecture.md#38-cross-references)

## [4. Domain Observability Runbooks Pack](04-domain-observability-runbooks-pack.md)

- [4.1 Purpose](04-domain-observability-runbooks-pack.md#41-purpose)
- [4.2 Infrastructure Observability Runbook](04-domain-observability-runbooks-pack.md#42-infrastructure-observability-runbook)
- [4.3 Application Observability Runbook (Pre-Login & Post-Login Execution Steps)](04-domain-observability-runbooks-pack.md#43-application-observability-runbook-pre-login-post-login-execution-steps)
- [4.4 Database Observability Runbook](04-domain-observability-runbooks-pack.md#44-database-observability-runbook)
- [4.5 Network & Latency Observability Runbook](04-domain-observability-runbooks-pack.md#45-network-latency-observability-runbook)
- [4.6 Scaling & Performance Runbook](04-domain-observability-runbooks-pack.md#46-scaling-performance-runbook)
- [4.7 Query Examples and Decision Trees (Per Domain)](04-domain-observability-runbooks-pack.md#47-query-examples-and-decision-trees-per-domain)
- [4.8 Calibration Note](04-domain-observability-runbooks-pack.md#48-calibration-note)
- [4.9 Cross-References](04-domain-observability-runbooks-pack.md#49-cross-references)

## [5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md)

- [5.1 Purpose](05-alerting-and-incident-severity-policy.md#51-purpose)
- [5.2 Principles](05-alerting-and-incident-severity-policy.md#52-principles)
- [5.3 Standard Severity Model](05-alerting-and-incident-severity-policy.md#53-standard-severity-model)
- [5.4 Domain-Specific Triggers (Reference)](05-alerting-and-incident-severity-policy.md#54-domain-specific-triggers-reference)
- [5.5 Alert Routing & Escalation](05-alerting-and-incident-severity-policy.md#55-alert-routing-escalation)
- [5.6 Calibration Guidance](05-alerting-and-incident-severity-policy.md#56-calibration-guidance)
- [5.7 Cross-References](05-alerting-and-incident-severity-policy.md#57-cross-references)

## [6. Grafana Platform Standard and Visualization Playbook](06-grafana-platform-standard-and-visualization-playbook.md)

- [6.1 Purpose](06-grafana-platform-standard-and-visualization-playbook.md#61-purpose)
- [6.2 Role of Grafana in the Strategy](06-grafana-platform-standard-and-visualization-playbook.md#62-role-of-grafana-in-the-strategy)
- [6.3 Dashboard Structure (Three-Layer Model)](06-grafana-platform-standard-and-visualization-playbook.md#63-dashboard-structure-three-layer-model)
- [6.4 Key Metrics & Suggested Ranges (Visualization)](06-grafana-platform-standard-and-visualization-playbook.md#64-key-metrics-suggested-ranges-visualization)
- [6.5 Recommended Alerting Policy (Grafana Implementation)](06-grafana-platform-standard-and-visualization-playbook.md#65-recommended-alerting-policy-grafana-implementation)
- [6.6 Implementation & Visualization Tips](06-grafana-platform-standard-and-visualization-playbook.md#66-implementation-visualization-tips)
- [6.7 Calibration](06-grafana-platform-standard-and-visualization-playbook.md#67-calibration)
- [6.8 Cross-References](06-grafana-platform-standard-and-visualization-playbook.md#68-cross-references)

## [7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md)

- [7.1 Strategic Intent & Guardrails](07-aiops-guardrails-and-implementation-playbook.md#71-strategic-intent-guardrails)
- [7.2 AI-Driven Observability Metrics](07-aiops-guardrails-and-implementation-playbook.md#72-ai-driven-observability-metrics)
- [7.3 Interpreting the AI-Driven Metrics](07-aiops-guardrails-and-implementation-playbook.md#73-interpreting-the-ai-driven-metrics)
- [7.4 Severity Policy for AI-Detected Events](07-aiops-guardrails-and-implementation-playbook.md#74-severity-policy-for-ai-detected-events)
- [7.5 Implementation Recommendations](07-aiops-guardrails-and-implementation-playbook.md#75-implementation-recommendations)
- [7.6 Feedback Loop & Continuous Improvement](07-aiops-guardrails-and-implementation-playbook.md#76-feedback-loop-continuous-improvement)
- [7.7 MLOps Lifecycle for AIOps Models](07-aiops-guardrails-and-implementation-playbook.md#77-mlops-lifecycle-for-aiops-models)
- [7.8 AI Safety, Explainability, and LLM Data Leakage](07-aiops-guardrails-and-implementation-playbook.md#78-ai-safety-explainability-and-llm-data-leakage)
- [7.9 Worked Examples — Filled Model Cards and Prompt Registry](07-aiops-guardrails-and-implementation-playbook.md#79-worked-examples-filled-model-cards-and-prompt-registry)
- [7.10 Cross-References](07-aiops-guardrails-and-implementation-playbook.md#710-cross-references)

## [8. IaC for Observability Standard (Docker Compose + PowerShell)](08-iac-for-observability-standard.md)

- [8.1 Strategic Policy Position](08-iac-for-observability-standard.md#81-strategic-policy-position)
- [8.2 Scope](08-iac-for-observability-standard.md#82-scope)
- [8.3 Implementation Patterns](08-iac-for-observability-standard.md#83-implementation-patterns)
- [8.4 Platform KPIs (Deployment via PowerShell + Docker Compose)](08-iac-for-observability-standard.md#84-platform-kpis-deployment-via-powershell-docker-compose)
- [8.5 Severity Policy (Deployment-Specific)](08-iac-for-observability-standard.md#85-severity-policy-deployment-specific)
- [8.6 Implementation & Visualization](08-iac-for-observability-standard.md#86-implementation-visualization)
- [8.7 Calibration](08-iac-for-observability-standard.md#87-calibration)
- [8.8 Cross-References](08-iac-for-observability-standard.md#88-cross-references)

## [9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md)

- [9.1 Purpose](09-observability-data-governance-and-retention-policy.md#91-purpose)
- [9.2 Scope](09-observability-data-governance-and-retention-policy.md#92-scope)
- [9.3 Telemetry Retention Tiers](09-observability-data-governance-and-retention-policy.md#93-telemetry-retention-tiers)
- [9.4 Worked Example: Applying Retention Policy](09-observability-data-governance-and-retention-policy.md#94-worked-example-applying-retention-policy)
- [9.5 Data Classification](09-observability-data-governance-and-retention-policy.md#95-data-classification)
- [9.6 Data Quality and Standards](09-observability-data-governance-and-retention-policy.md#96-data-quality-and-standards)
- [9.7 Deletion and Retention Enforcement](09-observability-data-governance-and-retention-policy.md#97-deletion-and-retention-enforcement)
- [9.8 Lifecycle Mechanics (linked to FinOps)](09-observability-data-governance-and-retention-policy.md#98-lifecycle-mechanics-linked-to-finops)
- [9.9 Success Criteria](09-observability-data-governance-and-retention-policy.md#99-success-criteria)
- [9.10 Cross-References](09-observability-data-governance-and-retention-policy.md#910-cross-references)

## [10. Observability FinOps Standard](10-observability-finops-standard.md)

- [10.1 Purpose](10-observability-finops-standard.md#101-purpose)
- [10.2 Storage Tier Model](10-observability-finops-standard.md#102-storage-tier-model)
- [10.3 Down-Sampling and Aggregation](10-observability-finops-standard.md#103-down-sampling-and-aggregation)
- [10.4 Cost Levers](10-observability-finops-standard.md#104-cost-levers)
- [10.5 Cost KPIs](10-observability-finops-standard.md#105-cost-kpis)
- [10.6 Value Tracking](10-observability-finops-standard.md#106-value-tracking)
- [10.7 Deletion & Compaction Monitoring](10-observability-finops-standard.md#107-deletion-compaction-monitoring)
- [10.8 Cross-References](10-observability-finops-standard.md#108-cross-references)

## [11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md)

- [11.1 Purpose](11-compliance-and-audit-control-matrix.md#111-purpose)
- [11.2 Audit Trails](11-compliance-and-audit-control-matrix.md#112-audit-trails)
- [11.3 Regulatory Alignment](11-compliance-and-audit-control-matrix.md#113-regulatory-alignment)
- [11.4 Reporting](11-compliance-and-audit-control-matrix.md#114-reporting)
- [11.5 Control Matrix (Initial)](11-compliance-and-audit-control-matrix.md#115-control-matrix-initial)
- [11.6 Framework Mapping](11-compliance-and-audit-control-matrix.md#116-framework-mapping)
- [11.7 Audit-Evidence Catalogue](11-compliance-and-audit-control-matrix.md#117-audit-evidence-catalogue)
- [11.8 Audit Lifecycle](11-compliance-and-audit-control-matrix.md#118-audit-lifecycle)
- [11.9 Cross-References](11-compliance-and-audit-control-matrix.md#119-cross-references)

## [12. Observability KPI Scorecard](12-observability-kpi-scorecard.md)

- [12.1 Purpose](12-observability-kpi-scorecard.md#121-purpose)
- [12.2 Core Outcome KPIs](12-observability-kpi-scorecard.md#122-core-outcome-kpis)
- [12.3 Resilience & Coverage KPIs](12-observability-kpi-scorecard.md#123-resilience-coverage-kpis)
- [12.4 Governance Success KPIs (from Governance & Data Strategy)](12-observability-kpi-scorecard.md#124-governance-success-kpis-from-governance-data-strategy)
- [12.5 Platform KPIs Roll-Up (from IaC Standard — Docker Compose + PowerShell)](12-observability-kpi-scorecard.md#125-platform-kpis-roll-up-from-iac-standard-docker-compose-powershell)
- [12.6 Maturity Phase Targets (from Capability Assessment / Roadmap)](12-observability-kpi-scorecard.md#126-maturity-phase-targets-from-capability-assessment-roadmap)
- [12.7 Reporting Cadence](12-observability-kpi-scorecard.md#127-reporting-cadence)
- [12.8 Cross-References](12-observability-kpi-scorecard.md#128-cross-references)

## [13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md)

- [13.1 Purpose](13-incident-response-playbook.md#131-purpose)
- [13.2 End-to-End Incident Sequence (Logical Flow)](13-incident-response-playbook.md#132-end-to-end-incident-sequence-logical-flow)
- [13.3 Roles](13-incident-response-playbook.md#133-roles)
- [13.4 Incident Severity Mapping](13-incident-response-playbook.md#134-incident-severity-mapping)
- [13.5 Diagnosis Aids](13-incident-response-playbook.md#135-diagnosis-aids)
- [13.6 Post-Incident Review (PIR)](13-incident-response-playbook.md#136-post-incident-review-pir)
- [13.7 Success Criteria](13-incident-response-playbook.md#137-success-criteria)
- [13.8 Cross-References](13-incident-response-playbook.md#138-cross-references)

## [14. Observability Roadmap Delivery Plan](14-observability-roadmap-delivery-plan.md)

- [14.1 Purpose](14-observability-roadmap-delivery-plan.md#141-purpose)
- [14.2 Phase 1 — Foundation (Months 1–3)](14-observability-roadmap-delivery-plan.md#142-phase-1-foundation-months-13)
- [14.3 Phase 2 — Correlation & Alerting (Months 4–6)](14-observability-roadmap-delivery-plan.md#143-phase-2-correlation-alerting-months-46)
- [14.4 Phase 3 — AI-Driven Intelligence (Months 7–12)](14-observability-roadmap-delivery-plan.md#144-phase-3-ai-driven-intelligence-months-712)
- [14.5 Dependencies (Cross-Phase)](14-observability-roadmap-delivery-plan.md#145-dependencies-cross-phase)
- [14.6 Risks (Initial)](14-observability-roadmap-delivery-plan.md#146-risks-initial)
- [14.7 Cross-References](14-observability-roadmap-delivery-plan.md#147-cross-references)

## [15. Observability Capability Assessment Framework](15-observability-capability-assessment-framework.md)

- [15.1 Purpose](15-observability-capability-assessment-framework.md#151-purpose)
- [15.2 Maturity Phase Scorecard](15-observability-capability-assessment-framework.md#152-maturity-phase-scorecard)
- [15.3 Assessment Dimensions](15-observability-capability-assessment-framework.md#153-assessment-dimensions)
- [15.4 Scoring Method](15-observability-capability-assessment-framework.md#154-scoring-method)
- [15.5 Inputs](15-observability-capability-assessment-framework.md#155-inputs)
- [15.6 Outputs](15-observability-capability-assessment-framework.md#156-outputs)
- [15.7 Cross-References](15-observability-capability-assessment-framework.md#157-cross-references)

## [16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md)

- [16.1 Purpose](16-observability-governance-charter-and-arb-pack.md#161-purpose)
- [16.2 Governance Body](16-observability-governance-charter-and-arb-pack.md#162-governance-body)
- [16.3 Decision Rights](16-observability-governance-charter-and-arb-pack.md#163-decision-rights)
- [16.4 Architecture Review Board (ARB) Pack](16-observability-governance-charter-and-arb-pack.md#164-architecture-review-board-arb-pack)
- [16.5 Review Cadence](16-observability-governance-charter-and-arb-pack.md#165-review-cadence)
- [16.6 Data Classification & Access Governance](16-observability-governance-charter-and-arb-pack.md#166-data-classification-access-governance)
- [16.7 Audit & Reporting](16-observability-governance-charter-and-arb-pack.md#167-audit-reporting)
- [16.8 Cross-References](16-observability-governance-charter-and-arb-pack.md#168-cross-references)

## [17. Observability ADR Decision Register](17-observability-adr-decision-register.md)

- [17.1 Purpose](17-observability-adr-decision-register.md#171-purpose)
- [17.2 ADR Index (Initial)](17-observability-adr-decision-register.md#172-adr-index-initial)
- [17.3 ADR Template](17-observability-adr-decision-register.md#173-adr-template)
- [17.4 ADR Bodies (Full Records)](17-observability-adr-decision-register.md#174-adr-bodies-full-records)
- [17.5 Cross-References](17-observability-adr-decision-register.md#175-cross-references)

## [18. Application Telemetry Standard](18-application-telemetry-standard.md)

- [18.1 Purpose](18-application-telemetry-standard.md#181-purpose)
- [18.2 Scope](18-application-telemetry-standard.md#182-scope)
- [18.3 Pre-Login Telemetry (Required Fields & Standards)](18-application-telemetry-standard.md#183-pre-login-telemetry-required-fields-standards)
- [18.4 Post-Login Telemetry (Required Fields & Standards)](18-application-telemetry-standard.md#184-post-login-telemetry-required-fields-standards)
- [18.5 Naming Conventions](18-application-telemetry-standard.md#185-naming-conventions)
- [18.6 PII & Data Classification](18-application-telemetry-standard.md#186-pii-data-classification)
- [18.7 Conformance](18-application-telemetry-standard.md#187-conformance)
- [18.8 Cross-References](18-application-telemetry-standard.md#188-cross-references)

## [19. Observability Operating Model and Adoption Plan](19-observability-operating-model-and-adoption-plan.md)

- [19.1 Purpose](19-observability-operating-model-and-adoption-plan.md#191-purpose)
- [19.2 Cultural Principles](19-observability-operating-model-and-adoption-plan.md#192-cultural-principles)
- [19.3 Roles & Responsibilities](19-observability-operating-model-and-adoption-plan.md#193-roles-responsibilities)
- [19.4 Adoption Plan (Aligned to Roadmap)](19-observability-operating-model-and-adoption-plan.md#194-adoption-plan-aligned-to-roadmap)
- [19.5 Continuous Improvement Process](19-observability-operating-model-and-adoption-plan.md#195-continuous-improvement-process)
- [19.6 Training Curriculum (Initial)](19-observability-operating-model-and-adoption-plan.md#196-training-curriculum-initial)
- [19.7 Success Indicators](19-observability-operating-model-and-adoption-plan.md#197-success-indicators)
- [19.8 Cross-References](19-observability-operating-model-and-adoption-plan.md#198-cross-references)

## [20. Observability Data Model Specification](20-observability-data-model-specification.md)

- [20.1 Purpose](20-observability-data-model-specification.md#201-purpose)
- [20.2 Telemetry Signal Types](20-observability-data-model-specification.md#202-telemetry-signal-types)
- [20.3 Core Entities (Initial Inventory)](20-observability-data-model-specification.md#203-core-entities-initial-inventory)
- [20.4 Relationships (Logical)](20-observability-data-model-specification.md#204-relationships-logical)
- [20.5 Correlation Identifiers](20-observability-data-model-specification.md#205-correlation-identifiers)
- [20.6 Schema Conventions](20-observability-data-model-specification.md#206-schema-conventions)
- [20.7 PII & Sensitive Data](20-observability-data-model-specification.md#207-pii-sensitive-data)
- [20.8 Canonical JSON Schemas, ERD, and OTel Crosswalk](20-observability-data-model-specification.md#208-canonical-json-schemas-erd-and-otel-crosswalk)
- [20.9 Cross-References](20-observability-data-model-specification.md#209-cross-references)

## [21. Business Capability and Value-Stream Mapping](21-business-capability-and-value-stream-mapping.md)

- [21.1 Why This Chapter Exists](21-business-capability-and-value-stream-mapping.md#211-why-this-chapter-exists)
- [21.2 Business Capability Map (Insurance Reference)](21-business-capability-and-value-stream-mapping.md#212-business-capability-map-insurance-reference)
- [21.3 Value-Stream View](21-business-capability-and-value-stream-mapping.md#213-value-stream-view)
- [21.4 Outcome → KPI → SLO → SLI → Telemetry Traceability](21-business-capability-and-value-stream-mapping.md#214-outcome-kpi-slo-sli-telemetry-traceability)
- [21.5 Capability-to-Artifact Mapping](21-business-capability-and-value-stream-mapping.md#215-capability-to-artifact-mapping)
- [21.6 Stakeholder Value Statements](21-business-capability-and-value-stream-mapping.md#216-stakeholder-value-statements)
- [21.7 Cross-References](21-business-capability-and-value-stream-mapping.md#217-cross-references)

## [22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md)

- [22.1 HA / DR Posture](22-observability-platform-ha-and-dr-design.md#221-ha-dr-posture)
- [22.2 Component HA Matrix](22-observability-platform-ha-and-dr-design.md#222-component-ha-matrix)
- [22.3 Reference HA Topology (Compose, Single Region)](22-observability-platform-ha-and-dr-design.md#223-reference-ha-topology-compose-single-region)
- [22.4 Persistence and Backup](22-observability-platform-ha-and-dr-design.md#224-persistence-and-backup)
- [22.5 DR Patterns](22-observability-platform-ha-and-dr-design.md#225-dr-patterns)
- [22.6 Failure Modes and Mitigations](22-observability-platform-ha-and-dr-design.md#226-failure-modes-and-mitigations)
- [22.7 Self-Monitoring (Meta-Monitor)](22-observability-platform-ha-and-dr-design.md#227-self-monitoring-meta-monitor)
- [22.8 DR Drill Cadence](22-observability-platform-ha-and-dr-design.md#228-dr-drill-cadence)
- [22.9 Cross-References](22-observability-platform-ha-and-dr-design.md#229-cross-references)

## [23. Capacity and Scale Model](23-capacity-and-scale-model.md)

- [23.1 Capacity Drivers](23-capacity-and-scale-model.md#231-capacity-drivers)
- [23.2 Reference Deployment Sizes](23-capacity-and-scale-model.md#232-reference-deployment-sizes)
- [23.3 Worked Sizing Examples](23-capacity-and-scale-model.md#233-worked-sizing-examples)
- [23.4 Scale-Out Triggers](23-capacity-and-scale-model.md#234-scale-out-triggers)
- [23.5 Sizing Calculator (heuristic)](23-capacity-and-scale-model.md#235-sizing-calculator-heuristic)
- [23.6 Cost Projection (illustrative, Azure pricing class)](23-capacity-and-scale-model.md#236-cost-projection-illustrative-azure-pricing-class)
- [23.7 Performance SLOs for the Platform Itself](23-capacity-and-scale-model.md#237-performance-slos-for-the-platform-itself)
- [23.8 Cardinality Budget](23-capacity-and-scale-model.md#238-cardinality-budget)
- [23.9 Cross-References](23-capacity-and-scale-model.md#239-cross-references)

### [24 Appendix A. Threat Model (STRIDE)](24-appendix-a-threat-model.md)

- [24A.1 Purpose](24-appendix-a-threat-model.md#24a1-purpose)
- [24A.2 Methodology](24-appendix-a-threat-model.md#24a2-methodology)
- [24A.3 In-Scope Components](24-appendix-a-threat-model.md#24a3-in-scope-components)
- [24A.4 STRIDE Threat Matrix](24-appendix-a-threat-model.md#24a4-stride-threat-matrix)
- [24A.5 Residual Risk Summary](24-appendix-a-threat-model.md#24a5-residual-risk-summary)
- [24A.6 Open Threats / Action Register](24-appendix-a-threat-model.md#24a6-open-threats-action-register)
- [24A.7 Cross-References](24-appendix-a-threat-model.md#24a7-cross-references)

## [24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md)

- [24.1 Threat Model (STRIDE)](24-observability-platform-security-architecture.md#241-threat-model-stride)
- [24.2 Authentication and Authorisation](24-observability-platform-security-architecture.md#242-authentication-and-authorisation)
- [24.3 Encryption](24-observability-platform-security-architecture.md#243-encryption)
- [24.4 PII Redaction (Concrete Mechanisms)](24-observability-platform-security-architecture.md#244-pii-redaction-concrete-mechanisms)
- [24.5 Audit Trail](24-observability-platform-security-architecture.md#245-audit-trail)
- [24.6 Secrets Management](24-observability-platform-security-architecture.md#246-secrets-management)
- [24.7 Supply-Chain Security](24-observability-platform-security-architecture.md#247-supply-chain-security)
- [24.8 Egress and Data-Residency Controls](24-observability-platform-security-architecture.md#248-egress-and-data-residency-controls)
- [24.9 Hardening Baseline](24-observability-platform-security-architecture.md#249-hardening-baseline)
- [24.10 Cross-References](24-observability-platform-security-architecture.md#2410-cross-references)

## [25. SLO and Error-Budget Framework](25-slo-and-error-budget-framework.md)

- [25.1 Why an SLO Framework](25-slo-and-error-budget-framework.md#251-why-an-slo-framework)
- [25.2 SLI Categories (Choose 1–3 per Service)](25-slo-and-error-budget-framework.md#252-sli-categories-choose-13-per-service)
- [25.3 SLO Target Derivation](25-slo-and-error-budget-framework.md#253-slo-target-derivation)
- [25.4 Error Budget](25-slo-and-error-budget-framework.md#254-error-budget)
- [25.5 Multi-Window Multi-Burn-Rate Alerting](25-slo-and-error-budget-framework.md#255-multi-window-multi-burn-rate-alerting)
- [25.6 Error-Budget Policy](25-slo-and-error-budget-framework.md#256-error-budget-policy)
- [25.7 SLO Authoring Workflow](25-slo-and-error-budget-framework.md#257-slo-authoring-workflow)
- [25.8 Tooling Decision](25-slo-and-error-budget-framework.md#258-tooling-decision)
- [25.9 Alert Quality Scorecard (per service)](25-slo-and-error-budget-framework.md#259-alert-quality-scorecard-per-service)
- [25.10 Cross-References](25-slo-and-error-budget-framework.md#2510-cross-references)

## [26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md)

- [26.1 Onboarding Workflow (Service Owner View)](26-service-onboarding-and-instrumentation-kits.md#261-onboarding-workflow-service-owner-view)
- [26.2 Production-Readiness Review (PRR) Gate](26-service-onboarding-and-instrumentation-kits.md#262-production-readiness-review-prr-gate)
- [26.3 Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md#263-instrumentation-kits)
- [26.4 Role-Based Training](26-service-onboarding-and-instrumentation-kits.md#264-role-based-training)
- [26.5 Knowledge Base](26-service-onboarding-and-instrumentation-kits.md#265-knowledge-base)
- [26.6 Adoption KPIs (rolling)](26-service-onboarding-and-instrumentation-kits.md#266-adoption-kpis-rolling)
- [26.7 Cross-References](26-service-onboarding-and-instrumentation-kits.md#267-cross-references)

## [27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md)

- [27.1 Deployment Topologies](27-multi-tenant-and-customer-site-deployment-model.md#271-deployment-topologies)
- [27.2 Tenant Identity Model](27-multi-tenant-and-customer-site-deployment-model.md#272-tenant-identity-model)
- [27.3 Tenant Labelling Enforcement](27-multi-tenant-and-customer-site-deployment-model.md#273-tenant-labelling-enforcement)
- [27.4 Per-Tenant Data Isolation Guarantees](27-multi-tenant-and-customer-site-deployment-model.md#274-per-tenant-data-isolation-guarantees)
- [27.5 Data-Residency](27-multi-tenant-and-customer-site-deployment-model.md#275-data-residency)
- [27.6 Trace Continuity Across Customer / Xceedance Boundary](27-multi-tenant-and-customer-site-deployment-model.md#276-trace-continuity-across-customer-xceedance-boundary)
- [27.7 Per-Customer-Site DR](27-multi-tenant-and-customer-site-deployment-model.md#277-per-customer-site-dr)
- [27.8 Operational Boundaries (Who Operates What)](27-multi-tenant-and-customer-site-deployment-model.md#278-operational-boundaries-who-operates-what)
- [27.9 Tenant Onboarding Checklist](27-multi-tenant-and-customer-site-deployment-model.md#279-tenant-onboarding-checklist)
- [27.10 Cross-References](27-multi-tenant-and-customer-site-deployment-model.md#2710-cross-references)

## [28. Observability Non-Functional Requirements Register](28-observability-non-functional-requirements.md)

- [28.1 Purpose](28-observability-non-functional-requirements.md#281-purpose)
- [28.2 Scope](28-observability-non-functional-requirements.md#282-scope)
- [28.3 NFR Register](28-observability-non-functional-requirements.md#283-nfr-register)
- [28.4 Verification Methods (Per NFR)](28-observability-non-functional-requirements.md#284-verification-methods-per-nfr)
- [28.5 Evidence Cadence by Category](28-observability-non-functional-requirements.md#285-evidence-cadence-by-category)
- [28.6 Change Control](28-observability-non-functional-requirements.md#286-change-control)
- [28.7 Cross-References](28-observability-non-functional-requirements.md#287-cross-references)

## [29. Observability Long-Term Archival Policy](29-observability-long-term-archival-policy.md)

- [29.1 Purpose](29-observability-long-term-archival-policy.md#291-purpose)
- [29.2 Scope](29-observability-long-term-archival-policy.md#292-scope)
- [29.3 Archival Categories](29-observability-long-term-archival-policy.md#293-archival-categories)
- [29.4 Retention Schedule (Worked View)](29-observability-long-term-archival-policy.md#294-retention-schedule-worked-view)
- [29.5 Storage Architecture](29-observability-long-term-archival-policy.md#295-storage-architecture)
- [29.6 Data Lifecycle](29-observability-long-term-archival-policy.md#296-data-lifecycle)
- [29.7 Privacy Treatment Before Archival](29-observability-long-term-archival-policy.md#297-privacy-treatment-before-archival)
- [29.8 Access Control](29-observability-long-term-archival-policy.md#298-access-control)
- [29.9 Legal Hold](29-observability-long-term-archival-policy.md#299-legal-hold)
- [29.10 Right to Erasure (GDPR Art. 17)](29-observability-long-term-archival-policy.md#2910-right-to-erasure-gdpr-art-17)
- [29.11 Chain of Custody (Forensic / Legal)](29-observability-long-term-archival-policy.md#2911-chain-of-custody-forensic-legal)
- [29.12 Cost Model](29-observability-long-term-archival-policy.md#2912-cost-model)
- [29.13 Data Residency](29-observability-long-term-archival-policy.md#2913-data-residency)
- [29.14 Roles & Responsibilities (Summary)](29-observability-long-term-archival-policy.md#2914-roles-responsibilities-summary)
- [29.15 KPIs](29-observability-long-term-archival-policy.md#2915-kpis)
- [29.16 Cross-References](29-observability-long-term-archival-policy.md#2916-cross-references)

## [30. Observability Programme Risk Register](30-observability-programme-risk-register.md)

- [30.1 Purpose](30-observability-programme-risk-register.md#301-purpose)
- [30.2 Scope](30-observability-programme-risk-register.md#302-scope)
- [30.3 Rating Scheme](30-observability-programme-risk-register.md#303-rating-scheme)
- [30.4 Risk Register (Top Programme Risks)](30-observability-programme-risk-register.md#304-risk-register-top-programme-risks)
- [30.5 Risk Categories (Reference)](30-observability-programme-risk-register.md#305-risk-categories-reference)
- [30.6 Operating the Register](30-observability-programme-risk-register.md#306-operating-the-register)
- [30.7 Known Limitations of v0.1](30-observability-programme-risk-register.md#307-known-limitations-of-v01)
- [30.8 Cross-References](30-observability-programme-risk-register.md#308-cross-references)

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
