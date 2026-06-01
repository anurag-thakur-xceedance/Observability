[Previous: Step 21 - Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md) | [Next: Step 23 - Merge PR](Step-23-Merge-PR.md)

# Step 22: Comment Aware Reasoning

## Overview
| **Attribute** | **Value** |
|---|---|
| **Step Number** | 22 |
| **Phase** | Develop |
| **Previous** | [Step 21: Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md) |
| **Next** | [Step 23: Merge PR](Step-23-Merge-PR.md) |
| **Responsible Roles** | Development Team, Development Lead |
| **Accountable** | Development Lead |
| **Supporting Roles** | Technical Architect, Solution Architect, QA Lead |
| **Tools** | Source control platform, approved AI assistant, static analysis tooling |

---

## Purpose
Step 22 verifies that code comments, inline documentation, and implementation intent remain aligned. It is the work item in which the team checks whether the code is understandable, whether comments explain the right concerns, and whether documented behaviour matches the actual implementation.

This step improves maintainability, reduces misinterpretation during review, and helps ensure that the codebase can be understood and supported without reliance on undocumented tribal knowledge.

---

## Inputs
| **Input** | **Source** | **Description** |
|---|---|---|
| **Implemented code and tests** | Steps 20 and 21 | The current change set and supporting tests. |
| **Code comments and inline documentation** | Source control repository | Existing comments, annotations, and explanatory notes in the changed code. |
| **Engineering standards** | Organisational standards | Expectations for code readability, documentation, and maintainability. |
| **Approved work scope** | Sprint backlog and work items | The behavioural intent against which implementation and comments are assessed. |

---

## Activities
### 22.1 Review Comment Quality
The team reviews comments to ensure they are necessary, clear, and helpful.

Comments should:
- explain intent, assumptions, or non-obvious reasoning
- not restate what the code already expresses clearly
- be current and aligned with the latest implementation
- avoid leaving stale TODO, FIXME, or obsolete guidance in reviewed code

### 22.2 Validate Intent Alignment
The team confirms that the documented intent of a method, class, or code block matches what the implementation actually does.

This includes validating:
- function and method behaviour
- parameter and return expectations
- validation and error-handling behaviour
- assumptions stated in comments or annotations

### 22.3 Identify Documentation Gaps
Gaps are identified where maintainability would be weakened by missing explanation.

Typical gaps include:
- complex business logic with no explanation
- public or shared internal interfaces without meaningful notes
- important edge-case handling with no context
- non-obvious technical constraints not captured in code comments

### 22.4 Improve Maintainability Signals
The team updates or removes comments where needed so that reviewers and future maintainers can understand the change without ambiguity.

### 22.5 Confirm Readability Readiness
The change is checked for readiness to proceed into pull request formalisation and broader review.

---

## Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Updated code comments and inline documentation** | Source control repository | Improved maintainability and intent clarity in the change set. |
| **Intent alignment confirmation** | Engineering records and downstream review flow | Evidence that code and documented behaviour do not materially conflict. |
| **Reduced documentation ambiguity** | Downstream review steps | A clearer codebase for reviewers and future maintainers. |

---

## Quality Gates / Exit Criteria
- [ ] Comments and inline documentation have been reviewed for relevance and accuracy.
- [ ] No critical mismatch remains between documented intent and actual behaviour.
- [ ] Obsolete, misleading, or low-value comments have been removed or corrected.
- [ ] The change is maintainable enough to proceed into pull request formalisation.

---

## AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Intent comparison support** | Approved AI assistant | Highlights likely mismatches between comments and implementation behaviour. |
| **Documentation improvement suggestions** | Approved AI assistant | Suggests clearer wording for comments or identifies missing explanations. |
| **Static maintainability signals** | Static analysis tooling | Detects commented-out code, unused sections, or other maintainability concerns. |

---

## Observability and Metrics
| **Metric / Reference** | **Type** | **Description** |
|---|---|---|
| **Comment accuracy issues found** | Maintainability metric | Number of mismatched or misleading documentation items detected. |
| **Documentation gaps closed** | Maintainability metric | Number of meaningful missing explanations added before review. |
| **Review clarification reduction** | Quality trend metric | Reduction in avoidable clarification comments during code review. |

---

## Best Practices
- Comment the why, not the obvious what.
- Remove stale comments as soon as code changes invalidate them.
- Avoid using comments to compensate for poor naming or structure.
- Ensure maintainability notes are concise and precise.
- Use this step to reduce reviewer confusion before formal review progresses.

---

## RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, Development Lead |
| **Accountable** | Development Lead |
| **Consulted** | Technical Architect, Solution Architect, QA Lead |
| **Informed** | Reviewers, Engineering Manager |

---

## Related Artefacts
- Source code with comments
- Coding standards and maintainability guidance
- Work item acceptance criteria

---

## Related Steps
- **Upstream:** [Step 21: Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md)
- **Downstream:** [Step 23: Merge PR](Step-23-Merge-PR.md)

---

## Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **1.0** | **2026-03-27** |  | **Initial draft aligned to Confluence baseline.** |
| **1.1** | **2026-05-28** | **OpenCode** | **Refined as a Confluence-ready enterprise version with stronger maintainability framing, intent-alignment controls, and formal review readiness criteria.** |

[Previous: Step 21 - Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md) | [Next: Step 23 - Merge PR](Step-23-Merge-PR.md)
