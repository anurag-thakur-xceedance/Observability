# Step C: Project Initiation

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | C |
| **Phase** | Project & Opportunity Preliminary |
| **Previous Step** | Step B: Concept to Project |
| **Next Step** | Step D: Project Team Initialise Planning |
| **Responsible Role(s)** | Project Management, Product Owner |
| **Tools** | Azure DevOps or Jira, Project Management Tools |

---

## Purpose

Formal project initiation establishes the project infrastructure, team formation, and initial planning artefacts. This step bridges the gap between strategic approval and operational execution.

---

## Inputs

| Input | Source | Description |
| --- | --- | --- |
| Finalised Project Charter | Step B | Approved project charter |
| Stakeholder Register | Step B | Identified stakeholders |
| Governance Framework | Step B | Decision-making structure |
| High-Level Scope | Step B | Initial scope boundaries |

---

## Activities

### C.1 Project Team Formation

**Owner:** Project Management / Resource Management  
**Duration:** 3-5 business days

#### Process Steps:

1. **Core Team Role Definition**
   - **Product Owner**
     - Responsibilities: Backlog management, requirement prioritization, business decisions
     - Required skills: Business domain knowledge, stakeholder management, decision-making
     - Time commitment: 50-100% depending on project size
   - **Scrum Master / Project Manager**
     - Responsibilities: Process facilitation, impediment removal, team coaching
     - Required skills: Agile methodologies, facilitation, conflict resolution
     - Time commitment: 50-100%
   - **Lead Architect**
     - Responsibilities: Technical strategy, architecture design, technology decisions
     - Required skills: Enterprise architecture, technology expertise, design patterns
     - Time commitment: 25-50%
   - **Development Lead**
     - Responsibilities: Team leadership, code quality, technical implementation
     - Required skills: Software development, leadership, code review
     - Time commitment: 100%
   - **QA Lead**
     - Responsibilities: Test strategy, quality assurance, defect management
     - Required skills: Testing methodologies, automation, quality frameworks
     - Time commitment: 50-100%
   - **DevOps/SRE Lead**
     - Responsibilities: CI/CD, infrastructure, deployment, monitoring
     - Required skills: Cloud platforms, automation, SRE practices
     - Time commitment: 25-50%
   - **Security Lead**
     - Responsibilities: Security requirements, threat modeling, compliance
     - Required skills: Application security, compliance frameworks, risk assessment
     - Time commitment: 10-25%
2. **Extended Team Identification**
   - **Development Team Members:** Full-stack, frontend, backend developers
   - **QA Engineers:** Manual testers, automation engineers
   - **Business Analysts:** Requirements analysis, documentation
   - **UX/UI Designers:** User experience and interface design
   - **Data Engineers:** Data architecture and ETL (if applicable)
   - **Technical Writers:** Documentation specialists
   - **Subject Matter Experts:** Domain experts for consultation
3. **Resource Assignment**
   - Match required skills with available resources
   - Confirm availability and allocation percentages
   - Identify skill gaps requiring hiring or training
   - Consider co-location vs. distributed team setup
   - Arrange for external resources or contractors if needed
   - Obtain management approval for resource assignments
4. **Team Onboarding**
   - Conduct project kick-off meeting
   - Share project charter and objectives
   - Clarify roles and responsibilities (RACI)
   - Establish team working agreements
   - Set up communication channels (Teams, Slack, email lists)
   - Provide access to project tools and systems
   - Schedule initial team building activities

**Team Charter Elements:**

- Team mission and objectives
- Core values and principles
- Roles and responsibilities
- Communication protocols
- Decision-making process
- Conflict resolution approach
- Working hours and availability expectations
- Team norms and working agreements

---

### C.2 Azure DevOps or Jira Project Setup

**Owner:** DevOps Lead / Scrum Master  
**Duration:** 2-3 business days

#### Process Steps:

1. **Project Creation**
   - Create new Azure DevOps or Jira project
   - Select appropriate process template (Agile, Scrum, CMMI)
   - Configure project visibility (private/public)
   - Set up project description and metadata
2. **Team Configuration**
   - Create project teams and sub-teams if needed
   - Add team members with appropriate permissions:
     - **Project Administrators:** Full access
     - **Contributors:** Standard development access
     - **Stakeholders:** Read-only access for business users
     - **Readers:** View-only access
   - Configure team areas and iteration paths
   - Set up team capacity and working days
3. **Repository Setup**
   - Create Git repositories for code
   - Define branching strategy:
     - **GitFlow:** main, develop, feature/\*, release/\*, hotfix/\*
     - **Trunk-Based:** main, short-lived feature branches
     - **Release Flow:** main, release branches
   - Configure branch policies:
     - Require pull requests for main/develop
     - Minimum number of reviewers
     - Require work item linking
     - Require build validation
     - Require comment resolution
   - Set up branch permissions
   - Initialize repository with:
     - README.md
     - .gitignore
     - LICENSE
     - Initial project structure
4. **Work Item Configuration**
   - Configure work item types (Epic, Feature, User Story, Task, Bug)
   - Customize work item fields if needed
   - Set up work item states and transitions
   - Create custom work item queries
   - Configure work item templates
   - Set up area paths for organizing work
   - Define iteration/sprint paths (current + next 3-6 sprints)
5. **Board and Backlog Configuration**
   - Configure Kanban boards
   - Set up swimlanes and columns
   - Define WIP (Work in Progress) limits
   - Configure board card fields and styles
   - Set up portfolio backlogs (Epics, Features)
   - Configure backlog levels and ordering
6. **Pipeline Setup (Initial)**
   - Create initial build pipeline skeleton
   - Configure pipeline triggers (CI/CD)
   - Set up service connections (Azure, GitHub, etc.)
   - Configure pipeline permissions
   - Set up variable groups for environment configs
   - Configure pipeline notifications
7. **Security and Permissions**
   - Review and adjust default permissions
   - Set up security groups:
     - Developers
     - Testers
     - Stakeholders
     - Administrators
   - Configure repository security
   - Set up pipeline permissions
   - Configure secrets management (Azure Key Vault)
8. **Integrations and Extensions**
   - Install required extensions:
     - Test management extensions
     - Reporting extensions
     - Integration extensions (Slack, Teams)
   - Configure service hooks:
     - Notifications to Teams/Slack
     - Integration with monitoring tools
     - Webhook configurations
   - Set up Azure Boards integration with work tracking tools

**Azure DevOps or Jira Setup Checklist:**

- ✓ Project created with appropriate template
- ✓ Teams configured with members and permissions
- ✓ Git repository initialized with branching strategy
- ✓ Branch policies configured
- ✓ Work item types and fields configured
- ✓ Area and iteration paths defined
- ✓ Boards and backlogs configured
- ✓ Initial pipeline created
- ✓ Security groups and permissions set
- ✓ Required extensions installed
- ✓ Service hooks and integrations configured
- ✓ Team wiki initialized

---

### C.3 Initial Backlog Creation

**Owner:** Product Owner / Business Analyst  
**Duration:** 5-7 business days

#### Process Steps:

1. **Epic Level Planning**
   - Create high-level Epics representing major capabilities or themes
   - Define Epic objectives and business value
   - Estimate Epic size (T-shirt sizing: XS, S, M, L, XL)
   - Prioritize Epics based on business value and dependencies
   - Map Epics to project phases or releases
2. **Feature Decomposition**
   - Break down each Epic into Features
   - Define Feature descriptions and acceptance criteria
   - Estimate Feature size (story points or T-shirt sizing)
   - Identify dependencies between Features
   - Prioritize Features within each Epic
3. **User Story Creation**
   - Decompose Features into User Stories
   - Use user story format: "As a [user role], I want [goal] so that [benefit]"
   - Define acceptance criteria for each story (Given/When/Then format)
   - Ensure stories follow INVEST principles:
     - **I**ndependent: Minimize dependencies
     - **N**egotiable: Details can be discussed
     - **V**aluable: Delivers value to users/business
     - **E**stimable: Can be estimated by team
     - **S**mall: Can be completed in one sprint
     - **T**estable: Clear acceptance criteria
   - Add priority, business value, and risk indicators
4. **Technical Enablers and Spikes**
   - Identify architectural work (Technical Enablers)
   - Create spike stories for research/investigation
   - Include infrastructure and DevOps stories
   - Add security and compliance work items
   - Include technical debt and refactoring items
5. **Initial Estimation**
   - Conduct planning poker or other estimation session
   - Assign story points to User Stories
   - Use relative sizing (Fibonacci: 1, 2, 3, 5, 8, 13, 21)
   - Establish team velocity baseline (start with capacity-based estimate)
   - Identify stories needing refinement
6. **Backlog Organization**
   - Order backlog by priority (business value, risk, dependencies)
   - Group related stories for cohesive sprints
   - Ensure top priority items are detailed and ready
   - Mark items as "Ready for Sprint" or "Needs Refinement"
   - Tag items with themes, components, or technical areas

**Initial Backlog Structure:**

textEpic: User Management
├── Feature: User Registration
│ ├── Story: As a new user, I want to register with email
│ ├── Story: As a user, I want to verify my email address
│ └── Story: As an admin, I want to approve new registrations
├── Feature: User Authentication
│ ├── Story: As a user, I want to log in with email/password
│ ├── Story: As a user, I want to reset my forgotten password
│ └── Spike: Research OAuth integration options
└── Feature: User Profile Management
├── Story: As a user, I want to update my profile information
└── Story: As a user, I want to upload a profile picture

**Backlog Health Indicators:**

- Sufficient stories for next 2-3 sprints
- Stories properly estimated
- Acceptance criteria defined
- Dependencies identified
- Technical debt items included
- Non-functional requirements captured

---

### C.4 Communication Plan Development

**Owner:** Project Manager / Scrum Master  
**Duration:** 2-3 business days

#### Process Steps:

1. **Stakeholder Communication Needs Analysis**
   - Review stakeholder register from Step B
   - Identify information needs for each stakeholder group:
     - Executives: High-level status, risks, decisions needed
     - Business stakeholders: Progress, demos, UAT planning
     - Team members: Daily coordination, impediments, technical decisions
     - Customers/End users: Release updates, feature availability
   - Determine preferred communication channels per stakeholder
2. **Communication Channel Definition**
   - **Synchronous Channels:**
     - **Daily Stand-up:** Team coordination (15 min daily)
     - **Sprint Planning:** Sprint scope and commitment (2-4 hours)
     - **Sprint Review:** Demo and feedback (1-2 hours)
     - **Sprint Retrospective:** Process improvement (1-2 hours)
     - **Backlog Refinement:** Story clarification (ongoing)
     - **Technical Design Reviews:** Architecture decisions (as needed)
     - **Steering Committee Meetings:** Executive updates (monthly)
   - **Asynchronous Channels:**
     - **Email:** Formal communication, decision records
     - **Teams/Slack:** Quick questions, informal coordination
     - **Azure Boards:** Work tracking and status
     - **Wiki/Confluence:** Documentation and knowledge base
     - **Status Reports:** Weekly/bi-weekly progress updates
     - **Dashboards:** Real-time metrics and KPIs
3. **Meeting Cadence and Schedule**
   - **Daily:**
     - Daily stand-up (15 minutes, all team members)
   - **Weekly:**
     - Backlog refinement (1-2 hours, PO + team subset)
     - Status report distribution
     - Office hours for stakeholder questions
   - **Bi-weekly (Sprint Cadence):**
     - Sprint Planning (at sprint start)
     - Sprint Review (at sprint end)
     - Sprint Retrospective (at sprint end)
   - **Monthly:**
     - Steering committee meeting
     - Architecture review board
     - Risk review
   - **Quarterly:**
     - Program increment planning (if SAFe)
     - Major milestone reviews
4. **Communication Protocols**
   - **Response Time Expectations:**
     - Critical issues: Within 1 hour
     - High priority: Within 4 hours
     - Normal: Within 24 hours
   - **Escalation Process:**
     - Team member → Scrum Master → Product Owner → Project Board → Steering Committee
   - **Decision Communication:**
     - Document all decisions in Azure DevOps or Jira wiki
     - Communicate decisions via email with decision record
   - **Status Reporting:**
     - Weekly status to project board
     - Monthly status to steering committee
     - Include: Progress, accomplishments, upcoming work, risks/issues, decisions needed
5. **Reporting Templates**
   - Status report template
   - Risk report template
   - Change request template
   - Issue escalation template
   - Decision record template

**Communication Matrix:**

| Stakeholder | Information Need | Method | Frequency | Owner |
| --- | --- | --- | --- | --- |
| Steering Committee | High-level status, risks | Meeting + Report | Monthly | PM |
| Project Board | Detailed progress, issues | Meeting + Dashboard | Bi-weekly | PM |
| Business Stakeholders | Feature demos, UAT | Sprint Review | Bi-weekly | PO |
| Development Team | Coordination, blockers | Stand-up + Chat | Daily | SM |
| End Users | Release updates | Email + Portal | Per release | PO |

---

### C.5 Risk Register Initialisation

**Owner:** Project Manager / Risk Manager  
**Duration:** 2-3 business days

#### Process Steps:

1. **Risk Register Setup**
   - Create risk tracking system (Azure DevOps or Jira, Excel, dedicated tool)
   - Define risk categories:
     - **Technical:** Architecture, technology, integration, performance
     - **Resource:** Availability, skills, turnover
     - **Schedule:** Dependencies, delays, scope creep
     - **Budget:** Cost overruns, funding issues
     - **External:** Vendor, regulatory, market
     - **Organizational:** Change resistance, priorities, politics
2. **Initial Risk Identification**
   - Transfer risks from Step A preliminary assessment
   - Conduct team risk identification workshop
   - Review lessons learned from similar projects
   - Consider risks across project lifecycle:
     - **Planning Risks:** Requirements volatility, unclear scope
     - **Design Risks:** Technology choices, scalability, security
     - **Development Risks:** Code quality, technical debt, resource availability
     - **Testing Risks:** Test coverage, defect rates, time constraints
     - **Deployment Risks:** Environment issues, data migration, rollback
     - **Operational Risks:** Performance, availability, support readiness
3. **Risk Assessment**
   - **Probability Assessment:**
     - High (>50%): Likely to occur
     - Medium (20-50%): May occur
     - Low (<20%): Unlikely to occur
   - **Impact Assessment:**
     - High: Significant impact on schedule, budget, or quality
     - Medium: Moderate impact, can be managed
     - Low: Minimal impact
   - **Risk Score:** Probability × Impact (9=Critical, 6=High, 4=Medium, 1-2=Low)
   - **Risk Urgency:** When risk may occur (immediate, short-term, long-term)
4. **Risk Response Planning**
   - For each high/critical risk, define response strategy:
     - **Avoid:** Change project plan to eliminate risk
     - **Mitigate:** Take action to reduce probability or impact
     - **Transfer:** Shift risk to third party (insurance, contract)
     - **Accept:** Acknowledge risk and plan contingency if occurs
   - Define specific mitigation actions with:
     - Action description
     - Responsible owner
     - Target completion date
     - Resources required
     - Success criteria
5. **Risk Monitoring Process**
   - Schedule regular risk reviews (weekly/bi-weekly)
   - Define risk triggers and warning signs
   - Establish risk escalation criteria
   - Assign risk owners for monitoring
   - Create risk dashboard for visibility

**Risk Register Template:**

| ID | Category | Description | Probability | Impact | Score | Response Strategy | Mitigation Actions | Owner | Status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| R-001 | Technical | Cloud service availability | M | H | 6 | Mitigate | Implement multi-region deployment | DevOps Lead | Open |
| R-002 | Resource | Key developer may leave | L | H | 4 | Transfer | Cross-training, documentation | Dev Lead | Open |
| R-003 | Schedule | Third-party API delay | H | M | 6 | Avoid | Develop mock API for parallel work | Architect | Open |

**Risk Monitoring Dashboard:**

- Total risks by category
- Total risks by severity
- Open vs. closed risks trend
- Risks by status (Open, In Progress, Mitigated, Accepted)
- Top 5 risks requiring immediate attention
- Risk velocity (new risks vs. closed risks)

---

## Outputs

| Output | Destination | Description |
| --- | --- | --- |
| Formed Project Team | Step D | Team with assigned roles |
| Azure DevOps or Jira Project | All Steps | Configured project workspace |
| Initial Product Backlog | Step D | High-level backlog items |
| Communication Plan | Project Team | Communication framework |
| Risk Register | Project Management | Initial risks identified |

---

## Quality Gates / Exit Criteria

- ✓ Project team formed with clear roles
- ✓ Azure DevOps or Jira project created and configured
- ✓ Initial product backlog created
- ✓ Communication plan established
- ✓ Risk register initialised

---

## AI/Automation Augmentation

| Capability | Tool/Service | Description |
| --- | --- | --- |
| MCP Server - ADO | Work Item Integration | Automated work item creation and management |

---

## Observability & Metrics

| Reference | Type | Description |
| --- | --- | --- |
| R1 | Reporting | ADO Dashboards setup |
| O1 | Observability | Initial observability configuration |

---

## Related Artefacts

- Azure DevOps or Jira Project Template
- Product Backlog Template
- Communication Plan Template
- Risk Register Template

---

## RACI Matrix

| Role | Responsibility |
| --- | --- |
| **Responsible** | Project Management |
| **Accountable** | Product Owner |
| **Consulted** | Architecture, SRE, Development Lead |
| **Informed** | Business Leadership, Stakeholders |

---

## Navigation

|  |