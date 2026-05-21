---
title: ADR Process and Traceability
chapter: 10
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
next_review: 2026-Q3
status: Draft
---

# Chapter 10. ADR Process and Traceability

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 10.1 Purpose of the ADR Register

The enterprise ADR register is the organisation's durable record of significant architecture decisions. It answers the question "why does the system work this way?" for every team, including teams that were not present when the decision was made.

Without a maintained register, architectural knowledge lives only in the heads of individuals who may leave the organisation, leading to repeated debates about settled questions, inconsistent implementations, and costly reversals.

---

## 10.2 ADR Lifecycle

```
Proposed --> Under Review --> Accepted
                          --> Rejected
         Accepted --> Superseded
                  --> Deprecated
```

| Status | Meaning |
|---|---|
| Proposed | Submitted for ARB review; not yet decided |
| Under Review | ARB is actively deliberating |
| Accepted | Binding ARB decision issued; in effect |
| Rejected | ARB declined the proposal; rationale recorded |
| Superseded | A newer ADR replaces this one; link to successor is mandatory |
| Deprecated | The decision is no longer applicable (e.g., technology decommissioned); not superseded by a new decision |

---

## 10.3 ADR Numbering and Naming

- Enterprise ADRs are numbered sequentially: **ADR-0001**, **ADR-0002**, etc.
- Product-level ADRs (managed by the PARB) use a domain prefix: **ADR-PE-0001** for Product Engineering, etc.
- The EA CoE owns the enterprise numbering sequence and allocates numbers at intake confirmation.
- ADR titles follow the pattern: `[Verb] [subject]` — e.g., "Adopt Apache Kafka as the enterprise event streaming platform" or "Standardise on OpenTelemetry for distributed tracing".

---

## 10.4 ADR Template

All enterprise ADRs must use the following structure:

```markdown
# ADR-NNNN: [Title]

| Field | Value |
|---|---|
| Status | Proposed / Accepted / Superseded / Deprecated |
| Date | YYYY-MM-DD |
| Deciders | [ARB members present] |
| Tags | [technology area, domain, pattern type] |

## Context

[Describe the situation that required a decision. What problem is being solved?
What constraints or forces are at play?]

## Decision

[State the decision clearly. What was agreed?]

## Rationale

[Explain why this option was selected. Reference the alternatives considered
and why they were not chosen.]

## Alternatives Considered

| Option | Reason Not Selected |
|---|---|
| Option A | ... |
| Option B | ... |

## Consequences

**Positive:**
- ...

**Negative / Risks:**
- ...

**Neutral:**
- ...

## Related Decisions

- [ADR-NNNN — Title](#)

## Review Date

[Date by which this decision should be re-evaluated]
```

---

## 10.5 Traceability Requirements

To maintain meaningful traceability, each ADR must link outward and inward:

- **Outward links**: Every ADR that this decision depends on or supersedes must be listed in "Related Decisions".
- **Inward links**: When a new ADR supersedes an existing one, the existing ADR must be updated to mark it as Superseded and link to the successor.
- **Epic / story traceability**: Where a decision is made in the context of a specific programme of work, the ADR should reference the relevant epic or initiative identifier so future readers can find the original business context.
- **Risk record links**: Where the ARB raised a risk record alongside an ADR, the ADR must reference the risk record ID.

---

## 10.6 Access and Discoverability

- The enterprise ADR register is maintained in the EA CoE Confluence space.
- All ADRs are visible to all engineering staff (read access).
- ADR submission (write access) is restricted to the EA CoE secretariat to maintain quality control.
- The register is searchable by tag, status, date range, and technology area.
- The EA CoE publishes a monthly digest of newly accepted ADRs to the engineering all-hands channel.

---

## 10.7 ADR Review and Expiry

Architecture decisions do not last forever. The EA CoE conducts an annual review of all Accepted ADRs and flags for re-evaluation any that:

- Were made more than 3 years ago and involve a technology area where the landscape has changed materially.
- Have a specified review date that has passed.
- Have been referenced in an escalation, dispute, or risk record during the past year.

Flagged ADRs are added to the ARB forward agenda for deliberation. The ARB may confirm, supersede, or deprecate the decision.

---

*Parent page: [ARB Charter](README.md)*
