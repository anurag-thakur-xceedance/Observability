# D16 — Observability ADR / Decision Register

> **Purpose:** Decision log with rationale and traceability.
> **Source Strategy Sections:** Decision Log.
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1.

---

## 1. Purpose
Formal Architecture Decision Records (ADRs) for significant observability decisions. Each ADR captures context, options considered, decision, and consequences.

## 2. ADR Index (Initial)

| ID | Title | Status | Source |
|---|---|---|---|
| ADR-001 | Adopt OpenTelemetry as universal telemetry standard | Implicit (in strategy) → ratify | Strategy §"Build the Technical Foundation" |
| ADR-002 | Select Grafana as primary visualization & alerting tool | Implicit → ratify | Strategy §"Build the Technical Foundation" |
| ADR-003 | Use Prometheus / Loki / Tempo as backends | Implicit → ratify | Strategy §"High-Level Architecture" |
| ADR-004 | Adopt PowerShell + Docker Compose for IaC and orchestration (supersedes earlier Pulumi/Kubernetes direction) | Accepted (revised) | D7; Strategy §"IaC Role in OpenTelemetry Deployment" |
| ADR-005 | Host-portable deployment (on-prem / customer site / cloud VM) via the same Compose stack — supersedes earlier multi-cloud K8s posture | Accepted (revised) | D2 §6; D7 |
| ADR-006 | Tiered retention (hot / warm / cold) with metrics 30–90d, logs 7–30d, traces 7d, RCA 1y | Implicit → ratify | Strategy §"Telemetry retention tiers" |
| ADR-007 | AIOps guardrails: FP < 5%, detection latency < 2 min | Implicit → ratify | Strategy §"AI-Driven Observability — Success criteria" |

> Source decision-log table in the strategy is currently empty (only headings — `Id | Review Group | Decision`). Existing decisions need to be ratified; that is flagged as a **decision required** in the handover report.

## 3. ADR Template

```
ADR-NNN: <Title>
Status: Proposed | Accepted | Superseded | Deprecated
Date: YYYY-MM-DD
Context:
  <What problem are we solving? What's the current state?>
Options Considered:
  - Option A — pros / cons
  - Option B — pros / cons
Decision:
  <Selected option and rationale>
Consequences:
  <Positive, negative, follow-on actions>
Linked Artifacts:
  <D-IDs that depend on this decision>
```

## 4. Cross-References
- **D2 / D5 / D7** — architectural decisions implemented.
- **D15** — governance body that ratifies ADRs.
