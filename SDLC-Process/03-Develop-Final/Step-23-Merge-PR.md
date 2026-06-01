[Previous: Step 22 - Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md) | [Next: Step 24 - Linting](Step-24-Linting.md)

# Step 23: Merge PR

## Overview
| **Attribute** | **Value** |
|---|---|
| **Step Number** | 23 |
| **Phase** | Develop |
| **Previous** | [Step 22: Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md) |
| **Next** | [Step 24: Linting](Step-24-Linting.md) |
| **Responsible Roles** | Development Team, Pull Request Author |
| **Accountable** | Development Lead |
| **Supporting Roles** | Reviewers, QA Lead, DevOps Engineer |
| **Tools** | Source control platform, pull request workflow, CI/CD pipeline, approved AI assistant |

---

## Purpose
Step 23 formalises the code change into the pull request workflow so that automated checks, traceability controls, and human review can proceed in a controlled manner. Although the step title is retained as `Merge PR` for sequence consistency, the work performed at this point is the structured creation and submission of the pull request into the merge process.

The purpose of this step is to ensure that the change is properly packaged for review, linked to the approved work scope, and submitted with enough context for reviewers and automation pipelines to evaluate it efficiently.

---

## Inputs
| **Input** | **Source** | **Description** |
|---|---|---|
| **Implemented and tested change set** | Steps 20-22 | Code, tests, and maintainability updates ready for pull request submission. |
| **Approved work item reference** | Sprint backlog and work items | The feature, defect, or change record linked to the code change. |
| **Branch and repository standards** | Engineering standards | Naming conventions, merge policies, and pull request expectations. |
| **Review context** | Development Team | Summary of what changed, why it changed, and how reviewers should validate it. |

---

## Activities
### 23.1 Prepare Pull Request Metadata
The author prepares the pull request with the correct branch target, title, linked work item, and summary of the change.

### 23.2 Provide Review Context
The pull request description must provide enough context for reviewers to understand:
- what changed
- why the change was made
- any technical or business constraints
- expected review focus areas
- how the change can be validated

### 23.3 Link Traceability Records
The pull request must be linked to the relevant backlog item, change record, defect, or release scope so that traceability is preserved.

### 23.4 Assign or Request Reviewers
The author assigns the appropriate reviewers or routes the pull request according to the team review policy.

### 23.5 Submit Into the Merge Workflow
The change is submitted so automated checks and review steps can begin. Submission does not imply immediate merge; it means the change has formally entered the merge and review path.

---

## Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Submitted pull request** | Source control platform | Formal review object representing the change. |
| **Traceable review record** | Source control platform and work item system | Linkage between the code change and the approved delivery scope. |
| **Review context package** | Reviewers and downstream quality controls | Description, testing notes, and context needed for review. |
| **Triggered automation checks** | CI/CD platform | Automated linting, testing, and pipeline controls initiated by pull request submission. |

---

## Quality Gates / Exit Criteria
- [ ] Pull request is created against the correct target branch.
- [ ] Linked work items or change references are present.
- [ ] The title and description are clear, complete, and review-ready.
- [ ] Reviewers have been assigned or the request has been routed correctly.
- [ ] The change has formally entered the automated and human review workflow.

---

## AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Pull request summary support** | Approved AI assistant | Helps generate an initial summary, testing notes, and reviewer context. |
| **Traceability validation** | Source control platform and workflow rules | Confirms branch, work item, and PR policy compliance. |
| **Automated workflow initiation** | CI/CD pipeline | Starts required review-time quality controls as soon as the pull request is submitted. |

---

## Observability and Metrics
| **Metric / Reference** | **Type** | **Description** |
|---|---|---|
| **Time to PR submission** | Flow metric | Time from implementation start to pull request creation. |
| **Traceability completeness** | Governance metric | Percentage of pull requests correctly linked to approved work scope. |
| **PR rework due to poor context** | Quality metric | Frequency of pull requests sent back because metadata or description was insufficient. |

---

## Best Practices
- Keep the pull request focused and coherent.
- Link every pull request to its governing work item.
- Write review instructions that reduce ambiguity for reviewers.
- Do not treat PR submission as a formality; it is a governed handoff into review.
- Ensure the merge workflow begins with clean, reviewable context.

---

## RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, Pull Request Author |
| **Accountable** | Development Lead |
| **Consulted** | Reviewers, QA Lead, DevOps Engineer |
| **Informed** | Engineering Manager, Product Owner |

---

## Related Artefacts
- Pull request description
- Linked work items or change records
- Branching and merge policy guidance
- Review assignment record

---

## Related Steps
- **Upstream:** [Step 22: Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md)
- **Downstream:** [Step 24: Linting](Step-24-Linting.md)

---

## Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **1.0** | **2026-03-27** |  | **Initial draft aligned to Confluence baseline.** |
| **1.1** | **2026-05-28** | **OpenCode** | **Refined as a Confluence-ready enterprise version and clarified the step as pull request formalisation within the merge workflow.** |

[Previous: Step 22 - Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md) | [Next: Step 24 - Linting](Step-24-Linting.md)
