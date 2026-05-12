---
title: IaC for Observability Standard (Docker Compose + PowerShell)
chapter: 7
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 7. IaC for Observability Standard (Docker Compose + PowerShell)

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 1. Strategic Policy Position
Observability deployment must be **reproducible, version-controlled, host-portable, and measurable**. The selected delivery model is:

- **Docker Compose** — declarative definition of the observability stack (Collector, Prometheus, Loki, Tempo, Grafana, exporters).
- **PowerShell** — primary automation and IaC scripting layer: provisions hosts, renders configuration, brings the stack up/down, validates health, manages secrets, and emits deployment telemetry.

All Compose files, PowerShell scripts, exporter configs, dashboards, alert rules, and SLO definitions are **version-controlled in Git** (GitOps-style change control).

## 2. Scope
- Deployment of the **OpenTelemetry Collector** as a Compose service.
- Configuration of **exporters, pipelines, sampling, processors**.
- Deployment of the full observability stack: **Prometheus, Loki, Tempo, Grafana** as Compose services.
- Per-host **node / container exporters** (Node Exporter, cAdvisor, Postgres / MySQL exporters, etc.).
- Application-side **OpenTelemetry SDK** wiring in services running on the same host or reachable over the network.
- PowerShell-driven **provisioning, lifecycle, validation, and reporting**.

## 3. Implementation Patterns

### 3.1 Repository Layout (Recommended)
```
observability-platform/
├─ compose/
│  ├─ docker-compose.yml              # base stack (otelcol, prometheus, loki, tempo, grafana)
│  ├─ docker-compose.exporters.yml    # node/cadvisor/db exporters overlay
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
   └─ Pester/                         # PowerShell Pester tests
```

### 3.2 PowerShell Responsibilities
- **Provisioning** — install/verify Docker Engine + Compose plugin, prepare data directories, file permissions.
- **Configuration rendering** — substitute env-specific values into Compose / config templates.
- **Lifecycle** — `docker compose up -d`, `docker compose pull`, `docker compose down`, rolling updates per service.
- **Validation** — health checks against each exposed endpoint (Prometheus `/-/ready`, Loki `/ready`, Tempo `/ready`, Grafana `/api/health`, OTel Collector `:13133/`).
- **Secrets** — pull from approved secret store; never persisted in repo or Compose files; injected as environment variables or Docker secrets.
- **Telemetry export** — emit deploy success / failure / duration counters to the Collector for Grafana visualisation.
- **Idempotency** — scripts safe to re-run; converge to declared state.

### 3.3 Docker Compose Conventions
- One compose project per environment; environment selected via `COMPOSE_PROJECT_NAME` and `--env-file`.
- All services define **`healthcheck`** stanzas; PowerShell waits on `Healthy` before continuing.
- All services define **`restart: unless-stopped`** (or stricter in production).
- Persistent state on **named volumes** with documented backup strategy.
- Internal-only services bound to a **dedicated Docker network**; only Grafana is exposed externally.
- Image versions are **pinned by digest or immutable tag** — no `:latest` in production.

### 3.4 Host & Workload Telemetry
- **Host metrics:** Node Exporter on every host; scraped by Prometheus.
- **Container metrics:** cAdvisor (or equivalent) for container CPU / memory / I/O.
- **Database telemetry:** Postgres / MySQL exporter Compose services pointed at managed DBs.
- **Application telemetry:** OpenTelemetry SDK in each service exporting OTLP to the Collector endpoint.

## 4. Platform KPIs (Deployment via PowerShell + Docker Compose)

| Category | Metric | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|---|
| Stack Deployment | Deploy OpenTelemetry Collector | 100% success | < 99% one env | < 95% / repeated failures | Failures imply config drift or PowerShell error. |
| Stack Deployment | Configure Exporters | ≥ 99% valid | 97–99% sustained | < 97% / repeated misconfig | Misconfigured exporters cause data gaps. |
| Stack Deployment | Stack Provision Time (cold start) | ≤ 5 min per host | 5–10 min | > 10 min or errors > 1 | Measured from `Deploy-Stack.ps1` invocation to all services `Healthy`. |
| Stack Deployment | Stack Update Time (image pull + restart) | ≤ 2 min per service | 2–5 min | > 5 min or failure | Rolling-update target. |
| Auto-Instrumentation | Service Coverage (OTel SDK) | 95–100% | 85–95% sustained | < 85% / errors | % of targeted services emitting telemetry. |
| Auto-Instrumentation | Exporter Health (Node / cAdvisor / DB) | ≥ 98% scrape success | 95–98% | < 95% / scrape failures | Prometheus `up{}` per exporter. |
| Auto-Instrumentation | Log Pipelines | 100% success | 99% / minor retry | < 98% / repeated parse errors | Test each Loki ingest path post-deploy. |
| Host Portability | Compose Validation (`docker compose config`) | 100% pass | 99% | Any failure on main branch | CI gate. |
| Host Portability | Cross-Host Config Parity | 95–100% | 90–95% | < 90% mismatch / drift | < 5% drift target across host fleet. |
| Host Portability | Image / Compose Version Alignment | 100% | 95–99% | < 95% mismatch | Same digests across hosts of the same tier. |
| Validation | Health-Check Pass Rate | 100% | < 99% one service | Any service `Unhealthy` > 5 min | PowerShell `Test-StackHealth.ps1`. |

## 5. Severity Policy (Deployment-Specific)
Owned by [Chapter 4. Alerting and Incident Severity Policy -> Section 4. Domain-Specific Triggers (Reference) (subsection 4.7)](04-alerting-and-incident-severity-policy.md#4-domain-specific-triggers-reference). Summary:

| Severity | Trigger | Action |
|---|---|---|
| Info / Normal | Healthy / normal | CI-CD trend analytics; no action. |
| Warning | Sustained breach ≥ 5 min, or 1 deployment failure | Review PowerShell logs, Compose definitions, exporter configs; correct drift. |
| Critical | Critical breach, or repeated deployment failures within 3 runs | Trigger incident or rollback; high chance of data loss / missing telemetry. |

## 6. Implementation & Visualization

**In Grafana (see also [Chapter 5. Grafana Platform Standard and Visualization Playbook](05-grafana-platform-standard-and-visualization-playbook.md)):**
- **Deployment dashboards** → status of each Compose service per host (image tag, uptime, healthcheck state).
- **Coverage dashboards** → per-host exporter scrape success and OTel service emission coverage.
- **Performance dashboards** → stack provision time and update time trends, sourced from PowerShell-emitted metrics.

**SLI examples:**
- **Collector Deployment Success Rate** = (Hosts with healthy Collector ÷ Intended hosts) × 100.
- **Exporter Coverage** = (Exporters returning `up=1` ÷ Configured exporters) × 100.
- **Service Telemetry Coverage** = (Services emitting OTel signals ÷ Targeted services) × 100.

**Validation tooling:**
- `docker compose config` — schema/syntax validation in CI.
- `docker compose ps --format json` — health-state inspection by PowerShell.
- Pester tests covering Compose file rendering, PowerShell cmdlets, and post-deploy probes.
- Each PowerShell deployment writes a structured success/failure record (JSON) consumed by an OTel exporter and surfaced in Grafana.

## 7. Calibration
After a few cycles, refine thresholds:
- **Critical** = "any misconfiguration that causes Collector telemetry gaps, or any deployment failure that leaves a service `Unhealthy`."
- **Warning** = "deployment slower than the per-host SLA window, or single-run failure recoverable by re-run."

## 7.1. Change Management

Changes to the observability platform are themselves a **change-managed** activity, distinct from changes by service teams to their service-level dashboards/alerts (covered by [Chapter 5. Grafana Platform Standard and Visualization Playbook -> Section 7.1. Dashboards-as-Code](05-grafana-platform-standard-and-visualization-playbook.md#71-dashboards-as-code)).

### 7.1.1 Change Classes

| Class | Examples | Approval | Window | Rollback Required |
|---|---|---|---|---|
| **Standard** | Image bump within minor version; config tweak with no schema change; new exporter for an existing target | PR review (2 approvers, one Platform Ops) | Anytime | Documented in PR |
| **Normal** | New backend (e.g. add Pyroscope); pipeline schema change; SDK upgrade across services | Platform Ops lead + ARB endorsement; ADR optional | Business-hours change window | Tested rollback in non-prod |
| **Major** | Backend replacement (e.g. swap Prometheus for VictoriaMetrics); cross-cloud migration; new T1 tenant | ARB-ratified ADR ([Chapter 16](16-observability-adr-decision-register.md)) | Approved release train | Full DR-style rollback rehearsed |
| **Emergency** | Hot-fix during incident; cardinality emergency; security CVE patch | On-call SRE may apply; post-hoc PR within 24h; review at next CoP | Any time | Best-effort; documented in PIR |

### 7.1.2 Change Workflow

```
[Idea] → [Design / RFC if Normal+] → [PR opened]
                                        │
                                        ├─ CI: lint, compose config, unit tests
                                        ├─ Staging deploy + smoke tests
                                        ├─ Canary host (production, 1 host)
                                        │     └─ 30-min soak; auto-rollback on health regression
                                        └─ Progressive rollout (waves of 25% / 50% / 100%)
                                              └─ Each wave gated on platform KPIs (Section 4)
```

A change passes a wave gate if **all** of the following hold during the wave's soak window:
- Collector deploy success ≥ 99% across the wave's hosts.
- Exporter health ≥ 98% across the wave.
- No critical-severity self-monitoring alert ([Chapter 21. Observability Platform HA and DR Design -> Section 7. Self-Monitoring (Meta-Monitor)](21-observability-platform-ha-and-dr-design.md#7-self-monitoring-meta-monitor)).
- Cardinality budget ([Chapter 1. Enterprise Observability Standards Catalog -> Section 3.1. Cardinality Governance](01-enterprise-observability-standards-catalog.md#31-cardinality-governance)) within ±5% of pre-change baseline.

### 7.1.3 Rollback Standards

Every change has a **named rollback path** documented in the PR description:
- **Compose-level**: `git revert <sha>` + `Deploy-Stack.ps1 -Environment prod -Wave full` is the **default** rollback.
- **Schema-changing**: Forward-only schema migrations require a **forward fix** plan (rollback would lose data); explicit ARB approval needed for any such change (Major class).
- **Stateful**: Backend version downgrades that cross a storage-format boundary are **not** rollback-safe; treated as Major class with full DR rehearsal.

### 7.1.4 Change Calendar and Freezes

| Period | Policy |
|---|---|
| Standard business hours | Standard + Normal changes permitted |
| End of fiscal quarter (last 5 business days) | Normal class restricted; ARB approval required |
| Designated incident-response weeks (e.g. peak renewal season) | Freeze all Normal+ changes; Standard changes still allowed with explicit on-call sign-off |
| Active Sev-1 incident anywhere in the platform | All non-Emergency changes paused |

The change calendar is published in Grafana and reviewed at every CoP session.

### 7.1.5 Post-Change Validation

Every Normal+ change requires a post-change validation report within 48 hours:
- KPI movement (deploy success, exporter health, cardinality, ingest rate).
- Any incidents triggered.
- Lessons learned, captured in CoP RFC log if relevant.

The post-change report is the auditable evidence under **OBS-C-02** ([Chapter 10](10-compliance-and-audit-control-matrix.md)).

## 8. Cross-References
- [Chapter 2. Observability Reference Architecture](02-observability-reference-architecture.md) — reference architecture deployed by these scripts.
- [Chapter 4. Alerting and Incident Severity Policy](04-alerting-and-incident-severity-policy.md) — deployment severity policy entry.
- [Chapter 5. Grafana Platform Standard and Visualization Playbook -> Section 7.1. Dashboards-as-Code](05-grafana-platform-standard-and-visualization-playbook.md#71-dashboards-as-code) — service-level dashboards-as-code workflow conforming to this standard.
- [Chapter 10. Compliance and Audit Control Matrix](10-compliance-and-audit-control-matrix.md) — OBS-C-02 audits change records produced by Section 7.1.
- [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md) — platform KPI roll-up to executive scorecard.
- [Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md) — change control / ARB approvals for stack changes.
- [Chapter 16. Observability ADR Decision Register](16-observability-adr-decision-register.md) — ADR for choice of Docker Compose + PowerShell.
- [Chapter 21. Observability Platform HA and DR Design](21-observability-platform-ha-and-dr-design.md) — self-monitoring signals gating Section 7.1 wave promotion.

---

[↑ Back to TOC](toc.md)
