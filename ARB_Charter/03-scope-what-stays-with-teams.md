---
title: Scope — What Stays With Teams
chapter: 3
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
next_review: 2026-Q3
status: Draft
---

[Chapter 2 — Scope: What Goes to ARB](02-scope-what-goes-to-arb.md) | [ARB Charter — Document Index](arb-charter.md)

# Chapter 3. Scope — What Stays With Teams

| **Document Owner** | Simon Armstrong, VP Chief Architect |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **Next Review Due** | 2026-08-01 |

## 3.1 Principle

The operating model is explicit: **local decisions stay with federated teams.** The ARB governs at the cross-domain and enterprise level; everything else belongs with the team. Autonomy within a domain is a design goal, not a concession. Teams should not feel the need to seek ARB approval for decisions that are rightly theirs to make.

## 3.2 Decisions That Stay With Teams

The four categories below map directly to the team-level scope defined in the CoE operating model (CoE deck, slide 7).

### 3.2.1 Routine Solution Design Within a Domain

- Detailed design of components, services, and data models that do not extend beyond the team's domain boundary.
- Choice of internal patterns (repository pattern, CQRS, saga, etc.) where the pattern is not mandated or prohibited by enterprise standards.
- Decisions about internal data storage structure, caching strategy, or in-process concurrency that have no cross-domain visibility.

### 3.2.2 Local Integration Within Own Platform

- Integration between services that are owned and operated within the same domain or platform.
- Internal event schemas, topics, or queues that are not consumed by other domains.
- Internal API contracts between a team's own microservices or modules, provided they do not form part of a published enterprise API.

### 3.2.3 Team-Level Tooling and Framework Choices

- Development tooling (IDEs, linters, build tools, test frameworks) that does not affect the production runtime or impose dependencies on other teams.
- Selection of libraries within an approved language or runtime ecosystem, subject to licence compliance.
- Choice of testing approach, coverage tooling, or CI pipeline implementation.
- Local developer environment configuration and scaffolding.

### 3.2.4 Sprint and Iteration Planning

- Sequencing of work within a sprint or programme increment.
- Tactical refactoring or technical debt remediation within a domain.
- Feature flags or experiment configurations scoped to a single product area.
- Performance tuning within a service boundary that does not alter external SLAs.

## 3.3 Recording Team-Level Decisions

Teams are encouraged — though not required — to maintain their own ADRs for significant local architecture decisions. This builds institutional memory and simplifies future ARB intake if a local decision later grows to cross-domain scope.

The EA CoE maintains a lightweight ADR template that teams may adopt. Using a consistent format makes it easier to promote a team ADR into an enterprise ADR if the decision is later elevated to ARB scope.

[Chapter 4 — Intake Criteria and Materiality Thresholds](04-intake-criteria-and-materiality-thresholds.md) | [ARB Charter — Document Index](arb-charter.md)
