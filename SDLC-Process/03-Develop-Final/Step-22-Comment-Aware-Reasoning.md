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
| Improved maintainability baseline | Source control repository | Comments and inline documentation are improved so the change set is easier to understand and maintain. |
| Intent alignment evidence | Engineering records and downstream review flow | Review evidence shows that documented intent and actual implementation do not materially conflict. |
| Clearer downstream review readiness | Downstream review steps | The change is easier for reviewers and future maintainers to understand without relying on undocumented tribal knowledge. |


## 22.6 Key Artifacts
**Inputs:**
- Implemented code and tests from Steps 20 and 21
- Existing code comments and inline documentation
- Engineering standards for readability and maintainability
- Approved work scope and behavioural intent

**Outputs:**
- Updated code comments and inline documentation
- Intent-alignment review evidence
- Documentation gap findings and applied improvements
- Readability-ready change set for downstream pull request formalisation


## 22.7 Quality Gates / Exit Criteria
- [ ] Comments and inline documentation have been reviewed for relevance and accuracy.
- [ ] No critical mismatch remains between documented intent and actual behaviour.
- [ ] Obsolete, misleading, or low-value comments have been removed or corrected.
- [ ] The change is maintainable enough to proceed into pull request formalisation.


## 22.8 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| Intent comparison support | Approved AI assistant | Highlights likely mismatches between comments and implementation behaviour. |
| Documentation improvement suggestions | Approved AI assistant | Suggests clearer wording for comments or identifies missing explanations. |
| Static maintainability signals | Static analysis tooling | Detects commented-out code, unused sections, or other maintainability concerns. |


## 22.9 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| Comment Coverage | 60-80% of relevant functions and complex logic blocks have meaningful comments | Source code review, maintainability review notes, and static analysis where available | Measures whether functions and complex logic areas are supported by useful and maintainable comments. |
| Intent Mismatches | 0 unresolved critical mismatches | Reviewer findings, comment-intent checks, and pull request review records | Tracks whether comments or documentation conflict with the actual implementation behaviour. |
| Documentation Gaps | Fewer than 5 significant gaps per pull request, unless explicitly justified | Code review findings, source diff review, and maintainability assessment records | Measures missing documentation on public APIs, shared logic, complex functions, or important edge-case handling. |
| Outdated Comments | 0 unresolved outdated comments in the reviewed scope | Code review evidence and source control change history | Tracks comments that no longer match the implementation and must be corrected or removed. |
| AI Suggestion Acceptance | 50-70% where AI assistance is used | Review notes comparing accepted suggestions to total suggestions generated | Indicates whether AI-generated comment or documentation suggestions are relevant and useful. |


## 22.10 Best Practices
**DO:**
- Comment the why, not the obvious what.
- Remove stale comments as soon as code changes invalidate them.
- Ensure maintainability notes are concise and precise.
- Use this step to reduce reviewer confusion before formal review progresses.

**DON'T:**
- Use comments to compensate for poor naming, poor structure, or weak code clarity.


## 22.11 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| Responsible | Development Team, Development Lead |
| Accountable | Development Lead |
| Consulted | Technical Architect, Solution Architect, QA Lead |
| Informed | Reviewers, Engineering Manager |


## 22.12 Related Steps
- **Upstream:** [Step 21: Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md)
- **Downstream:** [Step 23: Merge PR](Step-23-Merge-PR.md)


## 22.13 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| 0.1 | 5 May 2026 | Anurag Thakur | Initial draft for Review |

[Previous: Step 21 - Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md) | [Next: Step 23 - Merge PR](Step-23-Merge-PR.md)
