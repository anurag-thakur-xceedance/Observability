# Step 31: Development Complete

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |

## 31.1 Overview
| **Attribute** | **Value** |
|---|---|
| **Responsible Roles** | Development Lead, Development Team |
| **Accountable** | Engineering Manager |
| **Supporting Roles** | QA Lead, DevOps Engineer, Product Owner |
| **Tools** | Source control platform, CI/CD platform, work item system, quality records |


## 31.2 Purpose
Step 31 is the final development-phase closure step. It confirms that the change has completed the required development activities, meets Definition of Done expectations, and is ready to transition into the Secure, Govern, and Validate phase.

The purpose of this step is to prevent incomplete, weakly evidenced, or insufficiently validated work from progressing further in the SDLC.


## 31.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| **Completed development outputs** | Steps 19-30 | The full set of code, infrastructure, tests, review outcomes, and deployment evidence created in this phase. |
| **Definition of Done criteria** | Engineering and delivery standards | Approved completion expectations for the change. |
| **Work item status and evidence** | Work item system and engineering records | Delivery status, traceability, and supporting evidence for phase completion. |


## 31.4 Activities
### 31.4.1 Review Phase Completion
Confirm that the required development activities have been completed and that no mandatory control remains unresolved.

Review completion of development activities such as:
- All code merged to the main or approved branch
- Unit tests written and passing
 - Code reviews completed
 - Linting and quality checks passed
- Secrets scan passed
- IaC testing passed where applicable
- Deployment to the validation environment successful

Development phase checklist:
- [ ] All sprint backlog items completed
- [ ] Code merged to main or develop branch
 - [ ] Unit tests achieve >=80% coverage and 100% passing
- [ ] Code reviewed and approved with >=2 reviewers where policy requires
- [ ] Linting passed with zero blocking errors
- [ ] Secrets scan passed with zero unresolved secrets
- [ ] IaC testing passed where applicable
- [ ] Build artefacts generated
- [ ] Deployed to integration environment
- [ ] Smoke tests passed

### 31.4.2 Verify Definition of Done
Check the change against the applicable Definition of Done criteria, including implementation, tests, review, build, and deployment readiness.

Definition of Done review should include:

Code Quality:
- [ ] Code follows team standards
- [ ] Unit tests written and passing
- [ ] Code coverage >=80%
- [ ] No critical or high linting issues remain
- [ ] Code reviewed and approved

Security:
- [ ] No secrets in code
- [ ] Security review completed where needed
- [ ] Dependencies have no critical vulnerabilities
- [ ] Authorisation checks implemented where applicable

Documentation:
- [ ] Code comments added where needed
- [ ] API documentation updated
- [ ] README updated if applicable
- [ ] Runbooks updated where needed

Testing:
- [ ] Unit tests passing
- [ ] Integration tests passing where applicable
- [ ] Smoke tests passed
- [ ] Test cases linked to requirements where required

Deployment:
- [ ] Deployed to integration environment
- [ ] Environment variables configured
- [ ] Database migrations successful
- [ ] Rollback plan documented where required

### 31.4.3 Confirm Work Item and Traceability Closure
Ensure that the relevant work items, change links, and engineering records accurately reflect the completed state of the development work.

Work item updates should:
- Move work items to `Done`
- Add completion notes and supporting artefacts
- Link to merged pull requests
- Record actual versus estimated effort
- Update remaining work to zero where appropriate

Example work item update:

```text
Status: Done
Completion Date: 2026-03-10
Actual Effort: 8 hours (Estimated: 6 hours)

Completed Activities:
- Code developed and tested (Step 20)
- Code reviewed and approved (Steps 25-26)
- Deployed to integration (Step 30)
- Smoke tests passed

Artifacts:
- PR: #1234 (merged to main)
- Build: v2.5.3+build.1234
- Test Coverage: 85%

Related Work Items: AB#456, AB#457
```

### 31.4.4 Prepare Handoff to the Next Phase
Confirm that the output package is ready for the Secure, Govern, and Validate phase, with sufficient evidence and clarity for downstream teams.

Handoff preparation should include:
- Packaging deployment information
- Providing environment access details where appropriate
- Sharing security scan results
- Identifying areas requiring additional security review

Typical handoff package contents:
- Deployment version and location
- Environment details such as URLs and access information
- Security scan reports such as secrets and dependency results
- Updated architecture diagrams where relevant
- Test results and coverage reports

### 31.4.5 Communicate Development Completion
Update relevant stakeholders and records to show that the development phase is complete for the change.

Communication should include:
- Updating the sprint board
- Notifying the Product Owner
- Informing security and QA teams
- Updating project dashboards

Example completion communication:

```text
Development Phase Complete - Sprint 12

Work Items Completed: 8
- User Story AB#456: Payment gateway integration
- Bug AB#457: Login error handling
- Task AB#458: User profile UI update

Quality Metrics:
- Code Coverage: 85% (target: 80%)
- Unit Tests: 142 passing (0 failing)
- Code Review: 100% approved
- Deployment: Integration environment
- Smoke Tests: 100% passing

Next Steps:
- Security scanning and validation (Phase 04)
- QA testing beginning tomorrow
```


## 31.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Development completion confirmation** | Engineering and delivery records | Formal confirmation that the development phase is complete. |
| **Definition of Done evidence** | Work item system and governance records | Evidence that the change satisfies the approved completion criteria. |
| **Phase handoff package** | Phase 04 stakeholders | Information and evidence required to continue into Secure, Govern, and Validate. |


## 31.6 Key Artifacts
**Inputs:**
- Development phase outputs from Steps 19-30
- Work item status and delivery evidence
- Definition of Done checklist and completion criteria

**Outputs:**
 - Development complete confirmation
- Updated work items in `Done` state
- Definition of Done verification report
 - Handoff package for the next phase


## 31.7 Quality Gates / Exit Criteria
- [ ] All mandatory development-phase activities are complete.
- [ ] Definition of Done criteria have been met or formally exceptioned.
- [ ] Required traceability records are complete and current.
- [ ] The change is ready to move into Step 32 and the next phase.

The development phase is complete only when the change is demonstrably ready for the next phase without hidden rework, missing evidence, or unresolved material defects.


## 31.8 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Evidence aggregation** | CI/CD platform and work item tooling | Brings together build, test, review, and deployment evidence for completion assessment. |
| **Completion checklist support** | Approved AI assistant | Helps summarise whether expected development-phase deliverables appear complete. |
| **Traceability validation** | Work item and source control integrations | Confirms linkage between change records, PRs, builds, and delivery evidence. |


## 31.9 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| **Definition of Done Compliance** | 100% | Definition of Done checklist records and work item completion evidence | Percentage of required completion criteria satisfied before phase exit. |
| **Work Item Completion** | 100% | Sprint board, work item system, and delivery status reports | Percentage of committed development items completed for the scoped release or sprint. |
| **Phase Duration** | <2 weeks | Delivery lead-time reporting across the Develop phase | Time taken for a change to move through the Develop phase to closure. |
| **Handoff Time** | <1 hour | Handoff package timestamps and stakeholder notification records | Time required to prepare and hand off the completion package to the next phase. |
| **Time From Inception to PR** | <3 days | Work item start records, branch history, and pull request creation timestamps | Measures development velocity through the earlier part of the phase and supports DORA-style tracking. |


## 31.10 Best Practices
**DO:**
- Close the phase on evidence, not assumption.
- **Ensure the handoff:** package is usable by downstream stakeholders without additional reconstruction.
- Resolve material gaps before phase closure rather than after transition.
- Use phase completion as a quality decision point, not a calendar milestone.

- Verify all Definition of Done criteria objectively.
- Update work items promptly.
- Communicate completion clearly.

**DON'T:**
- **Mark development:** complete while material evidence or required controls are still missing.

- Skip Definition of Done verification to save time.
- Proceed with incomplete work.
- Delay handoff communication.


## 31.11 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Lead, Development Team |
| **Accountable** | Engineering Manager |
| **Consulted** | QA Lead, DevOps Engineer, Product Owner |
| **Informed** | Security Team, Release Stakeholders, Operations Team |


## 31.12 Related Steps
- **Upstream:** [Step 30: Development Flow Continued](Step-30-Development-Flow-Continued.md)
- **Downstream:** [Step 32: Code Test Creator](../04-Secure-Govern-Validate/Step-32-Code-Test-Creator.md)


## 31.13 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |
