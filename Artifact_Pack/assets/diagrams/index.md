---
title: Architecture Diagrams Index
chapter: assets
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# Architecture Diagrams Index

[↑ Back to TOC](../../toc.md)

| Version | Owner | Classification | Reviewed Date | Status |
|---|---|---|---|---|
| 0.1 | TBD | Internal |  | Draft |
---

## 1. Purpose

This directory holds canonical Mermaid source for the architecture diagrams referenced from the Artifact Pack chapters. Diagrams live as standalone `.mmd` files so they can be:

- rendered by any Mermaid-aware viewer (GitHub, VS Code, Obsidian, `mmdc` CLI);
- embedded verbatim in chapter prose without drift;
- versioned independently of the chapter that consumes them.

## 2. Conventions

- One concept per file. If a diagram needs more than ~50 nodes it should be split.
- File names use `kebab-case.mmd`.
- The first two lines of each file are a `%%` comment header naming the diagram and the chapter section it serves.
- Node labels are short; explanation belongs in the consuming chapter, not the diagram.
- Colour classes follow the pack convention: source/blue, edge/green, gateway/yellow, store/red, consumer/light-blue, control or audit/purple.
- Diagrams MUST NOT contain the U+00A7 character (see [AGENTS.md Section 2.1](../../../AGENTS.md)).

## 3. Catalogue

| Diagram | File | Consumed By |
|---|---|---|
| High-Level Architecture (Strategy) | `00-high-level-architecture.svg` | [Chapter 1. Xceedance Observability Strategy -> Section 1.4 High-Level Architecture (One-Page View)](../../01-xceedance-observability-strategy.md#14-high-level-architecture-one-page-view) |
| Observability Pipeline — End-to-End | `pipeline-end-to-end.mmd` | [Chapter 3. Observability Reference Architecture -> Section 3.2 High-Level Architecture (Logical View)](../../03-observability-reference-architecture.md#32-high-level-architecture-logical-view) |
| Multi-Tenant Deployment Model       | `multi-tenant-deployment.mmd` | [Chapter 27. Multi-Tenant and Customer-Site Deployment Model -> Section 27.1 Deployment Topologies](../../27-multi-tenant-and-customer-site-deployment-model.md#271-deployment-topologies) |
| AIOps Closed-Loop                   | `aiops-closed-loop.mmd`       | [Chapter 7. AIOps Guardrails and Implementation Playbook -> Section 7.1 Strategic Intent & Guardrails](../../07-aiops-guardrails-and-implementation-playbook.md#71-strategic-intent-guardrails) |
| HA Topology (Single Region)         | `ha-topology.mmd`             | [Chapter 22. Observability Platform HA and DR Design -> Section 22.3 Reference HA Topology (Compose, Single Region)](../../22-observability-platform-ha-and-dr-design.md#223-reference-ha-topology-compose-single-region) |
| DR Runbook (Region Loss)            | `dr-runbook.mmd`              | [Chapter 22. Observability Platform HA and DR Design -> Section 22.5 DR Patterns](../../22-observability-platform-ha-and-dr-design.md#225-dr-patterns) |

## 4. Rendering

```powershell
# Local render to SVG via mermaid-cli
npm install -g @mermaid-js/mermaid-cli
mmdc -i pipeline-end-to-end.mmd -o pipeline-end-to-end.svg
```

CI renders all `.mmd` to `.svg` on every PR and uploads them as build artefacts. The rendered SVGs are not committed (avoid binary churn); chapters reference the `.mmd` source and re-render in the reader's environment.

## 5. Change Control

Diagram edits follow the same change-control flow as chapter prose (see [Chapter 16. Observability Governance Charter and ARB Pack -> Section 16.3 Decision Rights](../../16-observability-governance-charter-and-arb-pack.md#163-decision-rights)). Material edits (adding / removing components, changing trust boundaries) require ARB review; cosmetic edits (label wording, colour) do not.

---

[↑ Back to TOC](../../toc.md)
