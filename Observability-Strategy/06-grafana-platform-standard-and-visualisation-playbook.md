---
title: Grafana Platform Standard and Visualisation Playbook
chapter: 6
version: 0.2
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 6. Grafana Platform Standard and Visualisation Playbook

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Reviewed Date | Status |
|---|---|---|---|---|
| 0.2 | TBD | Internal |  | Draft |
---

## 6.1 Purpose
Defines how Grafana is operated as the primary visualisation and alerting platform, and how dashboards deliver the strategy's "single pane of glass".

## 6.2 Role of Grafana in the Strategy
Grafana visualises and alerts against Prometheus (metrics), Loki (logs), and Tempo (traces). Dashboards, ad-hoc queries, and alerts present a unified, single-pane-of-glass view of system health, performance, and reliability.

## 6.3 Dashboard Structure (Three-Layer Model)

| Layer | Scope | Audience |
|---|---|---|
| **Infrastructure** | System reliability overview — host health, container health, network | SRE / Platform Ops |
| **Application** | Service health and trace-driven metrics — latency, errors, throughput | App engineering, on-call |
| **Business** | Customer-impact KPIs — login/payment success rates, conversion latencies | Product, Operations leadership |

## 6.4 Key Metrics & Suggested Ranges (Visualisation)
Full thresholds in [Chapter 2. Enterprise Observability Standards Catalogue -> Section 2.10 Grafana Visualisation Layer Standards](02-enterprise-observability-standards-catalog.md#210-grafana-visualisation-layer-standards). Summary:

| Layer | Metric | Healthy | Warning | Critical |
|---|---|---|---|---|
| Infra | Host Health (services Up) | 100% Up | < 99% > 5 min | < 97% / multi-service loss |
| Infra | Host Utilization | 40–70% | > 75% > 5 min | > 90% / OOM |
| Infra | Network Saturation | < 60% | 60–80% > 5 min | > 80% > 2 min or drops > 0.5% |
| App | API Latency (P95/P99) | < 300 ms | 300–800 ms sustained | > 800 ms > 2 min |
| App | Error Rates | < 0.2% | 0.2–1% > 5 min | > 1% > 2 min or > 3% spike |
| App | Request Throughput | Baseline trend | ±10% deviation | ±20% sustained 10 min |
| Business | Login Success | ≥ 99% | 98–99% sustained | < 98% or failures > 3% |
| Business | Payment Success | ≥ 98% | 96–98% sustained | < 96% > 2 min |
| Business | Checkout Latency (P95) | < 2 s | 2–3 s sustained | > 3 s > 2 min |

## 6.5 Recommended Alerting Policy (Grafana Implementation)
Severity model is owned by [5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md). Grafana implementation specifics:

- Alert rules are defined as code (GitOps) and version-controlled.
- Severity-based routing via contact points & notification policies.
- Group, dedupe, and silence rules tuned to preserve signal-to-noise ≥ 80%.
- Each alert references a runbook URL (linking to [4. Domain Observability Runbooks Pack](04-domain-observability-runbooks-pack.md) / [13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md)).

| Severity | Trigger Definition | Response Expectation |
|---|---|---|
| Info / Normal | Within healthy range or brief transient spikes | Observe trend; log for baselining only. |
| Warning | Above warning threshold for ≥ 5 min rolling window | Investigate within normal support hours; check dependency or resource limits. |
| Critical | Above critical threshold for ≥ 2 min or repeated within 10 min | Immediate incident response; probable user or business impact. |

## 6.6 Implementation & Visualisation Tips
- **Dashboards structure:** Infra → Application → Business (top-down).
- **Percentile-based latency.** Always track **P95 and P99**, never rely solely on averages.
- **Correlate metrics.** High API latency + elevated error rates typically indicates backend/DB issue. High API latency + healthy DB latency typically indicates app-side or runtime contention.
- **Use panels.** Combine **gauges** (current state) with **time-series** panels (trend).
- **Anomaly overlays.** Predicted-vs-actual curves and anomaly deviation values rendered alongside live data (see [7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md)).
- **Standardise dashboard library.** Per-domain template dashboards (Infra/App/DB/Network/Scaling/AI) cloned per service rather than hand-built.

## 6.7 Telemetry Health Dashboard Standard

A **Telemetry Health** dashboard is mandatory per environment. It surfaces the health of the observability data itself and implements the heuristics from [20. Observability Data Model Specification -> Section 20.8 Telemetry Health and Data-Quality Monitoring](20-observability-data-model-specification.md#208-telemetry-health-and-data-quality-monitoring).

### 6.7.1 Required Panels

- **Signal coverage (by service):**
  - Purpose: show, for each service, the proportion of traffic that is covered by metrics, logs, and traces.
  - Example metric (PromQL):
    - Request volume: `sum(rate(http_requests_total{service=~"$service"}[5m])) by (service)`.
    - Trace coverage: `sum(rate(http_requests_total{service=~"$service", trace_id!=""}[5m])) by (service) / sum(rate(http_requests_total{service=~"$service"}[5m])) by (service)`.

- **Schema validation failures (by signal):**
  - Purpose: visualise dead-letter volume for schema violations (see Section 20.9.6).
  - Example metric (LogQL → Prometheus counter via pipeline): `rate(obs_schemavalidation_failures_total{reason=~"required-field-missing|type-or-format"}[5m])`.

- **Cardinality vs budget:**
  - Purpose: compare active series and label-cardinality against per-tier budgets.
  - Example (PromQL):
    - Active series: `count by (service)( {__name__!=""} )` vs budget from `cardinality_budget{service="..."}`.
    - Panel shows % of budget used; alerts fire when > 80%.

- **Timestamp skew:**
  - Purpose: detect clock drift or bad timestamp wiring.
  - Example (LogQL):
    ```
    {job="otel-collector"}
    | unwrap ts(timestamp)
    | line_format "{{ .ts | duration_since_now }}"
    ```
  - In practice, a derived PromQL metric (e.g. `obs_timestamp_skew_seconds`) is preferred for graphing.

- **PII violations:**
  - Purpose: show the rate of records sent to `dlq-pii`.
  - Example metric: `rate(obs_telemetry_pii_violations_total[5m])` with labels `service`, `category`.

### 6.7.2 Layout and Usage

- The Telemetry Health dashboard is part of the **canonical** dashboard set and is owned by Platform Engineering.
- It is placed alongside infra/app/business overview dashboards and linked from the on-call runbook for platform issues.
- Panels use consistent colouring (green/amber/red) aligned with the thresholds in Chapters 2 and 20.

Service teams are encouraged to add a compact Telemetry Health row to their service-level dashboards (for example, trace coverage, schema failures, and cardinality vs budget for their service only).

## 6.8 Dashboard and Alert Governance

Without guardrails, dashboards and alerts sprawl. Governance ensures the library remains usable and supportable.

### 6.7.1 Dashboard Types and Lifecycle

- **Canonical dashboards:**
  - Owned by Platform Engineering or the Observability CoP.
  - Cover common layers (infra, app, business) and telemetry health.
  - Changes follow full PR review; breaking changes require communication to affected teams.
- **Service dashboards:**
  - Derived from standard templates (e.g. RED/USE) and owned by each service team.
  - Must include ownership metadata: `owner`, `team`, `tier`, `service.name` tags.
- **Team-local / experimental dashboards:**
  - Clearly tagged `experimental` or `team:<name>` and scoped to non-prod by default.
  - Subject to **expiry:** dashboards without any views in 90 days are flagged for deletion.

Lifecycle rules:
- Every dashboard JSON carries `xc.owner`, `xc.contact`, and `xc.tier` labels.
- A scheduled job computes **view counts**; dashboards with 0 views over 90 days open an issue for owner confirmation or archival.
- Canonical dashboards are exempt from automatic deletion but still reviewed annually.

### 6.7.2 Alert Creation, Ownership, and Review

- **Who may create production alerts:**
  - Platform Engineering, SRE, and designated service owners.
  - Non-production alerts may be created by any engineer but are bound to non-prod data sources.
- **Ownership metadata:**
  - Every alert rule must include `owner`, `team`, `service`, `tier`, and a `runbook_url`.
- **Review cadence:**
  - Alerts are reviewed at least **quarterly** per service: noise level, usefulness, and mapping to runbooks.
  - Experimental alerts must carry an `xc.expires_at` annotation; CI fails if expiry is in the past.
- **Sprawl controls:**
  - Alerts that have **never fired** in the last 180 days AND do not protect an explicit SLO are flagged for removal or consolidation.
  - Alerts that **fire > N times/week** without incident linkage are reviewed for tuning or removal (N defined per tier in [5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md)).

### 6.7.3 Quarterly Hygiene Review

Once per quarter, the Observability CoP runs a hygiene review per environment:
- Remove or archive 0-view dashboards (unless explicitly exempted).
- Tune or remove "never-firing" alerts and chronic-noise alerts.
- Verify that all Critical alerts link to an up-to-date runbook.
- Confirm that new services onboarded in the last quarter have RED dashboards and SLO burn panels (see [26. Service Onboarding and Instrumentation Kits](26-service-onboarding-and-instrumentation-kits.md)).

## 6.9 Calibration
Industry-standard starting ranges. After a few weeks of live data, calibrate: warning ≈ 95th-percentile normal; critical ≈ user impact / SLA breach.

### 6.9.1 Dashboards-as-Code

All Grafana dashboards, alert rules, and notification policies are managed **as code**. No production dashboard is hand-edited in the UI; UI changes are exported and committed via PR. This is enforced by **OBS-C-02** in [Chapter 11. Compliance and Audit Control Matrix -> Section 11.5 Control Matrix (Initial)](11-compliance-and-audit-control-matrix.md#115-control-matrix-initial).

#### 6.9.1.1 Repository Layout

```
observability-grafana/
├── dashboards/
│   ├── _templates/                     # Reusable Jsonnet/Grafonnet templates
│   │   ├── infra-host.libsonnet
│   │   ├── app-red.libsonnet           # RED method
│   │   ├── app-use.libsonnet           # USE method
│   │   └── business-funnel.libsonnet
│   ├── infra/
│   │   ├── host-overview.jsonnet
│   │   └── network.jsonnet
│   ├── app/
│   │   └── <service-name>.jsonnet      # One per service, derived from app-red
│   └── business/
│       └── checkout-funnel.jsonnet
├── alerts/
│   ├── _rules/                         # Reusable PromQL rule libraries
│   ├── infra-rules.yaml
│   ├── app-rules.yaml
│   └── slo-burn-rules.yaml             # See Chapter 24
├── policies/
│   ├── notification-policies.yaml
│   └── contact-points.yaml
├── tests/
│   ├── promql-syntax.sh
│   ├── dashboard-lint.sh               # dashboard-linter
│   └── alert-unit-tests.yaml           # promtool test rules
└── .github/workflows/
    └── deploy.yml                      # CI: lint → test → plan → apply
```

#### 6.9.1.2 Toolchain

| Tool | Purpose | Notes |
|---|---|---|
| **Grafonnet / Jsonnet** | Dashboard templating language | Generates Grafana JSON; reusable libsonnet panels |
| **`grizzly`** | Apply dashboards/rules to Grafana via API | `grr apply -f dashboards/` |
| **Grafana Terraform provider** | Alternative to grizzly for infra-style teams | Use one — not both — per ADR |
| **`dashboard-linter`** | Validate dashboards against best practice | Reject PR on lint fail |
| **`promtool test rules`** | Unit-test alert rules | Required for every alert rule |
| **`amtool`** | Test notification routing | Validates `policies/` |

#### 6.9.1.3 PR Workflow

```
PR opened → CI runs:
  1. promql-syntax.sh         (every rule parses)
  2. dashboard-lint.sh        (linter passes)
  3. promtool test rules      (alert unit tests pass)
  4. amtool check-config      (notification policies parse)
  5. grizzly diff             (preview changes against staging Grafana)
→ Reviewer approves
→ Merge to main
→ CI deploys to staging Grafana → smoke test → deploys to prod Grafana
```

A **break-glass** path exists for severity-Critical incident-response dashboard fixes: a designated SRE may apply a hot-fix via grizzly direct to prod with a follow-up PR within 24 hours. The break-glass action is logged and reviewed at the next CoP ([Chapter 19. Observability Operating Model and Adoption Plan -> Section 19.4.4 Community of Practice](19-observability-operating-model-and-adoption-plan.md#1944-community-of-practice)).

#### 6.9.1.4 Service Dashboard Template (RED)

Every service inherits the same RED dashboard skeleton, parameterised by service name. Pseudocode:

```jsonnet
// app-red.libsonnet
{
  new(serviceName, tier='T2'):: {
    title: 'App / RED — ' + serviceName,
    tags: ['app', 'red', 'tier:' + tier],
    templating: { list: [{ name: 'env', query: 'label_values(env)' }] },
    panels: [
      $.rate(serviceName),
      $.errors(serviceName),
      $.duration(serviceName, percentiles=['p50','p95','p99']),
      $.errorBudgetBurn(serviceName),       // links to Chapter 24
      $.exemplarTraces(serviceName),
      $.upstreamHealth(serviceName),
      $.deploymentMarkers(serviceName),
    ],
  },
}
```

Service teams provide only `serviceName` and `tier`; the dashboard itself is generated. This is the single largest lever for the **dashboard self-service rate** KPI in [Chapter 19. Observability Operating Model and Adoption Plan -> Section 19.7.1 Adoption KPIs](19-observability-operating-model-and-adoption-plan.md#1971-adoption-kpis).

#### 6.9.1.5 Drift Detection

A scheduled job exports the live Grafana state and `diff`s it against the repository. Any drift opens an issue automatically. Common causes:
- Hot-fix without follow-up PR (break-glass).
- UI edit by an authorised user — flagged for education by CoP.
- Backend change (e.g. data-source rename) requiring repo update.

Drift > 7 days is a finding under **OBS-C-02**.

## 6.10 Cross-References
- [2. Enterprise Observability Standards Catalogue](02-enterprise-observability-standards-catalog.md) — metric standards and thresholds.
- [3. Observability Reference Architecture](03-observability-reference-architecture.md) — Grafana's role in the reference architecture.
- [5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md) — enterprise severity policy.
- [7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md) — AI overlays in Grafana.
- [8. IaC for Observability Standard](08-iac-for-observability-standard.md) — IaC standard the Section 8.1 workflow conforms to.
- [11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md) — OBS-C-02 audits the dashboards-as-code controls.
- [12. Observability KPI Scorecard](12-observability-kpi-scorecard.md) — KPI scorecard rendered through Grafana.
- [25. SLO and Error-Budget Framework](25-slo-and-error-budget-framework.md) — burn-rate panels embedded in Section 8.1.4 service dashboards.

---

[↑ Back to TOC](toc.md)
