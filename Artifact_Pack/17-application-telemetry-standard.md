---
title: Application Telemetry Standard
chapter: 17
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 17. Application Telemetry Standard

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 1. Purpose
Defines **what** application services must emit, **how** fields are named, and **what thresholds** they must adhere to. Operational triage steps live in [Chapter 3. Domain Observability Runbooks Pack -> Section 3. Application Observability Runbook (Pre-Login & Post-Login Execution Steps)](03-domain-observability-runbooks-pack.md#3-application-observability-runbook-pre-login-post-login-execution-steps).

## 2. Scope
All Xceedance applications (PaaS-hosted, SaaS-hosted, customer-deployed) must emit pre-login and post-login telemetry via OpenTelemetry SDKs and pipelines defined in [Chapter 2. Observability Reference Architecture](02-observability-reference-architecture.md).

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
- `timestamp`, `level`, `service.name`, `auth.outcome`, `error.code`, `correlation.id`. **No PII** (see [Chapter 8. Observability Data Governance and Retention Policy](08-observability-data-governance-and-retention-policy.md)).

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
- Masking / tokenisation / redaction enforced at source or in the OpenTelemetry pipeline (see [Chapter 8. Observability Data Governance and Retention Policy -> Section 5. Data Classification](08-observability-data-governance-and-retention-policy.md#5-data-classification)).

## 7. Conformance
- Services must meet this standard before production promotion (see [Chapter 8. Observability Data Governance and Retention Policy -> Section 6. Data Quality and Standards](08-observability-data-governance-and-retention-policy.md#6-data-quality-and-standards)).
- Conformance evidence is part of release readiness.

## 8. Cross-References
- [Chapter 1. Enterprise Observability Standards Catalog](01-enterprise-observability-standards-catalog.md) — enterprise standards umbrella.
- [Chapter 2. Observability Reference Architecture](02-observability-reference-architecture.md) — pipeline and backend that consume this telemetry.
- [Chapter 3. Domain Observability Runbooks Pack -> Section 3. Application Observability Runbook (Pre-Login & Post-Login Execution Steps)](03-domain-observability-runbooks-pack.md#3-application-observability-runbook-pre-login-post-login-execution-steps) — operational runbook applying this telemetry.
- [Chapter 5. Grafana Platform Standard and Visualization Playbook](05-grafana-platform-standard-and-visualization-playbook.md) — Grafana visualization of these metrics.
- [Chapter 8. Observability Data Governance and Retention Policy](08-observability-data-governance-and-retention-policy.md) — PII / data governance constraints.
- [Chapter 19. Observability Data Model Specification](19-observability-data-model-specification.md) — formal data model for span hierarchy and entities.

---

[↑ Back to TOC](toc.md)
