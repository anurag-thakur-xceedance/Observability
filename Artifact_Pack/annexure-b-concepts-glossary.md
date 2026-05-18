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

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Reviewed Date | Status |
|---|---|---|---|---|
| 0.1 | TBD | Internal |  | Draft |
> Conceptual glossary (as opposed to acronym expansions in [Annexure A](annexure-a-acronyms.md)). Defines the terms and mental models used across the Observability Artifact Pack.

| Term | Definition | Where it is used |
|---|---|---|
| **Black-box monitoring** | Observing a system from the outside (synthetic probes, external uptime checks) without knowledge of internals. | [3. Observability Reference Architecture](03-observability-reference-architecture.md), [25. SLO and Error-Budget Framework](25-slo-and-error-budget-framework.md) |
| **Burn rate** | The rate at which an error budget is being consumed, expressed as a multiplier of the rate that would consume the entire budget over the SLO window. A burn rate of 14.4 over 1 h would consume a 30-day budget in ~2 days. | [Chapter 25. SLO and Error-Budget Framework -> Section 25.5 Multi-Window Multi-Burn-Rate Alerting](25-slo-and-error-budget-framework.md#255-multi-window-multi-burn-rate-alerting) |
| **Cardinality** | The number of distinct label-combinations (time series) a metric produces. High cardinality is the #1 Prometheus failure mode. | [Chapter 2. Enterprise Observability Standards Catalog -> Section 2.3.4 Cardinality Governance](02-enterprise-observability-standards-catalog.md#234-cardinality-governance), [23. Capacity and Scale Model](23-capacity-and-scale-model.md) |
| **Cardinality budget** | Maximum allowed series count per service / per metric, enforced via collector processors and recording-rule monitoring. | [Chapter 23. Capacity and Scale Model -> Section 23.8 Cardinality Budget](23-capacity-and-scale-model.md#238-cardinality-budget) |
| **Error budget** | The amount of unreliability the SLO permits before remediation action is required. Equal to `(1 − SLO) × total events in window`. | [Chapter 25. SLO and Error-Budget Framework -> Section 25.4 Error Budget](25-slo-and-error-budget-framework.md#254-error-budget) |
| **Error-budget policy** | The pre-agreed organisational response when error-budget consumption crosses thresholds (feature freeze, escalation, etc.). | [Chapter 25. SLO and Error-Budget Framework -> Section 25.6 Error-Budget Policy](25-slo-and-error-budget-framework.md#256-error-budget-policy) |
| **Exemplar** | A single representative trace span attached to a metric data point, allowing one-click navigation from "this latency spike" to "this exact trace". | [18. Application Telemetry Standard](18-application-telemetry-standard.md), [6. Grafana Platform Standard and Visualization Playbook](06-grafana-platform-standard-and-visualization-playbook.md) |
| **Five Pillars** | Metrics, Logs, Traces, Changes, Profiles. | [Chapter 2. Enterprise Observability Standards Catalog -> Section 2.2 The Five Pillars of Telemetry](02-enterprise-observability-standards-catalog.md#22-the-five-pillars-of-telemetry) |
| **Golden Signals** | Latency, Traffic, Errors, Saturation. Google's four primary user-facing service signals. | [6. Grafana Platform Standard and Visualization Playbook](06-grafana-platform-standard-and-visualization-playbook.md), [25. SLO and Error-Budget Framework](25-slo-and-error-budget-framework.md) |
| **Head-based sampling** | Sampling decision made at the start of a trace; cheap but blind to which traces will turn out interesting. | [18. Application Telemetry Standard](18-application-telemetry-standard.md), [3. Observability Reference Architecture](03-observability-reference-architecture.md) |
| **Host-portable** | Capable of running on any Linux/Windows host with Docker Engine, regardless of where the host lives (on-prem, customer site, cloud VM). Replaces the earlier "multi-cloud K8s" framing. | [Chapter 3. Observability Reference Architecture -> Section 3.6 Host-Portable Deployment Design](03-observability-reference-architecture.md#36-host-portable-deployment-design) |
| **Multi-window multi-burn-rate alerting** | The Google SRE pattern of pairing a long-window and short-window burn-rate alert to balance precision and recall. | [Chapter 25. SLO and Error-Budget Framework -> Section 25.5 Multi-Window Multi-Burn-Rate Alerting](25-slo-and-error-budget-framework.md#255-multi-window-multi-burn-rate-alerting) |
| **Observability** | The ability to ask arbitrary new questions of a system from its outputs alone, without shipping new code. Distinct from monitoring, which checks pre-defined questions. | [Chapter 1. Xceedance Observability Strategy -> Section 1.1 Executive Summary](01-xceedance-observability-strategy.md#11-executive-summary) |
| **PRR (Production Readiness Review)** | The gate that determines whether a service is ready to be promoted to production. | [Chapter 26. Service Onboarding and Instrumentation Kits -> Section 26.2 Production-Readiness Review (PRR) Gate](26-service-onboarding-and-instrumentation-kits.md#262-production-readiness-review-prr-gate) |
| **RED method** | Rate, Errors, Duration — the three signals every request-driven service should expose. | [6. Grafana Platform Standard and Visualization Playbook](06-grafana-platform-standard-and-visualization-playbook.md), [26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md) |
| **Resource attributes** | OTel concept: identity-bearing attributes attached to every signal (`service.name`, `service.version`, `deployment.environment`, etc.). | [18. Application Telemetry Standard](18-application-telemetry-standard.md), [27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md) |
| **Service tier** | Criticality classification (T1–T4) that drives instrumentation depth, SLO strictness, retention, alerting policy, and on-call coverage. | [Chapter 2. Enterprise Observability Standards Catalog -> Section 2.4.1 Service Tiering Model](02-enterprise-observability-standards-catalog.md#241-service-tiering-model), [21. Business Capability and Value-Stream Mapping](21-business-capability-and-value-stream-mapping.md) |
| **SLI** | Service Level Indicator — a measured signal (e.g., P95 latency). | [Chapter 25. SLO and Error-Budget Framework -> Section 25.2 SLI Categories (Choose 1–3 per Service)](25-slo-and-error-budget-framework.md#252-sli-categories-choose-13-per-service) |
| **SLO** | Service Level Objective — internal target on an SLI (e.g., "99.9% over 30d"). | [25. SLO and Error-Budget Framework](25-slo-and-error-budget-framework.md) |
| **SLA** | Service Level Agreement — externally-binding contractual commitment, looser than the internal SLO. | [12. Observability KPI Scorecard](12-observability-kpi-scorecard.md) |
| **Tail-based sampling** | Sampling decision made after the trace completes, allowing rules like "keep all traces with errors". More expensive but vastly more useful. | [18. Application Telemetry Standard](18-application-telemetry-standard.md), [3. Observability Reference Architecture](03-observability-reference-architecture.md) |
| **Telemetry** | Any data emitted by a system about its own operation: metrics, logs, traces, events, profiles. | [2. Enterprise Observability Standards Catalog](02-enterprise-observability-standards-catalog.md) |
| **Tenant** | A logical customer or organisational boundary across which data must be isolated. | [27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md) |
| **Trace context (W3C)** | Standard headers (`traceparent`, `tracestate`) that carry trace identity across service boundaries. | [18. Application Telemetry Standard](18-application-telemetry-standard.md), [Chapter 27. Multi-Tenant and Customer-Site Deployment Model -> Section 27.6 Trace Continuity Across Customer / Xceedance Boundary](27-multi-tenant-and-customer-site-deployment-model.md#276-trace-continuity-across-customer-xceedance-boundary) |
| **Universal observability** | Consistent metrics + logs + traces + events across all runtimes and deployment models, implemented in a model-aware way (not one-size-fits-all). | [Chapter 1. Xceedance Observability Strategy -> Section 1.1 Executive Summary](01-xceedance-observability-strategy.md#11-executive-summary), [Chapter 3. Observability Reference Architecture -> Section 3.1 Architectural Principles](03-observability-reference-architecture.md#31-architectural-principles) |
| **USE method** | Utilization, Saturation, Errors — the three signals every resource (CPU, memory, disk, network) should expose. | [Chapter 2. Enterprise Observability Standards Catalog -> Section 2.4 Infrastructure Telemetry Standards](02-enterprise-observability-standards-catalog.md#24-infrastructure-telemetry-standards), [6. Grafana Platform Standard and Visualization Playbook](06-grafana-platform-standard-and-visualization-playbook.md) |
| **White-box monitoring** | Observing a system from inside (instrumented code, internal metrics) — the bulk of OpenTelemetry. | [3. Observability Reference Architecture](03-observability-reference-architecture.md), [18. Application Telemetry Standard](18-application-telemetry-standard.md) |

---

[↑ Back to TOC](toc.md)
