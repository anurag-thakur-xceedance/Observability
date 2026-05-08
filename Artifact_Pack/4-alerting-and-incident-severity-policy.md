# 4. Alerting and Incident Severity Policy

[↑ Back to TOC](toc.md)

---

## 1. Purpose
A single, enterprise-wide severity model and action expectation for alerts from observability telemetry. Consolidates per-domain severity tables into one authoritative model.

## 2. Principles
- **Actionable alerting.** Every alert must have a clear owner and response playbook. Alerts without action are removed.
- **Reduce alert fatigue.** Intelligent thresholds, deduplication, and routing reduce noise.
- **Percentile-based.** Latency alerts are based on P95/P99, not averages, with 5-minute moving averages to prevent flapping.
- **Severity is impact-driven.** Critical = user/SLA impact, not internal-metric breach alone.

## 3. Standard Severity Model

| Severity | Trigger Logic (Generic) | Recommended Action |
|---|---|---|
| **Info / Tracking / Normal** | Within healthy range, brief transient spikes, or AI deviation < warning with confidence < 70% | Log trend; no alerting. Use dashboards for capacity planning. |
| **Warning** | Metric exceeds warning range for ≥ 5 min rolling window | Review during business hours; check for transient congestion, partial outage, dependency lag, or recent config changes. |
| **Critical** | Metric exceeds critical range for ≥ 2 min (95th percentile) or repeated within 10 min | Immediate incident: page on-call team. Probable user or business impact. |

## 4. Domain-Specific Triggers (Reference)

### 4.1 Application (Pre-Login & Post-Login)
- **Warning:** metric exceeds warning range ≥ 5 min or crosses rolling 5-minute average.
- **Critical:** metric exceeds critical range ≥ 2 min (95th percentile) → immediate page.
- **Info:** deviations within normal range → dashboards only.

### 4.2 Database
- **Warning:** crosses warning threshold > 5 min → investigate within hours.
- **Critical:** above critical threshold > 2 min → immediate incident; probable user impact or system instability.
- **Info / Trend:** gradual deviation < warning → monitor, auto-tune config, plan capacity.

### 4.3 Network & Latency
- **Info / Normal:** within healthy range → record trend; no alert.
- **Warning:** ≥ 5 min window → check for transient congestion, partial outage, config changes.
- **Critical:** ≥ 2 min or repeated spikes → immediate investigation; probable user impact or network fault.

### 4.4 Scaling & Performance
- **Info / Normal:** within healthy range → record baseline for capacity prediction.
- **Warning:** ≥ 5 min → review scaling parameters, resource limits, dependency latency.
- **Critical:** ≥ 2 min → immediate intervention; possible user-visible impact or broken autoscaling.

### 4.5 Grafana / Cross-Layer Dashboards
- **Info / Normal:** healthy range or transient spikes → log for baselining only.
- **Warning:** above warning threshold ≥ 5 min rolling window → investigate within normal support hours; check dependency or resource limits.
- **Critical:** above critical ≥ 2 min or repeated within 10 min → immediate incident response; probable user or business impact.

### 4.6 AI-Detected Events
- **Info / Normal:** deviation < warning OR anomaly confidence < 70% → record event for model training; no alert.
- **Warning:** deviation crosses warning AND confidence ≥ 80% → human triage; check recent deployments / infra changes.
- **Critical:** critical threshold crossed AND confidence ≥ 90%, OR correlation > 0.6 sustained → automatic incident creation or rollback trigger.

### 4.7 IaC / OpenTelemetry Deployment
- **Info / Normal:** metrics inside healthy/normal → CI-CD trend analytics only.
- **Warning:** sustained breach ≥ 5 min or 1 IaC run → review pipeline / IaC scripts; correct configuration drift.
- **Critical:** breach or repeated IaC failures within 3 runs → trigger incident or rollback; high chance of telemetry data loss.

## 5. Alert Routing & Escalation
- Alert rules and dashboards are version-controlled (GitOps). See [Chapter 10. Compliance and Audit Control Matrix](10-compliance-and-audit-control-matrix.md).
- Severity-based routing is configured in Grafana Alerting / Alertmanager.
- Each alert is associated with a runbook reference (see [Chapter 3. Domain Observability Runbooks Pack](3-domain-observability-runbooks-pack.md) and [Chapter 12. Incident Response Playbook](12-incident-response-playbook.md)).
- Quiet hours, deduplication, and grouping are tuned to maintain signal-to-noise ratio ≥ 80% (see [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md)).

## 6. Calibration Guidance
After a few weeks of live data, calibrate thresholds so:
- **Warning** ≈ 95th percentile of normal behaviour.
- **Critical** ≈ conditions where user impact or SLA breach begins.

## 7. Cross-References
- [Chapter 1. Enterprise Observability Standards Catalog](1-enterprise-observability-standards-catalog.md) — threshold definitions feeding alert rules.
- [Chapter 3. Domain Observability Runbooks Pack](3-domain-observability-runbooks-pack.md) — runbooks invoked by alerts.
- [Chapter 5. Grafana Platform Standard and Visualization Playbook](5-grafana-platform-standard-and-visualization-playbook.md) — Grafana implementation of alerting.
- [Chapter 6. AIOps Guardrails and Implementation Playbook](6-aiops-guardrails-and-implementation-playbook.md) — AI-specific alerting tuning.
- [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md) — alert quality KPIs (signal-to-noise ratio).
- [Chapter 12. Incident Response Playbook](12-incident-response-playbook.md) — incident response workflow once alert fires.

---

[↑ Back to TOC](toc.md)
