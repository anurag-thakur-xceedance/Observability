# 2. Scope — What Goes to ARB

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 1. Overview

The ARB reviews decisions that are **material** and **cross-domain**. The test is not technical complexity per se, but whether the decision has consequences beyond the team or domain that originated it. The categories below are definitive triggers; teams should also apply the materiality thresholds in [Chapter 4, Section 2 — Materiality Thresholds](04-intake-criteria-and-materiality-thresholds.md#2-materiality-thresholds) when a decision does not clearly fall into a named category.

---

## 2. Trigger Categories

### 2.1 Material Cross-Domain Architecture Decisions

Any decision that establishes or alters how two or more domains interact at a structural level, including:

- Shared data models or canonical data structures used across domain boundaries.
- Changes to inter-domain APIs or event contracts that would require coordinated migration across consuming teams.
- Introduction or deprecation of shared infrastructure components (message buses, API gateways, identity providers, observability platforms).
- Decisions that set a precedent likely to be adopted across multiple domains even if originating in one.

### 2.2 New Platform or Technology Adoption

Any proposal to introduce a net-new platform, runtime, database engine, messaging technology, or major framework that is not already on the approved technology radar, including:

- Cloud services not previously used in production.
- Open-source components with non-trivial operational or licensing implications.
- Commercial software or SaaS products that will become part of the platform topology.
- AI/ML platforms, LLM services, or agentic tooling with data residency or security implications.

### 2.3 Interoperability and Integration Changes

Structural changes to how the organisation's systems connect to one another or to external parties, including:

- Changes to integration patterns (synchronous/asynchronous, event-driven, batch) that affect multiple consuming systems.
- Modifications to API versioning strategy or contract management processes.
- Introduction of new integration middleware or ETL/ELT pipelines with cross-domain reach.
- External partner or third-party connectivity that introduces new network boundaries or data-sharing obligations.

### 2.4 Resilience, DR, and SLA Impact

Decisions that materially alter the organisation's resilience posture or service-level commitments, including:

- Changes to Recovery Time Objective (RTO) or Recovery Point Objective (RPO) targets for systems with cross-domain dependencies.
- Architecture changes that introduce or remove single points of failure at the platform level.
- Modifications to disaster recovery topology (active-active, active-passive, pilot light, cold standby).
- Changes to observability, alerting, or incident response architecture that affect SLA visibility across domains.

### 2.5 Third-Party Technology Onboarding

Onboarding of any third-party vendor technology into the production environment where the technology:

- Processes, stores, or transmits data classified as sensitive or regulated.
- Requires privileged access to internal systems or networks.
- Is subject to export controls, data sovereignty requirements, or specific regulatory obligations.
- Represents a concentration risk if it becomes a dependency for multiple domains simultaneously.

---

## 3. Boundary Cases

Where it is unclear whether a decision falls within ARB scope, the team should raise it with the EA CoE for a scope determination. The CoE will respond within **5 business days** with either a confirmation that the decision is in scope (and initiate the intake process) or a written statement that the decision may proceed at team level, which should be retained as a record.

---

*Parent page: [ARB Charter](README.md)*
