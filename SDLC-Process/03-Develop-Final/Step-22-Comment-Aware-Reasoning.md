[Previous: Step 21 - Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md) | [Next: Step 23 - Merge PR](Step-23-Merge-PR.md)

# Step 22: Comment Aware Reasoning

| **Attribute** | **Value** |
|---|---|
| Document Owner | Simon Armstrong, VP Chief Architect |
| Approved By | Simon Armstrong (pending wider review) |
| Classification | Internal |
| Review Frequency | Half-Yearly |
| Next Review Due | 2026-12-01 |

## 22.1 Overview
| **Attribute** | **Value** |
|---|---|
| Responsible Roles | Development Team, Development Lead |
| Accountable | Development Lead |
| Supporting Roles | Technical Architect, Solution Architect, QA Lead |
| Tools | Source control platform, approved AI assistant, static analysis tooling |


## 22.2 Purpose
Step 22 verifies that code comments, inline documentation, and implementation intent remain aligned. It is the work item in which the team checks whether the code is understandable, whether comments explain the right concerns, and whether documented behaviour matches the actual implementation.

This step improves maintainability, reduces misinterpretation during review, and helps ensure that the codebase can be understood and supported without reliance on undocumented tribal knowledge.


## 22.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| Implemented code and tests | Steps 20 and 21 | The current change set and supporting tests. |
| Code comments and inline documentation | Source control repository | Existing comments, annotations, and explanatory notes in the changed code. |
| Engineering standards | Organisational standards | Expectations for code readability, documentation, and maintainability. |
| Approved work scope | Sprint backlog and work items | The behavioural intent against which implementation and comments are assessed. |


## 22.4 Activities
### 22.4.1 Review Comment Quality
The team reviews comments to ensure they are necessary, clear, and helpful.

Comments should:
- Explain intent, assumptions, or non-obvious reasoning
- Not restate what the code already expresses clearly
- Be current and aligned with the latest implementation
- Avoid leaving stale TODO, FIXME, or obsolete guidance in reviewed code

### 22.4.2 Validate Intent Alignment
The team confirms that the documented intent of a method, class, or code block matches what the implementation actually does.

This includes validating:
- Function and method behaviour
- Parameter and return expectations
- Validation and error-handling behaviour
- Assumptions stated in comments or annotations

### 22.4.3 Identify Documentation Gaps
Gaps are identified where maintainability would be weakened by missing explanation.

Typical gaps include:
- Complex business logic with no explanation
- Public or shared internal interfaces without meaningful notes
- Important edge-case handling with no context
- Non-obvious technical constraints not captured in code comments

### 22.4.4 Improve Maintainability Signals
The team updates or removes comments where needed so that reviewers and future maintainers can understand the change without ambiguity.

### 22.4.5 Confirm Readability Readiness
The change is checked for readiness to proceed into pull request formalisation and broader review.


## 22.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| Updated code comments and inline documentation | Source control repository | Improved maintainability and intent clarity in the change set. |
| Intent alignment confirmation | Engineering records and downstream review flow | Evidence that code and documented behaviour do not materially conflict. |
| Reduced documentation ambiguity | Downstream review steps | A clearer codebase for reviewers and future maintainers. |


## 22.6 Quality Gates / Exit Criteria
- [ ] Comments and inline documentation have been reviewed for relevance and accuracy.
- [ ] No critical mismatch remains between documented intent and actual behaviour.
- [ ] Obsolete, misleading, or low-value comments have been removed or corrected.
- [ ] The change is maintainable enough to proceed into pull request formalisation.


## 22.7 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| Intent comparison support | Approved AI assistant | Highlights likely mismatches between comments and implementation behaviour. |
| Documentation improvement suggestions | Approved AI assistant | Suggests clearer wording for comments or identifies missing explanations. |
| Static maintainability signals | Static analysis tooling | Detects commented-out code, unused sections, or other maintainability concerns. |


## 22.8 Observability and Metrics
| **Metric / Reference** | **Type** | **Description** |
|---|---|---|
| Comment accuracy issues found | Maintainability metric | Number of mismatched or misleading documentation items detected. |
| Documentation gaps closed | Maintainability metric | Number of meaningful missing explanations added before review. |
| Review clarification reduction | Quality trend metric | Reduction in avoidable clarification comments during code review. |


## 22.9 Best Practices
**DO:**
- Comment the why, not the obvious what.
- Remove stale comments as soon as code changes invalidate them.
- Ensure maintainability notes are concise and precise.
- Use this step to reduce reviewer confusion before formal review progresses.

**DON'T:**
- Use comments to compensate for poor naming, poor structure, or weak code clarity.


## 22.10 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| Responsible | Development Team, Development Lead |
| Accountable | Development Lead |
| Consulted | Technical Architect, Solution Architect, QA Lead |
| Informed | Reviewers, Engineering Manager |


## 22.11 Related Artefacts
- Source code with comments
- Coding standards and maintainability guidance
- Work item acceptance criteria


## 22.12 Related Steps
- **Upstream:** [Step 21: Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md)
- **Downstream:** [Step 23: Merge PR](Step-23-Merge-PR.md)


## 22.13 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| 0.1 | 5 May 2026 | Anurag Thakur | Initial draft for Review |

[Previous: Step 21 - Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md) | [Next: Step 23 - Merge PR](Step-23-Merge-PR.md)
