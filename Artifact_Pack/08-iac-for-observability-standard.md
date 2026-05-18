---
title: IaC for Observability Standard
chapter: 8
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 8. IaC for Observability Standard

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Reviewed Date | Status |
|---|---|---|---|---|
| 0.1 | TBD | Internal |  | Draft |
---

## 8.1 Strategic Policy Position
Observability deployment must be **reproducible, version-controlled, containerized, and measurable**. The approved delivery approach is environment-aware rather than bound to a single orchestration tool:

- **Containerized deployment** — the observability stack runs as containers using the runtime or orchestrator appropriate for the target environment.
- **Automation and IaC** — deployment, configuration, validation, secrets handling, and rollout controls are managed through approved automation tooling and version-controlled definitions.

All deployment definitions, automation scripts, exporter configs, dashboards, alert rules, and SLO definitions are **version-controlled in Git** (GitOps-style change control).

## 8.2 Scope
- Deployment of the **OpenTelemetry Collector** as a containerized service.
- Configuration of **exporters, pipelines, sampling, processors**.
- Deployment of the full observability stack: **Prometheus, Loki, Tempo, Grafana** as containerized services.
- Per-host **node / container exporters** (Node Exporter, cAdvisor, Postgres / MySQL exporters, etc.).
- Application-side **OpenTelemetry SDK** wiring in services running on the same host or reachable over the network.
- IaC-driven **provisioning, lifecycle, validation, and reporting**.

## 8.3 Implementation Patterns

### 8.3.1 Repository Layout (Recommended)
```
observability-platform/
├─ deploy/
│  ├─ base/                           # base stack definition
│  ├─ overlays/                       # environment / component overlays
│  └─ env/<environment>.env           # per-env variables (no secrets)
├─ config/
│  ├─ otelcol/config.yaml
│  ├─ prometheus/prometheus.yml
│  ├─ loki/loki-config.yaml
│  ├─ tempo/tempo.yaml
│  └─ grafana/{provisioning,dashboards}/
├─ scripts/
│  ├─ Deploy-Stack.ps1
│  ├─ Stop-Stack.ps1
│  ├─ Test-StackHealth.ps1
│  ├─ Update-Stack.ps1
│  ├─ Rotate-Secrets.ps1
│  └─ Export-DeploymentTelemetry.ps1
└─ tests/
   └─ deployment/                     # deployment automation tests
```

### 8.3.2 Automation Responsibilities
- **Provisioning** — prepare runtime prerequisites, storage, network access, and platform dependencies.
- **Configuration rendering** — substitute environment-specific values into deployment and config templates.
- **Lifecycle** — deploy, update, roll back, and remove stack components in a controlled and repeatable way.
- **Validation** — health checks against each exposed endpoint (Prometheus `/-/ready`, Loki `/ready`, Tempo `/ready`, Grafana `/api/health`, OTel Collector `:13133/`).
- **Secrets** — pull from approved secret store; never persist secrets in repo; inject through approved secret-delivery patterns.
- **Telemetry export** — emit deploy success / failure / duration counters to the Collector for Grafana visualisation.
- **Idempotency** — automation must be safe to re-run and converge to declared state.

### 8.3.3 Deployment Conventions
- One logical deployment unit per environment with explicit environment configuration.
- All services define health checks; automation waits on `Healthy` before continuing.
- Restart policy and rollout behaviour must be defined explicitly for production deployments.
- Persistent state must use durable storage with a documented backup strategy.
- Internal-only services stay on private network paths; only approved entry points are exposed externally.
- Image versions are **pinned by digest or immutable tag** — no `:latest` in production.

### 8.3.4 Host & Workload Telemetry
- **Host metrics:** Node Exporter on every host; scraped by Prometheus.
- **Container metrics:** cAdvisor (or equivalent) for container CPU / memory / I/O.
- **Database telemetry:** Postgres / MySQL exporter services pointed at managed DBs.
- **Application telemetry:** OpenTelemetry SDK in each service exporting OTLP to the Collector endpoint.

## 8.4 Platform KPIs (Deployment and Automation)

| Category | Metric | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|
| Stack Deployment | Deploy OpenTelemetry Collector | 100% success | < 99% one env | < 95% / repeated failures | Failures imply config drift or automation error. |
| Stack Deployment | Configure Exporters | ≥ 99% valid | 97–99% sustained | < 97% / repeated misconfig | Misconfigured exporters cause data gaps. |
| Stack Deployment | Stack Provision Time (cold start) | ≤ 5 min per host | 5–10 min | > 10 min or errors > 1 | Measured from approved deployment invocation to all services `Healthy`. |
| Stack Deployment | Stack Update Time (image pull + restart) | ≤ 2 min per service | 2–5 min | > 5 min or failure | Rolling-update target. |
| Auto-Instrumentation | Service Coverage (OTel SDK) | 95–100% | 85–95% sustained | < 85% / errors | % of targeted services emitting telemetry. |
| Auto-Instrumentation | Exporter Health (Node / cAdvisor / DB) | ≥ 98% scrape success | 95–98% | < 95% / scrape failures | Prometheus `up{}` per exporter. |
| Auto-Instrumentation | Log Pipelines | 100% success | 99% / minor retry | < 98% / repeated parse errors | Test each Loki ingest path post-deploy. |
| Deployment Portability | Deployment Definition Validation | 100% pass | 99% | Any failure on main branch | CI gate. |
| Deployment Portability | Cross-Host Config Parity | 95–100% | 90–95% | < 90% mismatch / drift | < 5% drift target across host fleet. |
| Deployment Portability | Image / Deployment Version Alignment | 100% | 95–99% | < 95% mismatch | Same digests across deployments of the same tier. |
| Validation | Health-Check Pass Rate | 100% | < 99% one service | Any service `Unhealthy` > 5 min | Validated through approved health-check automation. |

## 8.5 Severity Policy (Deployment-Specific)
Owned by [Chapter 5. Alerting and Incident Severity Policy -> Section 5.4.7 IaC / OpenTelemetry Deployment](05-alerting-and-incident-severity-policy.md#547-iac-opentelemetry-deployment). Summary:

| Severity | Trigger | Action |
|---|---|---|
| Info / Normal | Healthy / normal | CI-CD trend analytics; no action. |
| Warning | Sustained breach ≥ 5 min, or 1 deployment failure | Review deployment logs, deployment definitions, exporter configs; correct drift. |
| Critical | Critical breach, or repeated deployment failures within 3 runs | Trigger incident or rollback; high chance of data loss / missing telemetry. |

## 8.6 Implementation & Visualization

**In Grafana (see also [6. Grafana Platform Standard and Visualization Playbook](06-grafana-platform-standard-and-visualization-playbook.md)):**
- **Deployment dashboards** → status of each platform service per host or cluster (image tag, uptime, healthcheck state).
- **Coverage dashboards** → per-host exporter scrape success and OTel service emission coverage.
- **Performance dashboards** → stack provision time and update time trends, sourced from deployment automation metrics.

**SLI examples:**
- **Collector Deployment Success Rate** = (Hosts with healthy Collector ÷ Intended hosts) × 100.
- **Exporter Coverage** = (Exporters returning `up=1` ÷ Configured exporters) × 100.
- **Service Telemetry Coverage** = (Services emitting OTel signals ÷ Targeted services) × 100.

**Validation tooling:**
- Deployment-definition validation in CI.
- Runtime health-state inspection by approved automation.
- Automated tests covering deployment rendering, automation logic, and post-deploy probes.
- Each deployment writes a structured success/failure record (JSON) consumed by an OTel exporter and surfaced in Grafana.

## 8.7 Calibration
After a few cycles, refine thresholds:
- **Critical** = "any misconfiguration that causes Collector telemetry gaps, or any deployment failure that leaves a service `Unhealthy`."
- **Warning** = "deployment slower than the per-host SLA window, or single-run failure recoverable by re-run."

### 8.7.1 Change Management

Changes to the observability platform are themselves a **change-managed** activity, distinct from changes by service teams to their service-level dashboards/alerts (covered by [Chapter 6. Grafana Platform Standard and Visualization Playbook -> Section 6.7.1 Dashboards-as-Code](06-grafana-platform-standard-and-visualization-playbook.md#671-dashboards-as-code)).

### 8.7.2 Change Classes

| Class | Examples | Approval | Window | Rollback Required |
|---|---|---|---|---|
| **Standard** | Image bump within minor version; config tweak with no schema change; new exporter for an existing target | PR review (2 approvers, one Platform Ops) | Anytime | Documented in PR |
| **Normal** | New backend (e.g. add Pyroscope); pipeline schema change; SDK upgrade across services | Platform Ops lead + ARB endorsement; ADR optional | Business-hours change window | Tested rollback in non-prod |
| **Major** | Backend replacement (e.g. swap Prometheus for VictoriaMetrics); cross-cloud migration; new T1 tenant | ARB-ratified ADR ([17. Observability ADR Decision Register](17-observability-adr-decision-register.md)) | Approved release train | Full DR-style rollback rehearsed |
| **Emergency** | Hot-fix during incident; cardinality emergency; security CVE patch | On-call SRE may apply; post-hoc PR within 24h; review at next CoP | Any time | Best-effort; documented in PIR |

### 8.7.3 Change Workflow

```
[Idea] → [Design / RFC if Normal+] → [PR opened]
                                        │
                                        ├─ CI: lint, deployment-definition validation, unit tests
                                        ├─ Staging deploy + smoke tests
                                        ├─ Canary host (production, 1 host)
                                        │     └─ 30-min soak; auto-rollback on health regression
                                        └─ Progressive rollout (waves of 25% / 50% / 100%)
                                              └─ Each wave gated on platform KPIs (Section 5)
```

A change passes a wave gate if **all** of the following hold during the wave's soak window:
- Collector deploy success ≥ 99% across the wave's hosts.
- Exporter health ≥ 98% across the wave.
- No critical-severity self-monitoring alert ([Chapter 22. Observability Platform HA and DR Design -> Section 22.7 Self-Monitoring (Meta-Monitor)](22-observability-platform-ha-and-dr-design.md#227-self-monitoring-meta-monitor)).
- Cardinality budget ([Chapter 2. Enterprise Observability Standards Catalog -> Section 2.3.4 Cardinality Governance](02-enterprise-observability-standards-catalog.md#234-cardinality-governance)) within ±5% of pre-change baseline.

### 8.7.4 Rollback Standards

Every change has a **named rollback path** documented in the PR description:
- **Deployment-level**: `git revert <sha>` plus approved deployment automation is the **default** rollback.
- **Schema-changing**: Forward-only schema migrations require a **forward fix** plan (rollback would lose data); explicit ARB approval needed for any such change (Major class).
- **Stateful**: Backend version downgrades that cross a storage-format boundary are **not** rollback-safe; treated as Major class with full DR rehearsal.

### 8.7.5 Change Calendar and Freezes

| Period | Policy |
|---|---|
| Standard business hours | Standard + Normal changes permitted |
| End of fiscal quarter (last 5 business days) | Normal class restricted; ARB approval required |
| Designated incident-response weeks (e.g. peak renewal season) | Freeze all Normal+ changes; Standard changes still allowed with explicit on-call sign-off |
| Active Sev-1 incident anywhere in the platform | All non-Emergency changes paused |

The change calendar is published in Grafana and reviewed at every CoP session.

### 8.7.6 Post-Change Validation

Every Normal+ change requires a post-change validation report within 48 hours:
- KPI movement (deploy success, exporter health, cardinality, ingest rate).
- Any incidents triggered.
- Lessons learned, captured in CoP RFC log if relevant.

The post-change report is the auditable evidence under **OBS-C-02** ([11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md)).

## 8.8 Cross-References
- [3. Observability Reference Architecture](03-observability-reference-architecture.md) — reference architecture deployed by this standard.
- [5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md) — deployment severity policy entry.
- [Chapter 6. Grafana Platform Standard and Visualization Playbook -> Section 6.7.1 Dashboards-as-Code](06-grafana-platform-standard-and-visualization-playbook.md#671-dashboards-as-code) — service-level dashboards-as-code workflow conforming to this standard.
- [11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md) — OBS-C-02 audits change records produced by Section 8.1.
- [12. Observability KPI Scorecard](12-observability-kpi-scorecard.md) — platform KPI roll-up to executive scorecard.
- [16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md) — change control / ARB approvals for stack changes.
- [17. Observability ADR Decision Register](17-observability-adr-decision-register.md) — ADRs for deployment and automation choices.
- [22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md) — self-monitoring signals gating Section 8.1 wave promotion.

---

[↑ Back to TOC](toc.md)
