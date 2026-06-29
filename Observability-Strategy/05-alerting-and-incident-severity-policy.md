---
title: Alerting and Incident Severity Policy
chapter: 5
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 5. Alerting and Incident Severity Policy

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](04-domain-observability-runbooks-pack.md) | [Next Page](06-grafana-platform-standard-and-visualisation-playbook.md)

| **Document Owner** | CoE-Architecture |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **First Review** | 1-Aug-2026 |
| **Next Review Due** | 1-Nov-2026 |

---

## 5.0 Reader Guide
Use this chapter to classify alert severity and response expectations. Service owners should use it when defining alert rules; on-call teams should use it to understand when an alert is informational, Warning, or Critical.

## 5.1 Purpose
A single, enterprise-wide severity model and action expectation for alerts from observability telemetry. Consolidates per-domain severity tables into one authoritative model.

## 5.2 Principles
- **Actionable alerting.** Every alert must have a clear owner and response playbook. Alerts without action are removed.
- **Reduce alert fatigue.** Intelligent thresholds, deduplication, and routing reduce noise.
- **Percentile-based.** Latency alerts are based on P95/P99, not averages, with 5-minute moving averages to prevent flapping.
- **Severity is impact-driven.** Critical = user/SLA impact, not internal-metric breach alone.

## 5.3 Standard Severity Model

| Severity | Trigger Logic (Generic) | Recommended Action |
|---|---|---|
| **Info / Tracking / Normal** | Within healthy range, brief transient spikes, or AI deviation < warning with confidence < 70% | Log trend; no alerting. Use dashboards for capacity planning. |
| **Warning** | Metric exceeds warning range for ≥ 5 min rolling window | Review during business hours; check for transient congestion, partial outage, dependency lag, or recent config changes. |
| **Critical** | Metric exceeds critical range for ≥ 2 min (95th percentile) or repeated within 10 min | Immediate incident: page on-call team. Probable user or business impact. |

**Global timing conventions.** Unless explicitly overridden in the domain sections below, all alerts follow these timing rules:
- **Warning:** condition in warning band for **at least 5 minutes** (rolling window).
- **Critical:** condition in critical band for **at least 2 minutes** at P95/P99, or repeated breaches within a **10-minute** window.

Domain-specific triggers in Section 5.4 refine *which* signals to watch per domain, but they all **inherit these timing conventions by default**.

## 5.4 Domain-Specific Triggers (Reference)

### 5.4.1 Application (Pre-Login & Post-Login)
- **Warning:** metric exceeds warning range ≥ 5 min or crosses rolling 5-minute average.
- **Critical:** metric exceeds critical range ≥ 2 min (95th percentile) → immediate page.
- **Info:** deviations within normal range → dashboards only.

### 5.4.2 Database
- **Warning:** crosses warning threshold > 5 min → investigate within hours.
- **Critical:** above critical threshold > 2 min → immediate incident; probable user impact or system instability.
- **Info / Trend:** gradual deviation < warning → monitor, auto-tune config, plan capacity.

### 5.4.3 Network & Latency
- **Info / Normal:** within healthy range → record trend; no alert.
- **Warning:** ≥ 5 min window → check for transient congestion, partial outage, config changes.
- **Critical:** ≥ 2 min or repeated spikes → immediate investigation; probable user impact or network fault.

### 5.4.4 Scaling & Performance
- **Info / Normal:** within healthy range → record baseline for capacity prediction.
- **Warning:** ≥ 5 min → review scaling parameters, resource limits, dependency latency.
- **Critical:** ≥ 2 min → immediate intervention; possible user-visible impact or broken autoscaling.

### 5.4.5 Grafana / Cross-Layer Dashboards
- **Info / Normal:** healthy range or transient spikes → log for baselining only.
- **Warning:** above warning threshold ≥ 5 min rolling window → investigate within normal support hours; check dependency or resource limits.
- **Critical:** above critical ≥ 2 min or repeated within 10 min → immediate incident response; probable user or business impact.

### 5.4.6 Synthetic and RUM Checks
- **Synthetic probes:**
  - Warning: 1–5% failure over 10 minutes in any region, or latency 50–100% above baseline for ≥ 10 minutes. Routed as **Warning**; triage in-hours.
  - Critical: ≥ 5% failure over 5 minutes in **two or more regions**, 100% failure from any single region for ≥ 3 minutes, or full-path latency > 2× SLO for ≥ 10 minutes across regions. Routed as **Critical**; immediate paging and incident creation.
- **RUM/Core Web Vitals:**
  - Warning: any front-end SLO (LCP, FID/INP, CLS, JS error rate) in [2.14.2](02-enterprise-observability-standards-catalog.md#2142-front-end-slo-targets-indicative) in warning band for ≥ 30 minutes.
  - Critical: front-end SLOs in critical band for ≥ 15 minutes, or a step change in JS error rate > 1% of active sessions. Routed as **Critical** for T1/T2 user-facing products.


### 5.4.7 AI-Detected Events
- **Info / Normal:** deviation < warning OR anomaly confidence < 70% → record event for model training; no alert.
- **Warning:** deviation crosses warning AND confidence ≥ 80% → human triage; check recent deployments / infra changes.
- **Critical:** critical threshold crossed AND confidence ≥ 90%, OR correlation > 0.6 sustained → automatic incident creation or rollback trigger.

AI-specific guardrails (confidence thresholds, model precision/recall, rollback rules) are defined in [Chapter 7. AIOps Guardrails and Implementation Playbook -> Section 7.4 Severity Policy for AI-Detected Events](07-aiops-guardrails-and-implementation-playbook.md#74-severity-policy-for-ai-detected-events).

### 5.4.8 IaC / OpenTelemetry Deployment
- **Info / Normal:** metrics inside healthy/normal → CI-CD trend analytics only.
- **Warning:** sustained breach ≥ 5 min or 1 IaC run → review pipeline / IaC scripts; correct configuration drift.
- **Critical:** breach or repeated IaC failures within 3 runs → trigger incident or rollback; high chance of telemetry data loss.

## 5.5 Alert Routing & Escalation
- Alert rules and dashboards are version-controlled (GitOps). See [Chapter 11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md).
- Severity-based routing is configured in Grafana Alerting / Alertmanager.
- Each alert is associated with a runbook reference (see [Chapter 4. Domain Observability Runbooks Pack](04-domain-observability-runbooks-pack.md) and [Chapter 13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md)).
- Quiet hours, deduplication, and grouping are tuned to maintain signal-to-noise ratio ≥ 80% (see [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md)).

## 5.6 Calibration Guidance
After a few weeks of live data, calibrate thresholds so:
- **Warning** ≈ 95th percentile of normal behaviour.
- **Critical** ≈ conditions where user impact or SLA breach begins.

## 5.7 Cross-References

See also:
- [Chapter 2. Enterprise Observability Standards Catalogue](02-enterprise-observability-standards-catalog.md) — threshold definitions feeding alert rules.
- [Chapter 4. Domain Observability Runbooks Pack](04-domain-observability-runbooks-pack.md) — runbooks invoked by alerts.
- [Chapter 6. Grafana Platform Standard and Visualisation Playbook](06-grafana-platform-standard-and-visualisation-playbook.md) — Grafana implementation of alerting.
- [Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md) — AI-specific alerting tuning.
- [Chapter 12. Observability KPI Scorecard](12-observability-kpi-scorecard.md) — alert quality KPIs (signal-to-noise ratio).
- [Chapter 13. Incident Response Playbook (Telemetry to Resolution)](13-incident-response-playbook.md) — incident response workflow once alert fires.

---

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](04-domain-observability-runbooks-pack.md) | [Next Page](06-grafana-platform-standard-and-visualisation-playbook.md)
