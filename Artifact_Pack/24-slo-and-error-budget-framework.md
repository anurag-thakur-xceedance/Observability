# 24. SLO and Error-Budget Framework

[↑ Back to TOC](toc.md)

> **Closes Gaps:** D1, D2 (partial).

---

## 1. Why an SLO Framework
Without a formal SLO methodology, "reliability targets" are aspirational. With it, every service has:
1. A handful of SLIs that approximate user happiness.
2. SLOs the organisation has actually agreed to honour.
3. An error budget — the maximum allowed unreliability per window.
4. Burn-rate alerts that page only when the error budget is being consumed at an unsustainable rate.
5. A policy that turns budget exhaustion into action (freeze, escalate, prioritise reliability work).

## 2. SLI Categories (Choose 1–3 per Service)

| Category | Definition | Example SLI |
|---|---|---|
| **Availability** | Successful requests / total valid requests | `sum(rate(http_requests_total{status!~"5..",service="quote"}[5m])) / sum(rate(http_requests_total{service="quote"}[5m]))` |
| **Latency** | Fraction of requests faster than threshold | `sum(rate(http_request_duration_seconds_bucket{le="0.8",service="quote"}[5m])) / sum(rate(http_request_duration_seconds_count{service="quote"}[5m]))` |
| **Correctness** | Fraction of operations producing correct output | Validated against gold-set; e.g., quote-engine match rate |
| **Freshness** | Fraction of data updated within target window | `1 - (data_lag_seconds > 300)` |
| **Throughput** | Whether throughput meets minimum sustained level | `rate(messages_processed_total[5m]) ≥ N` |
| **Coverage** | Fraction of requests instrumented properly | `tracecov = traces_with_span_count_ge_min / total_traces` |
| **Durability** | Fraction of writes acknowledged and recoverable | DB-replication freshness SLI |

## 3. SLO Target Derivation

| Service Tier (per [Chapter 1. Enterprise Observability Standards Catalog -> Section 4.1. Service Tiering Model](1-enterprise-observability-standards-catalog.md#41-service-tiering-model)) | Availability SLO | Latency SLO | Window |
|---|---|---|---|
| T1 | 99.9% | 99% requests under tier-specific target (e.g., P99 ≤ 800 ms) | 30-day rolling |
| T2 | 99.5% | 95% requests under target | 30-day rolling |
| T3 | 99.0% | 95% requests under target | 30-day rolling |
| T4 | 98.0% | best-effort | 30-day rolling |

Targets must be:
- **Just below** historical performance (do not set 99.99% if observed is 99.93%).
- **Achievable** without "nines theatre" (don't promise more than the dependencies offer).
- **Reviewed quarterly** as part of the SLO governance cadence.

## 4. Error Budget

```
Error Budget = (1 - SLO) × total_events_in_window
```

Examples:
- T1 service, 10M requests / 30d, SLO 99.9% → budget = 10,000 errors per window.
- T1 service latency SLO 99% under 800 ms → at 10M requests, 100,000 slow requests is the budget.

Budget consumption is tracked on a dashboard per service.

## 5. Multi-Window Multi-Burn-Rate Alerting

Single-threshold alerts ("error rate > X for 5 min") are noisy. The Google SRE pattern uses two windows simultaneously: a **long window** to confirm the trend and a **short window** to catch fast burns.

### 5.1 Burn-Rate Math
A burn rate of **N** means the budget would be consumed in **(window / N)** time. To page on a burn that would exhaust a 30-day budget in 1 hour, burn rate = 30×24 = 720 (extreme); typical critical alert at burn rate ~14.4 (consumes budget in ~2 days).

### 5.2 Standard Burn-Rate Alert Bundle (per service)
| Severity | Long Window | Short Window | Burn Rate | Budget Consumed (long window) | Page? |
|---|---|---|---|---|---|
| **Critical fast burn** | 1 h | 5 min | 14.4 | 2% | Yes — page on-call |
| **Critical slow burn** | 6 h | 30 min | 6 | 5% | Yes — page on-call |
| **Warning** | 24 h | 2 h | 3 | 10% | No — ticket |
| **Notice** | 72 h | 6 h | 1 | 10% | No — dashboard only |

### 5.3 PromQL Template (Availability SLO 99.9%)
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

### 5.4 Latency SLI Variant
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

## 6. Error-Budget Policy

| Budget State | Trigger | Policy Response |
|---|---|---|
| Healthy (≥ 50% remaining) | Default | Normal operation; new feature work prioritised |
| Stressed (10–50% remaining) | Burn rate > 1× baseline for ≥ 24h | Reliability work increases; ARB notified |
| Exhausted (≤ 10% remaining) | Sustained burn for 24h | **Feature freeze on this service**; only reliability/bugfix changes |
| Breached (< 0%) | Budget gone before window end | Service owner + Director SRE on-call; incident review; explicit ARB unfreeze required |

Exception process: written waiver from Director SRE + Service Owner with stated remediation timeline; logged in [Chapter 16. Observability ADR Decision Register](16-observability-adr-decision-register.md).

## 7. SLO Authoring Workflow
1. Service owner identifies user journeys.
2. Owner picks 1–3 SLIs (avoid > 3 — focus is the point).
3. Owner observes 30 days of telemetry to baseline current performance.
4. Proposed SLO = current_performance − 0.5σ (rounded down to a comfortable target).
5. Reviewed by SRE; approved by Director SRE; recorded in service catalog.
6. Burn-rate alerts deployed via Git-managed Prometheus rules (see [Chapter 7](7-iac-for-observability-standard.md)).
7. Quarterly review.

## 8. Tooling Decision
| Option | Pros | Cons | Decision |
|---|---|---|---|
| Sloth (`slok8s/sloth`) | Generates Prom rules from declarative SLO YAML; widely adopted | Originally Kubernetes-flavoured but works as a CLI | **Recommended** — fits Compose model; ADR-008 candidate |
| Pyrra | Web UI + rule generator; good UX | Operator-style; some K8s assumptions | Alternative |
| Hand-written rules | Full control | High maintenance | Fallback only |

ADR-008 (proposed): "Adopt Sloth as SLO-rule generator."

## 9. Alert Quality Scorecard (per service)
| Metric | Target |
|---|---|
| Pages per week | ≤ 5 |
| Alert acknowledged ≤ 5 min | ≥ 90% |
| Alerts auto-resolved without action | < 10% |
| Mean time-to-silence | ≤ 2 min |
| % alerts mapped to runbook | 100% |
| % alerts whose threshold was changed in last 90d | tracks alert-tuning hygiene |
| False-positive rate | < 5% |

This rolls up to the alerting KPIs in [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md).

## 10. Cross-References
- [Chapter 4. Alerting and Incident Severity Policy](4-alerting-and-incident-severity-policy.md) — severity model that burn-rate alerts plug into.
- [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md) — outcome KPIs derived from SLO posture.
- [Chapter 12. Incident Response Playbook](12-incident-response-playbook.md) — what happens when a burn alert fires.
- [Chapter 17. Application Telemetry Standard](17-application-telemetry-standard.md) — required SLI labels in app telemetry.
- [Chapter 20. Business Capability and Value-Stream Mapping](20-business-capability-and-value-stream-mapping.md) — outcome → SLO traceability.

---

[↑ Back to TOC](toc.md)
