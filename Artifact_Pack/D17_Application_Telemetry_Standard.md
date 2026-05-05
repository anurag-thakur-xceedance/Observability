# D17 — Application Telemetry Standard

> **Purpose:** Pre-login / post-login telemetry requirements and conventions.
> **Source Strategy Sections:** Application Telemetry (Pre-Login / Post-Login) — implementation standards & fields; Pre-Login Telemetry (standards portion); Post-Login Telemetry (standards portion).
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1.

---

## 1. Purpose
Defines **what** application services must emit, **how** fields are named, and **what thresholds** they must adhere to. Operational triage steps live in **D3 §3**.

## 2. Scope
All Xceedance applications (PaaS-hosted, SaaS-hosted, customer-deployed) must emit pre-login and post-login telemetry via OpenTelemetry SDKs and pipelines defined in **D2**.

## 3. Pre-Login Telemetry (Required Fields & Standards)

| Metric | Unit / Scope | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|---|
| Authentication Latency | ms (auth request → response) | < 300 ms | 500–800 ms ≥ 5 min | > 1000 ms sustained or errors | P95 < 800 ms |
| Login Failures | % attempts failing | < 1% | 1–3% sustained 5 min | > 3% sustained 5 min or > 5% spike | Indicates credential/backend issue |
| MFA Failures | % MFA challenges failing | < 0.5% | 0.5–2% sustained | > 2% sustained / MFA outage | Often third-party dependency |
| API Gateway Response Time | ms (avg + P95) | P95 < 500 ms | P95 > 800 ms ≥ 5 min | P95 > 1200 ms sustained | Includes upstream services |

### 3.1 Required Trace Attributes (Pre-Login)
- `service.name`, `auth.provider`, `auth.method` (`password` / `mfa` / `sso`), `auth.outcome` (`success` / `failure` / `mfa_required`), `gateway.route`, `client.region`, `correlation.id`.

### 3.2 Required Log Fields
- `timestamp`, `level`, `service.name`, `auth.outcome`, `error.code`, `correlation.id`. **No PII** (see **D8**).

## 4. Post-Login Telemetry (Required Fields & Standards)

| Metric | Unit / Scope | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|---|
| Transaction Latency | ms end-to-end user action | < 500 ms P95 | P95 > 800 ms ≥ 5 min | P95 > 1200 ms sustained | Reflects full user transaction |
| Service-Call Failures | % calls failing | < 0.2% | 0.5–1% sustained | > 1% sustained or > 3% spike | Includes timeouts, 5xx, retries |
| Dependency Latency | ms (external/internal dependency response) | < 200 ms | 200–400 ms sustained | > 400 ms sustained or timeouts | DB / cache / API |
| User-Journey Trace Success | % completed journeys without error | ≥ 98% | 95–98% | < 95% | Per major journey: login, checkout, report-gen |

### 4.1 Required Trace Attributes (Post-Login)
- `service.name`, `transaction.name`, `user.session.id` (hashed/tokenised), `journey.name`, `dependency.name`, `dependency.kind` (`db` / `cache` / `http` / `queue`), `correlation.id`.

### 4.2 Required Span Hierarchy
- Root span per user transaction; child spans per service call and dependency call. End-to-end span coverage required for the four named journeys: **login**, **checkout**, **report-gen**, **policy-quote** (placeholder — confirm with product).

## 5. Naming Conventions
- Metric names follow `<domain>.<entity>.<measure>.<unit>` (e.g. `app.auth.latency.ms`).
- Labels: `service`, `env`, `region`, `cloud`, `tenant_class` (no PII).
- Trace attributes follow OpenTelemetry semantic conventions where available.

## 6. PII & Data Classification
- **PII prohibited** in logs and traces wherever possible.
- Masking / tokenisation / redaction enforced at source or in the OpenTelemetry pipeline (see **D8 §5**).

## 7. Conformance
- Services must meet this standard before production promotion (see **D8 §6**).
- Conformance evidence is part of release readiness.

## 8. Cross-References
- **D1** — enterprise standards umbrella.
- **D2** — pipeline and backend that consume this telemetry.
- **D3 §3** — operational runbook applying this telemetry.
- **D5** — Grafana visualization of these metrics.
- **D8** — PII / data governance constraints.
- **D19** — formal data model for span hierarchy and entities.
