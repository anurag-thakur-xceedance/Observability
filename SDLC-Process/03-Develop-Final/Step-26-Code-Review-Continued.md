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
| **Pull request change set** | Step 23 onward | The working code change requires revision or clarification. |
| **Automated check results** | CI/CD platform | Current evidence used to confirm whether revised changes remain valid. |


## 26.4 Activities
### 26.4.1 Address Review Feedback
The author resolves the requested changes, clarifies ambiguities, and updates the change set accordingly.

Feedback resolution should include:
- **Comment Resolution:** Address each blocking and important review comment.
- **Change Updates:** Update code, tests, or documentation where required.
- **Documented Rationale:** Record rationale where the author disagrees and seeks reviewer confirmation.

Typical expectations:
- [ ] All material feedback items have an explicit action or response
- [ ] Code changes reflect the agreed resolution
- [ ] Supporting tests or documentation are updated where needed

This step should leave a clear audit trail showing what changed, why it changed, and whether the resulting pull request is ready for the next control point rather than simply appearing quieter because comment threads were closed.

### 26.4.2 Resolve Review Discussions
Open comment threads and questions are addressed to closure, with supporting rationale where required.

Discussion resolution should ensure:
- **Clear Answers:** Open questions are answered clearly.
- **Resolved Disagreements:** Reviewer-author discussion closes disagreements.
- **True Closure:** Threads are closed only when the underlying concern has actually been addressed.

### 26.4.3 Re-run Relevant Checks
After changes are made, the required automated checks are re-run to confirm that the revised change remains valid.

Re-validation typically includes:
- **Check Re-Runs:** Re-run linting and other pull request checks.
- **Targeted Test Re-Runs:** Re-run tests impacted by the review changes.
- **Healthy PR State:** Confirm the pull request remains in a healthy state after rework.

### 26.4.4 Re-submit for Review Confirmation
Reviewers reassess the updated change to confirm that requested actions have been completed satisfactorily.

Re-review should confirm:
- **Requested Changes Complete:** Requested changes have been completed.
- **No Regression Introduced:** No new issues were introduced during rework.
- **Comment Disposition:** Reviewer comments are either resolved or explicitly dispositioned.

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
| **Approval-ready change set** | Downstream steps | A revised change is ready for continued progression through the development controls. |


## 26.6 Key Artifacts
**Inputs:**
- Review comments and decisions from Step 25
- Pull request and updated code changes
- Automated check results and review workflow state

**Outputs:**
- Updated pull request with review feedback applied
- Closed or dispositioned discussion threads
- Re-run the pipeline and validation evidence
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
| **Review Rework Cycle Time** | <8 hours from review feedback to approval readiness | Pull request review timestamps and workflow analytics | Time taken to address review comments and return the change to approval readiness. |
| **Open Discussion Count** | 0 unresolved discussions before progression | Pull request discussion-thread status and review dashboard records | Number of unresolved review discussions per pull request. |
| **Rework Defect Recurrence** | 0 repeated critical issues in the same pull request review cycle | Review comment history and issue recurrence reporting | The frequency with which the same issue reappears after review and rework. |


## 26.10 Best Practices
**DO:**
- **Resolve with Intent:** Address feedback with clear intent and complete fixes.
- **Keep Reviewers Informed:** Keep reviewers informed when substantial changes are made after feedback.
- **Treat Closure as Quality Control:** Treat review closure as a quality control, not an administrative step.
- **Fix the Real Issue:** Resolve the underlying issue, not just the comment thread.

**DON'T:**
- **Mark Issues Resolved Prematurely:** Do not mark review issues resolved only when the code actually reflects the resolution.
- **Confuse Closure with Quality:** Do not treat comment closure as evidence of quality on its own.


## 26.11 Summary and Key Outcomes
Step 26 completes the human review response cycle by ensuring that review feedback is actioned properly, discussions are resolved transparently, and the pull request is returned to an approval-ready state with supporting evidence.

Key Outcomes:
- **Feedback Resolution:** Material review feedback is addressed with visible code, test, or documentation changes.
- **Discussion Closure:** Open review threads are resolved with a clear rationale rather than administrative closure alone.
- **Re-validated Pull Request State:** Automated checks and affected tests are re-run after rework.
- **Approval Readiness:** Reviewers can confirm whether the updated change is ready to proceed.
- **Controlled Review Continuation:** The pull request moves forward with stronger evidence and reduced ambiguity.


## 26.12 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, Reviewers |
| **Accountable** | Development Lead |
| **Consulted** | QA Lead, Technical Architect |
| **Informed** | Engineering Manager, Product Owner |


## 26.13 Related Steps
- **Upstream:** [Step 25: Code Review](Step-25-Code-Review.md)
- **Downstream:** [Step 27: IaC Testing](Step-27-IAC-Testing.md)


## 26.14 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |
