# Step 04: Work Item Integration

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 4 |
| **Phase** | Product Feedback & Discovery |
| **Previous Step** | Step 3: Architecture Artefact Store |
| **Next Step** | Step 5: Team Creates Sprint |
| **Responsible Role(s)** | MCP Server, Development Team |
| **Tools** | Azure DevOps or Jira, MCP Server - ADO |

---

## Purpose

Integration point where all work items are consolidated, linked, and prepared for sprint planning. The MCP Server - ADO facilitates automated work item management and ensures consistency across the backlog.

---

## Inputs

| Input | Source | Description |
| --- | --- | --- |
| Architecture Artefacts | Step 3 | Architecture documentation and decisions |
| Enhanced Work Items | Step 2 | AI-enhanced work items |
| Stakeholder Requirements | Step 1 | Requirements from stakeholders |
| Tech Debt Items | Development Team | Technical debt work items |
| Customer Feedback | Product Owner | Customer-driven items |

---

## Activities

### 4.1 Work Item Consolidation

**Owner:** MCP Server / Scrum Master
**Duration:** 1-2 business days

#### Process Steps:

1. **Gather Work Items from Multiple Sources**

- Collect work items from various channels: - **Product backlog:** From Steps 1-3 - **Customer feedback:** Support tickets, feature requests - **Technical debt:** From development team - **Bug reports:** From QA and production monitoring - **Compliance requirements:** From security/compliance team - **Architecture improvements:** From architecture reviews - **Operations improvements:** From SRE postmortems

1. **Standardize Work Item Format**

- Ensure all items follow consistent structure: - Use standard work item types (Epic, Feature, User Story, Task, Bug) - Apply consistent field population - Use standard title conventions - Format descriptions consistently - Apply standard tags and categories - Convert informal requests to proper work items - Migrate items from other systems if needed

1. **Deduplicate Work Items**

- Identify duplicate or overlapping items: - Search for similar titles or descriptions - Use AI/ML to detect semantic similarities - Group related items - Merge duplicates: - Consolidate information from all duplicates - Keep links to original sources - Retain all comments and attachments - Update stakeholder lists - Document merge decisions

1. **Categorize and Tag**

- Apply consistent categorization: - **Type:** Feature, Bug, Tech Debt, Spike, Chore - **Component:** UI, API, Database, Infrastructure - **Theme:** User Management, Reporting, Integration - **Priority:** P0 (Critical), P1 (High), P2 (Medium), P3 (Low) - **Risk:** High, Medium, Low - **Effort:** XS, S, M, L, XL (initial sizing) - Use Azure DevOps or Jira tags for flexible categorization - Create custom fields if needed

1. **Quality Validation**

- Check each work item for: - Complete required fields - Clear and concise descriptions - Actionable acceptance criteria - Appropriate work item type - Correct area and iteration path - Flag items needing more information - Return incomplete items for refinement

**Consolidation Metrics:**

- Total work items processed
- Duplicates identified and merged
- Items requiring refinement
- Items ready for planning
- Average quality score

---

### 4.2 Linking and Traceability

**Owner:** MCP Server / Business Analyst
**Duration:** 2-3 business days

#### Process Steps:

1. **Establish Hierarchical Links**

- Create parent-child relationships: ``` Epic (Business Capability) └── Feature (Customer-facing functionality) └── User Story (User need) └── Task (Implementation work) ``` - Use Azure DevOps or Jira link types: - **Parent/Child:** Hierarchy relationships - **Related:** Associated but not hierarchical - **Predecessor/Successor:** Sequence dependencies - **Tests/Tested By:** Link to test cases - Ensure every story has a parent feature - Ensure every feature has a parent epic (or is standalone)

1. **Link to Architecture Artefacts**

- Connect work items to relevant artefacts: - **ADRs:** Link items affected by architecture decisions - **Design Documents:** Link to relevant designs - **API Specifications:** Link API-related work - **Data Models:** Link data structure changes - **Context Diagrams:** Link to system diagrams - Use hyperlinks in work item descriptions - Create custom link types if needed - Maintain bidirectional traceability

1. **Link to Requirements**

- Trace work items to business requirements: - Business case documents - Market requirements documents (MRD) - Product requirements documents (PRD) - Use case documents - User research findings - Attach or link supporting documents - Reference requirement IDs in work items

1. **Dependency Linking**

- Document dependencies between work items: - **Blocks:** This item blocks another (must complete first) - **Blocked By:** This item is blocked by another - **Related:** Items should be completed together - Link dependencies from AI detection (Step 2.4) - Add dependency notes explaining relationship - Create dependency visualization/map

1. **Test Case Linking**

- Link work items to test cases: - Create test plan structure - Generate test cases from acceptance criteria - Link test cases to user stories - Use "Tests" relationship in Azure DevOps or Jira - Enable test coverage tracking - Support test traceability reporting

1. **External System Integration**

- Link to external systems: - **Support tickets:** Zendesk, ServiceNow - **Customer feedback:** UserVoice, Feedback tools - **Monitoring:** Application Insights, Datadog incidents - **Documentation:** Confluence, SharePoint - Use integration tools or custom links - Maintain external reference IDs

**Traceability Matrix:**

| Work Item | Type | Parent | Requirements | Architecture | Dependencies | Tests |
| --- | --- | --- | --- | --- | --- | --- |
| WI-101 | Epic | - | REQ-001 | ADR-005 | - | - |
| WI-102 | Feature | WI-101 | REQ-002 | HLD-User-Auth | - | - |
| WI-103 | Story | WI-102 | REQ-002.1 | API-Spec-v2 | WI-105 | TC-201, TC-202 |

---

### 4.3 Prioritisation Refinement

**Owner:** Product Owner with Team Input
**Duration:** 2-3 business days

#### Process Steps:

1. **Apply Prioritization Framework**

**Option A: RICE Scoring**

``` RICE Score = (Reach × Impact × Confidence) / Effort

Reach: How many users affected per time period (0-1000+) Impact: Impact per user (0.25=Minimal, 0.5=Low, 1=Medium, 2=High, 3=Massive) Confidence: How confident in estimates (50%=Low, 80%=Medium, 100%=High) Effort: Person-months required (0.5-10+) ```

**Option B: Value vs Effort Matrix**

``` High Value, Low Effort → P0 (Do First - Quick Wins) High Value, High Effort → P1 (Major Projects) Low Value, Low Effort → P2 (Fill-ins) Low Value, High Effort → P3 (Avoid - Time Sinks) ```

**Option C: Weighted Shortest Job First (WSJF)**

``` WSJF = Cost of Delay / Job Size

Cost of Delay = User/Business Value + Time Criticality + Risk Reduction Job Size = Estimated effort in story points ```

1. **Consider Multiple Factors**

- **Business Value:** - Revenue impact (increase or protection) - Cost reduction or avoidance - Market differentiation - Customer satisfaction - Strategic alignment - **Risk:** - Compliance or regulatory requirements - Security vulnerabilities - Technical debt accumulation - Competitive threats - **Dependencies:** - Prerequisite for other work - External commitments or deadlines - Resource availability - **Urgency:** - Time-sensitive opportunities - Market windows - Contractual obligations

1. **Stakeholder Priority Input**

- Gather priorities from stakeholders: - **Business Leadership:** Strategic priorities - **Product Management:** Product roadmap - **Sales/Marketing:** Customer commitments - **Customer Success:** Support and customer needs - **Engineering:** Technical debt and quality - **Security/Compliance:** Risk mitigation - Resolve conflicting priorities through discussion - Document priority decisions and rationale

1. **Balance Portfolio**

- Ensure balanced mix of work types: - **New features:** 60-70% (value generation) - **Bug fixes:** 10-15% (quality maintenance) - **Technical debt:** 10-20% (sustainability) - **Experiments/Spikes:** 5-10% (learning) - Balance short-term vs long-term value - Mix quick wins with strategic initiatives - Include team capacity for innovation

1. **Update Priority Rankings**

- Assign priority levels: - **P0 (Critical):** Must have, regulatory, critical bugs - **P1 (High):** High value, important features - **P2 (Medium):** Good to have, enhances value - **P3 (Low):** Nice to have, future consideration - Order backlog within each priority level - Update work item priority field - Add priority notes or justification

1. **Validate with Team**

- Review priorities with development team: - Technical feasibility of priority order - Dependency considerations - Resource and skill availability - Estimated effort validation - Adjust priorities based on technical input - Ensure team understands rationale

**Prioritization Output:**

- Rank-ordered backlog with priority labels
- Priority rationale documentation
- Stakeholder priority alignment record
- Portfolio balance analysis
- Priority change log

---

### 4.4 Estimation Review

**Owner:** Development Team
**Duration:** 2-3 business days

#### Process Steps:

1. **Review Existing Estimates**

- Check estimates from Step 1 and AI suggestions - Validate preliminary sizing (T-shirt sizes) - Identify items needing detailed estimation - Flag significantly under/over-estimated items

1. **Conduct Estimation Sessions**

**Planning Poker Process:**

- Gather team for estimation meeting - For each work item: 1. Product Owner reads story and acceptance criteria 2. Team asks clarifying questions 3. Each member privately selects estimate 4. Reveal estimates simultaneously 5. Discuss differences (especially outliers) 6. Re-estimate until consensus

**Estimation Guidelines:**

- Use Fibonacci sequence: 1, 2, 3, 5, 8, 13, 21 - Base estimates on story complexity, not hours - Consider: - Development effort - Testing effort - Code review time - Documentation - Uncertainty/risk - Stories >13 points should be broken down - Use reference stories for calibration

1. **Adjust for Risk and Uncertainty**

- Add uncertainty buffer: - Low uncertainty (known territory): No buffer - Medium uncertainty (some unknowns): +20-30% - High uncertainty (many unknowns): +50-100% or spike - For very uncertain items, create spike stories - Document assumptions in estimates

1. **Historical Velocity Calibration**

- Compare estimates to team velocity: - Review past sprint velocities - Calculate average velocity - Identify velocity trends - Adjust estimates based on team's historical accuracy - Factor in team changes or skill gaps

1. **Technical Complexity Assessment**

- Evaluate technical complexity: - **Simple (1-3 pts):** Well-understood, straight-forward - **Moderate (5-8 pts):** Some complexity, few unknowns - **Complex (13+ pts):** High complexity, many unknowns - Flag complex items for architecture review - Consider breaking complex items

1. **Update Estimates in Azure DevOps or Jira**

- Record story points in work items - Add estimation notes or assumptions - Tag items as "Estimated" or "Needs Estimation" - Update effort (hours) if required by organization - Record who participated in estimation

**Estimation Best Practices:**

- Estimate as a team, not individually
- Use relative sizing, not absolute time
- Focus on story complexity and effort
- Re-estimate when requirements change significantly
- Track estimation accuracy over time
- Refine estimation process based on retrospectives

---

### 4.5 Sprint Readiness Assessment

**Owner:** Product Owner with Scrum Master
**Duration:** 1-2 business days

#### Process Steps:

1. **Apply Definition of Ready Checklist**

For each work item, verify against DoR (from Step D.4):

- Story written in user story format
- Business value articulated
- Acceptance criteria defined (Given/When/Then)
- Story estimated by team
- Story size ≤13 points
- Dependencies identified and linked
- Technical approach discussed
- UI/UX mockups available (if applicable)
- Related work items linked
- Priority assigned
- No blockers or blockers have mitigation plan
  1. **Identify Ready Items**

  - Mark items meeting DoR as "Ready" - Create "Sprint-Ready" view in Azure DevOps or Jira - Ensure enough Ready items for 2-3 sprints - Calculate total story points of Ready items

  1. **Categorize Not-Ready Items**

  - **Needs Refinement:** Missing details, needs clarification - **Blocked:** Dependency or external blocker - **Spike Needed:** Too much uncertainty, investigation required - **Not Estimated:** Team hasn't estimated yet - **Too Large:** Needs decomposition (>13 points) - **Missing Acceptance Criteria:** Needs testable criteria

  1. **Create Action Plan for Not-Ready Items**

  - Assign actions to get items to Ready: - Schedule refinement sessions - Assign spike stories - Schedule estimation sessions - Decompose large stories - Resolve blockers - Schedule stakeholder meetings for clarification - Set target dates for Ready status - Track progress on actions

  1. **Prioritize Ready Items**

  - Order Ready items by priority - Group related items for efficient sprints - Consider dependencies in ordering - Flag items for next sprint - Ensure top items have highest detail

  1. **Validate Sprint Readiness**

  - Confirm sufficient Ready items: ``` Minimum Ready Backlog = 2 × Average Sprint Velocity Recommended Ready Backlog = 3 × Average Sprint Velocity ``` - Check mix of item types and sizes - Ensure critical path items are Ready - Validate resource availability for Ready items

  **Sprint Readiness Report:**

  | Status | Count | Story Points | Notes |
  | --- | --- | --- | --- |
  | Ready for Sprint | 25 | 180 pts | Sufficient for 3 sprints (60 pts/sprint avg) |
  | Needs Refinement | 12 | 85 pts | Scheduled for next refinement |
  | Blocked | 5 | 40 pts | Waiting on external API access |
  | Spike Needed | 8 | N/A | Spikes scheduled |
  | Too Large | 3 | 65+ pts | Decomposition in progress |

  **Sprint Readiness Checklist:**
  - [ ] Sufficient Ready items for next 2-3 sprints
  - [ ] Top priority items are Ready
  - [ ] No blocking dependencies on Ready items
  - [ ] Ready items balanced by type and size
  - [ ] Team has capacity for Ready items
  - [ ] Action plan exists for not-ready items
  - [ ] Product Owner has reviewed and approved Ready items

  ---

  ## Outputs

  | Output | Destination | Description |
  | --- | --- | --- |
  | Integrated Backlog | Step 5 | Consolidated and linked backlog |
  | Sprint-Ready Items | Step 5 | Items ready for sprint planning |
  | Work Item Updates | Azure DevOps or Jira | Updated work items in ADO |

  ---

  ## Quality Gates / Exit Criteria

  - [ ] All work items consolidated
  - [ ] Traceability links established
  - [ ] Priorities validated
  - [ ] Estimates reviewed
  - [ ] Sprint-ready items identified

  ---

  ## AI/Automation Augmentation

  | Capability | Tool/Service | Description |
  | --- | --- | --- |
  | MCP Server - ADO | Work Item Integration | Automated work item management and linking |
  | WorkItem Intelligence | Streamline ACT MCP Layer | Intelligent work item processing |

  ---

  ## Observability & Metrics

  | Reference | Type | Description |
  | --- | --- | --- |
  | DK5 | Document Output | Work Item Updates |

  ---

  ## Related Artefacts

  - Azure DevOps or Jira Backlog View
  - Work Item Templates
  - Linking Standards

  ---

  ## RACI Matrix

  | Role | Responsibility |
  | --- | --- |
  | **Responsible** | MCP Server / Scrum Master |
  | **Accountable** | Product Owner |
  | **Consulted** | Development Team, Architecture |
  | **Informed** | Project Management |

  ---

  ## Related Steps

  - **Upstream:** Step 3: Architecture Artefact Store
  - **Downstream:** Step 5: Team Creates Sprint

  ---

  ## Revision History

  | Version | Date | Author | Changes |
  | --- | --- | --- | --- |
  | 1 | 2026-03-25 | Simon Armstrong | Initial draft |

  ---

  ## Navigation

  |
   |