[Previous: Step 23 - Merge PR](Step-23-Merge-PR.md) | [Next: Step 25 - Code Review](Step-25-Code-Review.md)

# Step 24: Linting

## Overview
| **Attribute** | **Value** |
|---|---|
| **Step Number** | 24 |
| **Phase** | Develop |
| **Previous** | [Step 23: Merge PR](Step-23-Merge-PR.md) |
| **Next** | [Step 25: Code Review](Step-25-Code-Review.md) |
| **Responsible Roles** | Development Team, CI/CD Pipeline |
| **Accountable** | Development Lead |
| **Supporting Roles** | DevOps Engineer, Development Lead |
| **Tools** | Linting tools, static analysis tools, CI/CD pipeline |

---

## Purpose
Step 24 applies automated linting and code-style validation to the submitted change so that structural, formatting, and rule-based quality issues are identified before human review spends time on avoidable defects. The purpose is to ensure consistent coding standards and to catch common issues early in the review workflow.

---

## Inputs
| **Input** | **Source** | **Description** |
|---|---|---|
| **Submitted pull request** | Step 23 | The change set now in the review pipeline. |
| **Code standards and lint rules** | Engineering standards | Approved lint rules, formatting expectations, and language-specific checks. |
| **Project source code** | Source control repository | The files changed in the pull request. |

---

## Activities
### 24.1 Run Automated Linting
The CI/CD workflow executes the approved linting and formatting rules against the pull request change set.

### 24.2 Identify Rule Violations
The linting stage highlights errors, warnings, and informational findings related to code style, quality, and maintainability.

### 24.3 Resolve Blocking Findings
The author corrects linting errors and any agreed critical warnings before the pull request advances.

### 24.4 Re-run Validation
Linting is re-run after fixes to confirm the change is compliant and stable.

---

## Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Lint report** | CI/CD platform and pull request checks | Machine-generated record of errors, warnings, and informational findings. |
| **Corrected change set** | Source control repository | Pull request updated to comply with code standards. |
| **Lint status result** | Downstream review steps | Pass or fail result used before deeper human review proceeds. |

---

## Quality Gates / Exit Criteria
- [ ] Linting has run successfully against the change set.
- [ ] Blocking lint errors have been corrected.
- [ ] Agreed critical warnings are resolved or explicitly accepted by policy.
- [ ] Pull request is ready for human code review.

---

## AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Automated lint execution** | CI/CD pipeline | Runs standards checks consistently on every relevant pull request change. |
| **Fix suggestion support** | Approved AI assistant | Suggests likely remediations for rule violations. |
| **Rule enforcement** | Lint and static analysis tools | Applies team standards without requiring manual inspection first. |

---

## Observability and Metrics
| **Metric / Reference** | **Type** | **Description** |
|---|---|---|
| **Lint pass rate** | Quality metric | Percentage of pull requests that pass linting without repeated correction cycles. |
| **Average lint findings per PR** | Quality metric | Typical lint burden introduced per change set. |
| **Time to lint resolution** | Flow metric | Time taken to correct blocking lint issues after detection. |

---

## Best Practices
- Run linting locally before push wherever practical.
- Treat blocking lint findings as defects, not cosmetic suggestions.
- Keep lint rules consistent across the repository.
- Avoid suppressing rules unless an approved exception exists.

---

## RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, CI/CD Pipeline |
| **Accountable** | Development Lead |
| **Consulted** | DevOps Engineer, Development Lead |
| **Informed** | Reviewers, Engineering Manager |

---

## Related Artefacts
- Lint configuration files
- Pull request checks
- Code standards reference

---

## Related Steps
- **Upstream:** [Step 23: Merge PR](Step-23-Merge-PR.md)
- **Downstream:** [Step 25: Code Review](Step-25-Code-Review.md)

---

## Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **1.0** | **2026-03-27** |  | **Initial draft aligned to Confluence baseline.** |
| **1.1** | **2026-05-28** | **OpenCode** | **Refined as a Confluence-ready enterprise version with formal quality gates, outputs, metrics, and review readiness criteria.** |

[Previous: Step 23 - Merge PR](Step-23-Merge-PR.md) | [Next: Step 25 - Code Review](Step-25-Code-Review.md)
