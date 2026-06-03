[Previous: Step 23 - Merge PR](Step-23-Merge-PR.md) | [Next: Step 25 - Code Review](Step-25-Code-Review.md)

# Step 24: Linting

| **Attribute** | **Value** |
|---|---|
| Document Owner | Simon Armstrong, VP Chief Architect |
| Approved By | Simon Armstrong (pending wider review) |
| Classification | Internal |
| Review Frequency | Half-Yearly |
| Next Review Due | 2026-12-01 |

## 24.1 Overview
| **Attribute** | **Value** |
|---|---|
| Responsible Roles | Development Team, CI/CD Pipeline |
| Accountable | Development Lead |
| Supporting Roles | DevOps Engineer, Development Lead |
| Tools | Linting tools, static analysis tools, CI/CD pipeline |


## 24.2 Purpose
Step 24 applies automated linting and code-style validation to the submitted change so that structural, formatting, and rule-based quality issues are identified before human review spends time on avoidable defects. The purpose is to ensure consistent coding standards and to catch common issues early in the review workflow.


## 24.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| Submitted pull request | Step 23 | The change set now in the review pipeline. |
| Code standards and lint rules | Engineering standards | Approved lint rules, formatting expectations, and language-specific checks. |
| Project source code | Source control repository | The files changed in the pull request. |


## 24.4 Activities
### 24.4.1 Run Automated Linting
The CI/CD workflow executes the approved linting and formatting rules against the pull request change set.

### 24.4.2 Identify Rule Violations
The linting stage highlights errors, warnings, and informational findings related to code style, quality, and maintainability.

### 24.4.3 Resolve Blocking Findings
The author corrects linting errors and any agreed critical warnings before the pull request advances.

### 24.4.4 Re-run Validation
Linting is re-run after fixes to confirm the change is compliant and stable.


## 24.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| Lint report | CI/CD platform and pull request checks | Machine-generated record of errors, warnings, and informational findings. |
| Corrected change set | Source control repository | Pull request updated to comply with code standards. |
| Lint status result | Downstream review steps | Pass or fail result used before deeper human review proceeds. |


## 24.6 Quality Gates / Exit Criteria
- [ ] Linting has run successfully against the change set.
- [ ] Blocking lint errors have been corrected.
- [ ] Agreed critical warnings are resolved or explicitly accepted by policy.
- [ ] Pull request is ready for human code review.


## 24.7 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| Automated lint execution | CI/CD pipeline | Runs standards checks consistently on every relevant pull request change. |
| Fix suggestion support | Approved AI assistant | Suggests likely remediations for rule violations. |
| Rule enforcement | Lint and static analysis tools | Applies team standards without requiring manual inspection first. |


## 24.8 Observability and Metrics
| **Metric / Reference** | **Type** | **Description** |
|---|---|---|
| Lint pass rate | Quality metric | Percentage of pull requests that pass linting without repeated correction cycles. |
| Average lint findings per PR | Quality metric | Typical lint burden introduced per change set. |
| Time to lint resolution | Flow metric | Time taken to correct blocking lint issues after detection. |


## 24.9 Best Practices
**DO:**
- Run linting locally before push wherever practical.
- Treat blocking lint findings as defects, not cosmetic suggestions.
- Keep lint rules consistent across the repository.

**DON'T:**
- Suppress rules unless an approved exception exists.


## 24.10 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| Responsible | Development Team, CI/CD Pipeline |
| Accountable | Development Lead |
| Consulted | DevOps Engineer, Development Lead |
| Informed | Reviewers, Engineering Manager |


## 24.11 Related Artefacts
- Lint configuration files
- Pull request checks
- Code standards reference


## 24.12 Related Steps
- **Upstream:** [Step 23: Merge PR](Step-23-Merge-PR.md)
- **Downstream:** [Step 25: Code Review](Step-25-Code-Review.md)


## 24.13 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| 0.1 | 5 May 2026 | Anurag Thakur | Initial draft for Review |

[Previous: Step 23 - Merge PR](Step-23-Merge-PR.md) | [Next: Step 25 - Code Review](Step-25-Code-Review.md)
