# Step 08: Resource Timeline Suggester

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 8 |
| **Phase** | Planning (Azure DevOps or Jira) |
| **Previous Step** | Step 7: Design Feedback |
| **Next Step** | Step 9: PR META Design Feedback |
| **Responsible Role(s)** | AI/Automation, Scrum Master |
| **Tools** | WorkItem Intelligence, Streamline ACT MCP Layer |

---

## Purpose

AI-powered resource and timeline suggestions based on work item analysis, team capacity, and historical data. This augmented step provides intelligent recommendations to optimise sprint planning and resource allocation.

---

## Process Flow

```mermaid graph TD A[Sprint Backlog Input] --> B[8.1 Workload Analysis] B --> C[8.2 Resource Optimization] C --> D[8.3 Timeline Prediction] D --> E[8.4 Bottleneck Identification] E --> F[8.5 Human Review] F --> G{Approved?} G -->|Yes| H[Approved Resource Plan] G -->|No| I[Adjust & Re-analyze] I --> B ```

---

## Inputs

| Input | Source | Description |
| --- | --- | --- |
| Design Feedback Report | Step 7 | Consolidated design feedback |
| Sprint Backlog | Step 5 | Current sprint work items |
| Team Capacity | Azure DevOps or Jira | Available team capacity |
| Historical Data | AI/ML Models | Past sprint performance data |

---

## Activities

### 8.1 Workload Analysis

**Owner:** AI/Automation
**Duration:** 5-10 minutes (automated)

#### Process Steps:

1. **Gather Current State Data**

- Retrieve sprint backlog from Step 5 - Pull team capacity data from Azure DevOps or Jira: - Available team members - Capacity per member (hours/days per sprint) - Time off and holidays - Current in-progress work items - Collect historical performance metrics: - Past sprint velocities - Individual contribution patterns - Story point completion rates

1. **Calculate Current Workload Distribution**

- Analyze work assigned to each team member: - Current sprint assignments - Carryover items from previous sprints - Ongoing support/maintenance work - Non-sprint commitments (meetings, admin) - Calculate workload metrics: - **Utilization Rate:** Assigned work / Available capacity - **Load Balance:** Standard deviation of team utilization - **Capacity Buffer:** Remaining unallocated capacity

1. **Identify Workload Patterns**

- Detect workload imbalances: - Overloaded team members (>85% capacity) - Underutilized team members (<50% capacity) - Skill gaps or constraints - Single points of failure (work concentrated on one person) - Analyze work type distribution: - Frontend vs. Backend vs. Database work - Feature development vs. Bug fixes vs. Tech debt - High complexity vs. Low complexity items

1. **Assess Team Velocity Trends**

- Calculate rolling velocity metrics: - Last 3 sprints average velocity - Last 6 sprints average velocity - Velocity trend (increasing/decreasing/stable) - Velocity variability (standard deviation) - Identify factors affecting velocity: - Team composition changes - Onboarding new members - Technical complexity trends - External dependencies

1. **Generate Workload Analysis Report**

- Compile comprehensive analysis including: - Current capacity utilization per member - Team-wide workload balance score - Velocity trends and projections - Risk factors and constraints - Recommendations for workload adjustments

**Workload Analysis Report Template:**

| Team Member | Role | Available Capacity | Assigned Work | Utilization | Status | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Alice Chen | Full Stack | 40 hrs | 38 hrs (19 pts) | 95% | ⚠️ Overloaded | Consider redistributing |
| Bob Smith | Backend | 32 hrs | 24 hrs (12 pts) | 75% | ✅ Balanced | Good allocation |
| Carol Lee | Frontend | 40 hrs | 16 hrs (8 pts) | 40% | ⚠️ Underutilized | Can take more work |
| David Kim | QA | 40 hrs | 36 hrs (18 pts) | 90% | ✅ Balanced | Near capacity |

**Team Summary:**

- **Total Capacity:** 152 hours
- **Total Assigned:** 114 hours (57 story points)
- **Overall Utilization:** 75%
- **Balance Score:** 6.5/10 (moderate imbalance detected)
- **Velocity Trend:** Stable at 58-62 pts/sprint (last 3 sprints)

---

### 8.2 Resource Optimisation Suggestions

**Owner:** AI/Automation
**Duration:** 5-10 minutes (automated)

#### Process Steps:

1. **Analyze Work Item Requirements**

- Extract requirements from sprint backlog items: - Required skills (Frontend, Backend, Database, DevOps, etc.) - Complexity level (Simple, Moderate, Complex) - Domain knowledge needs - Collaboration requirements - Identify work item characteristics: - Can be parallelized or has dependencies - Requires specific expertise or generalist - Learning opportunities for junior developers

1. **Match Skills to Work Items**

- Build skill-to-work matching matrix: - Team member skill profiles (expertise levels) - Work item skill requirements - Match scores for each combination - Consider factors: - **Primary expertise:** Direct skill match (score: 1.0) - **Secondary skills:** Related experience (score: 0.7) - **Learning opportunity:** Skill development (score: 0.5) - **Knowledge transfer:** Pairing opportunities

1. **Generate Resource Allocation Recommendations**

- Apply optimization algorithms: - **Load Balancing:** Distribute work evenly across team - **Skill Matching:** Assign work to best-fit resources - **Efficiency:** Minimize context switching and handoffs - **Development:** Include learning/growth opportunities - Consider constraints: - No team member over 85% capacity - Maintain at least 15% buffer for unknowns - Balance skill development with delivery speed - Respect individual preferences (when known)

1. **Identify Pairing Opportunities**

- Recommend pair programming for: - Complex or high-risk work items - Knowledge transfer (senior + junior) - Cross-functional learning - Items requiring multiple skill sets - Calculate pairing efficiency: - Time investment vs. quality improvement - Knowledge sharing benefit - Risk reduction value

1. **Suggest Work Redistribution**

- Recommend specific reassignments: - Move work from overloaded to underutilized members - Reassign work requiring specific expertise - Balance workload across skill levels - Optimize for team throughput - Provide rationale for each suggestion: - Skill match score - Capacity improvement - Risk reduction - Learning opportunity

1. **Calculate Optimization Impact**

- Quantify expected improvements: - Improved utilization rate - Better skill-to-work alignment - Reduced risk of burnout - Enhanced team capability - Project potential outcomes: - Expected velocity improvement - Quality impact (defect reduction) - Team satisfaction improvement

**Resource Allocation Recommendations Template:**

| Work Item | Current Assignment | Recommended Assignment | Rationale | Impact | Priority |
| --- | --- | --- | --- | --- | --- |
| WI-501: User Auth API | Unassigned | Bob Smith (Backend) | Perfect skill match (1.0), Bob at 75% capacity | High efficiency | P1 |
| WI-502: Dashboard UI | Alice Chen | Carol Lee | Alice overloaded (95%), Carol underutilized (40%), both have frontend skills | Balance workload | P0 |
| WI-503: Database Migration | David Kim (QA) | Bob Smith + David Kim (pair) | Complex task, requires DB expertise + testing knowledge | Risk reduction | P1 |
| WI-504: API Integration | Alice Chen | Carol Lee + Alice Chen (mentor) | Learning opportunity for Carol, knowledge sharing | Skill development | P2 |

**Optimization Summary:**

- **Projected Utilization Improvement:** 75% → 82% (7% increase)
- **Balance Score Improvement:** 6.5/10 → 8.5/10
- **Risk Reduction:** 3 high-risk items now have appropriate assignments
- **Learning Opportunities:** 2 pairing sessions for skill development

---

### 8.3 Timeline Prediction

**Owner:** AI/Automation
**Duration:** 5-10 minutes (automated)

#### Process Steps:

1. **Historical Velocity Analysis**

- Gather historical sprint data: - Last 6-12 sprints of velocity data - Story points committed vs. completed - Carryover rates per sprint - Sprint disruptions or anomalies - Calculate baseline metrics: - **Average Velocity:** Mean story points completed - **Velocity Range:** Min to Max velocity observed - **Velocity Trend:** Increasing, stable, or decreasing - **Consistency Score:** Standard deviation / mean

1. **Apply Predictive Modeling**

- Use machine learning algorithms: - **Time Series Analysis:** Trend and seasonality patterns - **Regression Models:** Factor-based predictions - **Monte Carlo Simulation:** Probabilistic outcomes - **Ensemble Methods:** Combine multiple model predictions - Consider influencing factors: - Team size changes - Work complexity trends - Historical accuracy of estimates - External dependencies frequency

1. **Calculate Delivery Timelines**

- For each work item or group: - Estimate completion sprint based on: - Story points required - Team velocity projections - Current workload and priorities - Dependency chains - Generate timeline predictions: - **Best Case:** 90th percentile velocity - **Expected Case:** Mean velocity - **Worst Case:** 10th percentile velocity

1. **Generate Confidence Intervals**

- Calculate prediction confidence: - Based on historical accuracy - Account for uncertainty factors: - **High Confidence (>80%):** Stable velocity, clear requirements, no dependencies - **Medium Confidence (60-80%):** Some variability, minor unknowns - **Low Confidence (<60%):** High variability, many unknowns, complex dependencies - Provide confidence bands: - 50% confidence interval (likely range) - 80% confidence interval (probable range) - 95% confidence interval (possible range)

1. **Identify Timeline Risks**

- Detect factors affecting timelines: - **Dependency Delays:** External team delays - **Capacity Constraints:** Limited specialized resources - **Technical Complexity:** Unknown technical challenges - **Scope Creep:** Evolving requirements - **Integration Issues:** System integration complexity - Quantify risk impact on timelines: - Delay probability and magnitude - Risk mitigation options - Buffer recommendations

1. **Generate Timeline Prediction Report**

- Compile comprehensive timeline forecast: - Item-by-item predictions - Milestone completion dates - Release readiness projections - Risk-adjusted timelines - Recommended actions

**Timeline Prediction Report Template:**

| Work Item / Epic | Story Points | Expected Sprint | Best Case | Worst Case | Confidence | Key Risks |
| --- | --- | --- | --- | --- | --- | --- |
| User Authentication Epic | 45 pts | Sprint 15 | Sprint 14 | Sprint 17 | 75% | External OAuth integration |
| WI-501: Auth API | 8 pts | Sprint 13 (current) | Sprint 13 | Sprint 14 | 85% | None - clear requirements |
| WI-502: Dashboard UI | 13 pts | Sprint 14 | Sprint 13 | Sprint 15 | 70% | Design feedback pending |
| WI-503: DB Migration | 21 pts | Sprint 15 | Sprint 14 | Sprint 16 | 60% | Complex migration, testing needs |

**Sprint Capacity Forecast:**

| Sprint | Projected Velocity | Committed Work | Forecast Completion | Risk Level |
| --- | --- | --- | --- | --- |
| Sprint 13 (Current) | 58 pts | 57 pts | 95% completion | ✅ Low |
| Sprint 14 | 60 pts | 52 pts (planned) | Full completion | ✅ Low |
| Sprint 15 | 59 pts | 48 pts (planned) | Full completion + buffer | ✅ Low |
| Sprint 16 | 58 pts | TBD | On track for Q2 release | ⚠️ Medium |

**Release Prediction:**

- **Q2 Release Target:** April 30, 2026
- **Expected Completion:** Sprint 16 (April 22, 2026)
- **Confidence Level:** 78%
- **Buffer Remaining:** 8 days
- **Status:** ✅ On track

---

### 8.4 Bottleneck Identification

**Owner:** AI/Automation
**Duration:** 5-10 minutes (automated)

#### Process Steps:

1. **Dependency Analysis**

- Map work item dependencies: - Prerequisite relationships (must complete before) - Parallel work opportunities - Critical path identification - Dependency chains and depth - Analyze dependency types: - **Technical Dependencies:** API contracts, shared components - **Team Dependencies:** Cross-team coordination - **External Dependencies:** Third-party services, vendor deliverables - **Knowledge Dependencies:** Specific expertise required

1. **Resource Constraint Detection**

- Identify limited resources: - **Specialized Skills:** Only one person with expertise - **Shared Resources:** Infrastructure, test environments - **External Resources:** Vendor availability, approval processes - Calculate constraint impact: - Number of work items blocked by constraint - Duration of constraint period - Alternative resource availability

1. **Throughput Analysis**

- Analyze work-in-progress (WIP) limits: - Current WIP per team member - WIP limits vs. actual WIP - Context switching frequency - Identify flow bottlenecks: - **Development:** Coding phase delays - **Code Review:** PR review backlog - **Testing:** QA resource constraints - **Deployment:** Release process delays

1. **Risk Scoring Methodology**

- Calculate bottleneck severity: ``` Bottleneck Risk Score = Impact × Probability × Urgency

Impact: Number of work items affected (1-10) Probability: Likelihood of occurring (0.1-1.0) Urgency: Time sensitivity (1-5) ``` - Categorize risk levels: - **Critical (>30):** Immediate attention required - **High (15-30):** Address in current sprint - **Medium (5-15):** Monitor and plan mitigation - **Low (<5):** Track for future consideration

1. **Identify Potential Bottlenecks**

- Common bottleneck patterns: - **Resource Bottleneck:** Key person overloaded - **Dependency Bottleneck:** Waiting on external input - **Knowledge Bottleneck:** Specialized expertise unavailable - **Process Bottleneck:** Approval or review delays - **Technical Bottleneck:** Infrastructure or tooling limitations

1. **Generate Mitigation Strategies**

- Recommend actions for each bottleneck: - **Skill Development:** Train additional team members - **Process Optimization:** Streamline approval workflows - **Parallelization:** Restructure work to reduce dependencies - **Resource Addition:** Temporary resource augmentation - **Scope Adjustment:** Defer or descope blocked items - **Early Escalation:** Proactive communication with stakeholders

**Bottleneck Analysis Report Template:**

| Bottleneck | Type | Risk Score | Affected Items | Impact | Mitigation Strategy | Owner | Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Alice Chen overallocated | Resource | 35 (Critical) | 5 work items | Sprint delay risk | Redistribute 2 items to Carol | Scrum Master | ⚠️ Pending |
| External OAuth API access | Dependency | 28 (High) | WI-501, WI-505 | Blocks auth epic | Escalate to vendor, prepare mock | Product Owner | 🔄 In progress |
| Only Bob knows legacy DB | Knowledge | 18 (Medium) | 3 DB migrations | Single point of failure | Pair Bob with David on WI-503 | Tech Lead | ✅ Planned |
| Code review backlog | Process | 12 (Medium) | All PRs | Slows velocity | Institute 24hr review SLA | Dev Team | 📋 To implement |

**Critical Path Analysis:**

``` Epic: User Authentication (45 pts) ├── WI-501: Auth API (8 pts) → Sprint 13 │ └── BLOCKER: External OAuth access (High risk) ├── WI-502: Dashboard UI (13 pts) → Sprint 14 │ └── Depends on: WI-501 completion └── WI-503: DB Migration (21 pts) → Sprint 15 └── BOTTLENECK: Only Bob has expertise (Medium risk) ```

**Bottleneck Summary:**

- **Critical Bottlenecks:** 1 (requires immediate action)
- **High Risk Bottlenecks:** 1 (monitor closely)
- **Medium Risk Bottlenecks:** 2 (plan mitigation)
- **Mitigation Success Rate:** 85% (based on historical data)

---

### 8.5 Human Review

**Owner:** Scrum Master
**Duration:** 30-60 minutes

#### Process Steps:

1. **Review AI-Generated Reports**

- Examine all AI outputs: - Workload Analysis Report (Section 8.1) - Resource Optimization Suggestions (Section 8.2) - Timeline Predictions (Section 8.3) - Bottleneck Analysis (Section 8.4) - Validate data accuracy: - Verify capacity numbers - Check work item assignments - Confirm historical velocity data - Review risk assessments

1. **Validate Recommendations**

- Assess AI suggestions for: - **Feasibility:** Can recommendations be implemented? - **Practicality:** Do they fit team dynamics? - **Impact:** Will they achieve stated benefits? - **Trade-offs:** What are the downsides? - Consider factors AI may miss: - Team member preferences and career goals - Interpersonal dynamics - Ongoing personal development plans - Recent team morale or issues - Organizational constraints

1. **Apply Human Judgment**

- Override or adjust recommendations when: - Team member has explicitly requested certain work - Recent context suggests different allocation - Organizational priorities have shifted - Risk tolerance differs from AI assessment - Document override rationale: - Reason for deviation from AI suggestion - Expected impact of override - Alternative approach chosen

1. **Consult with Team**

- Discuss recommendations with: - **Development Team:** Resource allocation feedback - **Tech Leads:** Technical feasibility and risk assessment - **Product Owner:** Priority alignment - **Individual Contributors:** Workload and preference validation - Gather input on: - Workload comfort levels - Skill development interests - Pairing preferences - Timeline concerns

1. **Finalize Resource Plan**

- Make final decisions on: - Work item assignments - Pairing arrangements - Timeline commitments - Risk mitigation actions - Document approved plan: - Final resource allocation - Timeline commitments with confidence levels - Identified risks and mitigation steps - Action items for bottleneck resolution

1. **Provide Feedback to Improve AI**

- Log feedback on AI performance: - Accuracy of predictions - Usefulness of recommendations - Missed factors or considerations - Suggested improvements - Track over time: - AI recommendation acceptance rate - Prediction accuracy (compare actual vs. predicted) - Areas where human override is frequent - Improvement opportunities

**Human Review & Approval Checklist:**

| Review Area | Status | Approved? | Adjustments Made | Notes |
| --- | --- | --- | --- | --- |
| Workload Distribution | ✅ Reviewed | ✅ Yes | None | AI analysis accurate |
| Resource Allocations | ✅ Reviewed | ⚠️ Partial | WI-502 kept with Alice per her request | Career development priority |
| Timeline Predictions | ✅ Reviewed | ✅ Yes | None | Confidence levels reasonable |
| Bottleneck Mitigation | ✅ Reviewed | ✅ Yes | Added vendor escalation | Escalation owner assigned |
| Overall Plan | ✅ Reviewed | ✅ Approved | Minor adjustments | Ready for sprint |

**Approval Decision:**

- **Status:** ✅ Approved with minor adjustments
- **Approved By:** Sarah Johnson (Scrum Master)
- **Date:** March 10, 2026
- **Next Review:** Sprint retrospective (March 24, 2026)

**Feedback to AI System:**

- **Prediction Accuracy:** 90% (excellent)
- **Recommendation Usefulness:** 85% (very good)
- **Accepted Suggestions:** 12 of 14 (86%)
- **Override Reasons:** Personal development goals (2 cases)
- **Improvement Suggestion:** Consider individual development plans in recommendations

---

## Best Practices

### ✅ DO

- **Review AI suggestions before accepting** - Always apply human judgment to AI recommendations
- **Provide feedback to improve accuracy** - Log which suggestions worked and which didn't
- **Consider team member preferences** - Factor in career goals and development interests
- **Account for learning curves** - Balance efficiency with skill development opportunities
- **Validate historical data** - Ensure velocity and capacity data is accurate and current
- **Update predictions regularly** - Re-run analysis when significant changes occur
- **Document override rationale** - Explain why you deviated from AI recommendations
- **Communicate transparently** - Share resource plans and timelines with the team
- **Monitor actual vs. predicted** - Track prediction accuracy to improve future forecasts
- **Balance workload evenly** - Avoid overloading individuals or teams

### ❌ DON'T

- **Blindly accept AI recommendations** - AI lacks context on team dynamics and personal factors
- **Ignore team capacity constraints** - Overallocation leads to burnout and quality issues
- **Over-optimize for efficiency** - Team health and sustainability matter more than maximum utilization
- **Skip human validation** - AI is a tool to augment, not replace, human decision-making
- **Ignore soft factors** - Team morale, preferences, and dynamics impact success
- **Forget to account for buffer** - Always leave 10-15% capacity for unknowns and interruptions
- **Assign work without consultation** - Discuss assignments with team members first
- **Use outdated historical data** - Ensure velocity and performance data is recent and relevant
- **Ignore warning signs** - Act on bottleneck and risk alerts promptly
- **Treat predictions as certainties** - Timelines are estimates with confidence intervals, not guarantees

---

## Outputs

| Output | Destination | Description |
| --- | --- | --- |
| Resource Suggestions | Scrum Master | AI recommendations for resource allocation |
| Timeline Predictions | Project Management | Predicted delivery timelines |
| Risk Alerts | Risk Register | Identified potential issues |

---

## Quality Gates / Exit Criteria

- [ ] AI analysis completed
- [ ] Suggestions reviewed by Scrum Master
- [ ] Critical recommendations addressed
- [ ] Timeline predictions documented

---

## AI/Automation Augmentation

| Capability | Tool/Service | Description |
| --- | --- | --- |
| Resource/Timeline Suggester | WorkItem Intelligence | AI-powered resource and timeline suggestions |
| N8N Orchestration | Streamline ACT MCP Layer | Workflow orchestration |

---

## Observability & Metrics

| Reference | Type | Description | Target |
| --- | --- | --- | --- |
| D4 | DORA | Cycle Time (Deployment) | Track impact of resource optimization on deployment speed |
| D5 | DORA | Time From Inception to PR | Measure time savings from better planning |
| AI-1 | AI Performance | Prediction Accuracy Rate | >85% (timeline predictions vs. actuals) |
| AI-2 | AI Performance | Recommendation Acceptance Rate | >70% (accepted vs. total suggestions) |
| AI-3 | Efficiency | Time Saved in Planning | 50% reduction vs. manual planning |
| AI-4 | Quality | Resource Utilization Improvement | +15% balanced utilization |
| AI-5 | Quality | Bottleneck Detection Rate | 90% of actual issues identified proactively |
| AI-6 | Quality | Workload Balance Score | >8.0/10 (team workload distribution) |
| AI-7 | Outcome | Sprint Completion Rate | >90% (planned vs. completed work) |
| AI-8 | Outcome | Velocity Consistency | <15% standard deviation |

---

## Related Artefacts

- Resource Allocation Report
- Timeline Prediction Report
- AI Suggestion Log

---

## RACI Matrix

| Role | Responsibility |
| --- | --- |
| **Responsible** | AI/Automation |
| **Accountable** | Scrum Master |
| **Consulted** | Development Team, Project Management |
| **Informed** | Product Owner, Leadership |

---

## Related Steps

- **Upstream:** Step 7: Design Feedback
- **Downstream:** Step 9: PR META Design Feedback

---

## Revision History

| Version | Date | Author | Changes |
| --- | --- | --- | --- |
| 1 | 2026-03-25 | Simon Armstrong | Initial draft |

---

## Navigation

|
 |