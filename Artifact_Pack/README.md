# README — Observability Artifact Pack

[↑ Back to TOC](TOC.md)

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

The full table of contents — every chapter, every section, with deep links — lives in **[TOC.md](TOC.md)**. Start there to navigate.

A short reading order by audience:

- **Executives / Directors** → start with [Chapter 0. Xceedance Observability Strategy](0.%20Observability%20Strategy%20%28Revised%29.md), then [Chapter 11. KPI Scorecard](11.%20Observability%20KPI%20Scorecard.md) and [Chapter 13. Roadmap Delivery Plan](13.%20Observability%20Roadmap%20Delivery%20Plan.md).
- **Architects** → [Chapter 2. Reference Architecture](2.%20Observability%20Reference%20Architecture.md), [Chapter 16. ADR Register](16.%20Observability%20ADR%20Decision%20Register.md), and [Chapter 21. HA and DR](21.%20Observability%20Platform%20HA%20and%20DR%20Design.md).
- **SRE / Platform** → [Chapter 7. IaC Standard](7.%20IaC%20for%20Observability%20Standard.md), [Chapter 24. SLO Framework](24.%20SLO%20and%20Error-Budget%20Framework.md), and [Chapter 12. Incident Response](12.%20Incident%20Response%20Playbook.md).
- **Service Developers** → [Chapter 25. Onboarding and Instrumentation Kits](25.%20Service%20Onboarding%20and%20Instrumentation%20Kits.md) and [Chapter 17. Application Telemetry Standard](17.%20Application%20Telemetry%20Standard.md).
- **Security / Compliance** → [Chapter 23. Security Architecture](23.%20Observability%20Platform%20Security%20Architecture.md) and [Chapter 10. Compliance Control Matrix](10.%20Compliance%20and%20Audit%20Control%20Matrix.md).
- **FinOps** → [Chapter 9. FinOps Standard](9.%20Observability%20FinOps%20Standard.md) and [Chapter 22. Capacity and Scale Model](22.%20Capacity%20and%20Scale%20Model.md).
- **Auditors** → [Handover Report](Handover%20Report.md), [Traceability Matrix](Traceability%20Matrix.md), [Chapter 16. ADR Register](16.%20Observability%20ADR%20Decision%20Register.md).

## Pack Structure at a Glance

- **27 chapters** (Chapter 0 strategy + Chapters 1–26 standards, playbooks, and operating-model artifacts).
- **2 annexures** — [Acronyms](Annexure%20A%20-%20Acronyms.md) and [Concepts Glossary](Annexure%20B%20-%20Concepts%20Glossary.md).
- **3 cross-cutting documents** — [TOC](TOC.md), [Traceability Matrix](Traceability%20Matrix.md), [Handover Report](Handover%20Report.md).

## Conventions

- **Headings:** `# Chapter Title` (H1) and `## N. Section Title` (H2). Anchors are GitHub-style auto-generated slugs (lowercase, hyphenated, punctuation stripped).
- **Cross-references:** chapter links use URL-encoded filenames (e.g. `1.%20Enterprise%20Observability%20Standards%20Catalog.md`); section links append `#anchor`.
- **Back-to-TOC:** every chapter carries `[↑ Back to TOC](TOC.md)` at the top and bottom.
- **Header block:** every chapter declares its source strategy section(s) and current status.

## Maintenance

The pack is maintained with three small Python scripts:

- `regen_toc.py` — regenerates [TOC.md](TOC.md) from each chapter's H1/H2.
- `verify_links.py` — validates 100% of internal markdown links and TOC parity (must run zero-broken).
- `add_back_to_toc.py` — injects bidirectional TOC links.

PRs against the pack must run both `regen_toc.py` and `verify_links.py`, register new acronyms or concepts in the annexures, update the [Traceability Matrix](Traceability%20Matrix.md) if artifacts change, and cite a relevant ADR in [Chapter 16](16.%20Observability%20ADR%20Decision%20Register.md) for any architectural decision.

## Status and Open Items

Open decisions, deferred items, and known gaps are tracked in the [Handover Report](Handover%20Report.md). The [Traceability Matrix](Traceability%20Matrix.md) provides the source-to-artifact coverage map.

---

[↑ Back to TOC](TOC.md)
