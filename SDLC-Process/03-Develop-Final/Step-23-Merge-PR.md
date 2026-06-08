[Previous: Step 22 - Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md) | [Next: Step 24 - Linting](Step-24-Linting.md)

# Step 23: Merge PR

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |

## 23.1 Overview
| **Attribute** | **Value** |
|---|---|
| **Responsible Roles** | Development Team, Pull Request Author |
| **Accountable** | Development Lead |
| **Supporting Roles** | Reviewers, QA Lead, DevOps Engineer |
| **Tools** | Source control platform, pull request workflow, CI/CD pipeline, approved AI assistant |


## 23.2 Purpose
Step 23 formalises the code change into the pull request workflow so that automated checks, traceability controls, and human review can proceed in a controlled manner. Although the step title is retained as `Merge PR` for sequence consistency, the work performed at this point is the structured creation and submission of the pull request into the merge process.

The purpose of this step is to ensure that the change is properly packaged for review, linked to the approved work scope, and submitted with enough context for reviewers and automation pipelines to evaluate it efficiently.


## 23.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| **Implemented and tested change set** | Steps 20-22 | Code, tests, and maintainability updates ready for pull request submission. |
| **Approved work item reference** | Sprint backlog and work items | The feature, defect, or change record linked to the code change. |
| **Branch and repository standards** | Engineering standards | Naming conventions, merge policies, and pull request expectations. |
| **Review context** | Development Team | Summary of what changed, why it changed, and how reviewers should validate it. |


## 23.4 Activities
### 23.4.1 Prepare Pull Request Metadata
Create the pull request with proper branch naming and the correct merge target.

Expected branch metadata includes:
- **Branch Naming:** Follows the approved convention such as `feature/WORKITEM-123-short-description`.
- **Target Branch:** `main` or `develop`, based on the team branching strategy.
- **Source Branch Completeness:** The source branch contains the complete committed change set for the work item.

Typical branch strategy examples include:
- **User Story Branch:** `feature/US-456-add-payment-gateway`
- **Defect Fix Branch:** `bugfix/BUG-789-fix-login-error`
- **Production Hotfix Branch:** `hotfix/PROD-321-critical-security-patch`

### 23.4.2 Link Traceability Records
Link the pull request to the related work items so that traceability is explicit and bidirectional.

The pull request should:
- **Reference Work Items:** Include work items in the title or description.
- **Use Linking Keywords:** Use supported linking keywords such as `Fixes #123` or `Closes AB#456`.
- **Preserve Traceability:** Maintain bidirectional traceability between the pull request and the governing work item.

Typical linking structure includes:
- **Title Format:** `Add payment gateway integration (Fixes AB#456)`
- **Description Content:** Include implementation context and related work items.
- **Related Records:** Identify what the PR implements, depends on, or relates to.

Example linkage detail:
- **Implements:** `User Story AB#456`
- **Depends on:** `Task AB#457 (API credentials)`
- **Relates to:** `Bug AB#450 (payment validation)`

### 23.4.3 Provide Review Context
Provide a clear pull request description so reviewers can understand the change without reconstructing context from commits alone.

The description should cover:
- **What:** Summary of changes
- **Why:** Business context and rationale
- **How:** Technical approach overview
- **Testing:** How to test the changes
- **Screenshots:** For UI changes where relevant

An effective pull request template typically includes:
- **Summary Section:** `Summary`
- **Change Section:** `Changes`
- **Testing Section:** `Testing`
- **Work Item Section:** `Related Work Items`
- **Checklist Section:** `Checklist`

Example checklist items include:
- [ ] Unit tests added and coverage remains within target
- [ ] Integration tests added where relevant
- [ ] Documentation updated
- [ ] No known security vulnerabilities introduced

### 23.4.4 Assign or Request Reviewers
Assign appropriate reviewers according to team policy and change risk.

Reviewer assignment expectations include:
- **Dual Review:** At least 2 reviewers where team policy requires dual review.
- **Domain Expertise:** Include a domain expert for complex or business-critical changes.
- **Security Review:** Include a security reviewer for security-sensitive code.
- **Reviewer Notification:** Notify reviewers through the pull request workflow, comments, or approved team communication channels.

Reviewer selection criteria typically include:
- **Code owner:** Team member responsible for the affected area
- **Domain expert:** Reviewer with business logic familiarity
- **Security reviewer:** Required for authentication, payment, or sensitive data handling
- **Junior developer:** Included where appropriate for knowledge sharing and learning

### 23.4.5 Submit Into the Merge Workflow
Submit the pull request and monitor its progress through the merge workflow.

PR Checklist Before Submission:
- [ ] All tests are passing locally
- [ ] Code follows the style guide
- [ ] Comments and documentation are updated
- [ ] Work items are linked
- [ ] Reviewers are assigned
- [ ] Breaking changes are documented where applicable

After submission, the author should:
- **Check Validation Status:** Ensure pre-submit checks such as tests and linting pass.
- **Monitor Pipeline Progress:** Monitor CI/CD pipeline status.
- **Respond Promptly:** Respond to reviewer comments promptly.
- **Update the Pull Request:** Address feedback and update the pull request as needed.

Submission does not imply immediate merge; it means the change has formally entered the governed merge and review path.


## 23.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Submitted pull request** | Source control platform | Formal review object representing the change. |
| **Traceable review record** | Source control platform and work item system | Linkage between the code change and the approved delivery scope. |
| **Review context package** | Reviewers and downstream quality controls | Description, testing notes, and context needed for review. |
| **Triggered automation checks** | CI/CD platform | Automated linting, testing, and pipeline controls initiated by pull request submission. |


## 23.6 Key Artifacts
**Inputs:**
- Implemented and tested change set from Steps 20-22
- Approved work item, defect, or change reference
- Branching, pull request, and merge policy standards
- Review context, testing notes, and traceability requirements

**Outputs:**
- Submitted pull request with complete metadata
- Linked work item or change reference
- Pull request description with review and testing context
- Reviewer assignment or routing evidence


## 23.7 Quality Gates / Exit Criteria
- [ ] Pull request is created against the correct target branch.
- [ ] Linked work items or change references are present.
- [ ] The title and description are clear, complete, and review-ready.
- [ ] Reviewers have been assigned or the request has been routed correctly.
- [ ] The change has formally entered the automated and human review workflow.


## 23.8 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Pull request summary support** | Approved AI assistant | Helps generate an initial summary, testing notes, and reviewer context. |
| **Traceability validation** | Source control platform and workflow rules | Confirms branch, work item, and PR policy compliance. |
| **Automated workflow initiation** | CI/CD pipeline | Starts required review-time quality controls as soon as the pull request is submitted. |


## 23.9 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| **PR Size** | <400 lines changed | Pull request diff statistics in the source control platform | Tracks whether pull requests remain focused and reviewable. |
| **PR Creation Time** | <30 minutes | Pull request creation timestamps and author activity records | Measures the time taken to create and submit the pull request once the change is ready. |
| **Work Item Linkage** | 100% | Pull request metadata checks and work item linkage validation rules | Percentage of pull requests correctly linked to approved work scope. |
| **Time to First Review** | <4 hours | Pull request timestamps and first-review activity records | Time from pull request submission to the first human review. |
| **Time From Inception to PR** | <3 days | Work item start date, branch history, and pull request creation timestamp | Measures development velocity from work start to pull request submission. |


## 23.10 Best Practices
**DO:**
- **Keep the PR Focused:** Keep the pull request focused and coherent.
- **Maintain Work Item Traceability:** Link every pull request to its governing work item.
- **Write Clear Review Instructions:** Write review instructions that reduce ambiguity for reviewers.
- **Start with Reviewable Context:** Ensure the merge workflow begins with clean, reviewable context.

**DON'T:**
- **Treat Submission as a Formality:** Do not treat PR submission as a formality rather than a governed handoff into review.


## 23.11 Summary and Key Outcomes
Step 23 packages the completed change into a governed pull request so that traceability, automated validation, and human review can begin with the right context and the right routing.

Key Outcomes:
- **Governed Pull Request Submission:** The change is formally submitted into the controlled review and merge workflow.
- **Work Item Traceability:** The pull request is linked clearly to the approved work scope and related records.
- **Reviewer-Ready Context:** Reviewers receive clear description, testing notes, and implementation context.
- **Correct Reviewer Routing:** The request is assigned or routed to the right reviewers for the type of change.
- **Automated Review Initiation:** Submission triggers the expected CI/CD and review-time quality controls.


## 23.12 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, Pull Request Author |
| **Accountable** | Development Lead |
| **Consulted** | Reviewers, QA Lead, DevOps Engineer |
| **Informed** | Engineering Manager, Product Owner |


## 23.13 Related Steps
- **Upstream:** [Step 22: Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md)
- **Downstream:** [Step 24: Linting](Step-24-Linting.md)


## 23.14 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |
