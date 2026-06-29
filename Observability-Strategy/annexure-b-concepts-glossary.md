---
title: Annexure B — Concepts Glossary
chapter: Annexure B
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# Annexure B — Concepts Glossary

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](annexure-a-acronyms.md) | [Next Page](annexure-c-threat-model.md)

| **Document Owner** | CoE-Architecture |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **First Review** | 1-Aug-2026 |
| **Next Review Due** | 1-Nov-2026 |

## 1.0 Reader Guide

Use this annexure to understand the **concepts and mental models** that recur across the Observability Artifact Pack.

- Use [Annexure A. Acronyms & Definitions](annexure-a-acronyms.md) when you only need acronym expansion.
- Use the "Where it is used" column to jump to chapters that apply each concept.

| Term | Definition | Where it is used |
|---|---|---|
| **Black-box monitoring** | Observing a system from the outside (synthetic probes, external uptime checks) without knowledge of internals. | [Chapter 3. Observability Reference Architecture](03-observability-reference-architecture.md), [Chapter 25. SLO and Error-Budget Framework](25-slo-and-error-budget-framework.md) |
| **Burn rate** | The speed at which an error budget is being consumed. In this pack, used to decide whether an SLO breach should page immediately, create a ticket, or stay dashboard-only. Example: burn rate 14.4 means a 30-day budget would be consumed in about 2 days. | [Chapter 25. SLO and Error-Budget Framework -> Section 25.5 Multi-Window Multi-Burn-Rate Alerting](25-slo-and-error-budget-framework.md#255-multi-window-multi-burn-rate-alerting) |
| **Cardinality** | The number of distinct label-combinations (time series) a metric produces. High cardinality is the #1 Prometheus failure mode. | [Chapter 2. Enterprise Observability Standards Catalogue -> Section 2.3.4 Cardinality Governance](02-enterprise-observability-standards-catalog.md#234-cardinality-governance), [Chapter 23. Capacity and Scale Model](23-capacity-and-scale-model.md) |
| **Cardinality budget** | Maximum allowed series count per service / per metric, enforced via collector processors and recording-rule monitoring. | [Chapter 23. Capacity and Scale Model -> Section 23.8 Cardinality Budget](23-capacity-and-scale-model.md#238-cardinality-budget) |
| **Dead-letter stream (DLQ)** | A holding area for invalid telemetry records. In this pack, used to diagnose schema violations, PII violations, or malformed signals instead of silently dropping them. | [Chapter 20. Observability Data Model Specification -> Section 20.9.6 Dead-Letter Discipline for Schema Violations](20-observability-data-model-specification.md#2096-dead-letter-discipline-for-schema-violations) |
| **Deployment-model-aware** | Observability standards remain consistent across environments while deployment implementation may differ by runtime, platform, and operational context. | [Chapter 3. Observability Reference Architecture -> Section 3.6 Containerized Deployment Design](03-observability-reference-architecture.md#36-containerized-deployment-design) |
| **Error budget** | The amount of unreliability the SLO permits before remediation action is required. Equal to `(1 − SLO) × total events in window`. | [Chapter 25. SLO and Error-Budget Framework -> Section 25.4 Error Budget](25-slo-and-error-budget-framework.md#254-error-budget) |
| **Error-budget policy** | The pre-agreed organisational response when error-budget consumption crosses thresholds (feature freeze, escalation, etc.). | [Chapter 25. SLO and Error-Budget Framework -> Section 25.6 Error-Budget Policy](25-slo-and-error-budget-framework.md#256-error-budget-policy) |
| **Exemplar** | A single representative trace span attached to a metric data point, allowing one-click navigation from "this latency spike" to "this exact trace". | [Chapter 18. Application Telemetry Standard](18-application-telemetry-standard.md), [Chapter 6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md) |
| **Five Pillars** | Metrics, Logs, Traces, Changes, Profiles. | [Chapter 2. Enterprise Observability Standards Catalogue -> Section 2.2 The Five Pillars of Telemetry](02-enterprise-observability-standards-catalog.md#22-the-five-pillars-of-telemetry) |
| **Golden Signals** | Latency, Traffic, Errors, Saturation. Google's four primary user-facing service signals. | [Chapter 6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md), [Chapter 25. SLO and Error-Budget Framework](25-slo-and-error-budget-framework.md) |
| **Head-based sampling** | Sampling decision made at the start of a trace; cheap but blind to which traces will turn out interesting. | [Chapter 18. Application Telemetry Standard](18-application-telemetry-standard.md), [Chapter 3. Observability Reference Architecture](03-observability-reference-architecture.md) |
| **Minimum observability check** | CI gate that fails a pipeline if a service lacks minimum SLOs, alert rules, dashboards, or runbooks before promotion. | [Chapter 26. Service Onboarding and Instrumentation Kits -> Section 26.2.1 "Minimum Observability" CI Check](26-service-onboarding-and-instrumentation-kits.md#2621-minimum-observability-ci-check) |
| **Multi-window multi-burn-rate alerting** | The Google SRE pattern of pairing a long-window and short-window burn-rate alert to balance precision and recall. | [Chapter 25. SLO and Error-Budget Framework -> Section 25.5 Multi-Window Multi-Burn-Rate Alerting](25-slo-and-error-budget-framework.md#255-multi-window-multi-burn-rate-alerting) |
| **Observability** | The ability to ask arbitrary new questions of a system from its outputs alone, without shipping new code. Distinct from monitoring, which checks pre-defined questions. | [Chapter 1. Xceedance Observability Strategy -> Section 1.1 Executive Summary](01-xceedance-observability-strategy.md#11-executive-summary) |
| **Policy-as-code (for observability)** | Machine-evaluated rules for observability standards. In this pack, used to enforce correlation propagation, 5xx logging context, and cardinality budgets in CI/CD rather than relying only on manual review. | [Chapter 8. IaC for Observability Standard -> Section 8.1.1 Policy-as-Code for Telemetry Invariants](08-iac-for-observability-standard.md#811-policy-as-code-for-telemetry-invariants) |
| **PRR (Production Readiness Review)** | The gate that determines whether a service is ready to be promoted to production. | [Chapter 26. Service Onboarding and Instrumentation Kits -> Section 26.2 Production-Readiness Review (PRR) Gate](26-service-onboarding-and-instrumentation-kits.md#262-production-readiness-review-prr-gate) |
| **RED method** | Rate, Errors, Duration — the three signals every request-driven service should expose. | [Chapter 6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md), [Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md) |
| **Resource attributes** | OTel concept: identity-bearing attributes attached to every signal (`service.name`, `service.version`, `deployment.environment`, etc.). | [Chapter 18. Application Telemetry Standard](18-application-telemetry-standard.md), [Chapter 27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md) |
| **Service tier** | A criticality class from T1 to T4. In this pack, used to determine instrumentation depth, SLO strictness, retention, alerting policy, and on-call coverage. | [Chapter 2. Enterprise Observability Standards Catalogue -> Section 2.4.1 Service Tiering Model](02-enterprise-observability-standards-catalog.md#241-service-tiering-model), [Chapter 21. Business Capability and Value-Stream Mapping](21-business-capability-and-value-stream-mapping.md) |
| **SLA** | Service Level Agreement — externally-binding contractual commitment, looser than the internal SLO. | [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md) |
| **SLI** | Service Level Indicator — a measured signal (e.g., P95 latency). | [Chapter 25. SLO and Error-Budget Framework -> Section 25.2 SLI Categories (Choose 1–3 per Service)](25-slo-and-error-budget-framework.md#252-sli-categories-choose-13-per-service) |
| **SLO** | Service Level Objective — internal target on an SLI (e.g., "99.9% over 30d"). | [Chapter 25. SLO and Error-Budget Framework](25-slo-and-error-budget-framework.md) |
| **Tail-based sampling** | Sampling after a trace completes. In this pack, used to keep high-value traces such as errors and slow requests while reducing storage cost. | [Chapter 18. Application Telemetry Standard](18-application-telemetry-standard.md), [Chapter 3. Observability Reference Architecture](03-observability-reference-architecture.md) |
| **Telemetry** | Any data emitted by a system about its own operation: metrics, logs, traces, events, profiles. | [Chapter 2. Enterprise Observability Standards Catalogue](02-enterprise-observability-standards-catalog.md) |
| **Telemetry health** | The quality of the telemetry stream itself. In this pack, used to detect missing traces, stuck gauges, flat counters, schema failures, and timestamp skew before they corrupt dashboards or alerts. | [Chapter 20. Observability Data Model Specification -> Section 20.8 Telemetry Health and Data-Quality Monitoring](20-observability-data-model-specification.md#208-telemetry-health-and-data-quality-monitoring), [Chapter 6. Grafana Platform Standard and Visualisation Playbook -> Section 6.7 Telemetry Health Dashboard Standard](06-grafana-platform-standard-and-visualisation-playbook.md#67-telemetry-health-dashboard-standard) |
| **Tenant** | A logical customer or organisational boundary across which data must be isolated. | [Chapter 27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md) |
| **Trace context (W3C)** | Standard headers (`traceparent`, `tracestate`) that carry trace identity across service boundaries. | [Chapter 18. Application Telemetry Standard](18-application-telemetry-standard.md), [Chapter 27. Multi-Tenant and Customer-Site Deployment Model -> Section 27.6 Trace Continuity Across Customer / Xceedance Boundary](27-multi-tenant-and-customer-site-deployment-model.md#276-trace-continuity-across-customer-xceedance-boundary) |
| **Universal observability** | Consistent telemetry across all runtimes and deployment models. In this pack, used to mean common metrics, logs, traces, and events with deployment-specific collection and residency patterns. | [Chapter 1. Xceedance Observability Strategy -> Section 1.1 Executive Summary](01-xceedance-observability-strategy.md#11-executive-summary), [Chapter 3. Observability Reference Architecture -> Section 3.1 Architectural Principles](03-observability-reference-architecture.md#31-architectural-principles) |
| **USE method** | Utilisation, Saturation, Errors — the three signals every resource (CPU, memory, disk, network) should expose. | [Chapter 2. Enterprise Observability Standards Catalogue -> Section 2.4 Infrastructure Telemetry Standards](02-enterprise-observability-standards-catalog.md#24-infrastructure-telemetry-standards), [Chapter 6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md) |
| **White-box monitoring** | Observing a system from inside (instrumented code, internal metrics) — the bulk of OpenTelemetry. | [Chapter 3. Observability Reference Architecture](03-observability-reference-architecture.md), [Chapter 18. Application Telemetry Standard](18-application-telemetry-standard.md) |

---

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](annexure-a-acronyms.md) | [Next Page](annexure-c-threat-model.md)
