# D19 — Observability Data Model Specification

> **Purpose:** Formal schema / model for logs, metrics, traces, entities, and relationships.
> **Source Strategy Sections:** Observability Data Model.
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1. Detailed schema/JSON definitions to be authored.

---

## 1. Purpose
Defines the formal data model used across the observability platform: telemetry signal types, the entities they describe, the relationships between them, and the schema conventions that allow correlation across pillars.

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
| Instance | Running replica of a service | `instance.id`, `host`, `pod`, `node`, `zone` |
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
- Metric names: `<domain>.<entity>.<measure>.<unit>` (see **D17 §5**, **D1 §3**).
- Labels: bounded cardinality; high-cardinality labels removed/bucketed after retention window (see **D8 §6**, **D9 §3**).

## 7. PII & Sensitive Data
PII is prohibited in logs and traces wherever possible. Masking, tokenisation, or redaction enforced at source or in the pipeline (see **D8 §5**).

## 8. To Be Authored (Follow-Up)
- JSON schema for required log fields per service tier.
- Trace span hierarchy schema for the four named user journeys (see **D17 §4.2**).
- Entity relationship diagram (ERD).
- Mapping from this model to Prometheus / Loki / Tempo native data formats.

## 9. Cross-References
- **D1** — naming and labelling standards.
- **D2** — pipeline storing this data.
- **D8** — governance and classification.
- **D17** — application-level field requirements.
