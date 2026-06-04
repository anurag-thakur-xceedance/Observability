[Previous: Step 25 - Code Review](Step-25-Code-Review.md) | [Next: Step 27 - IaC Testing](Step-27-IAC-Testing.md)

# Step 26: Code Review Continued

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |

## 26.1 Overview
| **Attribute** | **Value** |
|---|---|
| **Responsible Roles** | Development Team, Reviewers |
| **Accountable** | Development Lead |
| **Supporting Roles** | QA Lead, Technical Architect |
| **Tools** | Source control platform, review workflow, CI/CD pipeline |


## 26.2 Purpose
Step 26 completes the review response cycle by ensuring that feedback from Step 25 is addressed, discussions are resolved, and the pull request is brought to an approval-ready state. It is the controlled rework and resolution step between initial review and final review completion.


## 26.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| **Review comments and decisions** | Step 25 | Issues, questions, and requested changes raised by reviewers. |
| **Pull request change set** | Step 23 onward | The working code change that requires revision or clarification. |
| **Automated check results** | CI/CD platform | Current evidence used to confirm whether revised changes remain valid. |


## 26.4 Activities
### 26.4.1 Address Review Feedback
The author resolves the requested changes, clarifies ambiguities, and updates the change set accordingly.

Feedback resolution should include:
- Address each blocking and important review comment.
- Updating code, tests, or documentation where required
- Recording rationale where the author disagrees and seeks reviewer confirmation

Typical expectations:
- [ ] All material feedback items have an explicit action or response
- [ ] Code changes reflect the agreed resolution
- [ ] Supporting tests or documentation are updated where needed

### 26.4.2 Resolve Review Discussions
Open comment threads and questions are addressed to closure, with supporting rationale where required.

Discussion resolution should ensure:
- Open questions are answered clearly.
- Disagreements are resolved through reviewer-author discussion.
- Threads are closed only when the underlying concern has actually been addressed.

### 26.4.3 Re-run Relevant Checks
After changes are made, the required automated checks are re-run to confirm that the revised change remains valid.

Re-validation typically includes:
- Re-running linting and other PR checks
- Re-running tests impacted by the review changes
- Confirming the pull request remains in a healthy state after rework

### 26.4.4 Re-submit for Review Confirmation
Reviewers reassess the updated change to confirm that requested actions have been completed satisfactorily.

Re-review should confirm:
- Requested changes have been completed
- No new issues were introduced during rework.
- Reviewer comments are either resolved or explicitly dispositioned.

### 26.4.5 Confirm Approval Readiness
The change is confirmed as ready to proceed into the next quality and control steps.

Approval readiness should confirm:
- [ ] All feedback addressed
- [ ] Discussions resolved
- [ ] Final approval obtained or approval conditions satisfied
- [ ] Pull request is ready for the next controlled step


## 26.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Updated pull request** | Source control platform | Revised code and tests incorporating review feedback. |
| **Resolved review discussions** | Pull request workflow | Closed or otherwise addressed review comments and questions. |
| **Approval-ready change set** | Downstream steps | A revised change ready for continued progression through the development controls. |


## 26.6 Key Artifacts
**Inputs:**
- Review comments and decisions from Step 25
- Pull request and updated code changes
- Automated check results and review workflow state

**Outputs:**
- Updated pull request with review feedback applied
- Closed or dispositioned discussion threads
- Re-run pipeline and validation evidence
- Approval-ready review state


## 26.7 Quality Gates / Exit Criteria
- [ ] Material review feedback has been addressed.
- [ ] Open review discussions have been resolved or explicitly dispositioned.
- [ ] Relevant automated checks have been re-run successfully.
- [ ] Reviewers have confirmed that rework is sufficient.
- [ ] The change is ready to proceed to Step 27.


## 26.8 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Feedback summarisation** | Approved AI assistant | Helps group and summarise review comments for author action planning. |
| **Re-validation automation** | CI/CD pipeline | Re-runs checks after feedback-driven changes are applied. |
| **Discussion tracking** | Pull request workflow | Tracks whether comments remain open or are resolved. |


## 26.9 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| **Review Rework Cycle Time** | <8 hours | Pull request review timestamps and workflow analytics | Time taken to address review comments and return the change to approval readiness. |
| **Open Discussion Count** | 0 unresolved discussions | Pull request discussion-thread status and review dashboard records | Number of unresolved review discussions per pull request. |
| **Rework Defect Recurrence** | 0 repeated critical issues | Review comment history and issue recurrence reporting | Frequency with which the same issue reappears after review rework. |


## 26.10 Best Practices
**DO:**
- Address feedback with clear intent and complete fixes.
- Keep reviewers informed when substantial changes are made after feedback.
- Treat review closure as a quality control, not an administrative step.
- Resolve the underlying issue, not just the comment thread.

**DON'T:**
- Mark review issues resolved only when the code actually reflects the resolution.
- Treat comment closure as evidence of quality on its own.


## 26.11 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, Reviewers |
| **Accountable** | Development Lead |
| **Consulted** | QA Lead, Technical Architect |
| **Informed** | Engineering Manager, Product Owner |


## 26.12 Related Steps
- **Upstream:** [Step 25: Code Review](Step-25-Code-Review.md)
- **Downstream:** [Step 27: IaC Testing](Step-27-IAC-Testing.md)


## 26.13 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |

[Previous: Step 25 - Code Review](Step-25-Code-Review.md) | [Next: Step 27 - IaC Testing](Step-27-IAC-Testing.md)
