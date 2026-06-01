[Previous: Step 25 - Code Review](Step-25-Code-Review.md) | [Next: Step 27 - IaC Testing](Step-27-IAC-Testing.md)

# Step 26: Code Review Continued

## Overview
| **Attribute** | **Value** |
|---|---|
| **Step Number** | 26 |
| **Phase** | Develop |
| **Previous** | [Step 25: Code Review](Step-25-Code-Review.md) |
| **Next** | [Step 27: IaC Testing](Step-27-IAC-Testing.md) |
| **Responsible Roles** | Development Team, Reviewers |
| **Accountable** | Development Lead |
| **Supporting Roles** | QA Lead, Technical Architect |
| **Tools** | Source control platform, review workflow, CI/CD pipeline |

---

## Purpose
Step 26 completes the review response cycle by ensuring that feedback from Step 25 is addressed, discussions are resolved, and the pull request is brought to an approval-ready state. It is the controlled rework and resolution step between initial review and final review completion.

---

## Inputs
| **Input** | **Source** | **Description** |
|---|---|---|
| **Review comments and decisions** | Step 25 | Issues, questions, and requested changes raised by reviewers. |
| **Pull request change set** | Step 23 onward | The working code change that requires revision or clarification. |
| **Automated check results** | CI/CD platform | Current evidence used to confirm whether revised changes remain valid. |

---

## Activities
### 26.1 Address Review Feedback
The author resolves the requested changes, clarifies ambiguities, and updates the change set accordingly.

### 26.2 Resolve Review Discussions
Open comment threads and questions are addressed to closure, with supporting rationale where required.

### 26.3 Re-run Relevant Checks
After changes are made, the required automated checks are re-run to confirm that the revised change remains valid.

### 26.4 Re-submit for Review Confirmation
Reviewers reassess the updated change to confirm that requested actions have been completed satisfactorily.

### 26.5 Confirm Approval Readiness
The change is confirmed as ready to proceed into the next quality and control steps.

---

## Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Updated pull request** | Source control platform | Revised code and tests incorporating review feedback. |
| **Resolved review discussions** | Pull request workflow | Closed or otherwise addressed review comments and questions. |
| **Approval-ready change set** | Downstream steps | A revised change ready for continued progression through the development controls. |

---

## Quality Gates / Exit Criteria
- [ ] Material review feedback has been addressed.
- [ ] Open review discussions have been resolved or explicitly dispositioned.
- [ ] Relevant automated checks have been re-run successfully.
- [ ] Reviewers have confirmed that rework is sufficient.
- [ ] The change is ready to proceed to Step 27.

---

## AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Feedback summarisation** | Approved AI assistant | Helps group and summarise review comments for author action planning. |
| **Re-validation automation** | CI/CD pipeline | Re-runs checks after feedback-driven changes are applied. |
| **Discussion tracking** | Pull request workflow | Tracks whether comments remain open or are resolved. |

---

## Observability and Metrics
| **Metric / Reference** | **Type** | **Description** |
|---|---|---|
| **Review rework cycle time** | Flow metric | Time taken to address review comments and return the change to approval readiness. |
| **Open discussion count** | Quality metric | Number of unresolved review discussions per pull request. |
| **Rework defect recurrence** | Quality metric | Frequency with which the same issue reappears after review rework. |

---

## Best Practices
- Address feedback with clear intent and complete fixes.
- Do not mark review issues resolved until the code actually reflects the resolution.
- Keep reviewers informed when substantial changes are made after feedback.
- Treat review closure as a quality control, not an administrative step.

---

## RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, Reviewers |
| **Accountable** | Development Lead |
| **Consulted** | QA Lead, Technical Architect |
| **Informed** | Engineering Manager, Product Owner |

---

## Related Artefacts
- Pull request discussion history
- Re-run pipeline results
- Review feedback summary

---

## Related Steps
- **Upstream:** [Step 25: Code Review](Step-25-Code-Review.md)
- **Downstream:** [Step 27: IaC Testing](Step-27-IAC-Testing.md)

---

## Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **1.0** | **2026-01-19** |  | **Initial draft** |
| **1.1** | **2026-05-28** | **OpenCode** | **Refined as a Confluence-ready enterprise version with explicit review rework, closure, and approval-readiness controls.** |

[Previous: Step 25 - Code Review](Step-25-Code-Review.md) | [Next: Step 27 - IaC Testing](Step-27-IAC-Testing.md)
