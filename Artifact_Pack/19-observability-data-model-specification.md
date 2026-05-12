---
title: Observability Data Model Specification
chapter: 19
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 19. Observability Data Model Specification

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 1. Purpose
Define the formal data model for the observability platform: telemetry signal types, the entities they describe, their relationships, and schema conventions enabling cross-pillar correlation.

## 2. Telemetry Signal Types

| Signal | Tool | Purpose |
|---|---|---|
| Metrics | Prometheus | Quantitative health checks; numerical time series |
| Logs | Loki | Discrete event records with narrative context |
| Traces | Tempo | End-to-end request journey across distributed services |
| Events | OpenTelemetry | Discrete occurrences (deployments, scaling, config changes) |
| Profiles | Pyroscope | Stack-trace / code-level performance |

Together these form **full-stack observability**.

## 3. Core Entities (Initial Inventory)

| Entity | Description | Key Attributes |
|---|---|---|
| Service | A deployable unit emitting telemetry | `service.name`, `service.version`, `env`, `cloud`, `region` |
| Instance | Running container of a service | `instance.id`, `host`, `container.id`, `container.name` |
| Dependency | External or internal target a service calls | `dependency.name`, `dependency.kind` (db / cache / http / queue) |
| User Session | Authenticated user session (tokenised) | `user.session.id` (hashed), `tenant_class` |
| Transaction | End-to-end user action (root span) | `transaction.name`, `journey.name`, `correlation.id` |
| Incident | A production issue with timeline & impact | `incident.id`, `severity`, `start`, `end`, `service` |
| Deployment | A change event | `deployment.id`, `service`, `version`, `timestamp` |
| Scaling Event | Autoscaler action | `event.id`, `service`, `direction`, `replicas.from/to` |

## 4. Relationships (Logical)
- **Service** *has many* **Instances**.
- **Service** *depends on* **Service / Dependency** (forms the dependency graph).
- **Transaction** *spans* multiple **Services** (root span + child spans).
- **Incident** *affects* one or more **Services** and *correlates with* **Deployments** / **Scaling Events**.
- **User Session** *initiates* **Transactions**.

## 5. Correlation Identifiers
- `correlation.id` (a.k.a. `trace.id`) — required across logs, metrics-with-exemplars, and traces.
- `service.name` + `env` — primary partition keys for cross-pillar joins.
- `tenant_class` — for multi-tenant grouping (no tenant PII).

## 6. Schema Conventions
- Follow **OpenTelemetry semantic conventions** where available.
- Custom attributes prefixed with `xc.` (Xceedance) namespace to avoid collision.
- Metric names: `<domain>.<entity>.<measure>.<unit>` (see [Chapter 17. Application Telemetry Standard -> Section 5. Naming Conventions](17-application-telemetry-standard.md#5-naming-conventions), [Chapter 1. Enterprise Observability Standards Catalog -> Section 3. Naming and Labelling Standards](01-enterprise-observability-standards-catalog.md#3-naming-and-labelling-standards)).
- Labels: bounded cardinality; high-cardinality labels removed/bucketed after retention window (see [Chapter 8. Observability Data Governance and Retention Policy -> Section 6. Data Quality and Standards](08-observability-data-governance-and-retention-policy.md#6-data-quality-and-standards), [Chapter 9. Observability FinOps Standard -> Section 3. Down-Sampling and Aggregation](09-observability-finops-standard.md#3-down-sampling-and-aggregation)).

## 7. PII & Sensitive Data
PII is prohibited in logs and traces wherever possible. Masking, tokenisation, or redaction enforced at source or in the pipeline (see [Chapter 8. Observability Data Governance and Retention Policy -> Section 5. Data Classification](08-observability-data-governance-and-retention-policy.md#5-data-classification)).

## 8. To Be Authored (Follow-Up)
- JSON schema for required log fields per service tier.
- Trace span hierarchy schema for the four named user journeys (see [Chapter 17. Application Telemetry Standard -> Section 4. Post-Login Telemetry (Required Fields & Standards) (subsection 4.2)](17-application-telemetry-standard.md#4-post-login-telemetry-required-fields-standards)).
- Entity relationship diagram (ERD).
- Mapping from this model to Prometheus / Loki / Tempo native data formats.

## 9. Cross-References
- [Chapter 1. Enterprise Observability Standards Catalog](01-enterprise-observability-standards-catalog.md) — naming and labelling standards.
- [Chapter 2. Observability Reference Architecture](02-observability-reference-architecture.md) — pipeline storing this data.
- [Chapter 8. Observability Data Governance and Retention Policy](08-observability-data-governance-and-retention-policy.md) — governance and classification.
- [Chapter 17. Application Telemetry Standard](17-application-telemetry-standard.md) — application-level field requirements.

---

[↑ Back to TOC](toc.md)
