[Previous: Step 24 - Linting](Step-24-Linting.md) | [Next: Step 26 - Code Review Continued](Step-26-Code-Review-Continued.md)

# Step 25: Code Review

| **Attribute** | **Value** |
|---|---|
| Document Owner | Simon Armstrong, VP Chief Architect |
| Approved By | Simon Armstrong (pending wider review) |
| Classification | Internal |
| Review Frequency | Half-Yearly |
| Next Review Due | 2026-12-01 |

## 25.1 Overview
| **Attribute** | **Value** |
|---|---|
| Responsible Roles | Development Team, Reviewers |
| Accountable | Development Lead |
| Supporting Roles | Security Engineer, Technical Architect, QA Lead |
| Tools | Source control platform, review workflow, approved AI assistant |


## 25.2 Purpose
Step 25 provides the primary human quality control within the development phase. It validates correctness, maintainability, security, architectural alignment, and readiness beyond what automated checks can confirm.

The purpose of code review is not only to approve code, but to improve the change and reduce delivery risk before merge progression continues.


## 25.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| Lint-compliant pull request | Step 24 | Pull request that has passed the automated linting gate. |
| Implemented code and tests | Steps 20-24 | The change set, test suite, and automated check results under review. |
| Architecture and design guidance | Phase 02 and work item records | Approved design expectations and constraints. |
| Review policy | Engineering standards | Team review rules, approval thresholds, and escalation expectations. |


## 25.4 Activities
### 25.4.1 Review Functional Correctness
Reviewers assess whether the implementation satisfies the approved scope and whether the logic is correct.

### 25.4.2 Review Quality and Maintainability
Reviewers assess readability, cohesion, duplication, structure, and long-term maintainability.

### 25.4.3 Review Security and Risk Concerns
Reviewers inspect for insecure practices, missing validation, inappropriate access assumptions, or other risks that require correction.

### 25.4.4 Provide Actionable Feedback
Comments should be specific, respectful, and prioritised according to severity and expected action.

### 25.4.5 Determine Review Outcome
The review outcome should clearly indicate whether the change is approved, conditionally approved, or requires rework before it can proceed.


## 25.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| Review comments | Pull request workflow | Structured feedback on quality, correctness, risk, and maintainability. |
| Review decision | Pull request workflow | Approval, request for changes, or equivalent review state. |
| Risk findings | Development Team and engineering records | Issues or concerns requiring rework or clarification. |


## 25.6 Quality Gates / Exit Criteria
- [ ] Required reviewers have reviewed the change.
- [ ] Material quality, correctness, and security concerns have been identified.
- [ ] The review outcome is clearly recorded.
- [ ] The change is ready either for rework in Step 26 or for final approval progression.


## 25.7 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| Review assistance | Approved AI assistant | Suggests likely code review focus areas or quality concerns for reviewer consideration. |
| Reviewer routing support | Source control workflow | Helps apply code owner or reviewer assignment rules. |
| Evidence aggregation | Pull request checks | Brings test, lint, and change evidence into the review context. |


## 25.8 Observability and Metrics
| **Metric / Reference** | **Type** | **Description** |
|---|---|---|
| Time to first review | Flow metric | Time from PR submission to the first human review. |
| Review turnaround time | Flow metric | Time from first review to review closure or approval. |
| Review defect detection rate | Quality metric | Meaningful issues found during review before merge. |


## 25.9 Best Practices
**DO:**
- Focus on correctness, risk, and maintainability before style issues already covered by automation.
- Make comments specific and actionable.
- Review with the approved design and acceptance criteria in mind.

**DON'T:**
- Give rubber-stamp approval without meaningful review.


## 25.10 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| Responsible | Development Team, Reviewers |
| Accountable | Development Lead |
| Consulted | Security Engineer, Technical Architect, QA Lead |
| Informed | Engineering Manager, Product Owner |


## 25.11 Related Artefacts
- Pull request discussion threads
- Review policy and approval rules
- Test and lint evidence
- Architecture guidance


## 25.12 Related Steps
- **Upstream:** [Step 24: Linting](Step-24-Linting.md)
- **Downstream:** [Step 26: Code Review Continued](Step-26-Code-Review-Continued.md)


## 25.13 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| 0.1 | 5 May 2026 | Anurag Thakur | Initial draft for Review |

[Previous: Step 24 - Linting](Step-24-Linting.md) | [Next: Step 26 - Code Review Continued](Step-26-Code-Review-Continued.md)
