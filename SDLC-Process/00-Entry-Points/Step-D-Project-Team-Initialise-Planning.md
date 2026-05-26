# Step D: Project Team Initialise Planning

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | D |
| **Phase** | Project & Opportunity Preliminary |
| **Previous Step** | Step C: Project Initiation |
| **Next Step** | Step 1: Sprint & Release Planning |
| **Responsible Role(s)** | Agile Team, Scrum Master, Product Owner |
| **Tools** | Azure DevOps or Jira |

---

## Purpose

The project team begins the formal planning process, establishing sprint cadence, refining the initial backlog, and preparing for the first sprint. This step transitions from project setup to active development planning.

---

## Inputs

| Input | Source | Description |
| --- | --- | --- |
| Formed Project Team | Step C | Team with assigned roles |
| Azure DevOps or Jira Project | Step C | Configured project workspace |
| Initial Product Backlog | Step C | High-level backlog items |
| Project Charter | Step B | Approved project charter |

---

## Activities

### D.1 Sprint Cadence Definition

**Owner:** Scrum Master / Agile Team  
**Duration:** 1-2 business days

#### Process Steps:

1. **Sprint Length Selection**

   - Evaluate project characteristics:

     - **1-week sprints:** Fast-paced, frequent releases, stable requirements
     - **2-week sprints:** RECOMMENDED - Balanced planning and delivery
     - **3-week sprints:** Complex features, longer testing cycles
     - **4-week sprints:** Less common, longer feedback cycles
   - Consider team capacity and availability
   - Assess release frequency requirements
   - Evaluate stakeholder availability for reviews
   - **Industry Best Practice:** 2-week sprints provide optimal balance
2. **Sprint Start Day and Time**

   - Select consistent day of week (commonly Monday or Tuesday)
   - Choose start time (typically morning to align with planning)
   - Consider team member time zones for distributed teams
   - Avoid company holidays and common PTO periods
   - Ensure consistency for stakeholder planning
3. **Sprint Ceremonies Schedule**

   - **Sprint Planning**

     - When: First day of sprint
     - Duration: 2-4 hours (2-week sprint)
     - Attendees: Full team, Product Owner, Scrum Master
     - Purpose: Select and commit to sprint backlog
   - **Daily Stand-up**

     - When: Every workday, same time
     - Duration: 15 minutes (timeboxed)
     - Attendees: Development team, Scrum Master, PO (optional)
     - Purpose: Synchronize work and identify impediments
     - Format: What I did yesterday, what I'll do today, any blockers
   - **Sprint Review**

     - When: Last day of sprint (afternoon)
     - Duration: 1-2 hours
     - Attendees: Team, PO, stakeholders
     - Purpose: Demo completed work, gather feedback
   - **Sprint Retrospective**

     - When: Last day of sprint (after review)
     - Duration: 1-1.5 hours
     - Attendees: Team, Scrum Master, PO (optional)
     - Purpose: Inspect and adapt team processes
   - **Backlog Refinement**

     - When: Mid-sprint (ongoing activity)
     - Duration: 1-2 hours per week
     - Attendees: PO, subset of team, SMEs as needed
     - Purpose: Prepare stories for upcoming sprints
4. **Calendar Setup**

   - Create recurring calendar invites for all ceremonies
   - Block team calendars for sprint ceremonies
   - Set up ceremony room bookings (if in-person)
   - Configure virtual meeting links (Teams/Zoom)
   - Add ceremonies to project wiki/documentation
5. **Working Agreements for Ceremonies**

   - Start and end on time (timeboxed)
   - Required vs. optional attendance
   - Preparation requirements (e.g., review stories before planning)
   - Device/distraction policy (laptops closed during stand-up)
   - Decision-making process during ceremonies
   - How to handle remote participants

**Sprint Ceremony Calendar (2-Week Sprint Example):**

textwide1800Week 1:
Monday 9:00-11:00 AM - Sprint Planning
Mon-Fri 9:30-9:45 AM - Daily Stand-up
Wednesday 2:00-3:00 PM - Backlog Refinement
Week 2:
Mon-Thu 9:30-9:45 AM - Daily Stand-up
Wednesday 2:00-3:00 PM - Backlog Refinement
Friday 2:00-3:30 PM - Sprint Review
Friday 3:45-5:00 PM - Sprint Retrospective

---

### D.2 Backlog Refinement

**Owner:** Product Owner with Team  
**Duration:** Ongoing (1-2 sessions to prepare initial sprint)

#### Process Steps:

1. **Story Readiness Assessment**

   - Review stories in priority order
   - Assess each story against "Definition of Ready" (see D.4)
   - Identify stories needing more information
   - Mark stories as "Ready" or "Needs Refinement"
2. **Story Decomposition**

   - Break down large stories (>13 points) into smaller stories
   - Ensure stories fit within one sprint
   - Create tasks or sub-tasks as needed
   - Maintain story independence where possible
3. **Acceptance Criteria Review**

   - Review and refine acceptance criteria
   - Use Given/When/Then format:

     - Given [precondition]
     - When [action]
     - Then [expected outcome]
   - Add negative test cases (error conditions)
   - Include non-functional criteria (performance, security)
   - Ensure criteria are testable and measurable
4. **Story Estimation**

   - Conduct Planning Poker sessions:

     - Read story and acceptance criteria
     - Clarify questions
     - Each team member selects estimate privately
     - Reveal estimates simultaneously
     - Discuss discrepancies (highest and lowest explain)
     - Re-estimate until consensus
   - Use Fibonacci sequence: 1, 2, 3, 5, 8, 13, 21
   - Stories >13 points should be broken down
   - Base estimates on team capacity (1 point = ~0.5 day of work)
5. **Dependency Identification**

   - Identify dependencies between stories
   - Document external dependencies (vendors, other teams)
   - Flag technical dependencies (infrastructure, data, APIs)
   - Plan to minimize or resolve dependencies
   - Link dependent work items in Azure DevOps or Jira
6. **Technical Discussion**

   - Discuss technical approach for complex stories
   - Identify need for spikes or prototypes
   - Raise architecture or design concerns
   - Consider reuse of existing components
   - Discuss testing strategy
7. **Priority Adjustment**

   - Re-evaluate priority based on new information
   - Consider business value, risk, dependencies
   - Ensure highest priority items are sprint-ready
   - Group related stories for efficient sprints

**Planning Poker Tips:**

- Use consistent reference stories for calibration
- Include all team members in estimation
- Focus on relative sizing, not absolute time
- Consider complexity, effort, and uncertainty
- Re-estimate stories after learning more

**Story Refinement Checklist:**

- ✓ Story follows user story format (As a... I want... So that...)
- ✓ Business value is clear
- ✓ Acceptance criteria defined (Given/When/Then)
- ✓ Story estimated with team consensus
- ✓ Story size ≤13 points
- ✓ Dependencies identified and linked
- ✓ Technical approach discussed
- ✓ Test strategy considered
- ✓ Story marked as "Ready for Sprint"

---

### D.3 Definition of Done (DoD) Creation

**Owner:** Agile Team (collaborative)  
**Duration:** 1 business day (workshop)

#### Process Steps:

1. **Define Story-Level DoD**

   - **Code Complete:**

     - ✓ Code written and follows coding standards
     - ✓ Code peer reviewed and approved
     - ✓ No critical or high priority static analysis issues
     - ✓ Code committed to feature branch
   - **Testing Complete:**

     - ✓ Unit tests written with >80% code coverage
     - ✓ All unit tests passing
     - ✓ Integration tests passing
     - ✓ Acceptance criteria validated
     - ✓ Manual testing completed (if applicable)
     - ✓ No open defects for the story
   - **Security & Quality:**

     - ✓ SAST scan completed with no critical issues
     - ✓ Secrets scan passed
     - ✓ Code quality metrics met (SonarQube gates)
     - ✓ Dependency vulnerabilities addressed
   - **Documentation:**

     - ✓ Code comments added for complex logic
     - ✓ README updated if needed
     - ✓ API documentation updated (Swagger/OpenAPI)
     - ✓ Inline documentation for public methods
   - **Integration:**

     - ✓ Code merged to develop/main branch
     - ✓ Build pipeline successful
     - ✓ Deployment to dev environment successful
     - ✓ No regression issues introduced
2. **Define Sprint-Level DoD**

   - ✓ All story-level DoD criteria met for all stories
   - ✓ Sprint review conducted with stakeholder acceptance
   - ✓ Regression testing completed
   - ✓ Release notes drafted
   - ✓ Deployed to staging/QA environment
   - ✓ Performance testing completed (if applicable)
   - ✓ Documentation updated in wiki
   - ✓ Demo recording created (optional)
3. **Define Release-Level DoD**

   - ✓ All sprint DoD criteria met
   - ✓ Full regression test suite passed
   - ✓ UAT completed and signed off
   - ✓ Performance testing met SLAs
   - ✓ Security testing completed (pen test if required)
   - ✓ Disaster recovery tested
   - ✓ Production deployment plan reviewed
   - ✓ Rollback plan documented and tested
   - ✓ Monitoring and alerting configured
   - ✓ User documentation complete
   - ✓ Training materials prepared
   - ✓ Support team briefed
   - ✓ Go-live approval obtained
4. **DoD Documentation and Visibility**

   - Document DoD in team wiki
   - Post DoD in team area (physical or virtual)
   - Include DoD in Azure DevOps or Jira work item templates
   - Create DoD checklist in PR template
   - Review DoD in sprint retrospectives
5. **DoD Evolution**

   - Revisit DoD quarterly or as needed
   - Add new criteria based on lessons learned
   - Remove or adjust criteria that are not valuable
   - Ensure DoD remains achievable and meaningful

**Example Story DoD Checklist:**

markdownwide1800## Definition of Done
- [ ] Code reviewed and approved
- [ ] Unit tests passing (>80% coverage)
- [ ] Integration tests passing
- [ ] SAST scan clean
- [ ] No secrets in code
- [ ] Documentation updated
- [ ] Merged to main
- [ ] Deployed to dev
- [ ] Acceptance criteria met
- [ ] No open defects

---

### D.4 Definition of Ready (DoR) Creation

**Owner:** Product Owner with Team  
**Duration:** 1 business day (workshop)

#### Process Steps:

1. **Define Story Readiness Criteria**

   - **Story Structure:**

     - ✓ Written in user story format (As a... I want... So that...)
     - ✓ Clear and concise title
     - ✓ Describes WHO, WHAT, and WHY
     - ✓ Business value is articulated
   - **Acceptance Criteria:**

     - ✓ Acceptance criteria defined
     - ✓ Criteria in Given/When/Then format
     - ✓ Criteria are testable
     - ✓ Happy path scenarios covered
     - ✓ Error/edge cases considered
     - ✓ Non-functional requirements included (performance, security)
   - **Sizing and Estimation:**

     - ✓ Story estimated by team
     - ✓ Story points assigned
     - ✓ Story size ≤13 points
     - ✓ If >13 points, story decomposed into smaller stories
   - **Dependencies:**

     - ✓ Dependencies identified and documented
     - ✓ External dependencies resolved or planned
     - ✓ Technical prerequisites available
     - ✓ Required data or test data identified
   - **Design and Architecture:**

     - ✓ Technical approach discussed
     - ✓ Architecture impact assessed
     - ✓ UI/UX mockups available (if applicable)
     - ✓ API contracts defined (if applicable)
     - ✓ Database schema changes identified
   - **Additional Information:**

     - ✓ Related work items linked
     - ✓ Supporting documentation attached
     - ✓ Testing strategy discussed
     - ✓ Priority assigned
     - ✓ Assigned to appropriate sprint/iteration
2. **Define Epic/Feature Readiness Criteria**

   - ✓ Business objective clear
   - ✓ Success metrics defined
   - ✓ High-level scope documented
   - ✓ Dependencies at feature level identified
   - ✓ Rough effort estimate (T-shirt size)
   - ✓ Stakeholders identified
   - ✓ Priority established
3. **DoR Enforcement Process**

   - Stories not meeting DoR cannot be pulled into sprint
   - Product Owner responsible for ensuring DoR before planning
   - Team can reject stories not meeting DoR during planning
   - Backlog refinement sessions focus on getting stories to Ready
   - Track % of backlog that is "Ready" (target: 2 sprints worth)
4. **DoR Documentation and Training**

   - Document DoR in team wiki
   - Include DoR in story template
   - Train Product Owner and team on DoR
   - Create DoR checklist for story creation
   - Review DoR compliance in retrospectives

**Ready vs. Not Ready Example:**

**Not Ready:**

textwide1800Title: User Login
Description: Users should be able to login

**Ready:**

textwide1800Title: As a registered user, I can login with email and password
Description:
As a registered user
I want to login with my email and password
So that I can access my account and personalized features
Acceptance Criteria:
Given I am on the login page
When I enter valid email and password
Then I am logged in and redirected to dashboard
Given I enter invalid credentials
When I click login
Then I see an error message "Invalid email or password"
Given I have forgotten my password
When I click "Forgot Password"
Then I am redirected to password reset flow
Non-Functional:
- Login must complete within 2 seconds
- Password must be hashed using bcrypt
- Rate limiting: max 5 attempts per 15 minutes
Estimate: 5 points
Dependencies: User registration story completed
Design: Mockup attached (login-page.png)

---

### D.5 Team Capacity Planning

**Owner:** Scrum Master with Team  
**Duration:** 1 business day

#### Process Steps:

1. **Individual Capacity Assessment**

   - Collect capacity information for each team member:

     - Working days in sprint
     - Planned time off (PTO, holidays)
     - Other commitments (meetings, support, other projects)
     - Available capacity per day (hours)
   - Calculate individual capacity:

     textIndividual Capacity = (Working Days - PTO) × Hours per Day × Focus Factor
     Focus Factor = 0.6-0.8 (accounts for meetings, interruptions, etc.)
     Example: (10 days - 1 day PTO) × 8 hours × 0.7 = 50.4 hours
2. **Team Capacity Calculation**

   - Sum all individual capacities
   - Account for team-level factors:

     - Sprint ceremonies (planning, review, retro, stand-ups)
     - Backlog refinement time
     - Team meetings and sync sessions
     - On-call or support duties
   - Calculate team capacity:

     textTeam Capacity = Sum of Individual Capacities - Ceremony Time
     Example for 2-week sprint with 5 team members:
     Individual capacities: 50 + 60 + 55 + 50 + 60 = 275 hours
     Ceremony time: 10 hours per person = 50 hours
     Net Team Capacity = 275 - 50 = 225 hours
3. **Velocity Baseline Estimation**

   - For new teams without history:

     - Convert capacity to story points
     - Use conservative conversion: 1 point ≈ 4-6 hours
     - Initial velocity estimate = Team Capacity / Hours per PointtextExample: 225 hours / 5 hours per point = 45 points
     Start conservatively at 70-80% = 32-36 points
   - For teams with history:

     - Review last 3-6 sprints velocity
     - Calculate average velocity
     - Adjust for team changes or known factors
4. **Capacity Allocation Planning**

   - Allocate capacity across work types:

     - **New feature development:** 60-70%
     - **Bug fixing:** 10-15%
     - **Technical debt:** 10-20%
     - **Support/maintenance:** 5-10%
   - Create capacity buffer:

     - Reserve 10-20% for unplanned work
     - Handles production issues, urgent bugs
     - Buffer for estimation errors
5. **Azure DevOps or Jira Capacity Configuration**

   - Set capacity for each team member in Azure DevOps or Jira
   - Configure days off and non-working days
   - Set activity-based capacity (Development, Testing, Design, etc.)
   - Use capacity planning view during sprint planning
   - Monitor capacity utilization during sprint
6. **Capacity Tracking and Adjustment**

   - Track actual vs. planned capacity usage
   - Monitor velocity trend over sprints
   - Adjust focus factor based on actuals
   - Refine estimates based on team learning
   - Update capacity for each sprint based on known changes

**Capacity Planning Template:**

| Team Member | Working Days | PTO | Available Days | Hours/Day | Focus Factor | Capacity (Hours) |
| --- | --- | --- | --- | --- | --- | --- |
| Developer 1 | 10 | 0 | 10 | 8 | 0.7 | 56 |
| Developer 2 | 10 | 1 | 9 | 8 | 0.7 | 50.4 |
| Developer 3 | 10 | 0 | 10 | 8 | 0.7 | 56 |
| Tester 1 | 10 | 2 | 8 | 8 | 0.7 | 44.8 |
| DevOps | 10 | 0 | 10 | 4 | 0.7 | 28 |
| **Total** |  |  |  |  |  | **235.2** |
| **Minus Ceremonies** |  |  |  |  |  | **-50** |
| **Net Capacity** |  |  |  |  |  | **185.2 hours** |

**Convert to Story Points:** 185.2 hours / 5 hours per point = ~37 points

**Capacity Best Practices:**

- Be conservative in initial sprints
- Build in buffer for unknowns
- Don't plan to 100% capacity
- Track actuals to refine estimates
- Adjust focus factor based on team maturity
- Account for team ramp-up time on new projects
- Consider skill distribution across work types

---

## Outputs

| Output | Destination | Description |
| --- | --- | --- |
| Sprint Cadence | Step 5 | Defined sprint length and ceremonies |
| Refined Backlog | Step 1 | Prioritised and estimated backlog |
| Definition of Done | All Development Steps | Team's DoD criteria |
| Definition of Ready | Step 5 | Criteria for sprint-ready items |
| Capacity Baseline | Step 8 | Team capacity information |

---

## Quality Gates / Exit Criteria

- ✓ Sprint cadence defined
- ✓ Initial backlog refined and prioritised
- ✓ Definition of Done agreed
- ✓ Definition of Ready established
- ✓ Team capacity assessed

---

## AI/Automation Augmentation

| Capability | Tool/Service | Description |
| --- | --- | --- |
| Resource/Timeline Suggester | WorkItem Intelligence | AI-assisted capacity and timeline suggestions |

---

## Observability & Metrics

| Reference | Type | Description |
| --- | --- | --- |
| R2 | Reporting | Power BI dashboards for planning |
| D2 | DORA | Count of Deploys/Period baseline |

---

## Related Artefacts

- Definition of Done Template
- Definition of Ready Template
- Sprint Ceremony Schedule Template
- Capacity Planning Worksheet

---

## RACI Matrix

| Role | Responsibility |
| --- | --- |
| **Responsible** | Scrum Master, Agile Team |
| **Accountable** | Product Owner |
| **Consulted** | Architecture, Development Lead |
| **Informed** | Project Management, Stakeholders |

---

## Navigation

Phase 00 - Entry Points | Step C: Project Initiation | [Step 01: Sprint & Release Planning](https://chainthat.atlassian.net/wiki/spaces/METH/pages/5918064686)