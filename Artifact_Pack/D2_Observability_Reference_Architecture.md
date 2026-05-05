# D2 — Observability Reference Architecture

> **Purpose:** Target architecture, component roles, telemetry collection layers, multi-cloud design.
> **Source Strategy Sections:** Build the Technical Foundation; Observability Strategy – High Level Architecture; Core Open-Source Observability Stack; Telemetry Collection Layers; Multi-Cloud Observability Design.
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1.

---

## 1. Architectural Principles
- **Centralised Data Collection.** All telemetry consolidated in a unified platform to break down silos and enable cross-pillar correlation.
- **Open Standards.** Vendor-neutral instrumentation (OpenTelemetry) to avoid lock-in and simplify integration.
- **Tool Selection.** Grafana selected as primary visualization and alerting tool based on scalability, ease of use, and cost.
- **Multi-Cloud Portability.** Same instrumentation, schema, and pipelines across AKS / EKS / GKE.
- **Single Pane of Glass.** Unified view across infra, application, and business layers.

## 2. High-Level Architecture (Logical View)

```
[ Services / Apps / Infra ]
        │ (OTel SDK / agents / sidecars / exporters)
        ▼
[ OpenTelemetry Collector ]  ← universal telemetry gateway (receive, process, enrich, export)
        │
        ├──► Prometheus  (Metrics)
        ├──► Loki        (Logs)
        ├──► Tempo       (Traces)
        │
        ▼
[ Grafana ]  ← dashboards, exploration, alerting (single pane of glass)
        │
        ▼
[ Agentic AI Layer ]  ← consumes telemetry APIs for RCA, anomaly detection, ticketing
```

## 3. Core Concepts

| Component | Role |
|---|---|
| OpenTelemetry Collector | Universal telemetry gateway: receives metrics/logs/traces from instrumented services, performs processing/enrichment, forwards to backends. Standardises ingestion and simplifies pipeline management. |
| Prometheus | Stores and queries metrics for performance, capacity, and health monitoring. |
| Loki | Stores structured logs; enables efficient querying and correlation with metrics/traces. |
| Tempo | Stores distributed traces; provides end-to-end visibility into request flows and dependencies. |
| Grafana | Dashboards, exploration views, and visual analytics across metrics, logs, and traces. |
| Agentic AI Layer | Consumes telemetry via APIs from Prometheus/Loki/Tempo to perform automated RCA, anomaly detection, and enriched incident-ticket generation. |

## 4. Core Open-Source Stack

| Layer | Tool | Role |
|---|---|---|
| Telemetry Standard | OpenTelemetry | Unified instrumentation standard for metrics, logs, traces |
| Telemetry Gateway | OpenTelemetry Collector | Central pipeline receiving, processing, exporting telemetry |
| Metrics Storage | Prometheus | Infra and application metrics |
| Logs Storage | Loki | Structured logs |
| Traces Storage | Tempo | Distributed traces |
| Visualization | Grafana | Dashboards, exploration, analytics |
| Infra Observability | Node Exporter | OS-level metrics (CPU/mem/disk/net) |
| Kubernetes Observability | kube-state-metrics | K8s object state |
| Network Monitoring | eBPF / Cilium / Pixie | Network traffic and flow analysis |
| DB Observability | Postgres / MySQL exporter | DB query/latency/connection/error metrics |
| Alerting | Grafana Alerting / Alertmanager | Alert rules, routing, notifications |

All components are open-source and OpenTelemetry compatible.

## 5. Telemetry Collection Layers
Telemetry is captured across four major layers:

1. **Infrastructure** — host/node, container, Kubernetes objects, network fabric.
2. **Application** — pre-login (auth/MFA/API gateway) and post-login (transactions, dependencies, journeys). See **D17** for application telemetry standards.
3. **Database** — query, lock, connection, replication telemetry.
4. **Network & Latency** — packet drops, retransmissions, mesh errors, DNS, cross-service latency.

A fifth, emerging layer — **Profiles** (Pyroscope-style stack-trace profiling) — is treated as a near-term extension. See **D1** for the formal pillar definition.

## 6. Multi-Cloud Observability Design
Same architecture deployed across Azure AKS, AWS EKS, and Google GKE.

**Advantages:**
- **Centralized Dashboards.** A unified Grafana view across cloud providers.
- **Unified Telemetry Schema.** Same metric names, labels, log fields, trace attributes everywhere.
- **Cross-Cloud Incident Visibility.** Incidents that span clouds remain visible in a single context.

**Design constraints:**
- Cross-cloud config parity ≥ 95% (see **D7** KPIs).
- Collector/exporter version alignment 100% across clusters.
- Codebase reused across providers via IaC (Pulumi). See **D7**.

## 7. Pipeline Processing
- Enrichment, masking/redaction of sensitive data, and label normalisation occur in the OpenTelemetry Collector.
- Sampling strategy (head vs tail) is configured at the collector layer for traces.
- Schema validation and cardinality controls are enforced at ingest.

## 8. Cross-References
- **D1** — telemetry standards consumed by this architecture.
- **D5** — Grafana platform standards and dashboard playbook.
- **D7** — IaC for OpenTelemetry deployment.
- **D8** — data lifecycle and retention applied to backends.
- **D19** — formal data model for entities/relationships across pillars.
