# Step 05: Team Creates Sprint

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 5 |
| **Phase** | Planning (Azure DevOps or Jira) |
| **Previous Step** | Step 4: Work Item Integration |
| **Next Step** | Step 6: Sprint Definition |
| **Responsible Role(s)** | Agile Team, Scrum Master |
| **Tools** | Azure DevOps or Jira |

---

## Purpose

The Agile team creates a new sprint, selecting work items from the prioritised backlog based on team capacity and sprint goals. This step establishes the sprint scope and commitments.

---

## Inputs

| Input | Source | Description |
| --- | --- | --- |
| Integrated Backlog | Step 4 | Consolidated and prioritised backlog |
| Sprint-Ready Items | Step 4 | Items ready for sprint planning |
| Team Capacity | Step D | Available team capacity |
| Definition of Ready | Step D | Criteria for sprint-ready items |

---

## Activities

### 5.1 Sprint Planning Meeting

**Owner:** Scrum Master (facilitator), Full Team
**Duration:** 2-4 hours (for 2-week sprint)

#### Process Steps:

1. **Meeting Preparation**

- **Before the meeting:** - Scrum Master: Book meeting room or virtual space - Product Owner: Prepare prioritized sprint-ready backlog - Team: Review sprint-ready items beforehand - Scrum Master: Prepare capacity information - QA: Review testing requirements - **Meeting materials:** - Sprint-ready backlog view - Team capacity worksheet - Definition of Done - Previous sprint velocity - Sprint goal ideas

1. **Sprint Planning Part 1: What (1-2 hours)**

**Step A: Review Sprint Context**

- Product Owner presents: - Product vision and roadmap - Business priorities for this sprint - Key stakeholder needs - Upcoming milestones or deadlines - Review previous sprint outcomes - Discuss any changes in priorities

**Step B: Review Team Capacity**

- Scrum Master presents capacity: - Team members and availability - Planned time off or absences - Other commitments (support, meetings) - Previous sprint velocity - Capacity calculation (from Step D.5) - Adjust expectations based on capacity

**Step C: Draft Sprint Goal**

- Collaboratively create sprint goal: - Should be achievable in one sprint - Aligned with product objectives - Provides focus and coherence - Inspirational and meaningful to team - Examples of good sprint goals: - "Enable users to manage their profiles" - "Improve system performance to meet SLA" - "Launch MVP for new customer segment" - Avoid anti-patterns: - "Complete 10 stories" (output-focused) - "Work on various things" (too vague)

**Step D: Select Work Items**

- Product Owner presents items in priority order - For each item: - PO explains business value and context - Team asks clarifying questions - Team confirms understanding - Team confirms estimate is still valid - Team decides if they can commit - Continue until capacity filled or goal achieved - Total committed points should not exceed capacity

1. **Sprint Planning Part 2: How (1-2 hours)**

**Step A: Technical Discussion**

- Team discusses implementation approach: - Architecture and design considerations - Technical dependencies - Integration points - Potential risks or challenges - Shared code or merge conflicts - Need for technical spikes - Architecture team provides input if needed

**Step B: Task Breakdown**

- Decompose each story into tasks: - Development tasks (frontend, backend, database) - Testing tasks (unit, integration, E2E) - Documentation tasks - Code review - Deployment tasks - Estimate tasks in hours (optional) - Assign tasks to team members (optional, can be done daily)

**Step C: Identify Risks and Dependencies**

- Discuss potential impediments: - External dependencies - Technical unknowns - Resource constraints - Third-party availability - Plan mitigation strategies - Identify items needing help or expertise

**Step D: Validation and Commitment**

- Review sprint scope: - Does it achieve sprint goal? - Is capacity realistic? - Are dependencies manageable? - Do we have needed skills? - Team makes commitment: - "We commit to delivering these items" - "We will work toward the sprint goal" - Not a guarantee, but a commitment to try - Product Owner confirms acceptance

1. **Sprint Planning Documentation**

- Record sprint details in Azure DevOps or Jira: - Sprint goal in iteration description - Committed work items in sprint backlog - Tasks created and assigned - Capacity allocated - Take meeting notes: - Key decisions made - Risks and mitigation plans - Dependencies identified - Action items - Communicate sprint plan to stakeholders

**Sprint Planning Outputs:**

- Sprint goal statement
- Sprint backlog (committed work items)
- Task breakdown
- Capacity allocation
- Risk register updates
- Sprint plan summary

**Sprint Planning Best Practices:**

- Timebox the meeting strictly
- Entire team must attend
- Product Owner must be present
- Focus on "What" then "How"
- Don't over-commit
- Allow team to self-organize
- Document decisions and rationale

---

### 5.2 Sprint Goal Definition

**Owner:** Product Owner with Team
**Duration:** 30 minutes (part of planning)

#### Process Steps:

1. **Understand Sprint Goal Purpose**

- Sprint goal provides: - **Focus:** What are we trying to achieve? - **Coherence:** How items relate to each other - **Flexibility:** Room to adjust scope if needed - **Motivation:** Why this sprint matters - **Communication:** Easy to explain to stakeholders

1. **Craft Effective Sprint Goal**

**Good Sprint Goal Characteristics:**

- **Outcome-focused:** Describes result, not output - **Business-oriented:** Connects to business value - **Achievable:** Realistic for sprint duration - **Measurable:** Can determine if achieved - **Inspiring:** Motivates the team

**Template Options:**

- "Enable [user] to [action] so they can [benefit]" - "Improve [aspect] to [target level]" - "Launch [feature] for [audience]" - "Complete [milestone] toward [larger goal]"

1. **Validate Sprint Goal**

- Check against criteria: - Does it align with product vision? - Can it be achieved this sprint? - Does selected backlog support it? - Is it meaningful to team and stakeholders? - Can success be measured? - Refine until team and PO agree

1. **Document and Communicate**

- Record in Azure DevOps or Jira iteration - Display on team board - Include in sprint kickoff communication - Reference in daily standups - Use to guide trade-off decisions during sprint

**Sprint Goal Examples:**
**Good Examples:**

- "Enable customers to self-service password resets, reducing support tickets by 30%"
- "Improve API response time to meet 99th percentile SLA of 200ms"
- "Launch beta version of mobile app to 100 early adopters"
- "Complete user authentication infrastructure to enable SSO rollout"

**Poor Examples (Anti-patterns):**

- "Complete 15 story points" ❌ (output-focused, not outcome)
- "Work on user features" ❌ (too vague)
- "Fix bugs and add features" ❌ (not coherent)
- "Make progress on the backlog" ❌ (not measurable or specific)

---

### 5.3 Work Item Selection

**Owner:** Product Owner presents, Team selects
**Duration:** 1-2 hours (part of planning)

#### Process Steps:

1. **Start with Highest Priority**

- Product Owner presents items in priority order - Team considers items sequentially - Don't skip lower priority items until higher ones selected - Exception: Can skip if blocking dependency

1. **For Each Work Item:**

**Step A: Product Owner Explains**

- Business value and context - User need or problem being solved - Expected outcomes - Acceptance criteria - Any special considerations

**Step B: Team Asks Questions**

- Clarify requirements - Understand scope boundaries - Identify assumptions - Discuss edge cases - Review design or mockups

**Step C: Validate Estimate**

- Team confirms estimate is still accurate - Adjust if new information emerged - Break down if too large (>13 points) - Create spike if too uncertain

**Step D: Check Capacity**

- Add item points to running total - Compare to available capacity - Ensure not over-committing - Leave buffer for unknowns (10-20%)

**Step E: Team Decision**

- Team decides if they can commit - Consider: - Capacity available - Skills and expertise needed - Dependencies manageable - Sufficient clarity - Product Owner cannot force team to take item - Team cannot commit without PO agreement on value

1. **Selection Strategies**

**Strategy A: Capacity-Based Selection**

- Select items until capacity filled - Start with must-have items - Fill remaining capacity with nice-to-haves - Leave 10-20% buffer

**Strategy B: Goal-Based Selection**

- Select items needed to achieve sprint goal - May result in lower or higher utilization - Focus on goal achievement over point maximization

**Strategy C: Theme-Based Selection**

- Group related items by theme or feature - Select complete feature sets when possible - Avoids partial implementation

1. **Handle Edge Cases**

**If capacity allows one more item:**

- Look for small items (1-3 points) - Consider bug fixes or tech debt - Don't force fit a large item - OK to have some unused capacity

**If item is too large:**

- Break down into smaller stories - Select most valuable portion - Defer rest to next sprint - Create sub-tasks if breakdown not possible

**If item has dependencies:**

- Check if dependency will be met in sprint - Plan coordination with other teams - Consider deferring if too risky - Add as sprint risk

1. **Finalize Sprint Backlog**

- Review complete list of selected items - Confirm alignment with sprint goal - Verify total points vs. capacity - Check for balanced mix of work - Get team commitment - Get Product Owner acceptance

**Sprint Backlog Composition:**

``` Sprint Capacity: 50 points Buffer (20%): 10 points Target Commitment: 40 points

Selected Items:

- Story 101: User login (8 pts) - P0
- Story 102: Password reset (5 pts) - P0
- Story 103: Profile page (13 pts) - P1
- Story 104: Email verification (5 pts) - P1
- Story 105: Remember me (3 pts) - P2
- Story 106: Login history (5 pts) - P2

Total: 39 points

Sprint Goal: "Enable secure user authentication with self-service password management" ```

---

### 5.4 Task Breakdown

**Owner:** Development Team
**Duration:** 1-2 hours (part of planning)

#### Process Steps:

1. **Understand Task Granularity**

- Tasks should be: - Small enough to complete in 1-2 days - Assignable to one person - Measurable (done or not done) - Technical/implementation focused - Tasks are more detailed than stories - Tasks help team organize daily work

1. **Identify Task Categories**

**Development Tasks:**

- Frontend implementation - Backend/API implementation - Database changes - Business logic - Integration code

**Testing Tasks:**

- Unit test creation - Integration test creation - E2E test creation - Manual test execution - Test data preparation

**Quality Tasks:**

- Code review - Static analysis fixes - Performance testing - Security review

**DevOps Tasks:**

- CI/CD pipeline updates - Infrastructure changes - Configuration management - Deployment scripts

**Documentation Tasks:**

- Code documentation - API documentation - User documentation - Runbook updates

1. **Create Tasks for Each Story**

**Example Task Breakdown:**

``` User Story: As a user, I can reset my forgotten password

Development Tasks: - Create password reset request API endpoint - Implement password reset token generation - Create password reset form UI - Implement new password submission API - Add password validation logic

Testing Tasks: - Write unit tests for token generation - Write integration tests for reset flow - Create E2E test for full workflow - Test password validation rules

Other Tasks: - Update API documentation - Add security review for token handling - Deploy password reset email template - Update user help documentation ```

1. **Estimate Tasks (Optional)**

- Estimate in hours (0.5, 1, 2, 4, 8, 16) - Tasks >8 hours should be broken down further - Sum of task hours should roughly match story points - Use for daily capacity planning

1. **Initial Task Assignment**

- Assign tasks to team members (optional) - Consider skills and expertise - Balance workload across team - Allow for self-assignment during sprint - Some teams defer assignment to daily standup

1. **Create Tasks in Azure DevOps or Jira**

- Create task work items linked to stories - Set task state to "To Do" - Add task descriptions - Set estimated hours if using - Assign if decided - Use task board for tracking

**Task Breakdown Best Practices:**

- Break down enough to see daily progress
- Don't over-engineer task breakdown
- Technical team creates technical tasks
- Include all work types (dev, test, doc, etc.)
- Update tasks during sprint as needed
- Use tasks to identify blockers early

---

### 5.5 Commitment Confirmation

**Owner:** Scrum Master facilitates, Team commits
**Duration:** 15-30 minutes (end of planning)

#### Process Steps:

1. **Review Sprint Plan**

- Scrum Master summarizes: - Sprint goal - Selected work items and total points - Team capacity - Known risks and dependencies - Key milestones or demos - Display sprint backlog visually - Confirm everyone understands

1. **Team Self-Assessment**

- Team discusses confidence level: - Do we understand all items? - Is scope achievable? - Do we have necessary skills? - Are dependencies manageable? - Any concerns or risks? - Use "fist of five" voting: - 5 fingers: Highly confident - 4 fingers: Confident - 3 fingers: Somewhat confident - 2 fingers: Concerned - 1 finger: Very concerned - 0 fingers (fist): Cannot commit - Discuss concerns if votes <3

1. **Adjust if Needed**

- If team lacks confidence: - Remove lowest priority items - Defer risky items to next sprint - Create spikes for unknowns - Request additional support - Clarify requirements further - Re-vote after adjustments

1. **Obtain Team Commitment**

- Team states commitment: - "We commit to the sprint goal" - "We will deliver these items to the best of our ability" - "We will work collaboratively to achieve our goal" - Commitment is not a guarantee - Commitment means team will do their best - Team owns the sprint backlog

1. **Product Owner Acceptance**

- Product Owner confirms: - Sprint goal aligns with product vision - Selected items are priority - Scope is acceptable - Dependencies are understood - PO commits to: - Being available for questions - Not changing scope mid-sprint - Supporting team with decisions

1. **Communicate Sprint Plan**

- Scrum Master communicates to stakeholders: - Sprint goal and objectives - Key deliverables expected - Demo date and time - Any dependencies needing support - Update project dashboard - Send sprint kickoff email - Post in team channels

**Sprint Commitment Template:**

``` Sprint: Sprint 15 (Feb 1-14, 2026)

Sprint Goal: "Enable secure user authentication with self-service password management"

Team Commitment:

- 8 user stories, 39 story points
- Achieve sprint goal
- Deliver shippable increment
- Follow Definition of Done

Team Capacity:

- 5 team members
- 50 points capacity
- 39 points committed (78% utilization)

Known Risks:

- External email service integration (mitigation: mock service for testing)
- New team member onboarding (mitigation: pair programming)

Dependencies:

- Email template approval by Marketing (due Feb 5)

Stakeholders:

- Product Owner: Available daily
- Architecture: Available for design review
- Security: Scheduled review Feb 10

Demo: February 14, 2026 at 2:00 PM ```

**Commitment Anti-patterns to Avoid:**

- ❌ Product Owner commits on behalf of team
- ❌ Management pressures team to commit to more
- ❌ Team commits without confidence
- ❌ Commitment treated as fixed contract
- ❌ No adjustment when new information emerges
- ❌ Individual commitments instead of team commitment

---

## Outputs

| Output | Destination | Description |
| --- | --- | --- |
| Sprint Backlog | Step 6 | Committed sprint work items |
| Sprint Goal | Development Team | Defined sprint objective |
| Task Breakdown | Development Team | Detailed tasks for work items |

---

## Quality Gates / Exit Criteria

- [ ] Sprint goal defined
- [ ] Work items selected within capacity
- [ ] All selected items meet Definition of Ready
- [ ] Tasks created for work items
- [ ] Team commitment obtained

---

## AI/Automation Augmentation

| Capability | Tool/Service | Description |
| --- | --- | --- |
| Resource/Timeline Suggester | WorkItem Intelligence | AI-assisted capacity and timeline suggestions |

---

## Observability & Metrics

| Reference | Type | Description |
| --- | --- | --- |
| DK6 | Document Output | Sprints |
| D2 | DORA | Count of Deploys/Period |

---

## Related Artefacts

- Sprint Planning Template
- Sprint Goal Template
- Capacity Planning Worksheet

---

## RACI Matrix

| Role | Responsibility |
| --- | --- |
| **Responsible** | Scrum Master, Development Team |
| **Accountable** | Product Owner |
| **Consulted** | Architecture, SRE |
| **Informed** | Project Management, Stakeholders |

---

## Related Steps

- **Upstream:** Step 4: Work Item Integration
- **Downstream:** Step 6: Sprint Definition

---

## Revision History

| Version | Date | Author | Changes |
| --- | --- | --- | --- |
| 1 | 2026-03-25 | Simon Armstrong | Initial draft |

---

## Navigation

|
 |