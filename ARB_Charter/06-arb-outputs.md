---
title: ARB Outputs
chapter: 6
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
next_review: 2026-Q3
status: Draft
---

# Chapter 6. ARB Outputs

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 6.1 Overview

Every ARB review produces a formal output. The four output types below map directly to those defined in the CoE operating model (CoE deck, slide 7). All outputs are recorded in the enterprise ADR register maintained by the EA CoE.

---

## 6.2 Output Types

### 6.2.1 Binding Decisions

A formal ruling that a specific proposal is approved, approved with conditions, or rejected. Binding decisions:

- Apply to all teams and domains within the organisation.
- Supersede any previously issued team-level or informal guidance on the same topic.
- Are effective from the date of publication unless the decision specifies a future effective date or migration window.
- May include **conditions** (e.g., "approved, subject to a security review being completed before production deployment").

A binding decision that is rejected includes the ARB's reasoning and, where possible, guidance on what alternative approach would be acceptable.

### 6.2.2 ADRs with Rationale

Every binding decision is captured in a formal Architectural Decision Record (ADR). The ADR records not just what was decided but why — the rationale, the alternatives considered, and the known consequences. This is what gives the ARB's output lasting value beyond the meeting itself.

The ADR structure is:

| Field | Content |
|---|---|
| ID | Sequential identifier (ADR-NNNN) |
| Title | Short descriptive title |
| Date | Date of ARB decision |
| Status | Proposed / Accepted / Superseded / Deprecated |
| Context | The problem or decision trigger |
| Decision | What was decided |
| Rationale | Why this option was selected over alternatives |
| Alternatives considered | Options that were evaluated and why they were not chosen |
| Consequences | Known positive and negative consequences |
| Related decisions | Links to preceding or dependent ADRs |
| Review date | When the decision should be revisited |

ADRs are stored in the EA CoE ADR register in Confluence and are accessible to all engineering teams.

### 6.2.3 Standards Additions

Where a binding decision establishes a pattern, technology, or practice that should be reused across the organisation, the ARB directs the EA CoE to add it to the enterprise architecture standards library. Standards additions are versioned and published alongside the ADR. The CoE owns maintenance of the standards library between ARB sessions.

### 6.2.4 Risk Records

Where a proposal is approved with known architectural risk, or where a team proceeds on a material matter without ARB review, the ARB raises a risk record. Risk records are:

- Owned by the domain lead or accountable executive of the requesting team.
- Tracked through the organisation's risk management process.
- Reviewed at subsequent ARB sessions until the risk is mitigated or formally accepted by the appropriate risk owner.

### 6.2.5 Session Minutes

Formal minutes are published for every ARB session within 2 business days. Minutes record: decisions taken, decisions deferred (with reason), attendance, and any actions assigned.

---

## 6.3 Precedence and Supersession

When the ARB issues a new binding decision that covers the same ground as a prior decision, the prior ADR is marked as **Superseded** and linked to the new ADR. Teams should always reference the current non-superseded ADR for a given topic.

---

*Parent page: [ARB Charter](README.md)*
