---
title: README — Observability Artifact Pack
chapter: Pack README
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# README — Observability Artifact Pack

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## Overview

The Xceedance Observability Artifact Pack is a complete, hyperlinked, enterprise-grade specification for how Xceedance instruments, operates, governs, and monetises observability across all business domains, customer sites, and cloud footprints.

It defines **one strategy, one platform, one data model, and one operating model** — built on **OpenTelemetry, Grafana, Prometheus, Loki, Tempo, PowerShell, and Docker Compose** — host-portable across on-premise data centres, customer-managed sites, and cloud VMs, with no Kubernetes dependency.

The pack covers the full lifecycle of observability as a capability:

- **Strategy and governance** — vision, principles, ARB charter, ADR decision register, RACI, and risk model.
- **Reference architecture** — agents, pipelines, storage tiers, security boundaries, HA/DR, and capacity model.
- **Standards and data model** — telemetry conventions, semantic attributes, retention tiers, and PII classification.
- **Operating model** — service tiering (T1–T4), SLO and error-budget framework, alerting policy, and incident response.
- **AIOps and automation** — anomaly detection, RCA, MLOps lifecycle, and AI safety guardrails.
- **FinOps and unit economics** — cost per signal, optimisation playbook, forecast and budget model.
- **Compliance and audit** — SOC 2, ISO 27001, GDPR, NIST CSF mapping with 17 control IDs.
- **Adoption** — onboarding kits, instrumentation playbooks, community of practice, and KPI scorecard.
- **Multi-tenancy** — per-customer site deployment, data isolation, and tenant-aware routing.

## How to Read This Pack

The full table of contents — every chapter, every section, with deep links — lives in [toc.md](toc.md). Start there to navigate.

A short reading order by audience:

- **Executives / Directors** → start with [Chapter 0. Xceedance Observability Strategy](00-observability-strategy.md), then [Chapter 11. KPI Scorecard](11-observability-kpi-scorecard.md) and [Chapter 13. Roadmap Delivery Plan](13-observability-roadmap-delivery-plan.md).
- **Architects** → [Chapter 2. Reference Architecture](02-observability-reference-architecture.md), [Chapter 16. ADR Register](16-observability-adr-decision-register.md), and [Chapter 21. HA and DR](21-observability-platform-ha-and-dr-design.md).
- **SRE / Platform** → [Chapter 7. IaC Standard](07-iac-for-observability-standard.md), [Chapter 24. SLO Framework](24-slo-and-error-budget-framework.md), and [Chapter 12. Incident Response](12-incident-response-playbook.md).
- **Service Developers** → [Chapter 25. Onboarding and Instrumentation Kits](25-service-onboarding-and-instrumentation-kits.md) and [Chapter 17. Application Telemetry Standard](17-application-telemetry-standard.md).
- **Security / Compliance** → [Chapter 23. Security Architecture](23-observability-platform-security-architecture.md), [Chapter 23 Appendix A. Threat Model (STRIDE)](23-appendix-a-threat-model.md), [Chapter 10. Compliance Control Matrix](10-compliance-and-audit-control-matrix.md), and [Chapter 28. Long-Term Archival Policy](28-observability-long-term-archival-policy.md).
- **FinOps** → [Chapter 9. FinOps Standard](09-observability-finops-standard.md) and [Chapter 22. Capacity and Scale Model](22-capacity-and-scale-model.md).
- **Auditors** → [Handover Report](handover-report.md), [Traceability Matrix](traceability-matrix.md), [Chapter 16. ADR Register](16-observability-adr-decision-register.md), [Chapter 27. Non-Functional Requirements Register](27-observability-non-functional-requirements.md).

## Pack Structure at a Glance

- **29 chapters** (Chapter 0 strategy + Chapters 1–28 standards, playbooks, and operating-model artifacts), plus **Chapter 23 Appendix A** (Threat Model).
- **2 annexures** — [Acronyms](annexure-a-acronyms.md) and [Concepts Glossary](annexure-b-concepts-glossary.md).
- **3 cross-cutting documents** — [TOC](toc.md), [Traceability Matrix](traceability-matrix.md), [Handover Report](handover-report.md).
- **5 JSON Schemas** for the five telemetry signals under `schemas/` — see [Chapter 19. Observability Data Model Specification -> Section 19.8.1 JSON Schema Index](19-observability-data-model-specification.md#1981-json-schema-index).
- **5 Mermaid architecture diagrams** under `assets/diagrams/` (catalogue in `assets/diagrams/index.md`) — pipeline, multi-tenant, AIOps loop, HA topology, DR runbook.

## Conventions

- **Headings:** `# Chapter Title` (H1) and `## N. Section Title` (H2). Anchors are GitHub-style auto-generated slugs (lowercase, hyphenated, punctuation stripped; leading section numbers retained, e.g. `3.1 Foo` -> `#31-foo`).
- **Cross-references:** chapter links use the canonical form `[Chapter N, Section M.K — Title]` followed by `(file.md#anchor)`. The Unicode section-sign character (U+00A7) is **banned** anywhere in the pack — see the durable agent rules in `AGENTS.md` at the repository root.
- **Back-to-TOC:** every chapter carries `[↑ Back to TOC](toc.md)` at the top and bottom.
- **Header block:** every chapter declares version, owner, classification, last/next review, and status.
- **No scaffolding:** `TEMP`, `TODO`, `FIXME`, `XXX`, `PLACEHOLDER` are not permitted in committed content (verifier-enforced). `TBD` is permitted only in `owner:` fields.

## Maintenance

The pack ships with three PowerShell verifiers under `tools/`:

- `tools/regen_toc.ps1` — regenerates [toc.md](toc.md) from each chapter's H1/H2.
- `tools/verify_links.ps1` — validates internal markdown links and anchors (must run zero-broken).
- `tools/verify_frontmatter.ps1` — validates YAML front-matter and the standard front-matter table.

PRs against the pack MUST run `verify_links.ps1` and `verify_frontmatter.ps1` (zero-broken / zero-error), regenerate the TOC if any heading changed, register new acronyms or concepts in the annexures, update the [Traceability Matrix](traceability-matrix.md) if artifacts change, and cite a relevant ADR in [Chapter 16](16-observability-adr-decision-register.md) for any architectural decision.

## Status and Open Items

Open decisions, deferred items, and known gaps are tracked in the [Handover Report](handover-report.md). The [Traceability Matrix](traceability-matrix.md) provides the source-to-artifact coverage map.

**Pack maturity — read before adoption.** This is a v0.1 **handover** artifact, not an engineering-ready specification. Chapter depth is intentionally asymmetric: governance, operating-model, strategy, and compliance-mapping content is more developed than reference implementations, dashboard JSON, prompt registries, and edge / RUM / SBOM patterns — those are deferred to the engineering phase. Schemas, NFR thresholds, regulatory crosswalks, and AIOps prompt scaffolding are **synthesis-grade** and require SME validation (data-platform, compliance, security, SRE) before they are used as binding artifacts. Known gaps are enumerated in the [Handover Report -> Section 3. Sections Pending](handover-report.md#3-sections-pending) and the new [Chapter 29. Observability Programme Risk Register](29-observability-programme-risk-register.md).

---

[↑ Back to TOC](toc.md)
