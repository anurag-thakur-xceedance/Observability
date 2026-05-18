---
title: Service Onboarding and Instrumentation Kits
chapter: 25
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 25. Service Onboarding and Instrumentation Kits

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

> **Closes Gaps:** E1, I2.

---

## 1. Onboarding Workflow (Service Owner View)

```
[Day 0]   Service registered in catalog (owner, tier, value stream)
[Day 1]   Pick instrumentation kit (per language)
[Day 2]   Local: SDK installed; metrics + logs + traces emitting
[Day 5]   PR opened with starter dashboards & alerts (from kit)
[Day 7]   PRR scheduled
[Day 10]  PRR passed → service promoted to staging
[Day 14]  Staging soak (7 days observed); SLOs baselined
[Day 21]  Production promotion gate review
[Day 30]  Service operational with full observability
```

## 2. Production-Readiness Review (PRR) Gate

A service may not be promoted to production without a PASS on every item below.

| # | Item | Owner | Evidence |
|---|---|---|---|
| 1 | Service registered in catalog with tier, owner, on-call | Service Owner | Catalog entry |
| 2 | OpenTelemetry SDK initialised; resource attributes complete (service.name, service.version, deployment.environment, team, tier, tenant where applicable) | Dev | OTel debug exporter run |
| 3 | RED metrics (Rate, Errors, Duration) emitted per endpoint | Dev | Prometheus scrape sample |
| 4 | Health endpoint (`/health/liveness`, `/health/readiness`) implemented | Dev | Probe test |
| 5 | Structured JSON logs at INFO level; trace_id and span_id present in every log line | Dev | Log sample |
| 6 | Trace propagation verified (W3C Trace Context) inbound + outbound | Dev | End-to-end trace |
| 7 | At least 1 SLI defined per [Chapter 24. SLO and Error-Budget Framework](24-slo-and-error-budget-framework.md) | Service Owner | SLO YAML |
| 8 | At least 3 starter dashboard panels | Dev | Dashboard PR |
| 9 | At least 1 burn-rate alert wired to on-call routing | Service Owner | Alert YAML |
| 10 | Runbook document linked from every alert | Service Owner | Runbook URL |
| 11 | PII redaction validated for any user-impacting fields | Dev + Security | Synthetic-PII canary results |
| 12 | Cardinality budget per [Chapter 22. Capacity and Scale Model -> Section 8. Cardinality Budget](22-capacity-and-scale-model.md#8-cardinality-budget) respected | Platform Engineering | Cardinality report |
| 13 | Tenant labels present where multi-tenant per [Chapter 26](26-multi-tenant-and-customer-site-deployment-model.md) | Dev | Sample telemetry |
| 14 | Capacity sizing reviewed against [Chapter 22](22-capacity-and-scale-model.md) reference deployment | Platform Engineering | Sizing note |

## 3. Instrumentation Kits

Each kit is a Git template + README in the service-templates monorepo. The kit provides:
- Pre-configured OTel SDK with resource detector.
- Logger configured for JSON + trace correlation.
- Auto-instrumentation libraries enabled.
- Starter dashboard JSON.
- Starter Prometheus rules YAML.
- Starter SLO YAML (Sloth format).
- Sample runbook.

### 3.1 Java (Spring Boot) Kit
- **OTel:** `opentelemetry-spring-boot-starter` + `opentelemetry-exporter-otlp`.
- **Auto-instrumentation:** Java agent (`opentelemetry-javaagent.jar`) attached at JVM start.
- **Metrics:** Micrometer → OTel bridge.
- **Logs:** Logback JSON encoder; MDC wired to trace/span.
- **Sample env vars:**
  ```
  OTEL_EXPORTER_OTLP_ENDPOINT=https://otel-gw:4317
  OTEL_RESOURCE_ATTRIBUTES=service.name=quote-engine,service.version=1.4.2,deployment.environment=prod,team=quote,tier=T1
  OTEL_TRACES_SAMPLER=parentbased_traceidratio
  OTEL_TRACES_SAMPLER_ARG=0.1
  ```

### 3.2 Node.js / TypeScript Kit
- **OTel:** `@opentelemetry/sdk-node` + auto-instrumentations (`@opentelemetry/auto-instrumentations-node`).
- **Logs:** Pino with `pino-otel` for trace correlation.
- **Metrics:** OTel API; histogram for HTTP duration.
- **Tracing:** Auto for HTTP, gRPC, common DBs.

### 3.3 .NET Kit
- **OTel:** `OpenTelemetry.Extensions.Hosting` + `AutoInstrumentation`.
- **Logs:** Serilog with OTel sink and trace correlation.
- **Metrics:** `System.Diagnostics.Metrics`.
- **Common ASP.NET Core middleware** for HTTP server / client / EF Core.

### 3.4 Python Kit
- **OTel:** `opentelemetry-distro` + `opentelemetry-bootstrap` for auto-instrumentation.
- **Logs:** Structured JSON via `python-json-logger`; trace context via OTel logging instrumentation.
- **Frameworks covered:** Flask, FastAPI, Django, requests, urllib3, common DB drivers.

### 3.5 Go Kit
- **OTel:** `go.opentelemetry.io/otel` + contrib instrumentations per framework.
- **Logs:** `slog` with trace-aware handler.
- **Note:** Go has fewer auto-instrumentation hooks; expect manual span creation around critical functions.

### 3.6 Front-end (Browser) RUM Kit
- **OTel:** `@opentelemetry/sdk-trace-web` + browser auto-instrumentations.
- **RUM signals:** Core Web Vitals (LCP, INP, CLS), custom user-journey spans.
- **PII guard:** Strip URL params, form values; no DOM scraping.

### 3.7 Mobile RUM (iOS / Android) Kit (deferred)
- Roadmap: Phase 3.

### 3.8 Legacy / Unmodifiable Service (eBPF Kit)
- **Beyla** (or equivalent eBPF auto-instrumentation) for HTTP/gRPC visibility without code changes.
- Useful for vendor-supplied or legacy components where SDK adoption isn't possible.
- See [Chapter 2 Section 4.1. eBPF for Legacy and Non-Intrusive Instrumentation](02-observability-reference-architecture.md#41-ebpf-for-legacy-and-non-intrusive-instrumentation).

## 4. Role-Based Training

### 4.1 Curriculum Map
| Role | Module | Format | Duration | Cadence |
|---|---|---|---|---|
| Developer | OTel basics + RED + tracing | Self-paced + lab | 4 h | On hire |
| Developer | Service onboarding kit walkthrough | Workshop | 2 h | Per language adoption |
| Developer | Dashboards-as-code + PromQL primer | Self-paced + lab | 3 h | On hire |
| SRE | Full observability stack operations | Workshop | 8 h | On hire |
| SRE | SLO authoring + burn-rate alerting | Workshop | 4 h | Annually |
| Ops / NOC | Alert triage + runbook execution | Workshop | 4 h | On hire |
| Exec / Director | Outcome dashboards + KPI interpretation | Briefing | 1 h | Quarterly |
| Compliance / Audit | Audit trail + retention policy + access review | Workshop | 2 h | Annually |
| Security | Threat model + redaction + secrets | Workshop | 3 h | On hire + after incidents |

### 4.2 Assessment and Certification
- Per-module practical assessment (build a working alert; baseline an SLI; respond to a synthetic incident).
- "Observability Champion" recognition for SMEs willing to support their team — see [Chapter 18 Section 4.1. Community of Practice](18-observability-operating-model-and-adoption-plan.md#41-community-of-practice).

## 5. Knowledge Base

| Area | Content | Owner |
|---|---|---|
| Query cookbook | Common PromQL / LogQL / TraceQL recipes | SRE Guild |
| Runbook templates | Standard runbook skeletons (alert → triage → diagnose → mitigate → verify → escalate) | SRE Guild |
| Dashboard patterns | Three-layer dashboard examples (infra / app / business) | Platform Engineering |
| FAQs | Onboarding, common pitfalls (cardinality, sampling, redaction) | Observability CoP |

## 6. Adoption KPIs (rolling)
| KPI | Target |
|---|---|
| % T1 services with full kit applied | 100% by end Phase 1 |
| % T2 services with full kit applied | 100% by end Phase 2 |
| % services with at least 1 SLO | 100% T1 by end Phase 1; 100% T2 by end Phase 2 |
| % alerts with runbook | 100% |
| Time from "service registered" to "PRR pass" | Median ≤ 21 days |
| % PRRs passing first review | ≥ 70% |

## 7. Cross-References
- [Chapter 1. Enterprise Observability Standards Catalog](01-enterprise-observability-standards-catalog.md) — telemetry standards the kits implement.
- [Chapter 17. Application Telemetry Standard](17-application-telemetry-standard.md) — pre/post-login standards.
- [Chapter 18. Observability Operating Model and Adoption Plan](18-observability-operating-model-and-adoption-plan.md) — adoption governance.
- [Chapter 22. Capacity and Scale Model](22-capacity-and-scale-model.md) — cardinality budget.
- [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) — PII redaction enforcement.
- [Chapter 24. SLO and Error-Budget Framework](24-slo-and-error-budget-framework.md) — SLO authoring.

---

[↑ Back to TOC](toc.md)
