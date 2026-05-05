# D3 — Domain Observability Runbooks Pack

> **Purpose:** Practical runbooks for Infrastructure / Application / Database / Network / Scaling domains.
> **Source Strategy Sections:** Infrastructure Observability; Pre-Login Telemetry (execution steps); Post-Login Telemetry (execution steps); Database Observability; Database Observability Metrics and Ranges (runbook usage); Network and Latency Observability; Network & Latency Observability Metrics (runbook usage); Implementation Tips (Network); Scaling and Performance Observability; Scaling and Performance Observability Metrics (runbook usage); Implementation Notes (Scaling); Appendix tables.
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1.

---

## 1. Purpose
This pack contains operational runbooks that translate the standards in **D1** into day-to-day actions. Each runbook covers: signals to watch, what they mean, immediate diagnostics, and remediation steps. Severities and escalation are governed by **D4**.

---

## 2. Infrastructure Observability Runbook

### 2.1 Signals
CPU, memory, disk I/O, container restarts, node failures, cluster scaling events, pod scheduling delays. Metric thresholds: see **D1 §4**.

### 2.2 Triage Flow
1. Confirm scope: per node/pod, per namespace, per zone.
2. Correlate with recent changes (deployments, autoscaler events).
3. If sustained > 80% CPU or > 85% memory → trigger scale-up or investigate runaway workload.
4. If container restarts > 2/hour → inspect logs (Loki) for OOM / crash loop / config errors.
5. If node failures > 1/day → check hardware/cloud-provider health and rescheduling impact.

### 2.3 Visualization
Use stacked-area charts and heat maps for trend visibility. Combine gauges (current state) with time-series panels (trend).

---

## 3. Application Observability Runbook (Pre-Login & Post-Login Execution Steps)

> Standards and field definitions live in **D17**. This runbook covers operational execution.

### 3.1 Pre-Login Operational Checks
- **Authentication latency** rising → inspect upstream IdP, API gateway, certificate refresh events.
- **Login failures** elevated → check for credential-system outages, rate limiting, recent auth config changes.
- **MFA failures** elevated → verify third-party MFA provider status; failover to backup if available.
- **API gateway response time** degrading → review upstream service latency and gateway resource saturation.

### 3.2 Post-Login Operational Checks
- **Transaction latency** P95 > 800 ms → trace through user-journey spans in Tempo; identify slowest dependency.
- **Service-call failures** rising → inspect retries, timeouts, 5xx clusters by service; correlate with deployments.
- **Dependency latency** > 400 ms → check DB, cache, external API health.
- **User-journey success** < 98% → drill into specific journey (login, checkout, report-gen) and isolate failing step.

### 3.3 Implementation Tips
- Always track **P95 / P99**, not just averages.
- Correlate signals: high API latency + elevated error rates typically indicates backend or DB issue.

---

## 4. Database Observability Runbook

### 4.1 Signals
Slow queries, lock contention, connection-pool usage, replication lag, query latency. Thresholds: **D1 §7**.

### 4.2 Triage Flow
1. **Slow queries > 1%** → review query plan, indexes, recent schema changes.
2. **Lock contention > 50 ms avg wait** → review transaction design, long-running transactions, hot rows.
3. **Connection pool > 80%** → check application connection leaks, pool sizing, DB CPU/IO.
4. **Replication lag > 5 s** → check replica health, network between primary/replica, write throughput surge.
5. **P95 query latency > 200 ms** → drill into slowest endpoints/queries, evaluate index coverage and parameter sniffing.

### 4.3 Action Expectation
- Warning crosses → investigate within hours; assess resource saturation or query regressions.
- Critical crosses → immediate incident; probable user impact or system instability.

---

## 5. Network & Latency Observability Runbook

### 5.1 Signals
Packet drops, cross-service latency, DNS failures, service mesh errors, TCP retransmissions. Thresholds: **D1 §8**.

### 5.2 Triage Flow
1. **Packet drops > 0.5%** sustained → investigate route saturation or link errors.
2. **Cross-service latency P95 > 100 ms** intra-region → check network or service hops.
3. **DNS failures > 0.5%** → validate caching, propagation, resolver health.
4. **Mesh errors > 1%** → inspect sidecar config, control-plane health, retry storms.
5. **TCP retransmissions > 1%** → congestion or packet loss; user-visible latency likely.

### 5.3 Implementation Tips
- **Measure percentiles, not only averages.** Configure alerts on P95 / P99 latency.
- **Correlate signals:**
  - Packet drops + TCP retransmits → physical/network congestion issue.
  - Cross-service latency + service-mesh errors → dependency or routing problem.
- **Scope:** Collect per node/pod, per namespace, per zone.
- **Visualization:** Stacked-area charts or heat maps for packet-loss and latency trends.

---

## 6. Scaling & Performance Runbook

### 6.1 Signals
Queue length, request latency, error rate, pod startup time, cold-start latency. Thresholds: **D1 §9**.

### 6.2 Outcome Posture
Scaling observability is intended to validate that autoscaling delivers the user-visible performance the strategy commits to. Strategic posture: scaling should be **predictable, observable, and tied to user impact**, not internal metrics alone.

### 6.3 Implementation Notes
- **Queue length + request latency** together → most effective real-time autoscaling signals. Both rising → scale up; both falling → scale down.
- **Error rate + latency spikes** together → service saturation; increase replicas or investigate dependency bottlenecks.
- **Pod startup time + cold-start latency** → feed into scaling-lag indicators; track over time to validate auto-scaler responsiveness.
- **Percentile-based latency (P95/P99)** with 5-minute moving averages → prevents false alerts caused by short-lived spikes.

### 6.4 Triage Flow
1. **Queue > 200 items rising** → scale event likely needed; check autoscaler config.
2. **P95 latency > 800 ms or P99 > 1 s** → SLA breach risk; correlate with replica count and dependency latency.
3. **Error rate > 1%** sustained → degraded service; combine with latency to detect cascade.
4. **Pod startup > 30 s** → image-pull or readiness-probe issue; check image size > 1 GB scenarios.
5. **Cold start > 800 ms FaaS / > 5 s container** → tune pre-warming or concurrency.

---

## 7. Calibration Note
After a few weeks of production data, narrow each range so **Warning ≈ 95th percentile of normal behaviour** and **Critical ≈ conditions approaching SLA breach**.

## 8. Cross-References
- **D1** — metric definitions and threshold catalog.
- **D4** — severity policy and alert routing.
- **D5** — Grafana dashboard structure.
- **D12** — incident response playbook for end-to-end resolution.
