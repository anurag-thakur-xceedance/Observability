# D7 — IaC for Observability Standard (OpenTelemetry + Pulumi)

> **Purpose:** IaC patterns, controls, deployment model, and platform KPIs for OpenTelemetry-based observability stack.
> **Source Strategy Sections:** Infrastructure as a Code Role in OpenTelemetry Deployment; Key Metrics for Infrastructure-as-Code Role in OpenTelemetry Deployments; Implementation & Visualization Tips (IaC).
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1.

---

## 1. Strategic Policy Position
Observability deployment must be reproducible, multi-cloud portable, and measurable. **Pulumi** is the language of choice enabling Infrastructure as Code across AKS / EKS / GKE.

## 2. Scope
- Deployment of OpenTelemetry Collectors.
- Configuration of exporters, pipelines, sampling.
- Deployment of full observability stack (Prometheus, Grafana, Tempo, Loki).
- Service-mesh telemetry enablement.
- Sidecar / log-pipeline injection automation.

## 3. IaC Implementation Patterns
- **Same codebase across providers.** Cross-cloud config parity ≥ 95% drift target.
- **Collector / exporter version alignment** maintained at 100% across clusters.
- **Sidecar injection** via mutating webhooks or service-mesh integration; targeted workload coverage 95–100%.
- **Post-deployment validation** (`helm test`, `kubectl rollout status`, Pulumi outputs) feeds success / failure counts directly into OpenTelemetry metrics exporters.
- **GitOps-driven** changes for alert rules, dashboards, SLO definitions.

## 4. Platform KPIs (IaC Deployment)

| Category | Metric | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|---|
| Telemetry Infra | Deploy OpenTelemetry Collectors | 100% success | < 99% one env | < 95% / repeated failures | Failures imply IaC drift or config errors. |
| Telemetry Infra | Configure Exporters | ≥ 99% valid | 97–99% sustained | < 97% / repeated misconfig | Misconfigured exporters cause data gaps. |
| Telemetry Infra | Deploy Observability Stack | ≤ 15 min | 15–25 min | > 25 min or errors > 1 | Long deployment indicates IaC inefficiency. |
| Auto-Instrumentation | Inject OpenTelemetry Sidecars | 95–100% | 85–95% sustained | < 85% / errors | Below 90% means inconsistent monitoring coverage. |
| Auto-Instrumentation | Service Mesh Telemetry | ≥ 98% emitting | 95–98% | < 95% / missing spans | Aim for full coverage. |
| Auto-Instrumentation | Log Pipelines | 100% success | 99% / minor retry | < 98% / repeated parse errors | Test each collector path post-deploy. |
| Cloud Portability | Pulumi Stack Provision Time | ≤ 10 min/cluster | 10–20 min | > 20 min / failed > 1% | IaC efficiency baseline. |
| Cloud Portability | Cross-Cloud Config Parity | 95–100% | 90–95% | < 90% mismatch | < 5% drift target. |
| Cloud Portability | Collector / Exporter Version Alignment | 100% | 95–99% | < 95% mismatch | Ensures consistent telemetry schema. |

## 5. Severity Policy (IaC Specific)
Owned by **D4 §4.7**. Summary:

| Severity | Trigger | Action |
|---|---|---|
| Info / Normal | Healthy / normal | CI-CD trend analytics; no action. |
| Warning | Sustained breach ≥ 5 min or 1 IaC run | Review pipeline / IaC scripts; correct configuration drift. |
| Critical | Critical breach or repeated IaC failures within 3 runs | Trigger incident or rollback; high chance of data loss / missing telemetry. |

## 6. Implementation & Visualization
**In Grafana (see also D5):**
- **Infrastructure dashboards** → deployment status and versions.
- **Coverage dashboards** → public (AKS / EKS / GKE) collector deployments vs successful telemetry exports.
- **Performance dashboards** → stack provisioning time trends.

**SLI examples:**
- **Collector Deployment Success Rate** = (Deployed Collectors ÷ Intended Collectors) × 100.
- **Sidecar Injection Coverage** = (Workloads with sidecar ÷ Targeted workloads) × 100.

**IaC Validation:** `helm test`, `kubectl rollout status`, Pulumi outputs feed success/failure counters into OpenTelemetry metrics.

## 7. Calibration
After a few cycles, refine thresholds:
- **Critical** = "any misconfiguration that causes collector telemetry gaps."
- **Warning** = "deployment slower than SLA window."

## 8. Cross-References
- **D2** — reference architecture this IaC deploys.
- **D4** — IaC severity policy entry.
- **D11** — IaC platform KPI roll-up to executive scorecard.
- **D15** — change control / ARB approvals for IaC changes.
- **D16** — ADR for choice of Pulumi.
