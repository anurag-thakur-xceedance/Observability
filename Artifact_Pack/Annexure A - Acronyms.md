# Annexure A — Acronyms & Definitions

[↑ Back to TOC](TOC.md)

> Glossary of acronyms used across the Observability Artifact Pack.
> Cross-reference: full glossary of strategy terms in [Chapter 1. Enterprise Observability Standards Catalog -> Section 13. Glossary (Light References from Strategy Appendix)](1.%20Enterprise%20Observability%20Standards%20Catalog.md#13-glossary-light-references-from-strategy-appendix).

| Acronym | Expansion | Definition / Context |
|---|---|---|
| ADR | Architecture Decision Record | Short document capturing one architecture decision, its context, and consequences. Index in [Chapter 16. Observability ADR Decision Register](16.%20Observability%20ADR%20Decision%20Register.md). |
| ABAC | Attribute-Based Access Control | Access control using attributes (tenant, tier, classification) — see [Chapter 23](23.%20Observability%20Platform%20Security%20Architecture.md). |
| AI | Artificial Intelligence | Used here in the AIOps sense — anomaly detection, RCA suggestion, enriched alerting. |
| AIOps | AI for IT Operations | Application of AI/ML to observability data for detection, correlation, and remediation. See [Chapter 6. AIOps Guardrails and Implementation Playbook](6.%20AIOps%20Guardrails%20and%20Implementation%20Playbook.md). |
| AKS | Azure Kubernetes Service | Microsoft's managed Kubernetes. Referenced historically; superseded by host-portable Compose model. |
| API | Application Programming Interface | Network-callable service interface; instrumented via OpenTelemetry. |
| ARB | Architecture Review Board | Governance body that reviews architecture decisions and ratifies ADRs. See [Chapter 15. Observability Governance Charter and ARB Pack](15.%20Observability%20Governance%20Charter%20and%20ARB%20Pack.md). |
| CC | Common Criteria | Used here as SOC2 control-category prefix (e.g. "CC ID" = SOC2 control reference). |
| CD | Continuous Delivery | Automated deployment pipeline downstream of CI. |
| CI | Continuous Integration | Automated build/test pipeline triggered on commit. |
| CPU | Central Processing Unit | Compute capacity metric (utilization %). |
| CSAT | Customer Satisfaction | Business KPI used to validate observability outcomes. |
| CX | Customer Experience | User-facing quality metric. |
| DB | Database | Generic term for data store; see [Chapter 1 Section 7. Database Telemetry Standards](1.%20Enterprise%20Observability%20Standards%20Catalog.md#7-database-telemetry-standards). |
| DDoS | Distributed Denial of Service | Network-saturation attack; relevant to packet-drop and latency telemetry. |
| DevOps | Development + Operations | Cultural/operational model that observability supports. |
| DNS | Domain Name System | Name-resolution service; failure rate is a network telemetry signal. |
| EKS | Elastic Kubernetes Service | AWS's managed Kubernetes. Referenced historically; superseded by host-portable Compose model. |
| ERD | Entity-Relationship Diagram | Data-model diagram pending in [Chapter 19. Observability Data Model Specification](19.%20Observability%20Data%20Model%20Specification.md). |
| FaaS | Function as a Service | Serverless runtime; cold-start latency target < 300 ms. |
| FinOps | Financial Operations | Discipline for managing cloud/observability cost. See [Chapter 9. Observability FinOps Standard](9.%20Observability%20FinOps%20Standard.md). |
| FP | False Positive | AIOps quality metric; guardrail target < 5%. |
| GDPR | General Data Protection Regulation | EU data-protection law; drives PII handling and retention rules. |
| GKE | Google Kubernetes Engine | Google Cloud's managed Kubernetes. Referenced historically; superseded by host-portable Compose model. |
| GitOps | Git-based Operations | Operational model where Git is the source of truth for configuration and alert rules. |
| ID | Identifier | Generic identifier (e.g. trace ID, span ID, control ID). |
| IaC | Infrastructure as Code | Code-defined infrastructure provisioning. See [Chapter 7. IaC for Observability Standard](7.%20IaC%20for%20Observability%20Standard.md). |
| IdP | Identity Provider | Authentication system used in pre-login telemetry (e.g. Okta, Azure AD). |
| IO | Input/Output | Disk or network throughput dimension. |
| ISO | International Organization for Standardization | Standards body; ISO 27001 referenced for compliance mapping. |
| JSON | JavaScript Object Notation | Schema/serialization format used in telemetry export and data-model spec. |
| KPI | Key Performance Indicator | Measurable success metric. See [Chapter 11. Observability KPI Scorecard](11.%20Observability%20KPI%20Scorecard.md). |
| MFA | Multi-Factor Authentication | Pre-login telemetry signal — failure rate and latency tracked. |
| ML | Machine Learning | Underlies AIOps anomaly detection and forecasting. |
| MTBF | Mean Time Between Failures | Reliability metric for hosts/services. |
| MTTD | Mean Time To Detect | KPI: how quickly an incident is detected from telemetry. |
| MTTR | Mean Time To Resolve | KPI: how quickly an incident is resolved end-to-end. |
| MySQL | (product name) | Open-source relational database; used in retention-policy worked examples. |
| NIC | Network Interface Card | Host-level network telemetry source. |
| OCR | Optical Character Recognition | Referenced for un-extracted diagram content in source `.docx`. |
| OOM | Out Of Memory | Container/process failure mode tracked by infra telemetry. |
| OS | Operating System | Host platform layer. |
| OTLP | OpenTelemetry Protocol | Wire protocol for telemetry export between instrumented services and collectors. |
| OTel | OpenTelemetry | Vendor-neutral telemetry standard (metrics, logs, traces). |
| P95 / P99 | 95th / 99th Percentile | Latency-distribution metrics; preferred over averages for SLA monitoring. |
| PIR | Post-Incident Review | Structured review after Critical incidents; output retained 1 year. See [Chapter 12 Section 6. Post-Incident Review (PIR)](12.%20Incident%20Response%20Playbook.md#6-post-incident-review-pir). |
| PII | Personally Identifiable Information | Data class subject to PII redaction rules. See [Chapter 17 Section 6. PII & Data Classification](17.%20Application%20Telemetry%20Standard.md#6-pii-data-classification). |
| PaaS | Platform as a Service | Managed-platform deployment model. |
| RBAC | Role-Based Access Control | Access control model for telemetry stores and dashboards. |
| RCA | Root Cause Analysis | Diagnostic activity; AIOps generates RCA suggestions. |
| ROI | Return on Investment | Business KPI to validate observability spend. |
| RPO | Recovery Point Objective | Maximum acceptable data loss window for recovery. |
| RTO | Recovery Time Objective | Maximum acceptable downtime window for recovery. |
| SDG | Solution Design Group | Governance review forum. |
| SDK | Software Development Kit | Language-specific OpenTelemetry library used to instrument services. |
| SIEM | Security Information and Event Management | Security log/correlation platform; potential telemetry consumer. |
| SLA | Service Level Agreement | Contractual reliability/performance commitment. |
| SLI | Service Level Indicator | Specific measured signal (e.g. P95 latency) backing an SLO. |
| SLO | Service Level Objective | Internal reliability target (e.g. 99.9% availability). |
| SME | Subject Matter Expert | Domain specialist consulted during artifact authoring. |
| SOC2 | Service Organization Control 2 | AICPA security/availability audit framework; mapped in [Chapter 10. Compliance and Audit Control Matrix](10.%20Compliance%20and%20Audit%20Control%20Matrix.md). |
| SRE | Site Reliability Engineering | Operational discipline; primary consumer of infra and platform telemetry. |
| SaaS | Software as a Service | Hosted-application delivery model. |
| TBD | To Be Determined | Placeholder for content awaiting decision. |
| TCP | Transmission Control Protocol | Transport-layer protocol; retransmission rate is a network telemetry signal. |
| URL | Uniform Resource Locator | Web address. |
| UX | User Experience | User-perceived quality dimension. |
| VM | Virtual Machine | Compute host (replaces "node" in the host-portable model). |
| CoP | Community of Practice | Working-level forum that operationalises observability standards. See [Chapter 18 §4.1](18.%20Observability%20Operating%20Model%20and%20Adoption%20Plan.md#41-community-of-practice). |
| CSF | Cybersecurity Framework | NIST framework used to structure governance risk register. |
| DORA | Digital Operational Resilience Act | EU financial-sector regulation; emerging compliance driver. |
| eBPF | extended Berkeley Packet Filter | Kernel-level instrumentation enabling auto-instrumentation (Beyla, Pixie). See [Chapter 2 §4.1](2.%20Observability%20Reference%20Architecture.md#41-auto-instrumentation-via-ebpf). |
| HA | High Availability | Architecture pattern; covered in [Chapter 21](21.%20Observability%20Platform%20HA%20and%20DR%20Design.md). |
| DR | Disaster Recovery | Architecture pattern; covered in [Chapter 21](21.%20Observability%20Platform%20HA%20and%20DR%20Design.md). |
| HIPAA | Health Insurance Portability and Accountability Act | US healthcare regulation; out of scope today. |
| LLM | Large Language Model | Generative AI model class. AI safety controls in [Chapter 6 §8](6.%20AIOps%20Guardrails%20and%20Implementation%20Playbook.md#8-ai-safety-explainability-and-llm-data-leakage). |
| MLOps | Machine Learning Operations | Lifecycle for ML models. AIOps lifecycle in [Chapter 6 §7](6.%20AIOps%20Guardrails%20and%20Implementation%20Playbook.md#7-mlops-lifecycle-for-aiops-models). |
| mTLS | mutual TLS | Two-way TLS authentication between services. Required between collectors and backends. |
| NIS2 | Network and Information Systems Directive 2 | EU cyber-resilience directive. |
| NPS | Net Promoter Score | Adoption KPI for engineer satisfaction with the platform. |
| PCI DSS | Payment Card Industry Data Security Standard | Card-data protection standard. Conditional scope. |
| PRR | Production Readiness Review | Gate that a service must pass before going to production. See [Chapter 25](25.%20Service%20Onboarding%20and%20Instrumentation%20Kits.md). |
| RACI | Responsible / Accountable / Consulted / Informed | Decision-rights matrix model. See [Chapter 15 §4.1](15.%20Observability%20Governance%20Charter%20and%20ARB%20Pack.md#41-raci-matrix). |
| RAG | Retrieval-Augmented Generation | LLM technique citing retrieved sources rather than free generation. |
| RED | Rate, Errors, Duration | Service-monitoring method (Tom Wilkie). |
| RFC | Request for Comments | CoP-level proposal stage that may become an ADR. |
| RUM | Real User Monitoring | Browser-side telemetry capturing real user experience. |
| SBOM | Software Bill of Materials | Inventory of components/dependencies; supply-chain control. |
| SHAP | SHapley Additive exPlanations | Feature-attribution technique used for AI explainability. |
| SOC | Security Operations Centre | Security team consuming security-relevant telemetry. |
| STRIDE | Spoofing, Tampering, Repudiation, Info disclosure, DoS, Elevation of privilege | Threat-modelling taxonomy. |
| TSC | Trust Services Criteria | SOC 2 criteria categories (Security, Availability, etc.). |
| USE | Utilization, Saturation, Errors | Resource-monitoring method (Brendan Gregg). |

---

[↑ Back to TOC](TOC.md)
