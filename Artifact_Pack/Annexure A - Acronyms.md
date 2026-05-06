# Annexure A — Acronyms & Definitions

> Glossary of acronyms used across the Observability Artifact Pack.
> Cross-reference: full glossary of strategy terms in [Chapter 1. Enterprise Observability Standards Catalog -> Section 13. Glossary (Light References from Strategy Appendix)](1.%20Enterprise%20Observability%20Standards%20Catalog.md#13-glossary-light-references-from-strategy-appendix).

| Acronym | Expansion | Definition / Context |
|---|---|---|
| ADR | Architecture Decision Record | Short document capturing one architecture decision, its context, and consequences. Index in [Chapter 16. Observability ADR Decision Register](16.%20Observability%20ADR%20Decision%20Register.md). |
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
