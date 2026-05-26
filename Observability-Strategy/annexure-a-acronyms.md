---
title: Annexure A — Acronyms & Definitions
chapter: Annexure A
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# Annexure A — Acronyms & Definitions

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Reviewed Date | Status |
|---|---|---|---|---|
| 0.1 | TBD | Internal |  | Draft |
> Glossary of acronyms used across the Observability Artifact Pack.
> Cross-reference: conceptual definitions in [Annexure B. Concepts Glossary](annexure-b-concepts-glossary.md).

| Acronym | Expansion | Definition / Context |
|---|---|---|
| ABAC | Attribute-Based Access Control | Access control using attributes (tenant, tier, classification) — see [24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md). |
| ADR | Architecture Decision Record | Short document capturing one architecture decision, its context, and consequences. Index in [17. Observability ADR Decision Register](17-observability-adr-decision-register.md). |
| AI | Artificial Intelligence | Used here in the AIOps sense — anomaly detection, RCA suggestion, enriched alerting. |
| AIOps | AI for IT Operations | Application of AI/ML to observability data for detection, correlation, and remediation. See [7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md). |
| AKS | Azure Kubernetes Service | Microsoft's managed Kubernetes. Acceptable as an internal deployment target where it fits the environment. |
| API | Application Programming Interface | Network-callable service interface; instrumented via OpenTelemetry. |
| ARB | Architecture Review Board | Governance body that reviews architecture decisions and ratifies ADRs. See [16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md). |
| CC | Common Criteria | Used here as SOC2 control-category prefix (e.g. "CC ID" = SOC2 control reference). |
| CD | Continuous Delivery | Automated deployment pipeline downstream of CI. |
| CI | Continuous Integration | Automated build/test pipeline triggered on commit. |
| CoP | Community of Practice | Working-level forum that operationalises observability standards. See [Chapter 19. Observability Operating Model and Adoption Plan -> Section 19.4.4 Community of Practice](19-observability-operating-model-and-adoption-plan.md#1944-community-of-practice). |
| CPU | Central Processing Unit | Compute capacity metric (utilization %). |
| CSAT | Customer Satisfaction | Business KPI used to validate observability outcomes. |
| CSF | Cybersecurity Framework | NIST framework used to structure governance risk register. |
| CX | Customer Experience | User-facing quality metric. |
| DB | Database | Generic term for data store; see [Chapter 2. Enterprise Observability Standards Catalog -> Section 2.7 Database Telemetry Standards](02-enterprise-observability-standards-catalog.md#27-database-telemetry-standards). |
| DDoS | Distributed Denial of Service | Network-saturation attack; relevant to packet-drop and latency telemetry. |
| DevOps | Development + Operations | Cultural/operational model that observability supports. |
| DNS | Domain Name System | Name-resolution service; failure rate is a network telemetry signal. |
| DORA | Digital Operational Resilience Act | EU financial-sector regulation; emerging compliance driver. |
| DR | Disaster Recovery | Architecture pattern; covered in [22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md). |
| eBPF | extended Berkeley Packet Filter | Kernel-level instrumentation enabling auto-instrumentation (Beyla, Pixie). See [Chapter 3. Observability Reference Architecture -> Section 3.4.1 eBPF for Legacy and Non-Intrusive Instrumentation](03-observability-reference-architecture.md#341-ebpf-for-legacy-and-non-intrusive-instrumentation). |
| EKS | Elastic Kubernetes Service | AWS's managed Kubernetes. One possible managed-cluster deployment target depending on environment needs. |
| ERD | Entity-Relationship Diagram | Data-model diagram pending in [20. Observability Data Model Specification](20-observability-data-model-specification.md). |
| FaaS | Function as a Service | Serverless runtime; cold-start latency target < 300 ms. |
| FinOps | Financial Operations | Discipline for managing cloud/observability cost. See [10. Observability FinOps Standard](10-observability-finops-standard.md). |
| FP | False Positive | AIOps quality metric; guardrail target < 5%. |
| GDPR | General Data Protection Regulation | EU data-protection law; drives PII handling and retention rules. |
| GitOps | Git-based Operations | Operational model where Git is the source of truth for configuration and alert rules. |
| GKE | Google Kubernetes Engine | Google Cloud's managed Kubernetes. One possible managed-cluster deployment target depending on environment needs. |
| HA | High Availability | Architecture pattern; covered in [22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md). |
| HIPAA | Health Insurance Portability and Accountability Act | US healthcare regulation; out of scope today. |
| IaC | Infrastructure as Code | Code-defined infrastructure provisioning. See [8. IaC for Observability Standard](08-iac-for-observability-standard.md). |
| ID | Identifier | Generic identifier (e.g. trace ID, span ID, control ID). |
| IdP | Identity Provider | Authentication system used in pre-login telemetry (e.g. Okta, Azure AD). |
| IO | Input/Output | Disk or network throughput dimension. |
| ISO | International Organization for Standardization | Standards body; ISO 27001 referenced for compliance mapping. |
| JSON | JavaScript Object Notation | Schema/serialization format used in telemetry export and data-model spec. |
| KPI | Key Performance Indicator | Measurable success metric. See [12. Observability KPI Scorecard](12-observability-kpi-scorecard.md). |
| LLM | Large Language Model | Generative AI model class. AI safety controls in [Chapter 7. AIOps Guardrails and Implementation Playbook -> Section 7.8 AI Safety, Explainability, and LLM Data Leakage](07-aiops-guardrails-and-implementation-playbook.md#78-ai-safety-explainability-and-llm-data-leakage). |
| MFA | Multi-Factor Authentication | Pre-login telemetry signal — failure rate and latency tracked. |
| ML | Machine Learning | Underlies AIOps anomaly detection and forecasting. |
| MLOps | Machine Learning Operations | Lifecycle for ML models. AIOps lifecycle in [Chapter 7. AIOps Guardrails and Implementation Playbook -> Section 7.7 MLOps Lifecycle for AIOps Models](07-aiops-guardrails-and-implementation-playbook.md#77-mlops-lifecycle-for-aiops-models). |
| MTBF | Mean Time Between Failures | Reliability metric for hosts/services. |
| mTLS | mutual TLS | Two-way TLS authentication between services. Required between collectors and backends. |
| MTTD | Mean Time To Detect | KPI: how quickly an incident is detected from telemetry. |
| MTTR | Mean Time To Resolve | KPI: how quickly an incident is resolved end-to-end. |
| MySQL | (product name) | Open-source relational database; used in retention-policy worked examples. |
| NIC | Network Interface Card | Host-level network telemetry source. |
| NIS2 | Network and Information Systems Directive 2 | EU cyber-resilience directive. |
| NPS | Net Promoter Score | Adoption KPI for engineer satisfaction with the platform. |
| OCR | Optical Character Recognition | Referenced for un-extracted diagram content in source `.docx`. |
| OOM | Out Of Memory | Container/process failure mode tracked by infra telemetry. |
| OS | Operating System | Host platform layer. |
| OTel | OpenTelemetry | Vendor-neutral telemetry standard (metrics, logs, traces). |
| OTLP | OpenTelemetry Protocol | Wire protocol for telemetry export between instrumented services and collectors. |
| P95 / P99 | 95th / 99th Percentile | Latency-distribution metrics; preferred over averages for SLA monitoring. |
| PaaS | Platform as a Service | Managed-platform deployment model. |
| PCI DSS | Payment Card Industry Data Security Standard | Card-data protection standard. Conditional scope. |
| PII | Personally Identifiable Information | Data class subject to PII redaction rules. See [Chapter 18. Application Telemetry Standard -> Section 18.6 PII & Data Classification](18-application-telemetry-standard.md#186-pii-data-classification). |
| PIR | Post-Incident Review | Structured review after Critical incidents; output retained 1 year. See [Chapter 13. Incident Response Playbook (Telemetry to Resolution) -> Section 13.6 Post-Incident Review (PIR)](13-incident-response-playbook.md#136-post-incident-review-pir). |
| PRR | Production Readiness Review | Gate that a service must pass before going to production. See [26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md). |
| RACI | Responsible / Accountable / Consulted / Informed | Decision-rights matrix model. See [Chapter 16. Observability Governance Charter and ARB Pack -> Section 16.4.1 RACI Matrix](16-observability-governance-charter-and-arb-pack.md#1641-raci-matrix). |
| RAG | Retrieval-Augmented Generation | LLM technique citing retrieved sources rather than free generation. |
| RBAC | Role-Based Access Control | Access control model for telemetry stores and dashboards. |
| RCA | Root Cause Analysis | Diagnostic activity; AIOps generates RCA suggestions. |
| RED | Rate, Errors, Duration | Service-monitoring method (Tom Wilkie). |
| RFC | Request for Comments | CoP-level proposal stage that may become an ADR. |
| ROI | Return on Investment | Business KPI to validate observability spend. |
| RPO | Recovery Point Objective | Maximum acceptable data loss window for recovery. |
| RTO | Recovery Time Objective | Maximum acceptable downtime window for recovery. |
| RUM | Real User Monitoring | Browser-side telemetry capturing real user experience. |
| SaaS | Software as a Service | Hosted-application delivery model. |
| SBOM | Software Bill of Materials | Inventory of components/dependencies; supply-chain control. |
| SDG | Solution Design Group | Governance review forum. |
| SDK | Software Development Kit | Language-specific OpenTelemetry library used to instrument services. |
| SHAP | SHapley Additive exPlanations | Feature-attribution technique used for AI explainability. |
| SIEM | Security Information and Event Management | Security log/correlation platform; potential telemetry consumer. |
| SLA | Service Level Agreement | Contractual reliability/performance commitment. |
| SLI | Service Level Indicator | Specific measured signal (e.g. P95 latency) backing an SLO. |
| SLO | Service Level Objective | Internal reliability target (e.g. 99.9% availability). |
| SME | Subject Matter Expert | Domain specialist consulted during artifact authoring. |
| SOC | Security Operations Centre | Security team consuming security-relevant telemetry. |
| SOC2 | Service Organization Control 2 | AICPA security/availability audit framework; mapped in [11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md). |
| SRE | Site Reliability Engineering | Operational discipline; primary consumer of infra and platform telemetry. |
| STRIDE | Spoofing, Tampering, Repudiation, Info disclosure, DoS, Elevation of privilege | Threat-modelling taxonomy. |
| TBD | To Be Determined | Placeholder for content awaiting decision. |
| TCP | Transmission Control Protocol | Transport-layer protocol; retransmission rate is a network telemetry signal. |
| TSC | Trust Services Criteria | SOC 2 criteria categories (Security, Availability, etc.). |
| URL | Uniform Resource Locator | Web address. |
| USE | Utilization, Saturation, Errors | Resource-monitoring method (Brendan Gregg). |
| UX | User Experience | User-perceived quality dimension. |
| VM | Virtual Machine | Compute host (replaces "node" in the host-portable model). |

---

[↑ Back to TOC](toc.md)
