---
title: Enterprise Observability Standards Catalogue
chapter: 2
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 2. Enterprise Observability Standards Catalogue

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](01-xceedance-observability-strategy.md) | [Next Page](03-observability-reference-architecture.md)

| **Document Owner** | CoE-Architecture |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **First Review** | 1-Aug-2026 |
| **Next Review Due** | 1-Nov-2026 |

---

## 2.0 Reader Guide
This chapter is the **reference catalogue** for telemetry standards. Read it in layers:
- Start with **Section 2.3 Naming and Labelling Standards** to understand the core schema and mandatory attributes every signal must carry.
- Then use the **per-domain standards** (Sections 2.4–2.9 and 2.13–2.14) when you need concrete thresholds for infrastructure, application, database, network, scaling, synthetic, and front-end telemetry.
- Treat the later sections (Grafana, AI-driven standards, sampling and retention defaults) as **look-up tables** during implementation rather than cover-to-cover reading.

## 2.1 Scope and Intent
The single source of truth for telemetry standards across Xceedance — what is measured, named, and labelled, and the thresholds for healthy / warning / critical states. All other artefacts (runbooks, alerting policy, dashboards, AIOps) reference this catalogue rather than redefining values locally.

### 2.1.1 Normative Language

Throughout this pack, **normative requirements** use the RFC 2119-style keywords **MUST**, **SHOULD**, and **MAY**:
- **MUST** / **MUST NOT** — required for conformance; deviation requires an ADR and governance approval.
- **SHOULD** / **SHOULD NOT** — strongly recommended; deviation only when justified and documented.
- **MAY** — optional behaviour.

Plain-language "must" in narrative text is descriptive; when a statement is intended to be binding it is written with **MUST**/**MUST NOT**.

## 2.2 The Five Pillars of Telemetry
Telemetry is standardised so that systems generate consistent information, enabling a holistic view of the stack.

| Pillar | Definition | Primary Use |
|---|---|---|
| Metrics | Numerical measurements (e.g. CPU usage, error rates) | Quantitative health checks |
| Logs | Detailed records of discrete events (e.g. error messages) | Narrative context for events |
| Traces | End-to-end journey maps of requests across distributed services | Pinpoint bottlenecks |
| Changes | Configuration / infrastructure changes tracked across services (e.g. Azure Change Analysis) | Correlate modifications with system behaviour |
| Profiles | Stack-trace–based code profiling (emerging "fifth pillar", e.g. Pyroscope) | Code-level performance issues |

## 2.3 Naming and Labelling Standards
In practice, this section tells you **which fields must exist on every signal and how to name them**, so that dashboards, queries, and alerts behave consistently across all services.
- A standard telemetry schema is maintained (naming conventions for metrics, labels, log fields, and trace attributes).
- Data quality checks (missing labels, malformed logs, excessive cardinality) are implemented in the telemetry pipeline.
- Services must meet minimum instrumentation standards before production promotion.
- High-cardinality labels are removed or bucketed after defined retention windows.

### 2.3.1 Required Resource Attributes (every signal)
In practice, this means **every metric, log line, and trace span carries a common set of identity fields** (service, version, environment, tenant, tier) so that you can always answer "who emitted this?" and "in which context?" from the data alone.

| Attribute | Source | Example |
|---|---|---|
| `service.name` | Service catalogue | `quote-engine` |
| `service.version` | Build metadata | `1.4.2` |
| `deployment.environment` | Deploy pipeline | `prod` / `uat` / `dev` |
| `team` | Service catalogue | `quote-platform` |
| `tier` | Service catalogue | `T1` / `T2` / `T3` / `T4` (service criticality class) |
| `tenant_id` | Auth context (per [Chapter 27. Multi-Tenant and Customer-Site Deployment Model -> Section 27.2 Tenant Identity Model](27-multi-tenant-and-customer-site-deployment-model.md#272-tenant-identity-model)) | `customer-acme` (stable identifier of the customer the telemetry belongs to. Set by the gateway from the authenticated session, never trusted from the client) |
| `tenant_class` | Service catalogue | `enterprise` / `mid` (mid-market) / `smb` (small and medium business) |
| `region` | Deploy pipeline | `eu-west-1` |
| `host.name` | Auto-detected | `xc-host-001` |
| `trace.id` | OTel SDK (derived from inbound `traceparent`) | `4bf92f3577b34da6a3ce929d0e0e4736` |
| `correlation.id` | Edge hop (from inbound `X-Correlation-Id`, else generated alongside `traceparent`) | `xc-corr-2026-05-13-7f3a9b` |

`trace.id` ties a signal to its OTel span and is regenerated only when no inbound `traceparent` exists. `correlation.id` is the **business** correlation identifier: it MUST survive layers that do not emit spans — batch jobs, legacy adapters, partner callbacks, SIEM forwarders, message queues, and human-triggered replays — and MUST NOT be regenerated by any downstream hop. Logs, metric exemplars, and trace attributes all carry both.

**Correlation initiation (mandatory).** The W3C Trace Context `traceparent` header AND the `X-Correlation-Id` header MUST be generated at the **first Azure ingress hop** for every external request and propagated unchanged through every downstream service, queue, and async boundary. The first hop is the outermost component reached by the client:

| Edge component | Responsibility |
|---|---|
| Azure Front Door | Inject `traceparent` and `tracestate` if absent; preserve if client-supplied. |
| Azure Application Gateway / WAF | Same as Front Door when it is the outermost hop. |
| Azure API Management | Inject on inbound policy; emit `correlation.id` to backends. |
| Azure App Service / Functions / AKS Ingress | Fallback origin only when no upstream edge exists (internal-only services). |

Where Azure ingress is not in use, the same control applies at the equivalent edge component: **AWS** CloudFront / Application Load Balancer / API Gateway, **Google Cloud** External HTTP(S) Load Balancer / API Gateway, or an approved third-party edge such as Cloudflare. The rule is unchanged: the **outermost authenticated ingress hop** creates `traceparent` and `X-Correlation-Id`, and every downstream hop preserves both.

Every signal emitted downstream MUST carry `trace_id` and `span_id` derived from this `traceparent`. Services that drop or regenerate `traceparent` are non-conformant. See [Chapter 18. Application Telemetry Standard -> Section 18.3.1 Required Trace Attributes (Pre-Login)](18-application-telemetry-standard.md#1831-required-trace-attributes-pre-login) for the application-side contract.

### 2.3.2 Metric Naming Convention
- Lowercase, snake-case.
- Format: `<domain>_<entity>_<metric>_<unit>`.
- Examples: `http_request_duration_seconds`, `db_query_duration_seconds`, `quote_engine_calls_total`.
- Counters end in `_total`; histograms include the unit (`_seconds`, `_bytes`).
- Use OpenTelemetry semantic conventions where applicable; only invent custom names when convention does not cover the case.

### 2.3.3 Log Field Convention
- JSON-structured.
- Required fields: `ts`, `level`, `msg`, `service`, `trace_id`, `span_id`, `tenant_id`.
- PII fields prohibited at source (see [Chapter 24. Observability Platform Security Architecture -> Section 24.4 PII Redaction (Concrete Mechanisms)](24-observability-platform-security-architecture.md#244-pii-redaction-concrete-mechanisms)).

### 2.3.4 Cardinality Governance
In practice, this section defines **how many distinct time series a service is allowed to create** and what to do when that limit is approached.

> **Inline glossary — cardinality.** *Cardinality* is the number of distinct time series a metric produces (for example, one series per `service`, `region`, and `status`). High cardinality increases cost and can destabilise Prometheus and Loki.

Cardinality is the #1 production failure mode for Prometheus and Loki. Enforce three layers:

#### 2.3.4.1 Per-Service Cardinality Budget

| Tier | Max Active Series per Service | Max Distinct Label Combos per Metric |
|---|---|---|
| T1 | 50,000 | 1,000 |
| T2 | 20,000 | 500 |
| T3 | 10,000 | 200 |
| T4 | 5,000 | 100 |

#### 2.3.4.2 Forbidden Label Patterns
- User identifiers (`user_id`, `email`, `session_id`).
- Free-form strings (request paths with IDs, raw URLs).
- Timestamps as labels.
- Trace or span IDs as labels.
- Random UUIDs.

Any of the above must be **bucketed** (e.g., path templates instead of paths) or **dropped** before ingestion.

#### 2.3.4.3 Enforcement Mechanisms
1. **At source:** SDK-side label allow-list per kit (see [Chapter 26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md)).
2. **At collector:** `metric_relabel_configs` to drop forbidden labels.
3. **At backend:** `limits.max_label_names_per_series`, `limits.max_series_per_user` configured in Prometheus / Mimir.
4. **Recording rule:** `count by (__name__)({__name__=~".+"})` to track per-metric cardinality; alert when a service breaches its budget.
5. **Emergency switch:** A pre-tested `metric_relabel_config` block-list deployed via Git PR within 30 minutes when an incident demands it.

#### 2.3.4.4 Cardinality KPIs
- Per-service cardinality vs budget — dashboard in [Chapter 6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md).
- New high-cardinality metrics introduced per release.
- Time from cardinality breach to remediation.

## 2.4 Infrastructure Telemetry Standards

In practice, this section tells SRE / infra teams **what "healthy" looks like for hosts and containers** (CPU, memory, disk, restarts) and when to treat a condition as Warning vs Critical.

| Metric | Unit | Healthy | Acceptable | Concerning | Notes |
|---|---|---|---|---|---|
| CPU Usage | % | < 20% (under-utilised) | 40–70% | > 80% sustained > 5 min | Trigger scale-up at sustained > 80% |
| Memory Pressure | % | < 40% | 40–75% | > 85% sustained | Sustained high usage may cause OOM kills |
| Disk I/O Latency | ms | < 5 ms | 5–15 ms | > 20 ms, stalls | Keep < 10 ms for production |
| Container Restart Count | count/hour | 0 | 0–1 occasional | > 2/hour or repeating | > 2/hour suggests memory leak/config |
| Host Failures | count/week | 0 | 0–1 transient | > 1/day | Monitor host MTBF |
| Service Restart Events (Compose) | count/day | 0–1 | 1–5 | > 10/day | Frequent restarts → review healthchecks / config |
| Container Start Time | seconds | < 5 s | 5–15 s | > 30 s | Long start times slow recovery and updates |

### 2.4.1 Service Tiering Model

In practice, **tiers (T1–T4) let you scale effort and cost**: critical, customer-facing systems get deeper instrumentation, stricter SLOs, and longer retention than low-risk internal tools.

> **Inline glossary — tier.** A *tier* is the criticality class of a service (T1 = most critical, T4 = least). Many standards in this document (sampling rates, retention, alerting) are expressed "per tier" so that you do more for the services that matter most.

#### 2.4.1.1 Tier Definitions

| Tier | Definition | Examples |
|---|---|---|
| **T1 — Critical** | Direct revenue or regulated; customer-facing; outage = immediate business impact | Quote-to-Bind, FNOL, Policy Admin, Payment, Customer Self-Service |
| **T2 — Important** | Indirect revenue or operational dependency; outage = degraded experience | Producer Portal, Billing, Reinsurance |
| **T3 — Supporting** | Internal or periodic; outage = inconvenience | Reporting, BI, internal analytics |
| **T4 — Standard** | Internal-only or non-business-critical | Corporate IT, internal tooling |

#### 2.4.1.2 Per-Tier Policy Deltas

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
| RTO / RPO | per [Chapter 21. Business Capability and Value-Stream Mapping](21-business-capability-and-value-stream-mapping.md) | per [Chapter 21. Business Capability and Value-Stream Mapping](21-business-capability-and-value-stream-mapping.md) | per [Chapter 21. Business Capability and Value-Stream Mapping](21-business-capability-and-value-stream-mapping.md) | per [Chapter 21. Business Capability and Value-Stream Mapping](21-business-capability-and-value-stream-mapping.md) |

#### 2.4.1.3 Tier Assignment
- Tier is assigned at service registration in the catalogue.
- Tier changes require ARB approval and an ADR (see [Chapter 17. Observability ADR Decision Register](17-observability-adr-decision-register.md)).
- The tier label is mandatory on every signal (per Section 4.4).

## 2.5 Application Telemetry Standards (Pre-Login)

| Metric | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|
| Authentication Latency | < 300 ms | 500–800 ms ≥ 5 min | > 1000 ms sustained | Keep P95 < 800 ms |
| Login Failures | < 1% | 1–3% sustained 5 min | > 3% sustained or > 5% spike | Validate at step-up auth |
| MFA Failures | < 0.5% | 0.5–2% sustained | > 2% sustained or MFA outage | Often third-party dependency |
| API Gateway Response Time | P95 < 500 ms | P95 > 800 ms ≥ 5 min | P95 > 1200 ms sustained | Includes upstream services |

## 2.6 Application Telemetry Standards (Post-Login)

| Metric | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|
| Transaction Latency | < 500 ms P95 | P95 > 800 ms ≥ 5 min | P95 > 1200 ms sustained | Reflects full user transaction |
| Service-Call Failures | < 0.2% | 0.5–1% sustained | > 1% sustained or > 3% spike | Includes timeouts, 5xx, retries |
| Dependency Latency | < 200 ms | 200–400 ms sustained | > 400 ms sustained or timeouts | DB/cache/API dependencies |
| User-Journey Trace Success Rate | ≥ 98% | 95–98% | < 95% | Track per major journey |

## 2.7 Database Telemetry Standards

| Metric | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|
| Slow Queries | < 1% | 1–3% sustained 5 min | > 3% sustained or > 5% spike | Track P95/P99 query duration |
| Lock Contention | < 50 ms avg wait | 50–100 ms sustained / > 1% waiting | > 100 ms sustained / > 5% waiting | Concurrency design issue |
| Connection Pool Usage | 40–70% | > 80% > 5 min | > 90% > 2 min or exhaustion | Steady < 75% |
| Replication Lag | < 1 s | 2–5 s sustained | > 10 s sustained or rising | Critical for fresh-read deps |
| Query Latency (Overall) | P95 < 100 ms | 100–200 ms sustained | > 200 ms sustained or > 300 ms jump | Keep P95 ≤ 100 ms |

## 2.8 Network & Latency Telemetry Standards

| Metric | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|
| Packet Drops | < 0.1% | 0.1–0.5% ≥ 5 min | > 0.5% ≥ 2 min or spikes > 1% | Investigate route saturation |
| Cross-Service Latency (P95) | < 50 ms | 50–100 ms ≥ 5 min | > 100 ms sustained or > 200 ms spike | Intra-region < 100 ms; cross-region < 200 ms |
| DNS Failures | < 0.1% | 0.1–0.5% ≥ 5 min | > 1% ≥ 2 min or resolver outage | Caching/propagation/resolver health |
| Inter-Service Errors | < 0.2% | 0.2–1% ≥ 5 min | > 1% ≥ 2 min or backend outage | App-layer 4xx/5xx between services. Keep < 0.2%; review retries if climbing. |
| TCP Retransmissions | < 0.5% | 0.5–1% ≥ 5 min | > 1% ≥ 2 min or > 2% spike | Congestion / packet loss |

## 2.9 Scaling & Performance Telemetry Standards

| Metric | Purpose | Healthy | Warning | Critical |
|---|---|---|---|---|
| Queue Length | Scaling trigger | < 50 items avg | 50–200 ≥ 5 min | > 200 ≥ 2 min or rapid growth |
| Request Latency | SLA monitoring | P95 < 300 ms | P95 300–800 ms ≥ 5 min | P95 > 800 ms or P99 > 1 s sustained |
| Error Rate | Service health | < 0.1% | 0.1–1% ≥ 5 min | > 1% ≥ 2 min or > 5% spike |
| Container Startup Time | Recovery efficiency | < 10 s | 10–30 s | > 30 s sustained or repeated start failure |
| Cold Start Latency | Autoscaling tuning | < 300 ms FaaS / < 2 s container | 300–800 ms / 2–5 s | > 800 ms / > 5 s sustained |

## 2.10 Grafana Visualisation Layer Standards

| Layer | Metric | Healthy | Warning | Critical |
|---|---|---|---|---|
| Infra | Host Health (services Up) | 100% Up | < 99% > 5 min | < 97% or multi-service loss |
| Infra | Host Utilisation | 40–70% | > 75% > 5 min | > 90% sustained / OOM |
| Infra | Network Saturation | < 60% | 60–80% > 5 min | > 80% > 2 min or drops > 0.5% |
| Application | API Latency | < 300 ms | 300–800 ms sustained | > 800 ms > 2 min |
| Application | Error Rates | < 0.2% | 0.2–1% > 5 min | > 1% > 2 min or > 3% spike |
| Application | Request Throughput | Baseline trend | ±10% deviation | ±20% sustained 10 min |
| Business | Login Success Rate | ≥ 99% | 98–99% sustained | < 98% or failures > 3% |
| Business | Payment Success Rate | ≥ 98% | 96–98% sustained | < 96% > 2 min |
| Business | Checkout Latency | P95 < 2 s | 2–3 s sustained | > 3 s > 2 min |

## 2.11 AI-Driven Telemetry Standards

| Category | Metric | Healthy | Warning | Critical |
|---|---|---|---|---|
| Anomaly Detection | Abnormal Latency Spikes | ±10% baseline | 10–25% deviation > 5 min | > 25% deviation > 2 min |
| Anomaly Detection | Unusual Traffic Patterns | ±15% | 15–30% > 5 min | > 30% > 2 min or confidence > 95% |
| Correlation | Deployment vs Error Spike | r < 0.3 | r 0.3–0.6 | r > 0.6 |
| Correlation | Scaling vs DB Saturation | r < 0.4 | r 0.4–0.7 | r > 0.7 |

Targets: false-positive rate < 5%, detection latency < 2 min from anomaly onset, anomaly precision ≥ 90%, recall ≥ 85%.

## 2.12 Calibration Guidance
Safe baselines. After several weeks of telemetry, calibrate so **Warning ≈ 95th percentile of normal behaviour** and **Critical ≈ user impact or SLA breach**.

## 2.13 Synthetic and Black-Box Monitoring Standards

Synthetic monitoring complements real-user telemetry by continuously testing critical journeys from **outside-in** and from **inside** the platform.

### 2.13.1 Synthetic Probe Placement
- **External probes:**
  - Run from at least **three user-critical regions** per active geography (for example, EU, US, APAC) against production entrypoints (Azure Front Door / Application Gateway / API Management).
  - Cover the top 3–5 business journeys per T1 product: login, quote, bind, payment, self-service policy view.
- **Internal probes:**
  - Run from inside the cluster / VNet against internal entrypoints to detect configuration or dependency issues not visible from the public edge.
  - At minimum: API health endpoints, auth dependency checks, database connectivity, queue depth sanity checks.

### 2.13.2 Synthetic SLOs and Thresholds
Synthetic checks define **black-box SLOs** that backstop service SLOs:

| Service Tier | Synthetic Availability SLO | Synthetic Latency SLO |
|---|---|---|
| T1 | ≥ 99.9% probe success over 30 days | 95% of probes complete within 2.5 s end-to-end |
| T2 | ≥ 99.5% | 95% within 3.5 s |
| T3 | ≥ 99.0% | 95% within 5.0 s |
| T4 | ≥ 98.0% | best-effort |

Synthetic SLOs are **not a substitute** for service SLOs; they provide an early warning when full-path behaviour degrades.

### 2.13.3 Severity Mapping for Synthetic Failures
- **Warning:**
  - Probe failure rate between 1–5% over 10 minutes in any single region.
  - Latency degradation of 50–100% over baseline in any single region for ≥ 10 minutes.
  - Action: triage during business hours; check for regional routing, DNS, or CDN issues.
- **Critical:**
  - ≥ 5% failure sustained for 5 minutes in **two or more regions**, or
  - 100% failure from any region for ≥ 3 minutes, or
  - full-path latency > 2× SLO threshold for ≥ 10 minutes across regions.
  - Action: immediate incident; page on-call. See [Chapter 5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md) and [Chapter 13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md).

Synthetic checks for T1 services MUST be integrated into change pipelines so that **pre-deploy and post-deploy** synthetic runs gate production changes.

## 2.14 Front-End and RUM Standards

Front-end observability covers browser and mobile experiences via **Real User Monitoring (RUM)** plus complementary synthetic checks.

### 2.14.1 RUM Required Signals
- **Navigation timing:** time to first byte (TTFB), DOM content loaded, First Paint.
- **Core Web Vitals:**
  - Largest Contentful Paint (LCP).
  - First Input Delay (FID) or Interaction to Next Paint (INP) when FID is not available.
  - Cumulative Layout Shift (CLS).
- **Error telemetry:** JavaScript errors, resource load failures, unhandled promise rejections.
- **Session metrics:** page views per session, bounce rate, session length, errors per session.

### 2.14.2 Front-End SLO Targets (Indicative)

| Metric | Healthy Target | Warning | Critical |
|---|---|---|---|
| LCP | < 2.5 s for ≥ 75% of real-user page loads | 2.5–4.0 s for ≥ 25% | > 4.0 s for ≥ 25% |
| FID / INP | FID < 100 ms / INP < 200 ms for ≥ 75% | 100–300 ms / 200–400 ms for ≥ 25% | > 300 ms / > 400 ms for ≥ 25% |
| CLS | < 0.1 for ≥ 75% | 0.1–0.25 for ≥ 25% | > 0.25 for ≥ 25% |
| JS Error Rate | < 0.2% of sessions with JS errors | 0.2–1% | > 1% |

Front-end SLOs are attached to the same **service tier** model (Section 2.4.1) and feed into the application SLO framework in [Chapter 25. SLO and Error-Budget Framework](25-slo-and-error-budget-framework.md).

### 2.14.3 Privacy and Sampling
- **PII and content:**
  - No keystroke capture, DOM snapshotting of sensitive forms, or raw PII in RUM payloads.
  - RUM events must be limited to performance timing, high-level navigation metadata, and non-sensitive error context.
- **Sampling:**
  - **Production:** default 5–20% of sessions sampled, calibrated per T1/T2 traffic level. T1 services may sample at higher rates subject to FinOps review.
  - **Pre-production (uat/staging):** up to 100% sampling permitted; environment must not carry real PII.
  - **Development:** RUM optional; if enabled, 100% sampling allowed for debugging.
- **Region and tenant awareness:**
  - RUM data must be labelled by `tenant_id`, `region`, and `deployment.environment` and abide by regional data residency rules from [Chapter 9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md).

## 2.15 Environment-Specific Sampling and Retention Defaults

Per-environment defaults align SLO visibility with FinOps constraints (see [Chapter 10. Observability FinOps Standard](10-observability-finops-standard.md)).

| Environment | Metrics Scrape Interval | Trace Sampling (Head + Tail) | Log Level / Sampling | RUM Session Sampling | Hot Retention (Metrics / Logs / Traces) |
|---|---|---|---|---|---|
| **prod** | Per tier (T1 10 s, T2 15 s, T3 30 s, T4 60 s) | T1: 10% head + 100% errors; T2: 5% + 100% errors; T3: 1% + 100% errors; T4: 0.1% | Error + Warning by default; Info only for short periods during incidents; sampling or dropping DEBUG | 5–20% of sessions, tuned per service | T1: 30 d / 14 d / 7 d; T2: 30 d / 14 d / 7 d; T3: 14 d / 7 d / 3 d; T4: 14 d / 7 d / 1 d |
| **pre-prod / uat** | 15–30 s | Up to 20% head + 100% errors | Info + above; DEBUG allowed with shorter retention | Up to 100% of sessions (no real PII) | 14 d / 7 d / 3 d for all tiers |
| **test / dev** | 30–60 s | Flexible; 0–100% as needed for debugging | All levels allowed; developers must avoid noisy DEBUG spam | Optional; typically disabled or 100% for short debugging windows | 7 d / 3 d / 1 d |

Deviation from these defaults (for example, 100% tracing in prod or extended hot retention) requires ARB review and an ADR entry, as it has direct cost and risk implications.

## 2.16 Cross-References

See also:
- [Chapter 4. Domain Observability Runbooks Pack](04-domain-observability-runbooks-pack.md): How these standards are operationally applied (runbooks).
- [Chapter 5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md): How thresholds map to severities and actions.
- [Chapter 6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md): How standards render in Grafana dashboards.
- [Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md): AIOps interpretation of these metrics.
- [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md): Outcome KPI scorecard tied to these measurements.

---

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](01-xceedance-observability-strategy.md) | [Next Page](03-observability-reference-architecture.md)
