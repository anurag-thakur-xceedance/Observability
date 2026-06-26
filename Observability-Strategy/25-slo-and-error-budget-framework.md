---
title: SLO and Error-Budget Framework
chapter: 25
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 25. SLO and Error-Budget Framework

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](24-observability-platform-security-architecture.md) | [Next Page](26-service-onboarding-and-instrumentation-kits.md)

| **Document Owner** | CoE-Architecture |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **First Review** | 1-Aug-2026 |
| **Next Review Due** | 1-Nov-2026 |

---

## 25.1 Why an SLO Framework
Without a formal SLO methodology, "reliability targets" are aspirational. With it, every service has:
1. A handful of SLIs that approximate user happiness.
2. SLOs the organisation has actually agreed to honour.
3. An error budget — the maximum allowed unreliability per window.
4. Burn-rate alerts that page only when the error budget is being consumed at an unsustainable rate.
5. A policy that turns budget exhaustion into action (freeze, escalate, prioritise reliability work).

**Worked example (keep this in mind while reading).**
- **Service:** Login API
- **SLI:** successful login requests / total valid login requests
- **SLO:** **99.9% success over 30 days**
- **Volume assumption:** 10,000,000 valid login requests in 30 days
- **Error budget:** `(1 - 0.999) × 10,000,000 = 10,000` failed login requests allowed in the window
- **What this means in practice:** if the service burns through those 10,000 failures too quickly, burn-rate alerts page the team and the error-budget policy can freeze feature work until reliability recovers.

> **If you’re a service owner, do these 3 things:**
> 1. Pick **1–3 SLIs** that reflect user happiness (for example availability and latency for a login API).
> 2. Set an SLO that is ambitious but realistic for the service tier.
> 3. Make sure burn-rate alerts and a runbook exist before shipping to production.

## 25.2 SLI Categories (Choose 1–3 per Service)

| Category | Definition | Example SLI |
|---|---|---|
| **Availability** | Successful requests / total valid requests | `sum(rate(http_requests_total{status!~"5..",service="quote"}[5m])) / sum(rate(http_requests_total{service="quote"}[5m]))` |
| **Latency** | Fraction of requests faster than threshold | `sum(rate(http_request_duration_seconds_bucket{le="0.8",service="quote"}[5m])) / sum(rate(http_request_duration_seconds_count{service="quote"}[5m]))` |
| **Correctness** | Fraction of operations producing correct output | Validated against gold-set; e.g., quote-engine match rate |
| **Freshness** | Fraction of data updated within target window | `1 - (data_lag_seconds > 300)` |
| **Throughput** | Whether throughput meets minimum sustained level | `rate(messages_processed_total[5m]) ≥ N` |
| **Coverage** | Fraction of requests instrumented properly | `tracecov = traces_with_span_count_ge_min / total_traces` |
| **Durability** | Fraction of writes acknowledged and recoverable | DB-replication freshness SLI |

## 25.3 SLO Target Derivation

| Service Tier (per [Chapter 2. Enterprise Observability Standards Catalogue -> Section 2.4.1 Service Tiering Model](02-enterprise-observability-standards-catalog.md#241-service-tiering-model)) | Availability SLO | Latency SLO | Window |
|---|---|---|---|
| T1 | 99.9% | 99% requests under tier-specific target (e.g., P99 ≤ 800 ms) | 30-day rolling |
| T2 | 99.5% | 95% requests under target | 30-day rolling |
| T3 | 99.0% | 95% requests under target | 30-day rolling |
| T4 | 98.0% | best-effort | 30-day rolling |

Targets must be:
- **Just below** historical performance (do not set 99.99% if observed is 99.93%).
- **Achievable** without "nines theatre" (don't promise more than the dependencies offer).
- **Reviewed quarterly** as part of the SLO governance cadence.

### 25.3.1 Standard "golden" SLO sets by service type
The tiering model defines *how reliable* a service must be; this section defines *what to measure* for common archetypes. Teams should start from these "golden" SLOs and only diverge with a documented rationale.

| Service Type | Primary SLIs | Default SLO Set (for T1/T2 services) |
|---|---|---|
| **User-facing HTTP API** | Availability, latency, correctness | Availability: 99.9% (T1) / 99.5% (T2) over 30 days. Latency: 99% of requests under 800 ms (T1) / 95% under 1,200 ms (T2) for key read paths. Correctness: ≥ 99.5% of responses pass schema and domain validation. |
| **Interactive web/mobile UI** | Availability, latency, freshness | Availability (page load without error): 99.5% (T1) / 99.0% (T2). Latency: 95% of page loads to interactive under 2.5 s on reference devices. Freshness: ≥ 99% of dashboards/widgets reflect data no more than 5 minutes old. |
| **Asynchronous worker / batch job** | Timeliness, success rate | Timeliness: ≥ 99% of jobs complete within SLA window (e.g. within 30 minutes of scheduled start). Success rate: ≥ 99.5% of jobs complete without manual intervention. |
| **Data pipeline / ETL** | Freshness, correctness, throughput | Freshness: ≥ 99% of pipelines deliver data to consumers within agreed lag (e.g. ≤ 15 minutes for near-real-time, ≤ 4 hours for daily loads). Correctness: ≥ 99.9% of records pass validation checks. Throughput: pipeline sustains ≥ 95% of contracted throughput during peak windows. |
| **Streaming / messaging consumer** | Availability, lag, loss | Availability: 99.9% of time consumer is healthy and reading from stream. Lag: 99% of messages processed within X seconds of arrival (X agreed per stream). Loss: 100% of messages processed at-least-once; 0% accepted data loss. |
| **Internal platform component (e.g. auth, identity, config)** | Availability, latency | Availability: 99.9% over 30 days for T1 dependencies. Latency: 99% of calls under 300 ms on the critical path. |

Additional SLIs (e.g. durability, coverage) may be added where they materially affect user outcomes, but each service **must keep the number of SLOs small (≤ 5)** to remain operable.

## 25.4 Error Budget

```
Error Budget = (1 - SLO) × total_events_in_window
```

Examples:
- T1 service, 10M requests / 30d, SLO 99.9% → budget = 10,000 errors per window.
- T1 service latency SLO 99% under 800 ms → at 10M requests, 100,000 slow requests is the budget.

Budget consumption is tracked on a dashboard per service.

## 25.5 Multi-Window Multi-Burn-Rate Alerting

Single-threshold alerts ("error rate > X for 5 min") are noisy. The Google SRE pattern uses two windows simultaneously: a **long window** to confirm the trend and a **short window** to catch fast burns.

### 25.5.1 Burn-Rate Math
A burn rate of **N** means the budget would be consumed in **(window / N)** time. To page on a burn that would exhaust a 30-day budget in 1 hour, burn rate = 30×24 = 720 (extreme); typical critical alert at burn rate ~14.4 (consumes budget in ~2 days).

### 25.5.2 Standard Burn-Rate Alert Bundle (per service)
| Severity | Long Window | Short Window | Burn Rate | Budget Consumed (long window) | Page? |
|---|---|---|---|---|---|
| **Critical fast burn** | 1 h | 5 min | 14.4 | 2% | Yes — page on-call |
| **Critical slow burn** | 6 h | 30 min | 6 | 5% | Yes — page on-call |
| **Warning** | 24 h | 2 h | 3 | 10% | No — ticket |
| **Notice** | 72 h | 6 h | 1 | 10% | No — dashboard only |

### 25.5.3 PromQL Template (Availability SLO 99.9%)
```promql
# Window error rates (slo: 0.001 means error budget = 0.1%)
- record: slo:errors:ratio_rate1h
  expr: |
    sum(rate(http_requests_total{service="quote",status=~"5.."}[1h]))
    /
    sum(rate(http_requests_total{service="quote"}[1h]))

- record: slo:errors:ratio_rate5m
  expr: |
    sum(rate(http_requests_total{service="quote",status=~"5.."}[5m]))
    /
    sum(rate(http_requests_total{service="quote"}[5m]))

# Critical fast burn alert: 14.4× the budget rate over both windows
- alert: SLOFastBurn_Quote
  expr: |
    slo:errors:ratio_rate1h > (14.4 * 0.001)
    and
    slo:errors:ratio_rate5m > (14.4 * 0.001)
  for: 2m
  labels:
    severity: critical
    service: quote
    slo: availability
  annotations:
    summary: "Quote SLO fast burn (1h+5m windows)"
    runbook_url: "https://runbooks.xc/runbooks/quote-slo-burn"
```

### 25.5.4 Latency SLI Variant
```promql
- record: slo:latency:good_ratio_rate5m
  expr: |
    sum(rate(http_request_duration_seconds_bucket{service="quote",le="0.8"}[5m]))
    /
    sum(rate(http_request_duration_seconds_count{service="quote"}[5m]))
- alert: SLOLatencyFastBurn_Quote
  expr: 1 - slo:latency:good_ratio_rate5m > (14.4 * 0.01)   # SLO 99% under 800ms → budget 1%
  for: 2m
  labels: { severity: critical, service: quote, slo: latency }
```

## 25.6 Error-Budget Policy

| Budget State | Budget Remaining | Budget Consumed | Trigger | Policy Response |
|---|---|---|---|---|
| **Healthy** | ≥ 50% | ≤ 50% | Default | Normal operation; new feature work prioritised. Reliability work scheduled but not blocking. |
| **Stressed** | 10–50% | 50–90% | Burn rate > 1× baseline for ≥ 24h | Reliability work increases; ARB notified; teams start planning mitigations (canarying reliability fixes, capacity changes, tuning dependencies). |
| **Exhausted** | ≤ 10% | 90–100% | Sustained burn for 24h or multiple critical burn alerts in a week | **Feature freeze on this service**; only reliability and defect fixes allowed. Any exception requires ARB approval. |
| **Breached** | < 0% | > 100% | Budget gone before window end | Service owner + Director SRE on-call; incident review scheduled; explicit ARB decision required to unfreeze and accept further risk. |

**Budget burn thresholds and actions:**
- **At ~50% budget consumed:** reliability posture is still acceptable, but teams must review SLOs, recent incidents and dependencies. For T1/T2 services this review should happen within the same sprint.
- **Beyond 75% budget consumed (within the current window):** for T1 services, the default is to **gate new feature releases** behind additional checks (e.g. error-budget-aware release pipeline) and bring forward reliability work.
- **At 100% budget consumed (breach):** feature freeze is mandatory until a corrective plan is agreed and implemented; rollbacks, traffic-shaping or dark-launching of risky features are explicitly considered.

Exception process: written waiver from Director SRE + Service Owner with a stated remediation timeline; logged in [Chapter 17. Observability ADR Decision Register](17-observability-adr-decision-register.md).

## 25.7 SLO Authoring Workflow
1. Service owner identifies user journeys.
2. Owner picks 1–3 SLIs (avoid > 3 — focus is the point).
3. Owner observes 30 days of telemetry to baseline current performance.
4. Proposed SLO = current_performance − 0.5σ (rounded down to a comfortable target).
5. Reviewed by SRE; approved by Director SRE; recorded in service catalog.
6. Burn-rate alerts deployed via Git-managed Prometheus rules (see [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md)).
7. Quarterly review.

## 25.8 Tooling Decision
| Option | Pros | Cons | Decision |
|---|---|---|---|
| Sloth (`slok8s/sloth`) | Generates Prom rules from declarative SLO YAML; widely adopted | Originally Kubernetes-flavoured but works as a CLI | **Recommended** — fits the Git-managed deployment model; ADR-008 candidate |
| Pyrra | Web UI + rule generator; good UX | Operator-style; some K8s assumptions | Alternative |
| Hand-written rules | Full control | High maintenance | Fallback only |

ADR-008 (proposed): "Adopt Sloth as SLO-rule generator."

## 25.9 Alert Quality Scorecard (per service)
| Metric | Target |
|---|---|
| Pages per week | ≤ 5 |
| Alert acknowledged ≤ 5 min | ≥ 90% |
| Alerts auto-resolved without action | < 10% |
| Mean time-to-silence | ≤ 2 min |
| % alerts mapped to runbook | 100% |
| % alerts whose threshold was changed in last 90d | tracks alert-tuning hygiene |
| False-positive rate | < 5% |

This rolls up to the alerting KPIs in [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md).

## 25.10 Cross-References
- [Chapter 5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md) — severity model that burn-rate alerts plug into.
- [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md) — outcome KPIs derived from SLO posture.
- [Chapter 13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md) — what happens when a burn alert fires.
- [Chapter 18. Application Telemetry Standard](18-application-telemetry-standard.md) — required SLI labels in app telemetry.
- [Chapter 21. Business Capability and Value-Stream Mapping](21-business-capability-and-value-stream-mapping.md) — outcome → SLO traceability.

---

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](24-observability-platform-security-architecture.md) | [Next Page](26-service-onboarding-and-instrumentation-kits.md)
