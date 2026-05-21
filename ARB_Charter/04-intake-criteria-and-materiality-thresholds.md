---
title: Intake Criteria and Materiality Thresholds
chapter: 4
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
next_review: 2026-Q3
status: Draft
---

# Chapter 4. Intake Criteria and Materiality Thresholds

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 4.1 How to Raise a Decision for ARB Review

Any team, architect, or senior engineer may submit a decision for ARB review. The intake process is:

1. **Complete the ARB Intake Form** (available in Confluence under the EA CoE space). The form captures: decision context, options considered, recommended option, stakeholders affected, timeline pressure, and materiality self-assessment.
2. **Submit to the EA CoE intake queue** via the designated Confluence page or Jira project (details maintained by CoE).
3. The EA CoE performs **triage within 2 business days**: confirms scope, assigns an architect to support the submission, and schedules the decision for the appropriate review track (standard fortnightly cadence or 48-hour urgent track).
4. The submitting team receives a **confirmation of track assignment** and expected decision date.

---

## 4.2 Materiality Thresholds

A decision is **material** — and therefore within ARB scope — if it meets one or more of the following thresholds. These are minimum triggers; the ARB may determine that a decision below these thresholds warrants review based on strategic context.

| Dimension | Threshold |
|---|---|
| Number of domains affected | 2 or more |
| Number of consuming teams affected | 3 or more |
| Estimated cost of reversal | Above [currency threshold — to be set by CFO sign-off] (illustrative) |
| Data classification | Involves data classified Sensitive, Regulated, or above |
| SLA impact | Changes or creates an SLA commitment of 99.5% availability or higher |
| Vendor/licensing spend | Net-new annual commitment above [spend threshold — to be set] (illustrative) |
| Regulatory or compliance exposure | Any decision with potential regulatory reporting or audit implication |
| Security perimeter | Introduces a new external network boundary or privileged access pattern |

> **Note:** Spend thresholds marked *(illustrative)* are placeholders pending CFO and leadership sign-off. They will be updated in version 1.0.

---

## 4.3 Non-Material Decisions — Recording by Exception

Decisions that fall below materiality thresholds but sit close to the boundary should be **recorded by exception**. The team lead or domain architect emails the EA CoE with a brief summary; the CoE logs the decision in the non-material register and responds to confirm no ARB review is required. This record protects teams if the decision is later questioned.

---

## 4.4 Fast-Track Intake for Urgent Matters

Where a decision cannot wait for the fortnightly cadence, teams may invoke the **48-hour urgent track**:

- Submit the standard intake form with the urgency flag set.
- Provide a brief statement of why the decision cannot wait (production incident, contractual deadline, regulatory deadline).
- The EA CoE chair convenes an async or synchronous ARB quorum within 48 hours.
- A minimum quorum of **Chair plus two standing members** is required for a binding urgent decision.
- All urgent decisions are ratified at the next standard fortnightly session and recorded in the formal minutes.

---

*Parent page: [ARB Charter](README.md)*
