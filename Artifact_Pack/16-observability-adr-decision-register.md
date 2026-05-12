---
title: Observability ADR Decision Register
chapter: 16
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 16. Observability ADR Decision Register

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 1. Purpose
Formal Architecture Decision Records (ADRs) for significant observability decisions. Each ADR captures context, options considered, decision, and consequences.

## 2. ADR Index (Initial)

| ID | Title | Status | Source |
|---|---|---|---|
| ADR-000 | Observability Strategy Principles (10 principles) | Accepted | [Chapter 0 Section 1.1. Vision, Mission, and Guiding Principles](0-observability-strategy-revised.md#11-vision-mission-and-guiding-principles) |
| ADR-001 | Adopt OpenTelemetry as universal telemetry standard | Implicit (in strategy) → ratify | Strategy section "Build the Technical Foundation" |
| ADR-002 | Select Grafana as primary visualization & alerting tool | Implicit → ratify | Strategy section "Build the Technical Foundation" |
| ADR-003 | Use Prometheus / Loki / Tempo as backends | Implicit → ratify | Strategy section "High-Level Architecture" |
| ADR-004 | Adopt PowerShell + Docker Compose for IaC and orchestration (supersedes earlier Pulumi/Kubernetes direction) | Accepted (revised) | [Chapter 7. IaC for Observability Standard](7-iac-for-observability-standard.md); Strategy section "IaC Role in OpenTelemetry Deployment" |
| ADR-005 | Host-portable deployment (on-prem / customer site / cloud VM) via the same Compose stack — supersedes earlier multi-cloud K8s posture | Accepted (revised) | [Chapter 2. Observability Reference Architecture -> Section 6. Host-Portable Deployment Design](2-observability-reference-architecture.md#6-host-portable-deployment-design); [Chapter 7. IaC for Observability Standard](7-iac-for-observability-standard.md) |
| ADR-006 | Tiered retention (hot / warm / cold) with metrics 30–90d, logs 7–30d, traces 7d, RCA 1y | Implicit → ratify | Strategy section "Telemetry retention tiers" |
| ADR-007 | AIOps guardrails: FP < 5%, detection latency < 2 min | Implicit → ratify | Strategy section "AI-Driven Observability — Success criteria" |
| ADR-008 | Adopt Sloth as SLO-rule generator | Proposed | [Chapter 24 Section 8. Tooling Decision](24-slo-and-error-budget-framework.md#8-tooling-decision) |
| ADR-009 | Service Tiering Model (T1–T4) with per-tier policy deltas | Proposed | [Chapter 1 Section 4.1. Service Tiering Model](1-enterprise-observability-standards-catalog.md#41-service-tiering-model) |
| ADR-010 | Cardinality Budget (per-service, enforced at SDK + collector + backend) | Proposed | [Chapter 1 Section 3.1. Cardinality Governance](1-enterprise-observability-standards-catalog.md#31-cardinality-governance) |
| ADR-011 | Multi-tenant data-isolation model with gateway-injected `tenant_id` | Proposed | [Chapter 26 Section 3. Tenant Labelling Enforcement](26-multi-tenant-and-customer-site-deployment-model.md#3-tenant-labelling-enforcement) |
| ADR-012 | Auto-instrumentation via eBPF (Beyla) for legacy / unmodifiable services | Proposed | [Chapter 2 Section 4.1. Auto-Instrumentation via eBPF](2-observability-reference-architecture.md#41-auto-instrumentation-via-ebpf) |
| ADR-013 | Tail-based sampling at gateway with 100%-error retention | Proposed | [Chapter 2 Section 5.1. Sampling Strategy](2-observability-reference-architecture.md#51-sampling-strategy) |
| ADR-014 | HA topology: Prometheus pair, Alertmanager 3-cluster, Loki/Tempo + object storage, Grafana × 2 with external Postgres | Proposed | [Chapter 21 Section 3. Reference HA Topology](21-observability-platform-ha-and-dr-design.md#3-reference-ha-topology-compose-single-region) |
| ADR-015 | Compliance framework adoption: SOC 2 Type II + ISO 27001 + GDPR baseline (DORA where applicable) | Proposed | [Chapter 10. Compliance and Audit Control Matrix](10-compliance-and-audit-control-matrix.md) |
| ADR-016 | LLM telemetry-data handling: redact-before-prompt; on-prem / Azure OpenAI tenancy only; no third-party LLM access to raw telemetry | Proposed | [Chapter 6 Section 8. AI Safety, Explainability, and LLM Data Leakage](6-aiops-guardrails-and-implementation-playbook.md#8-ai-safety-explainability-and-llm-data-leakage) |

> Source decision-log table in the strategy is currently empty (only headings — `Id | Review Group | Decision`). Existing decisions need to be ratified; that is flagged as a **decision required** in the handover report.

## 3. ADR Template

When to write an ADR:
- Any decision that constrains future choices, costs significant effort to reverse, or is visible across multiple teams.
- Any deviation from these principles (per ADR-000).
- Any vendor or open-source tool selection that becomes architectural.
- Any change to security, retention, residency, or governance posture.

```
ADR-NNN: <Title>

Status: Proposed | Accepted | Superseded by ADR-MMM | Deprecated
Date: YYYY-MM-DD
Authors: <name(s)>
Reviewers: <ARB / SRE Director / Security / etc.>
Supersedes: <ADR-XXX or "—">
Related: <ADR-XXX, Chapter N>

## Context
What is the problem? What is the current state? What constraints apply?
What forces (technical, business, regulatory) are at play?

## Options Considered
- Option A — description; pros; cons
- Option B — description; pros; cons
- Option C — description; pros; cons

## Decision
Selected option and the rationale that distinguishes it.

## Consequences
- Positive: ...
- Negative: ...
- Follow-on actions:
  - <action> — owner — date
  - <action> — owner — date

## Linked Artifacts
- Chapter N. Title — section impacted
- Service catalog entries impacted
- Runbook updates required
```

## 4. Cross-References
- [Chapter 2. Observability Reference Architecture](2-observability-reference-architecture.md) / [Chapter 5. Grafana Platform Standard and Visualization Playbook](5-grafana-platform-standard-and-visualization-playbook.md) / [Chapter 7. IaC for Observability Standard](7-iac-for-observability-standard.md) — architectural decisions implemented.
- [Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md) — governance body that ratifies ADRs.

---

[↑ Back to TOC](toc.md)
