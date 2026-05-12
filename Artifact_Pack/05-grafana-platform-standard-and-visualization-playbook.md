---
title: Grafana Platform Standard and Visualization Playbook
chapter: 5
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 5. Grafana Platform Standard and Visualization Playbook

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 1. Purpose
Defines how Grafana is operated as the primary visualization and alerting platform, and how dashboards deliver the strategy's "single pane of glass".

## 2. Role of Grafana in the Strategy
Grafana visualizes and alerts against Prometheus (metrics), Loki (logs), and Tempo (traces). Dashboards, ad-hoc queries, and alerts present a unified, single-pane-of-glass view of system health, performance, and reliability.

## 3. Dashboard Structure (Three-Layer Model)

| Layer | Scope | Audience |
|---|---|---|
| **Infrastructure** | System reliability overview — host health, container health, network | SRE / Platform Ops |
| **Application** | Service health and trace-driven metrics — latency, errors, throughput | App engineering, on-call |
| **Business** | Customer-impact KPIs — login/payment success rates, conversion latencies | Product, Operations leadership |

## 4. Key Metrics & Suggested Ranges (Visualization)
Full thresholds in [Chapter 1. Enterprise Observability Standards Catalog -> Section 10. Grafana Visualization Layer Standards](01-enterprise-observability-standards-catalog.md#10-grafana-visualization-layer-standards). Summary:

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

## 5. Recommended Alerting Policy (Grafana Implementation)
Severity model is owned by [Chapter 4. Alerting and Incident Severity Policy](04-alerting-and-incident-severity-policy.md). Grafana implementation specifics:

- Alert rules are defined as code (GitOps) and version-controlled.
- Severity-based routing via contact points & notification policies.
- Group, dedupe, and silence rules tuned to preserve signal-to-noise ≥ 80%.
- Each alert references a runbook URL (linking to [Chapter 3. Domain Observability Runbooks Pack](03-domain-observability-runbooks-pack.md) / [Chapter 12. Incident Response Playbook](12-incident-response-playbook.md)).

| Severity | Trigger Definition | Response Expectation |
|---|---|---|
| Info / Normal | Within healthy range or brief transient spikes | Observe trend; log for baselining only. |
| Warning | Above warning threshold for ≥ 5 min rolling window | Investigate within normal support hours; check dependency or resource limits. |
| Critical | Above critical threshold for ≥ 2 min or repeated within 10 min | Immediate incident response; probable user or business impact. |

## 6. Implementation & Visualization Tips
- **Dashboards structure:** Infra → Application → Business (top-down).
- **Percentile-based latency.** Always track **P95 and P99**, never rely solely on averages.
- **Correlate metrics.** High API latency + elevated error rates typically indicates backend/DB issue. High API latency + healthy DB latency typically indicates app-side or runtime contention.
- **Use panels.** Combine **gauges** (current state) with **time-series** panels (trend).
- **Anomaly overlays.** Predicted-vs-actual curves and anomaly deviation values rendered alongside live data (see [Chapter 6. AIOps Guardrails and Implementation Playbook](06-aiops-guardrails-and-implementation-playbook.md)).
- **Standardise dashboard library.** Per-domain template dashboards (Infra/App/DB/Network/Scaling/AI) cloned per service rather than hand-built.

## 7. Calibration
Industry-standard starting ranges. After a few weeks of live data, calibrate: warning ≈ 95th-percentile normal; critical ≈ user impact / SLA breach.

## 7.1. Dashboards-as-Code

All Grafana dashboards, alert rules, and notification policies are managed **as code**. No production dashboard is hand-edited in the UI; UI changes are exported and committed via PR. This is enforced by **OBS-C-02** in [Chapter 10. Compliance and Audit Control Matrix -> Section 5. Control Matrix (Initial)](10-compliance-and-audit-control-matrix.md#5-control-matrix-initial).

### 7.1.1 Repository Layout

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

### 7.1.2 Toolchain

| Tool | Purpose | Notes |
|---|---|---|
| **Grafonnet / Jsonnet** | Dashboard templating language | Generates Grafana JSON; reusable libsonnet panels |
| **`grizzly`** | Apply dashboards/rules to Grafana via API | `grr apply -f dashboards/` |
| **Grafana Terraform provider** | Alternative to grizzly for infra-style teams | Use one — not both — per ADR |
| **`dashboard-linter`** | Validate dashboards against best practice | Reject PR on lint fail |
| **`promtool test rules`** | Unit-test alert rules | Required for every alert rule |
| **`amtool`** | Test notification routing | Validates `policies/` |

### 7.1.3 PR Workflow

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

A **break-glass** path exists for severity-Critical incident-response dashboard fixes: a designated SRE may apply a hot-fix via grizzly direct to prod with a follow-up PR within 24 hours. The break-glass action is logged and reviewed at the next CoP ([Chapter 18. Observability Operating Model and Adoption Plan -> Section 4.1. Community of Practice](18-observability-operating-model-and-adoption-plan.md#41-community-of-practice)).

### 7.1.4 Service Dashboard Template (RED)

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

Service teams provide only `serviceName` and `tier`; the dashboard itself is generated. This is the single largest lever for the **dashboard self-service rate** KPI in [Chapter 18. Observability Operating Model and Adoption Plan -> Section 7.1. Adoption KPIs](18-observability-operating-model-and-adoption-plan.md#71-adoption-kpis).

### 7.1.5 Drift Detection

A scheduled job exports the live Grafana state and `diff`s it against the repository. Any drift opens an issue automatically. Common causes:
- Hot-fix without follow-up PR (break-glass).
- UI edit by an authorised user — flagged for education by CoP.
- Backend change (e.g. data-source rename) requiring repo update.

Drift > 7 days is a finding under **OBS-C-02**.

## 8. Cross-References
- [Chapter 1. Enterprise Observability Standards Catalog](01-enterprise-observability-standards-catalog.md) — metric standards and thresholds.
- [Chapter 2. Observability Reference Architecture](02-observability-reference-architecture.md) — Grafana's role in the reference architecture.
- [Chapter 4. Alerting and Incident Severity Policy](04-alerting-and-incident-severity-policy.md) — enterprise severity policy.
- [Chapter 6. AIOps Guardrails and Implementation Playbook](06-aiops-guardrails-and-implementation-playbook.md) — AI overlays in Grafana.
- [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) — IaC standard the Section 7.1 workflow conforms to.
- [Chapter 10. Compliance and Audit Control Matrix](10-compliance-and-audit-control-matrix.md) — OBS-C-02 audits the dashboards-as-code controls.
- [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md) — KPI scorecard rendered through Grafana.
- [Chapter 24. SLO and Error-Budget Framework](24-slo-and-error-budget-framework.md) — burn-rate panels embedded in Section 7.1.4 service dashboards.

---

[↑ Back to TOC](toc.md)
