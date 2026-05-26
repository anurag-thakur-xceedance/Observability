# Step 06: Sprint Definition

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 6 |
| **Phase** | Planning (Azure DevOps or Jira) |
| **Previous Step** | Step 5: Team Creates Sprint |
| **Next Step** | Step 7: Design Feedback |
| **Responsible Role(s)** | Scrum Master, Product Owner |
| **Tools** | Azure DevOps or Jira |

---

## Purpose

Finalise and validate the sprint definition, ensuring all work items are properly defined and the sprint is ready for execution. This step includes a Pass/Rework decision point.

---

## Inputs

| Input | Source | Description |
| --- | --- | --- |
| Sprint Backlog | Step 5 | Committed sprint work items |
| Sprint Goal | Step 5 | Defined sprint objective |
| Definition of Done | Step D | Team's DoD criteria |

---

## Activities

### 6.1 Sprint Definition Review

**Owner:** Scrum Master
**Duration:** 1-2 hours

#### Process Steps:

1. **Comprehensive Sprint Review Session**

- Schedule review meeting with key participants: - Scrum Master (facilitator) - Product Owner - Development Lead - QA Lead - Architecture representative (if complex items) - Prepare review materials: - Sprint backlog summary - Sprint goal statement - Capacity vs. commitment analysis - Dependency matrix - Risk register

1. **Review Sprint Goal Alignment**

- Validate sprint goal: - Is it clear and measurable? - Is it achievable within sprint timeframe? - Does it align with product roadmap? - Does selected backlog support the goal? - Check goal coherence: - Do all items contribute to goal? - Is there a logical progression? - Are there unrelated items that should be removed? - Confirm stakeholder alignment on goal importance

1. **Review Sprint Backlog Composition**

- Analyze backlog balance: ``` Recommended Mix: - New Features: 60-70% - Bug Fixes: 10-15% - Technical Debt: 10-20% - Spikes/Research: 5-10% ``` - Check story distribution: - Mix of sizes (small, medium, large) - Multiple team members can work in parallel - Not all work dependent on single person - Balance of frontend, backend, testing work - Verify total commitment vs. capacity: - Committed points should be 70-90% of capacity - Leave buffer for unplanned work - Account for known risks

1. **Review Sprint Metadata**

- Confirm sprint details in Azure DevOps or Jira: - Sprint name and number - Start and end dates - Sprint goal documented - All committed items assigned to sprint - Sprint capacity set correctly - Team members configured - Verify sprint ceremony schedule: - Daily standup times - Backlog refinement sessions - Sprint review date/time - Sprint retrospective scheduled

1. **Review Communication Plan**

- Confirm stakeholder communication: - Who needs sprint updates? - What communication channels to use? - When to provide status updates? - Who needs demo invitations? - Verify escalation paths are clear - Ensure everyone knows how to raise impediments

**Sprint Definition Review Checklist:**

- [ ] Sprint goal is clear, measurable, and aligned
- [ ] Sprint backlog supports sprint goal
- [ ] Work items are balanced by type and size
- [ ] Capacity vs. commitment is appropriate
- [ ] Sprint metadata correctly configured in Azure DevOps or Jira
- [ ] Sprint ceremonies scheduled
- [ ] Communication plan confirmed
- [ ] Team understands sprint scope and goal

---

### 6.2 Work Item Validation

**Owner:** Product Owner with Scrum Master
**Duration:** 1-2 hours

#### Process Steps:

1. **Apply Definition of Ready (DoR) Validation**

For each work item in sprint backlog, verify:

**Story Structure:**- Written in proper user story format (As a... I want... So that...)
- Title is clear and descriptive
- Description provides sufficient context
- Business value is articulated
  **Acceptance Criteria:**
- Acceptance criteria are defined
- Criteria use Given/When/Then format
- Criteria are testable and measurable
- Happy path scenarios covered
- Error/edge cases included
- Non-functional requirements specified
  **Estimation & Sizing:**
- Story has been estimated by team
- Story points are assigned
- Story size is ≤13 points
- Estimate is still valid (no significant changes)
  **Dependencies & Links:**
- Dependencies identified and documented
- Dependent items linked in Azure DevOps or Jira
- Parent-child relationships correct
- Related work items linked
- Test cases linked (if exist)
  **Technical Details:**
- Technical approach discussed
- Architecture considerations documented
- UI/UX designs available (if applicable)
- API contracts defined (if applicable)
- Data model changes identified
- Security considerations noted
  1. **Validate Work Item Completeness****Essential Fields:**
- Title: Clear and concise
- Description: Complete and unambiguous
- Acceptance Criteria: Comprehensive
- Priority: Assigned appropriately
- Estimate: Story points assigned
- Area Path: Correct team/component
- Iteration: Assigned to current sprint
- State: Set to "New" or "Approved"
  **Supporting Information:**
- Tags applied for categorization
- Attachments added (mockups, specs)
- Links to related documents
- Comments with additional context
- History shows appropriate refinement
  1. **Verify Technical Readiness****Development Readiness:**

  - Required environments available - Development tools and licenses ready - Code repositories accessible - Branch strategy clear - CI/CD pipeline ready

  **Architecture Readiness:**

  - Architecture decisions made - Design patterns selected - Integration points defined - Data structures designed - API contracts agreed

  **Testing Readiness:**

  - Test strategy defined - Test data available or plan to create - Test environments accessible - Testing tools configured - Acceptance test approach agreed

  1. **Flag Issues and Gaps**

  Create issues list for items not meeting validation:

  | Work Item | Issue | Severity | Action Required | Owner | Due Date |
  | --- | --- | --- | --- | --- | --- |
  | WI-123 | Missing acceptance criteria | High | Add Given/When/Then | PO | Before sprint start |
  | WI-124 | No mockup attached | Medium | Attach design | UX | Day 1 of sprint |
  | WI-125 | Estimate seems low | Medium | Re-estimate | Team | Planning session |
  | WI-126 | Blocked by external dependency | Critical | Resolve or defer | SM | Immediately |

  1. **Re-validate Changed Items**

  - If items were updated during planning: - Review all changes made - Ensure changes maintain DoR compliance - Verify team still understands and agrees - Update estimates if scope changed - Document what changed and why

  **Validation Outcomes:**
  - **Pass:** All items meet DoR and ready to proceed
  - **Conditional Pass:** Minor issues that can be resolved quickly
  - **Fail:** Critical gaps requiring rework before sprint start

  ---

  ### 6.3 Dependency Check

  **Owner:** Scrum Master with Team
  **Duration:** 1 hour

  #### Process Steps:

  1. **Review Dependency Matrix**

  Create or review dependency matrix for sprint:

  | This Item | Depends On | Type | Status | Risk | Mitigation |
  | --- | --- | --- | --- | --- | --- |
  | WI-123 | WI-105 (completed) | Technical | ✅ Resolved | Low | N/A |
  | WI-124 | External API access | External | ⚠️ Pending | High | Use mock service |
  | WI-125 | WI-126 (in sprint) | Sequence | ✅ Planned | Low | Sequence work |
  | WI-127 | Design approval | External | ❌ Blocked | Critical | Escalate immediately |

  1. **Categorize Dependencies****Internal Dependencies (Within Team):**

  - **Sequence dependencies:** One story must complete before another - **Parallel dependencies:** Stories can work simultaneously with coordination - **Technical dependencies:** Shared code, components, or infrastructure - **Data dependencies:** Shared data models or database changes

  **External Dependencies (Outside Team):**

  - **Other Teams:** Shared services, APIs, components - **Third-Party Services:** External APIs, services, vendors - **Infrastructure:** Cloud resources, network, security - **Business Stakeholders:** Approvals, decisions, content - **Regulatory/Compliance:** Certifications, audits, legal review

  1. **Assess Dependency Status**

  For each dependency, determine status:

  **✅ Resolved:**

  - Dependency already completed - Resource/approval obtained - No blocking issue - Action: Document for reference

  **🟢 On Track:**

  - Dependency in progress with expected completion before needed - Low risk of delay - Action: Monitor progress

  **⚠️ At Risk:**

  - Dependency may not complete on time - Medium risk of impact - Action: Develop contingency plan

  **❌ Blocked:**

  - Dependency cannot be met - Critical blocker to progress - Action: Escalate immediately or remove item from sprint

  1. **Develop Mitigation Strategies**

  For at-risk or blocked dependencies:

  **Strategy 1: Remove Dependency**

  - Refactor story to eliminate dependency - Use alternative approach - Implement temporary solution

  **Strategy 2: Mock/Stub**

  - Create mock services or data - Implement stub functionality - Enable parallel development - Replace with real implementation later

  **Strategy 3: Defer Item**

  - Move blocked item to next sprint - Select alternative item from backlog - Adjust sprint goal if necessary

  **Strategy 4: Escalate and Expedite**

  - Escalate to management - Request expedited approval/access - Negotiate priority with other teams - Allocate additional resources

  **Strategy 5: Reduce Scope**

  - Implement partial functionality - Defer dependent parts to future sprint - Deliver incremental value

  1. **Coordinate with Dependency Owners**

  - Contact owners of external dependencies: - Confirm timeline and availability - Communicate sprint needs - Establish communication channel - Agree on notification when ready - Document agreements and commitments - Set up monitoring or checkpoints

  1. **Update Dependency Status in Azure DevOps or Jira**

  - Use "Predecessor/Successor" link types - Add dependency notes in work item comments - Create tasks for dependency management - Set up alerts for dependency status changes - Update risk register with dependency risks

  **Dependency Check Decision:**
  - **✅ All Clear:** All dependencies resolved or mitigated → Proceed
  - **⚠️ Monitored:** Some risks but managed → Proceed with caution
  - **❌ Blocked:** Critical blockers unresolved → Rework required

  ---

  ### 6.4 Pass/Rework Decision

  **Owner:** Product Owner with Scrum Master
  **Duration:** 30 minutes

  #### Process Steps:

  1. **Consolidate Validation Results**

  Compile results from previous activities: - Sprint definition review findings - Work item validation status - Dependency check outcomes - Risk assessment summary - Team confidence level

  1. **Apply Decision Criteria****PASS Criteria (All must be true):**
- Sprint goal is clear and achievable
- All work items meet Definition of Ready
- No critical dependencies are blocked
- Team has committed with confidence
- Capacity is appropriate (not over/under)
- No critical risks without mitigation
- Required resources are available
- Stakeholders aligned on sprint scope
  **REWORK Criteria (Any triggers rework):**
- Sprint goal is unclear or unachievable
- Multiple work items don't meet DoR
- Critical dependencies are blocked
- Team lacks confidence in sprint scope
- Capacity significantly over/under allocated
- Critical unmitigated risks exist
- Key resources unavailable
- Major stakeholder concerns
  1. **Make Decision****Decision: PASS ✅**

  - Sprint definition is approved - Sprint can officially start - Proceed to Step 7 (Design Feedback) - Document approval and proceed

  **Decision: REWORK ⚠️**

  - Sprint definition needs refinement - Return to Step 5 for adjustments - Document issues requiring rework: - What needs to be fixed? - Who will fix it? - How long will it take? - When to re-review? - Communicate rework to team and stakeholders

  1. **Document Decision****For PASS:**

  ```markdown # Sprint 15 - Definition Approved

  **Date:** 2026-02-01
  **Decision:** PASS ✅
  **Approved By:** Product Owner, Scrum Master
  **Sprint Goal:** Enable secure user authentication with self-service password management
  **Sprint Scope:** 8 stories, 39 points
  **Team Capacity:** 50 points (78% utilization)
  **Key Validations:**

  ✅ All work items meet DoR ✅ Dependencies resolved or mitigated ✅ Team committed with high confidence ✅ Resources available ✅ No blocking risks

  **Sprint Start:** February 1, 2026
  **Sprint End:** February 14, 2026
  **Sprint Review:** February 14, 2026 at 2:00 PM

  ```

  **For REWORK:**

  ```markdown # Sprint 15 - Rework Required

  **Date:** 2026-01-31
  **Decision:** REWORK ⚠️
  **Decision By:** Product Owner, Scrum Master
  **Issues Requiring Rework:**

  1. WI-123: Missing acceptance criteria (Critical) 2. WI-127: Blocked by unresolved external dependency (Critical) 3. Capacity over-allocated by 15% (High)

  **Actions Required:**

  - PO to add acceptance criteria to WI-123 by EOD - SM to escalate WI-127 dependency or remove from sprint - Team to reduce scope by ~8 points

  **Re-review Scheduled:** February 1, 2026 at 9:00 AM
  **Target Sprint Start:** February 1, 2026 (afternoon)

  ```

  1. **Communicate Decision**

  - Notify all stakeholders: - Development team - Product Owner - Project management - Dependent teams - Business stakeholders - For PASS: Send sprint kickoff announcement - For REWORK: Explain issues and revised timeline - Update Azure DevOps or Jira sprint status

  **Pass/Rework Decision Matrix:**

  | Validation Area | Status | Impact on Decision |
  | --- | --- | --- |
  | Sprint Goal | Clear ✅ | Supports PASS |
  | Work Items | 1 minor issue ⚠️ | Conditional PASS |
  | Dependencies | 2 resolved, 1 at-risk ⚠️ | Supports PASS with monitoring |
  | Team Confidence | High ✅ | Supports PASS |
  | Capacity | Appropriate ✅ | Supports PASS |
  | Risks | All mitigated ✅ | Supports PASS |
  | **Overall Decision** |  | **PASS ✅** |

  ---

  ### 6.5 Sprint Kick-off

  **Owner:** Scrum Master
  **Duration:** 30 minutes to 1 hour

  #### Process Steps:

  1. **Prepare Sprint Kick-off Meeting**

  - Schedule kick-off meeting (if not part of planning) - Invite full team: - All development team members - Product Owner - QA team - DevOps/SRE (if needed) - Prepare kick-off materials: - Sprint goal poster/slide - Sprint backlog summary - Team capacity overview - Sprint calendar with key dates - Risk and dependency summary

  1. **Conduct Sprint Kick-off Session****A. Sprint Overview (5 minutes)**

  - Scrum Master presents sprint details: - Sprint number and dates - Sprint duration (e.g., 2 weeks) - Key milestone dates - Public holidays or team events

  **B. Sprint Goal Presentation (10 minutes)**

  - Product Owner presents sprint goal: - Read goal statement - Explain why it matters - Connect to product vision - Describe expected impact - Show how backlog supports goal - Visualize goal on team board

  **C. Sprint Backlog Review (15 minutes)**

  - Review committed work items: - Quick walkthrough of each story - Highlight key dependencies - Point out critical path items - Show task breakdown - Display backlog on team board - Ensure everyone understands scope

  **D. Team Alignment (10 minutes)**

  - Confirm team understanding: - Any questions about scope? - Any concerns about capacity? - Any unclear requirements? - Review working agreements - Confirm Definition of Done - Agree on collaboration approach

  **E. Logistics and Schedule (10 minutes)**

  - Review sprint ceremonies: - Daily standup time and location - Backlog refinement sessions - Sprint review date/time - Sprint retrospective schedule - Confirm communication channels - Identify any schedule conflicts - Set up virtual meeting links if needed

  **F. Risk and Dependency Review (10 minutes)**

  - Highlight key risks: - Explain mitigation plans - Assign risk owners - Establish monitoring approach - Review dependencies: - Explain coordination needs - Identify dependency owners - Set up checkpoints - Ensure everyone knows escalation process

  1. **Set Up Physical/Virtual Sprint Board****Physical Board (if co-located):**

  - Create columns: To Do, In Progress, Review, Done - Post sprint goal prominently - Add all story cards - Include team capacity chart - Display Definition of Done - Add "parking lot" for impediments

  **Virtual Board (Azure DevOps or Jira):**

  - Configure sprint board view - Set up columns matching workflow - Add swimlanes if needed (by person, by story) - Configure WIP limits if using - Set up custom tags and filters - Enable taskboard for daily standup

  1. **Initialize Sprint Tracking****Set up monitoring dashboards:**

  - **Burndown Chart:** Track remaining work over time - **Velocity Chart:** Compare planned vs. actual velocity - **Cumulative Flow:** Visualize work distribution - **Cycle Time:** Track time in each state - **Work Item Age:** Identify stagnant items

  **Configure alerts and notifications:**

  - Set up work item state change notifications - Configure build failure alerts - Enable PR review notifications - Set up impediment escalation alerts

  **Establish daily tracking:**

  - Team members move tasks on board - Update remaining work daily - Log impediments as they arise - Update burndown daily

  1. **Official Sprint Start**

  - Mark sprint as "Active" in Azure DevOps or Jira - Send sprint kickoff announcement: ```markdown 🚀 Sprint 15 Has Started!

  Sprint Goal: Enable secure user authentication with self-service password management

  Dates: February 1-14, 2026 Team: 5 members, 50 points capacity Commitment: 8 stories, 39 points

  Key Milestones: - Feb 5: Email service integration ready - Feb 10: Security review - Feb 14: Sprint review (2:00 PM)

  Daily Standup: Every day at 9:30 AM (Teams link)

  Let's make it a great sprint! 💪 ``` - Update project status reports - Notify stakeholders and dependent teams - Enable sprint metrics tracking

  1. **First Day Actions**

  - Developers pick up first stories/tasks - QA prepares test environments - DevOps validates CI/CD pipeline - Architecture available for questions - Product Owner available for clarification - Scrum Master monitors for early impediments

  **Sprint Kick-off Checklist:**
  - [ ] Kick-off meeting conducted
  - [ ] Sprint goal communicated and understood
  - [ ] Team aligned on sprint scope
  - [ ] Sprint board set up (physical/virtual)
  - [ ] Tracking dashboards configured
  - [ ] Sprint marked as "Active" in Azure DevOps or Jira
  - [ ] Kickoff announcement sent
  - [ ] Stakeholders notified
  - [ ] Team started work on first items
  - [ ] First daily standup scheduled**Sprint Kick-off Success Indicators:**
  - Team is energized and motivated
  - Everyone understands sprint goal
  - No major confusion about scope
  - Communication channels working
  - Tracking mechanisms in place
  - First stories/tasks picked up
  - No immediate impediments

  ---

  ## Outputs

  | Output | Destination | Description |
  | --- | --- | --- |
  | Validated Sprint | Step 7 | Approved sprint ready for execution |
  | Rework Items | Step 5 | Items requiring further refinement (if rework) |

  ---

  ## Quality Gates / Exit Criteria

  - [ ] All work items validated
  - [ ] Dependencies resolved or mitigated
  - [ ] Sprint definition approved (Pass)
  - [ ] Sprint officially started

  ---

  ## Decision Point: Pass / Rework

  | Decision | Criteria | Action |
  | --- | --- | --- |
  | **Pass** | All items meet DoR, dependencies resolved | Proceed to Step 7 |
  | **Rework** | Items need refinement, unresolved dependencies | Return to Step 5 |

  ---

  ## AI/Automation Augmentation

  | Capability | Tool/Service | Description |
  | --- | --- | --- |

  ---

  ## Observability & Metrics

  | Reference | Type | Description |
  | --- | --- | --- |

  ---

  ## Related Artefacts

  - Sprint Definition Checklist
  - Dependency Matrix

  ---

  ## RACI Matrix

  | Role | Responsibility |
  | --- | --- |
  | **Responsible** | Scrum Master |
  | **Accountable** | Product Owner |
  | **Consulted** | Development Team, Architecture |
  | **Informed** | Project Management |

  ---

  ## Related Steps

  - **Upstream:** Step 5: Team Creates Sprint
  - **Downstream:** Step 7: Design Feedback (Pass) or Step 5 (Rework)

  ---

  ## Revision History

  | Version | Date | Author | Changes |
  | --- | --- | --- | --- |
  | 1 | 2026-03-25 | Simon Armstrong | Initial draft |

  ---

  ## Navigation

  |
   |