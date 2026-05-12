---
title: Enterprise Observability Standards Catalog
chapter: 1
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 1. Enterprise Observability Standards Catalog

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 1. Scope and Intent
The single source of truth for telemetry standards across Xceedance — what is measured, named, and labelled, and the thresholds for healthy / warning / critical states. All other artifacts (runbooks, alerting policy, dashboards, AIOps) reference this catalog rather than redefining values locally.

## 2. The Five Pillars of Telemetry
Telemetry is standardised so that systems generate consistent information, enabling a holistic view of the stack.

| Pillar | Definition | Primary Use |
|---|---|---|
| Metrics | Numerical measurements (e.g. CPU usage, error rates) | Quantitative health checks |
| Logs | Detailed records of discrete events (e.g. error messages) | Narrative context for events |
| Traces | End-to-end journey maps of requests across distributed services | Pinpoint bottlenecks |
| Changes | Configuration / infrastructure changes tracked across services (e.g. Azure Change Analysis) | Correlate modifications with system behaviour |
| Profiles | Stack-trace–based code profiling (emerging "fifth pillar", e.g. Pyroscope) | Code-level performance issues |

## 3. Naming and Labelling Standards
- A standard telemetry schema is maintained (naming conventions for metrics, labels, log fields, and trace attributes).
- Data quality checks (missing labels, malformed logs, excessive cardinality) are implemented in the telemetry pipeline.
- Services must meet minimum instrumentation standards before production promotion.
- High-cardinality labels are removed or bucketed after defined retention windows.

### 3.1 Required Resource Attributes (every signal)
Every metric, log line, and trace span must carry these resource attributes:

| Attribute | Source | Example |
|---|---|---|
| `service.name` | Service catalog | `quote-engine` |
| `service.version` | Build metadata | `1.4.2` |
| `deployment.environment` | Deploy pipeline | `prod` / `uat` / `dev` |
| `team` | Service catalog | `quote-platform` |
| `tier` | Service catalog | `T1` / `T2` / `T3` / `T4` |
| `tenant_id` | Auth context (per [Chapter 26](26-multi-tenant-and-customer-site-deployment-model.md)) | `customer-acme` |
| `tenant_class` | Service catalog | `enterprise` / `mid` / `smb` |
| `region` | Deploy pipeline | `eu-west-1` |
| `host.name` | Auto-detected | `xc-host-001` |

### 3.2 Metric Naming Convention
- Lowercase, snake-case.
- Format: `<domain>_<entity>_<metric>_<unit>`.
- Examples: `http_request_duration_seconds`, `db_query_duration_seconds`, `quote_engine_calls_total`.
- Counters end in `_total`; histograms include the unit (`_seconds`, `_bytes`).
- Use OpenTelemetry semantic conventions where applicable; only invent custom names when convention does not cover the case.

### 3.3 Log Field Convention
- JSON-structured.
- Required fields: `ts`, `level`, `msg`, `service`, `trace_id`, `span_id`, `tenant_id`.
- PII fields prohibited at source (see [Chapter 23 Section 4. PII Redaction (Concrete Mechanisms)](23-observability-platform-security-architecture.md#4-pii-redaction-concrete-mechanisms)).

## 3.1. Cardinality Governance
Cardinality is the #1 production failure mode for Prometheus and Loki. Enforce three layers:

### 3.1.1 Per-Service Cardinality Budget (from [Chapter 22. Capacity and Scale Model -> Section 8. Cardinality Budget](22-capacity-and-scale-model.md#8-cardinality-budget))

| Tier | Max Active Series per Service | Max Distinct Label Combos per Metric |
|---|---|---|
| T1 | 50,000 | 1,000 |
| T2 | 20,000 | 500 |
| T3 | 10,000 | 200 |
| T4 | 5,000 | 100 |

### 3.1.2 Forbidden Label Patterns
- User identifiers (`user_id`, `email`, `session_id`).
- Free-form strings (request paths with IDs, raw URLs).
- Timestamps as labels.
- Trace or span IDs as labels.
- Random UUIDs.

Any of the above must be **bucketed** (e.g., path templates instead of paths) or **dropped** before ingestion.

### 3.1.3 Enforcement Mechanisms
1. **At source:** SDK-side label allow-list per kit (see [Chapter 25](25-service-onboarding-and-instrumentation-kits.md)).
2. **At collector:** `metric_relabel_configs` to drop forbidden labels.
3. **At backend:** `limits.max_label_names_per_series`, `limits.max_series_per_user` configured in Prometheus / Mimir.
4. **Recording rule:** `count by (__name__)({__name__=~".+"})` to track per-metric cardinality; alert when a service breaches its budget.
5. **Emergency switch:** A pre-tested `metric_relabel_config` block-list deployed via Git PR within 30 minutes when an incident demands it.

### 3.1.4 Cardinality KPIs
- Per-service cardinality vs budget — dashboard in [Chapter 5](5-grafana-platform-standard-and-visualization-playbook.md).
- New high-cardinality metrics introduced per release.
- Time from cardinality breach to remediation.

## 4. Infrastructure Telemetry Standards

| Metric | Unit | Healthy | Acceptable | Concerning | Notes |
|---|---|---|---|---|---|
| CPU Usage | % | < 20% (under-utilized) | 40–70% | > 80% sustained > 5 min | Trigger scale-up at sustained > 80% |
| Memory Pressure | % | < 40% | 40–75% | > 85% sustained | Sustained high usage may cause OOM kills |
| Disk I/O Latency | ms | < 5 ms | 5–15 ms | > 20 ms, stalls | Keep < 10 ms for production |
| Container Restart Count | count/hour | 0 | 0–1 occasional | > 2/hour or repeating | > 2/hour suggests memory leak/config |
| Host Failures | count/week | 0 | 0–1 transient | > 1/day | Monitor host MTBF |
| Service Restart Events (Compose) | count/day | 0–1 | 1–5 | > 10/day | Frequent restarts → review healthchecks / config |
| Container Start Time | seconds | < 5 s | 5–15 s | > 30 s | Long start times slow recovery and updates |

## 4.1. Service Tiering Model

The tier of a service determines instrumentation depth, SLO strictness, retention, alerting policy, and on-call coverage.

### 4.1.1 Tier Definitions

| Tier | Definition | Examples |
|---|---|---|
| **T1 — Critical** | Direct revenue or regulated; customer-facing; outage = immediate business impact | Quote-to-Bind, FNOL, Policy Admin, Payment, Customer Self-Service |
| **T2 — Important** | Indirect revenue or operational dependency; outage = degraded experience | Producer Portal, Billing, Reinsurance |
| **T3 — Supporting** | Internal or periodic; outage = inconvenience | Reporting, BI, internal analytics |
| **T4 — Standard** | Internal-only or non-business-critical | Corporate IT, internal tooling |

### 4.1.2 Per-Tier Policy Deltas

| Dimension | T1 | T2 | T3 | T4 |
|---|---|---|---|---|
| Instrumentation depth | Full RUM + APM + DB + dependency traces; profiling on hot paths | APM + DB + dependency traces | APM minimum | Basic infra + health checks |
| SLO target (availability) | 99.9% | 99.5% | 99.0% | 98.0% |
| SLO target (latency) | P99 ≤ 800 ms | P95 ≤ 800 ms | P95 ≤ 1500 ms | best effort |
| Error-budget policy | Strict freeze on exhaustion | Freeze + ARB review | Warning + ticket | Track only |
| Trace sampling rate (head) | 10% baseline + 100% errors via tail | 5% + 100% errors | 1% + 100% errors | 0.1% |
| Metric scrape interval | 10 s | 15 s | 30 s | 60 s |
| Log retention (hot) | 14 days | 14 days | 7 days | 7 days |
| Metric retention (high-res) | 30 days | 30 days | 14 days | 14 days |
| Trace retention | 7 days | 7 days | 3 days | 1 day |
| Alert routing | 24×7 paging | Business hours + critical paging | Business hours | Email only |
| On-call response | ≤ 5 min ack | ≤ 15 min ack | ≤ 1 h | NBD |
| RTO / RPO | per [Chapter 20](20-business-capability-and-value-stream-mapping.md) | per [Chapter 20](20-business-capability-and-value-stream-mapping.md) | per [Chapter 20](20-business-capability-and-value-stream-mapping.md) | per [Chapter 20](20-business-capability-and-value-stream-mapping.md) |

### 4.1.3 Tier Assignment
- Tier is assigned at service registration in the catalog.
- Tier changes require ARB approval and an ADR (see [Chapter 16](16-observability-adr-decision-register.md)).
- The tier label is mandatory on every signal (per Section 3.1).

## 5. Application Telemetry Standards (Pre-Login)

| Metric | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|
| Authentication Latency | < 300 ms | 500–800 ms ≥ 5 min | > 1000 ms sustained | Keep P95 < 800 ms |
| Login Failures | < 1% | 1–3% sustained 5 min | > 3% sustained or > 5% spike | Validate at step-up auth |
| MFA Failures | < 0.5% | 0.5–2% sustained | > 2% sustained or MFA outage | Often third-party dependency |
| API Gateway Response Time | P95 < 500 ms | P95 > 800 ms ≥ 5 min | P95 > 1200 ms sustained | Includes upstream services |

## 6. Application Telemetry Standards (Post-Login)

| Metric | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|
| Transaction Latency | < 500 ms P95 | P95 > 800 ms ≥ 5 min | P95 > 1200 ms sustained | Reflects full user transaction |
| Service-Call Failures | < 0.2% | 0.5–1% sustained | > 1% sustained or > 3% spike | Includes timeouts, 5xx, retries |
| Dependency Latency | < 200 ms | 200–400 ms sustained | > 400 ms sustained or timeouts | DB/cache/API dependencies |
| User-Journey Trace Success Rate | ≥ 98% | 95–98% | < 95% | Track per major journey |

## 7. Database Telemetry Standards

| Metric | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|
| Slow Queries | < 1% | 1–3% sustained 5 min | > 3% sustained or > 5% spike | Track P95/P99 query duration |
| Lock Contention | < 50 ms avg wait | 50–100 ms sustained / > 1% waiting | > 100 ms sustained / > 5% waiting | Concurrency design issue |
| Connection Pool Usage | 40–70% | > 80% > 5 min | > 90% > 2 min or exhaustion | Steady < 75% |
| Replication Lag | < 1 s | 2–5 s sustained | > 10 s sustained or rising | Critical for fresh-read deps |
| Query Latency (Overall) | P95 < 100 ms | 100–200 ms sustained | > 200 ms sustained or > 300 ms jump | Keep P95 ≤ 100 ms |

## 8. Network & Latency Telemetry Standards

| Metric | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|
| Packet Drops | < 0.1% | 0.1–0.5% ≥ 5 min | > 0.5% ≥ 2 min or spikes > 1% | Investigate route saturation |
| Cross-Service Latency (P95) | < 50 ms | 50–100 ms ≥ 5 min | > 100 ms sustained or > 200 ms spike | Intra-region < 100 ms; cross-region < 200 ms |
| DNS Failures | < 0.1% | 0.1–0.5% ≥ 5 min | > 1% ≥ 2 min or resolver outage | Caching/propagation/resolver health |
| Inter-Service Errors | < 0.2% | 0.2–1% ≥ 5 min | > 1% ≥ 2 min or backend outage | App-layer 4xx/5xx between services. Keep < 0.2%; review retries if climbing. |
| TCP Retransmissions | < 0.5% | 0.5–1% ≥ 5 min | > 1% ≥ 2 min or > 2% spike | Congestion / packet loss |

## 9. Scaling & Performance Telemetry Standards

| Metric | Purpose | Healthy | Warning | Critical |
|---|---|---|---|---|
| Queue Length | Scaling trigger | < 50 items avg | 50–200 ≥ 5 min | > 200 ≥ 2 min or rapid growth |
| Request Latency | SLA monitoring | P95 < 300 ms | P95 300–800 ms ≥ 5 min | P95 > 800 ms or P99 > 1 s sustained |
| Error Rate | Service health | < 0.1% | 0.1–1% ≥ 5 min | > 1% ≥ 2 min or > 5% spike |
| Container Startup Time | Recovery efficiency | < 10 s | 10–30 s | > 30 s sustained or repeated start failure |
| Cold Start Latency | Autoscaling tuning | < 300 ms FaaS / < 2 s container | 300–800 ms / 2–5 s | > 800 ms / > 5 s sustained |

## 10. Grafana Visualization Layer Standards

| Layer | Metric | Healthy | Warning | Critical |
|---|---|---|---|---|
| Infra | Host Health (services Up) | 100% Up | < 99% > 5 min | < 97% or multi-service loss |
| Infra | Host Utilization | 40–70% | > 75% > 5 min | > 90% sustained / OOM |
| Infra | Network Saturation | < 60% | 60–80% > 5 min | > 80% > 2 min or drops > 0.5% |
| Application | API Latency | < 300 ms | 300–800 ms sustained | > 800 ms > 2 min |
| Application | Error Rates | < 0.2% | 0.2–1% > 5 min | > 1% > 2 min or > 3% spike |
| Application | Request Throughput | Baseline trend | ±10% deviation | ±20% sustained 10 min |
| Business | Login Success Rate | ≥ 99% | 98–99% sustained | < 98% or failures > 3% |
| Business | Payment Success Rate | ≥ 98% | 96–98% sustained | < 96% > 2 min |
| Business | Checkout Latency | P95 < 2 s | 2–3 s sustained | > 3 s > 2 min |

## 11. AI-Driven Telemetry Standards

| Category | Metric | Healthy | Warning | Critical |
|---|---|---|---|---|
| Anomaly Detection | Abnormal Latency Spikes | ±10% baseline | 10–25% deviation > 5 min | > 25% deviation > 2 min |
| Anomaly Detection | Unusual Traffic Patterns | ±15% | 15–30% > 5 min | > 30% > 2 min or confidence > 95% |
| Correlation | Deployment vs Error Spike | r < 0.3 | r 0.3–0.6 | r > 0.6 |
| Correlation | Scaling vs DB Saturation | r < 0.4 | r 0.4–0.7 | r > 0.7 |

Targets: false-positive rate < 5%, detection latency < 2 min from anomaly onset, anomaly precision ≥ 90%, recall ≥ 85%.

## 12. Calibration Guidance
Safe baselines. After several weeks of telemetry, calibrate so **Warning ≈ 95th percentile of normal behaviour** and **Critical ≈ user impact or SLA breach**.

## 13. Glossary (Light References from Strategy Appendix)
- **MTTD**: Mean Time to Detect.
- **MTTR**: Mean Time to Resolution.
- **SLO / SLA**: Service Level Objective / Agreement.
- **RPO / RTO**: Recovery Point / Time Objective.
- **CSAT**: Customer Satisfaction.

## 14. Cross-References
- [Chapter 3. Domain Observability Runbooks Pack](3-domain-observability-runbooks-pack.md): How these standards are operationally applied (runbooks).
- [Chapter 4. Alerting and Incident Severity Policy](4-alerting-and-incident-severity-policy.md): How thresholds map to severities and actions.
- [Chapter 5. Grafana Platform Standard and Visualization Playbook](5-grafana-platform-standard-and-visualization-playbook.md): How standards render in Grafana dashboards.
- [Chapter 6. AIOps Guardrails and Implementation Playbook](6-aiops-guardrails-and-implementation-playbook.md): AIOps interpretation of these metrics.
- [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md): Outcome KPI scorecard tied to these measurements.

---

[↑ Back to TOC](toc.md)
