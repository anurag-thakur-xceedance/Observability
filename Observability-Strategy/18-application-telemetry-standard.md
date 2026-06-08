---
title: Application Telemetry Standard
chapter: 18
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 18. Application Telemetry Standard

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Reviewed Date | Status |
|---|---|---|---|---|
| 0.1 | TBD | Internal |  | Draft |
---

## 18.1 Purpose
Defines **what** application services must emit, **how** fields are named, and **what thresholds** they must adhere to. Operational triage steps live in [Chapter 4. Domain Observability Runbooks Pack -> Section 4.3 Application Observability Runbook (Pre-Login & Post-Login Execution Steps)](04-domain-observability-runbooks-pack.md#43-application-observability-runbook-pre-login-post-login-execution-steps).

## 18.2 Scope
All Xceedance applications (PaaS-hosted, SaaS-hosted, customer-deployed) must emit pre-login and post-login telemetry via OpenTelemetry SDKs and pipelines defined in [3. Observability Reference Architecture](03-observability-reference-architecture.md).

## 18.3 Pre-Login Telemetry (Required Fields & Standards)

| Metric | Unit / Scope | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|
| Authentication Latency | ms (auth request → response) | < 300 ms | 500–800 ms ≥ 5 min | > 1000 ms sustained or errors | P95 < 800 ms |
| Login Failures | % attempts failing | < 1% | 1–3% sustained 5 min | > 3% sustained 5 min or > 5% spike | Indicates credential/backend issue |
| MFA Failures | % MFA challenges failing | < 0.5% | 0.5–2% sustained | > 2% sustained / MFA outage | Often third-party dependency |
| API Gateway Response Time | ms (avg + P95) | P95 < 500 ms | P95 > 800 ms ≥ 5 min | P95 > 1200 ms sustained | Includes upstream services |

### 18.3.1 Required Trace Attributes (Pre-Login)
- `service.name`, `auth.provider`, `auth.method` (`password` / `mfa` / `sso`), `auth.outcome` (`success` / `failure` / `mfa_required`), `gateway.route`, `client.region`, `correlation.id`.

**Correlation initiation (mandatory).** The W3C Trace Context `traceparent` header MUST be created at the first Azure ingress hop (Azure Front Door, Application Gateway, or API Management — whichever is outermost) and propagated through every downstream service, message, and async hand-off. Application services MUST NOT regenerate `traceparent`; they extract `trace_id` / `span_id` from the inbound header and attach them to every emitted span, log line, and metric exemplar. Pre-login flows that bypass authenticated APIM policies still inherit `traceparent` from Front Door / App Gateway. See [Chapter 2. Enterprise Observability Standards Catalogue -> Section 2.3.1 Required Resource Attributes (every signal)](02-enterprise-observability-standards-catalog.md#231-required-resource-attributes-every-signal) for the edge-injection contract.

Where Azure ingress is not present, the same requirement applies at the equivalent outermost ingress component in AWS, Google Cloud, or an approved third-party edge service. The cloud-specific product may change; the propagation contract does not.

### 18.3.2 Required Log Fields
- `timestamp`, `level`, `service.name`, `auth.outcome`, `error.code`, `correlation.id`. **No PII** (see [9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md)).

## 18.4 Post-Login Telemetry (Required Fields & Standards)

| Metric | Unit / Scope | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|
| Transaction Latency | ms end-to-end user action | < 500 ms P95 | P95 > 800 ms ≥ 5 min | P95 > 1200 ms sustained | Reflects full user transaction |
| Service-Call Failures | % calls failing | < 0.2% | 0.5–1% sustained | > 1% sustained or > 3% spike | Includes timeouts, 5xx, retries |
| Dependency Latency | ms (external/internal dependency response) | < 200 ms | 200–400 ms sustained | > 400 ms sustained or timeouts | DB / cache / API |
| User-Journey Trace Success | % completed journeys without error | ≥ 98% | 95–98% | < 95% | Per major journey: login, checkout, report-gen |

### 18.4.1 Required Trace Attributes (Post-Login)
- `service.name`, `transaction.name`, `user.session.id` (hashed/tokenised), `journey.name`, `dependency.name`, `dependency.kind` (`db` / `cache` / `http` / `queue`), `correlation.id`.

### 18.4.2 Required Span Hierarchy
- Root span per user transaction; child spans per service call and dependency call. End-to-end span coverage required for the four named journeys: **login**, **checkout**, **report-gen**, **policy-quote** (subject to product confirmation).

## 18.5 Naming Conventions
- Metric names follow the enterprise convention in [Chapter 2. Enterprise Observability Standards Catalogue -> Section 2.3.2 Metric Naming Convention](02-enterprise-observability-standards-catalog.md#232-metric-naming-convention): lowercase snake_case with units where applicable (for example `http_request_duration_seconds`).
- Labels: `service`, `env`, `region`, `cloud`, `tenant_class` (no PII).
- Trace attributes follow OpenTelemetry semantic conventions where available.

## 18.6 PII & Data Classification
- **PII prohibited** in logs and traces wherever possible.
- Masking / tokenisation / redaction enforced at source or in the OpenTelemetry pipeline (see [Chapter 9. Observability Data Governance and Retention Policy -> Section 9.5 Data Classification](09-observability-data-governance-and-retention-policy.md#95-data-classification)).

## 18.7 Conformance
- Services must meet this standard before production promotion (see [Chapter 9. Observability Data Governance and Retention Policy -> Section 9.6 Data Quality and Standards](09-observability-data-governance-and-retention-policy.md#96-data-quality-and-standards)).
- Conformance evidence is part of release readiness.

## 18.8 Cross-References
- [2. Enterprise Observability Standards Catalogue](02-enterprise-observability-standards-catalog.md) — enterprise standards umbrella.
- [3. Observability Reference Architecture](03-observability-reference-architecture.md) — pipeline and backend that consume this telemetry.
- [Chapter 4. Domain Observability Runbooks Pack -> Section 4.3 Application Observability Runbook (Pre-Login & Post-Login Execution Steps)](04-domain-observability-runbooks-pack.md#43-application-observability-runbook-pre-login-post-login-execution-steps) — operational runbook applying this telemetry.
- [6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md) — Grafana visualisation of these metrics.
- [9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md) — PII / data governance constraints.
- [20. Observability Data Model Specification](20-observability-data-model-specification.md) — formal data model for span hierarchy and entities.

---

[↑ Back to TOC](toc.md)
