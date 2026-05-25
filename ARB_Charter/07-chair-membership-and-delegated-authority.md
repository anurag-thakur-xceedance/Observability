---
title: Chair, Membership and Delegated Authority
chapter: 7
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
next_review: 2026-Q3
status: Draft
---

ARB Charter — Document Index
# Chapter 7. Chair, Membership and Delegated Authority

| **Document Owner** | Simon Armstrong, VP Chief Architect |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **Next Review Due** | 2026-08-01 |

## 7.1 Organisation Model

The ARB sits within a federated architecture organisation. The structure below is drawn directly from the CoE operating model (CoE deck, slide 7). Each layer has a distinct role; the ARB is the single formal governance board that the entire model feeds into and operates through.

Enterprise-wide decisions stay with the CoE. Local decisions stay with the federated teams.

## 7.2 Chair

The ARB is chaired by the **Senior EVP / President** or their designated delegate.

The Chair:

- Sets direction and has final decision-making authority on any matter brought to the ARB.
- May delegate chair authority and ARB authority to the **Head of EA / EA Lead**, who orchestrates the ARB on the Chair's behalf.
- Casts the deciding vote in the event of a tied vote among standing members.
- Is responsible for ensuring the ARB operates within its charter and that decisions are made on time, consistent with the SLA commitments in [Chapter 5 — SLA Model and Cadence](05-sla-model-and-cadence.md).

In the Chair's absence, they must designate an acting Chair in advance. An undesignated absence does not defer the session; the Head of EA / EA Lead assumes acting Chair authority for that session.

## 7.3 Core EA CoE — Secretariat and Standards Owner

The Core EA CoE supports the ARB as its secretariat and standards body. The CoE:

- Manages the ARB agenda, circulates decision papers, records minutes, and publishes decisions.
- Owns enterprise and data architecture standards and the ADR register.
- Governs platform standards and runs the architecture maturity programme.
- Does not hold a standing vote on the ARB; the CoE Head participates in deliberation in an advisory capacity.

The CoE Head does not vote on binding decisions unless they are also the delegated Chair.

## 7.4 Standing Members

The following roles hold permanent standing membership on the ARB, drawn from the interfaces defined in the operating model:

| **Role** | **Interface / Domain** |
| --- | --- |
| Head of EA / EA Lead (or delegate) | Enterprise Architecture — orchestrates ARB |
| Engineering Lead (or delegate) | Engineering |
| Product Lead (or delegate) | Product |
| Security Lead (or delegate) | Security |
| Data & AI Lead (or delegate) | Data & AI |
| Domain Architect representative (rotating) | Delivery domains |

Standing members are expected to:

- Attend or send a prepared delegate to every session.
- Review the circulated decision papers in advance of the session.
- Declare conflicts of interest on decisions where their domain has a direct stake.
- Contribute to domain-level risk and impact assessment during deliberation.

> **Note:** The specific named individuals for each standing role are maintained as a living register by the EA CoE and updated outside this charter to avoid requiring a charter version bump for personnel changes.

## 7.5 Domain and Platform Architects — Participation

Domain Architects and Platform / Product Architects are not standing ARB members but are the primary source of intake submissions and pattern input:

- **Domain Architects** are embedded with delivery teams, stay close to engineering, and feed the CoE with emerging patterns. They are the first point of escalation for teams uncertain whether a decision is material enough for ARB review.
- **Platform / Product Architects** own platform and product capabilities, drive reuse across the organisation, and shape the platform roadmap. They bring platform-level proposals to the ARB and implement ARB decisions within their platforms.

Both groups may be invited to specific ARB sessions as subject-matter contributors when their domain's decisions are under review.

## 7.6 Invited Members

The EA CoE may invite subject-matter experts, domain leads, or vendor representatives to specific sessions where their input is relevant. Invited members:

- Participate in discussion on the specific item(s) for which they are invited.
- Do not hold voting rights.
- May be required to leave the session once their item is concluded, at the Chair's discretion.

## 7.7 Quorum

| **Track** | **Minimum Quorum** |
| --- | --- |
| Standard fortnightly session | Chair (or acting Chair) plus two standing members |
| 48-hour urgent track | Chair (or acting Chair) plus two standing members (async acceptable) |

A session that does not meet quorum may not issue binding decisions. Agenda items from a quorum-failed session are carried forward to the next session with priority scheduling.

## 7.8 Delegated Authority

The Chair may formally delegate authority to the EA CoE for categories of decision that are:

- Within an already-established standard (e.g., approving a new service that uses only approved technology components and follows documented integration patterns).
- Below a defined complexity threshold agreed between the Chair and the Head of EA / EA Lead.
- Subject to retrospective ratification at the next standard ARB session.

Delegated decisions are recorded in the ARB minutes and carry the same binding status as a full ARB decision. The EA CoE does not hold delegated authority for decisions that involve new technology adoption, significant resilience or SLA impact, or any matter where a standing member has objected.

## 7.9 Membership Review

Membership composition is reviewed annually by the Chair. Changes to standing membership roles require Chair approval and are recorded in an updated version of this charter. Changes to the named individuals in each role are maintained by the EA CoE in the living register without requiring a charter version update.

ARB Charter — Document Index