# Step 31: Development Complete

| **Attribute** | **Value** |
|---|---|
| Document Owner | Simon Armstrong, VP Chief Architect |
| Approved By | Simon Armstrong (pending wider review) |
| Classification | Internal |
| Review Frequency | Half-Yearly |
| Next Review Due | 2026-12-01 |

## 31.1 Overview
| **Attribute** | **Value** |
|---|---|
| Responsible Roles | Development Lead, Development Team |
| Accountable | Engineering Manager |
| Supporting Roles | QA Lead, DevOps Engineer, Product Owner |
| Tools | Source control platform, CI/CD platform, work item system, quality records |


## 31.2 Purpose
Step 31 is the final development-phase closure step. It confirms that the change has completed the required development activities, meets Definition of Done expectations, and is ready to transition into the Secure, Govern, and Validate phase.

The purpose of this step is to prevent incomplete, weakly evidenced, or insufficiently validated work from progressing further in the SDLC.


## 31.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| Completed development outputs | Steps 19-30 | The full set of code, infrastructure, tests, review outcomes, and deployment evidence created in this phase. |
| Definition of Done criteria | Engineering and delivery standards | Approved completion expectations for the change. |
| Work item status and evidence | Work item system and engineering records | Delivery status, traceability, and supporting evidence for phase completion. |


## 31.4 Activities
### 31.4.1 Review Phase Completion
Confirm that the required development activities have been completed and that no mandatory control remains unresolved.

### 31.4.2 Verify Definition of Done
Check the change against the applicable Definition of Done criteria, including implementation, tests, review, build, and deployment readiness.

### 31.4.3 Confirm Work Item and Traceability Closure
Ensure that the relevant work items, change links, and engineering records accurately reflect the completed state of the development work.

### 31.4.4 Prepare Handoff to the Next Phase
Confirm that the output package is ready for the Secure, Govern, and Validate phase, with sufficient evidence and clarity for downstream teams.

### 31.4.5 Communicate Development Completion
Update relevant stakeholders and records to show that the development phase is complete for the change.


## 31.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| Development completion confirmation | Engineering and delivery records | Formal confirmation that the development phase is complete. |
| Definition of Done evidence | Work item system and governance records | Evidence that the change satisfies the approved completion criteria. |
| Phase handoff package | Phase 04 stakeholders | Information and evidence required to continue into Secure, Govern, and Validate. |


## 31.6 Quality Gates / Exit Criteria
- [ ] All mandatory development-phase activities are complete.
- [ ] Definition of Done criteria have been met or formally exceptioned.
- [ ] Required traceability records are complete and current.
- [ ] The change is ready to move into Step 32 and the next phase.

The development phase is complete only when the change is demonstrably ready for the next phase without hidden rework, missing evidence, or unresolved material defects.


## 31.7 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| Evidence aggregation | CI/CD platform and work item tooling | Brings together build, test, review, and deployment evidence for completion assessment. |
| Completion checklist support | Approved AI assistant | Helps summarise whether expected development-phase deliverables appear complete. |
| Traceability validation | Work item and source control integrations | Confirms linkage between change records, PRs, builds, and delivery evidence. |


## 31.8 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| Definition of Done Compliance | 100% | Definition of Done checklist records and work item completion evidence | Percentage of required completion criteria satisfied before phase exit. |
| Work Item Completion | 100% | Sprint board, work item system, and delivery status reports | Percentage of committed development items completed for the scoped release or sprint. |
| Phase Duration | Less than 2 weeks, unless formally planned otherwise | Delivery lead-time reporting across the Develop phase | Time taken for a change to move through the Develop phase to closure. |
| Handoff Time | Less than 1 hour | Handoff package timestamps and stakeholder notification records | Time required to prepare and hand off the completion package to the next phase. |
| Time From Inception to PR | Less than 3 days | Work item start records, branch history, and pull request creation timestamps | Measures development velocity through the earlier part of the phase and supports DORA-style tracking. |


## 31.9 Best Practices
**DO:**
- Close the phase on evidence, not assumption.
- Ensure the handoff package is usable by downstream stakeholders without additional reconstruction.
- Resolve material gaps before phase closure rather than after transition.
- Use phase completion as a quality decision point, not a calendar milestone.

**DON'T:**
- Mark development complete while material evidence or required controls are still missing.


## 31.10 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| Responsible | Development Lead, Development Team |
| Accountable | Engineering Manager |
| Consulted | QA Lead, DevOps Engineer, Product Owner |
| Informed | Security Team, Release Stakeholders, Operations Team |


## 31.11 Related Artefacts
- Definition of Done checklist
- Work item completion record
- Build, test, review, and deployment evidence
- Handoff summary for Phase 04


## 31.12 Related Steps
- **Upstream:** [Step 30: Development Flow Continued](Step-30-Development-Flow-Continued.md)
- **Downstream:** [Step 32: Code Test Creator](../04-Secure-Govern-Validate/Step-32-Code-Test-Creator.md)


## 31.13 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| 0.1 | 5 May 2026 | Anurag Thakur | Initial draft for Review |
