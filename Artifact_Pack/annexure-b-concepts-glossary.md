---
title: Annexure B — Concepts Glossary
chapter: Annexure B
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# Annexure B — Concepts Glossary

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

> Conceptual glossary (as opposed to acronym expansions in [Annexure A](annexure-a-acronyms.md)). Defines the terms and mental models used across the Observability Artifact Pack.

| Term | Definition | Where it is used |
|---|---|---|
| **Black-box monitoring** | Observing a system from the outside (synthetic probes, external uptime checks) without knowledge of internals. | [Chapter 2](02-observability-reference-architecture.md), [Chapter 24](24-slo-and-error-budget-framework.md) |
| **Burn rate** | The rate at which an error budget is being consumed, expressed as a multiplier of the rate that would consume the entire budget over the SLO window. A burn rate of 14.4 over 1 h would consume a 30-day budget in ~2 days. | [Chapter 24. SLO and Error-Budget Framework -> Section 24.5 Multi-Window Multi-Burn-Rate Alerting](24-slo-and-error-budget-framework.md#245-multi-window-multi-burn-rate-alerting) |
| **Cardinality** | The number of distinct label-combinations (time series) a metric produces. High cardinality is the #1 Prometheus failure mode. | [Chapter 1. Enterprise Observability Standards Catalog -> Section 1.3.4 Cardinality Governance](01-enterprise-observability-standards-catalog.md#134-cardinality-governance), [Chapter 22](22-capacity-and-scale-model.md) |
| **Cardinality budget** | Maximum allowed series count per service / per metric, enforced via collector processors and recording-rule monitoring. | [Chapter 22. Capacity and Scale Model -> Section 22.8 Cardinality Budget](22-capacity-and-scale-model.md#228-cardinality-budget) |
| **Error budget** | The amount of unreliability the SLO permits before remediation action is required. Equal to `(1 − SLO) × total events in window`. | [Chapter 24. SLO and Error-Budget Framework -> Section 24.4 Error Budget](24-slo-and-error-budget-framework.md#244-error-budget) |
| **Error-budget policy** | The pre-agreed organisational response when error-budget consumption crosses thresholds (feature freeze, escalation, etc.). | [Chapter 24. SLO and Error-Budget Framework -> Section 24.6 Error-Budget Policy](24-slo-and-error-budget-framework.md#246-error-budget-policy) |
| **Exemplar** | A single representative trace span attached to a metric data point, allowing one-click navigation from "this latency spike" to "this exact trace". | [Chapter 17](17-application-telemetry-standard.md), [Chapter 5](05-grafana-platform-standard-and-visualization-playbook.md) |
| **Five Pillars** | Metrics, Logs, Traces, Changes, Profiles. | [Chapter 1. Enterprise Observability Standards Catalog -> Section 1.2 The Five Pillars of Telemetry](01-enterprise-observability-standards-catalog.md#12-the-five-pillars-of-telemetry) |
| **Golden Signals** | Latency, Traffic, Errors, Saturation. Google's four primary user-facing service signals. | [Chapter 5](05-grafana-platform-standard-and-visualization-playbook.md), [Chapter 24](24-slo-and-error-budget-framework.md) |
| **Head-based sampling** | Sampling decision made at the start of a trace; cheap but blind to which traces will turn out interesting. | [Chapter 17](17-application-telemetry-standard.md), [Chapter 2](02-observability-reference-architecture.md) |
| **Host-portable** | Capable of running on any Linux/Windows host with Docker Engine, regardless of where the host lives (on-prem, customer site, cloud VM). Replaces the earlier "multi-cloud K8s" framing. | [Chapter 2. Observability Reference Architecture -> Section 2.6 Host-Portable Deployment Design](02-observability-reference-architecture.md#26-host-portable-deployment-design) |
| **Multi-window multi-burn-rate alerting** | The Google SRE pattern of pairing a long-window and short-window burn-rate alert to balance precision and recall. | [Chapter 24. SLO and Error-Budget Framework -> Section 24.5 Multi-Window Multi-Burn-Rate Alerting](24-slo-and-error-budget-framework.md#245-multi-window-multi-burn-rate-alerting) |
| **Observability** | The ability to ask arbitrary new questions of a system from its outputs alone, without shipping new code. Distinct from monitoring, which checks pre-defined questions. | [Chapter 0. Xceedance Observability Strategy -> Section 0.1 Executive Summary](00-observability-strategy.md#01-executive-summary) |
| **PRR (Production Readiness Review)** | The gate that determines whether a service is ready to be promoted to production. | [Chapter 25. Service Onboarding and Instrumentation Kits -> Section 25.2 Production-Readiness Review (PRR) Gate](25-service-onboarding-and-instrumentation-kits.md#252-production-readiness-review-prr-gate) |
| **RED method** | Rate, Errors, Duration — the three signals every request-driven service should expose. | [Chapter 5](05-grafana-platform-standard-and-visualization-playbook.md), [Chapter 25](25-service-onboarding-and-instrumentation-kits.md) |
| **Resource attributes** | OTel concept: identity-bearing attributes attached to every signal (`service.name`, `service.version`, `deployment.environment`, etc.). | [Chapter 17](17-application-telemetry-standard.md), [Chapter 26](26-multi-tenant-and-customer-site-deployment-model.md) |
| **Service tier** | Criticality classification (T1–T4) that drives instrumentation depth, SLO strictness, retention, alerting policy, and on-call coverage. | [Chapter 1. Enterprise Observability Standards Catalog -> Section 1.4.1 Service Tiering Model](01-enterprise-observability-standards-catalog.md#141-service-tiering-model), [Chapter 20. Business Capability and Value-Stream Mapping](20-business-capability-and-value-stream-mapping.md) |
| **SLI** | Service Level Indicator — a measured signal (e.g., P95 latency). | [Chapter 24. SLO and Error-Budget Framework -> Section 24.2 SLI Categories (Choose 1–3 per Service)](24-slo-and-error-budget-framework.md#242-sli-categories-choose-13-per-service) |
| **SLO** | Service Level Objective — internal target on an SLI (e.g., "99.9% over 30d"). | [Chapter 24](24-slo-and-error-budget-framework.md) |
| **SLA** | Service Level Agreement — externally-binding contractual commitment, looser than the internal SLO. | [Chapter 11](11-observability-kpi-scorecard.md) |
| **Tail-based sampling** | Sampling decision made after the trace completes, allowing rules like "keep all traces with errors". More expensive but vastly more useful. | [Chapter 17](17-application-telemetry-standard.md), [Chapter 2](02-observability-reference-architecture.md) |
| **Telemetry** | Any data emitted by a system about its own operation: metrics, logs, traces, events, profiles. | [Chapter 1](01-enterprise-observability-standards-catalog.md) |
| **Tenant** | A logical customer or organisational boundary across which data must be isolated. | [Chapter 26](26-multi-tenant-and-customer-site-deployment-model.md) |
| **Trace context (W3C)** | Standard headers (`traceparent`, `tracestate`) that carry trace identity across service boundaries. | [Chapter 17](17-application-telemetry-standard.md), [Chapter 26. Multi-Tenant and Customer-Site Deployment Model -> Section 26.6 Trace Continuity Across Customer / Xceedance Boundary](26-multi-tenant-and-customer-site-deployment-model.md#266-trace-continuity-across-customer-xceedance-boundary) |
| **Universal observability** | Consistent metrics + logs + traces + events across all runtimes and deployment models, implemented in a model-aware way (not one-size-fits-all). | [Chapter 0. Xceedance Observability Strategy -> Section 0.1 Executive Summary](00-observability-strategy.md#01-executive-summary), [Chapter 2. Observability Reference Architecture -> Section 2.1 Architectural Principles](02-observability-reference-architecture.md#21-architectural-principles) |
| **USE method** | Utilization, Saturation, Errors — the three signals every resource (CPU, memory, disk, network) should expose. | [Chapter 1. Enterprise Observability Standards Catalog -> Section 1.4 Infrastructure Telemetry Standards](01-enterprise-observability-standards-catalog.md#14-infrastructure-telemetry-standards), [Chapter 5](05-grafana-platform-standard-and-visualization-playbook.md) |
| **White-box monitoring** | Observing a system from inside (instrumented code, internal metrics) — the bulk of OpenTelemetry. | [Chapter 2](02-observability-reference-architecture.md), [Chapter 17](17-application-telemetry-standard.md) |

---

[↑ Back to TOC](toc.md)
