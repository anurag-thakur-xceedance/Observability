---
title: Alignment to Product Architecture Governance
chapter: 9
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
next_review: 2026-Q3
status: Draft
---

ARB Charter — Document Index
# Chapter 9. Alignment to Product Architecture Governance

| **Document Owner** | Simon Armstrong, VP Chief Architect |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **Next Review Due** | 2026-08-01 |

## 9.1 Context

The requirements for the **Product Architecture Review Board (PARB)** charter are being drafted to govern product-level architecture decisions within the Product Engineering domain. This chapter defines how the PARB and the enterprise ARB relate to each other, where their scopes differ, and how decisions flow between them.

This alignment is drawn from the EA CoE Terms of Reference and the CoE governance model. Where the CoE TOR is silent, this chapter establishes the default position.

## 9.2 The Two-Level Model

The organisation operates a two-level architecture governance model:

| **Level** | **Body** | **Scope** |
| --- | --- | --- |
| Enterprise | ARB (this charter) | Cross-domain and enterprise-wide decisions; technology standards; platform topology; resilience and SLA governance |
| Product | PARB (Praveen's charter) | Product Engineering domain decisions; product architecture patterns; product-level platform choices; product team enablement |

The two levels are complementary, not competitive. The PARB provides fast, domain-specific governance; the ARB provides cross-domain alignment and enterprise binding decisions.

## 9.3 Where the Scopes Align

The PARB and ARB scopes align in the following areas:

- Both use ADR-based decision traceability.
- Both are expected to apply the same technology radar and enterprise standards library maintained by the EA CoE.
- PARB decisions that meet the ARB materiality thresholds (see [Chapter 4, Section 4.2 — Materiality Thresholds](04-intake-criteria-and-materiality-thresholds.md#42-materiality-thresholds)) must be elevated to the ARB for a binding enterprise decision before they can be treated as final.
- The PARB Chair (or delegate) is expected to attend ARB sessions as an invited member when product architecture items are on the agenda.

## 9.4 Where the Scopes Differ

| **Dimension** | **ARB** | **PARB** |
| --- | --- | --- |
| Authority | Binding across all domains | Binding within the Product Engineering domain only |
| Membership | Multi-domain standing members | Product Engineering focused |
| Cadence | Fortnightly standard; 48-hour urgent | To be defined in the PARB charter |
| Escalation | This charter, Chapter 8 | Escalates to ARB for cross-domain matters |
| ADR register | Enterprise register (EA CoE) | Product register (may feed into enterprise register) |

The PARB does not have authority over decisions that fall within ARB scope. Attempting to use the PARB to resolve a cross-domain or enterprise-scope decision is a charter breach and must be referred to the ARB.

## 9.5 Decision Flow Between Levels

The following flow governs how decisions move between the PARB and ARB:

1. A Product Engineering team decides with the PARB.
2. The PARB assesses whether the decision is cross-domain or meets ARB materiality thresholds.
3. If **yes**: The PARB prepares an intake submission for the ARB. The PARB may provide its own recommendation as part of the submission. The ARB issues the binding decision.
4. If **no**: The PARB processes and decides. The decision is recorded in the product ADR register. If the decision later has cross-domain consequences, it is elevated to the ARB retroactively.

## 9.6 Shared Artefacts

Both bodies should use:

- The EA CoE ADR template (version-controlled in Confluence).
- The enterprise technology radar is a reference baseline.
- A consistent decision status taxonomy: Proposed / Accepted / Superseded / Deprecated.

The EA CoE is responsible for ensuring that product-level ADRs that are elevated to enterprise scope are migrated to the enterprise register without loss of history.

ARB Charter — Document Index