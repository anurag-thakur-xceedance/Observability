# Step A: Intake Process

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | A |
| **Phase** | Project & Opportunity Preliminary |
| **Previous Step** | N/A - Entry Point |
| **Next Step** | Step B: Concept to Project |
| **Responsible Role(s)** | Business Leadership, Program Management |
| **Tools** | Azure DevOps or Jira, Project Charters |

---

## Purpose

The Intake Process is the initial gateway where business leadership evaluates whether to take a concept forward to become a project. This step ensures strategic alignment and resource availability before committing to project initiation.

---

## Inputs

| Input | Source | Description |
| --- | --- | --- |
| Business Case | Business Stakeholders | Justification for the proposed concept |
| Value Proposition & Outcome Map | Product Owner | Expected value and outcomes |
| Market Analysis | Business Intelligence | Market opportunity assessment |
| Market Feedback | Customer Channels | Customer and market insights |
| Strategic Product Features | Product Management | Alignment with product strategy |
| Client Requirements | Client Engagement | Specific client needs and requests |

---

## Activities

### A.1 Business Case Review

**Owner:** Program Management  
**Duration:** 1-2 business days

#### Process Steps:

1. **Intake Submission Validation**

   - Verify all required sections are completed
   - Check for supporting documentation
   - Validate financial projections and assumptions
   - Confirm sponsorship and stakeholder identification
2. **Completeness Assessment**

   - Business problem statement clearly defined
   - Proposed solution approach documented
   - Expected benefits quantified (ROI, cost savings, revenue impact)
   - Implementation timeline estimated
   - Resource requirements identified
3. **Viability Analysis**

   - Review financial feasibility (budget vs. expected value)
   - Assess technical feasibility with Architecture team
   - Evaluate market timing and competitive position
   - Analyse dependency on other initiatives

**Checklist:**

- Business case document submitted and complete
- Financial model validated
- Sponsorship confirmed
- Supporting documentation attached
- Initial resource estimates provided

---

### A.2 Strategic Alignment Assessment

**Owner:** Business Leadership  
**Duration:** 2-3 business days

#### Process Steps:

1. **Strategic Objectives Mapping**

   - Map proposed initiative to organizational strategic objectives
   - Assess contribution to key performance indicators (KPIs)
   - Evaluate alignment with annual planning priorities
   - Consider portfolio balance across strategic themes
2. **Priority Scoring**

   - Apply weighted scoring criteria:

     - Strategic fit (30%)
     - Business value (25%)
     - Urgency/market timing (20%)
     - Risk level (15%)
     - Resource availability (10%)
   - Compare against other initiatives in pipeline
   - Determine priority tier (P0-Critical, P1-High, P2-Medium, P3-Low)
3. **Portfolio Impact Analysis**

   - Assess impact on current portfolio
   - Identify potential conflicts or synergies with other initiatives
   - Evaluate overall portfolio capacity
   - Consider sequencing and dependencies

**Scoring Matrix:**

| Criterion | Weight | Score (1-5) | Weighted Score |
| --- | --- | --- | --- |
| Strategic Fit | 30% |  |  |
| Business Value | 25% |  |  |
| Urgency | 20% |  |  |
| Risk Level | 15% |  |  |
| Resource Availability | 10% |  |  |
| **Total** | **100%** |  |  |

---

### A.3 Resource Availability Check

**Owner:** Resource Management / PMO  
**Duration:** 2-3 business days

#### Process Steps:

1. **Budget Assessment**

   - Verify budget allocation availability
   - Confirm funding source and authorization
   - Assess multi-year funding requirements if applicable
   - Identify any budget constraints or dependencies
2. **People Resource Analysis**

   - Identify required roles and skill sets:

     - Product Owner availability
     - Architecture team capacity
     - Development team availability
     - QA/Testing resources
     - DevOps/SRE support
     - Security team involvement
   - Check current allocation of key resources
   - Assess need for external resources or contractors
   - Consider training requirements for new technologies
3. **Technology & Infrastructure Assessment**

   - Review required technology stack
   - Assess infrastructure capacity (cloud resources, licenses)
   - Identify new tool or platform requirements
   - Evaluate existing technology constraints
   - Consider technical debt impact
4. **Capacity Planning**

   - Calculate total effort estimate (person-months)
   - Map resource availability across timeline
   - Identify resource conflicts with other projects
   - Determine if additional hiring/contracting needed

**Resource Checklist:**

- Budget confirmed and authorized
- Product Owner assigned
- Architecture resources available
- Development team capacity confirmed
- QA resources allocated
- Infrastructure capacity verified
- Technology/tool licenses available
- External resources identified if needed

---

### A.4 Risk Preliminary Assessment

**Owner:** Risk Management / Program Management  
**Duration:** 1-2 business days

#### Process Steps:

1. **Risk Identification**

   - Technical risks (complexity, new technology, integration)
   - Resource risks (availability, capability, retention)
   - Schedule risks (dependencies, external factors)
   - Budget risks (cost overruns, scope creep)
   - Business risks (market changes, competitive actions)
   - Compliance/regulatory risks
   - Security risks
2. **Risk Analysis**

   - Assess probability of each risk (High/Medium/Low)
   - Evaluate impact if risk occurs (High/Medium/Low)
   - Calculate risk score (Probability × Impact)
   - Prioritize risks for mitigation planning
3. **Initial Mitigation Strategy**

   - Identify mitigation approaches for high-priority risks
   - Determine if risks are acceptable or require mitigation before approval
   - Document assumptions and constraints
   - Establish risk monitoring approach

**Risk Register Template:**

| Risk ID | Description | Probability | Impact | Score | Mitigation Strategy | Owner |
| --- | --- | --- | --- | --- | --- | --- |
| R-001 |  |  |  |  |  |  |

**Risk Categories:**

- **Critical (9):** High probability + High impact - Requires mitigation plan before approval
- **High (6):** Medium-High combination - Mitigation plan required
- **Medium (4):** Low-Medium combination - Monitor and manage
- **Low (1-2):** Acceptable risk - Document and monitor

---

### A.5 Go/No-Go Decision

**Owner:** Business Leadership (Steering Committee)  
**Duration:** 1 business day (decision meeting)

#### Process Steps:

1. **Decision Package Preparation**

   - Compile all assessments and analyses
   - Prepare executive summary with recommendation
   - Include supporting financial models and projections
   - Document key assumptions and dependencies
   - Prepare presentation for decision meeting
2. **Steering Committee Review**

   - Present business case and strategic alignment
   - Review resource availability and capacity
   - Discuss key risks and mitigation strategies
   - Address questions and concerns
   - Consider alternative approaches or deferral options
3. **Decision Making**

   - **Approve:** Proceed to Step B with funding authorization
   - **Approve with Conditions:** Proceed with specific requirements or constraints
   - **Defer:** Request additional information or analysis
   - **Reject:** Do not proceed - provide feedback for future consideration
4. **Decision Documentation**

   - Document decision and rationale
   - Record any conditions or constraints
   - Communicate decision to stakeholders
   - If approved, initiate project charter development
   - If rejected, provide feedback and close intake

**Decision Criteria:**

- Strategic alignment score meets minimum threshold (≥3.5/5.0)
- Business case ROI meets minimum requirements
- Resources available or plan to acquire
- Critical risks have mitigation strategies
- Funding authorized
- Sponsorship confirmed
- Timeline acceptable to business

**Decision Outcomes:**

- **Approved:** Proceed to Step B: Concept to Project
- **Conditional:** Address conditions and re-review
- **Deferred:** Revisit next planning cycle
- **Rejected:** Close with documented feedback

---

## Outputs

| Output | Destination | Description |
| --- | --- | --- |
| Intake Decision | Step B | Approval to proceed or rejection with feedback |
| Project Charter (Draft) | Architecture Artefact Store | Initial project charter if approved |
| Terms of Reference (ToR) | Project Management | Scope and boundaries definition |

---

## Quality Gates / Exit Criteria

- Business case reviewed and validated
- Strategic alignment confirmed
- Resource availability assessed
- Initial risk assessment completed
- Leadership approval obtained (Pass/Exception)

---

## AI/Automation Augmentation

| Capability | Tool/Service | Description |
| --- | --- | --- |
| Resource/Timeline Suggester | WorkItem Intelligence | AI-assisted resource planning suggestions |

---

## Observability & Metrics

| Reference | Type | Description |
| --- | --- | --- |
| D5 | DORA | Time From Inception to PR (starts tracking here) |

---

## Related Artefacts

- Project Charter Template
- Terms of Reference Template
- Business Case Template
- Value Proposition Canvas

---

## RACI Matrix

| Role | Responsibility |
| --- | --- |
| **Responsible** | Program Management |
| **Accountable** | Business Leadership |
| **Consulted** | Product Owner, Architecture |
| **Informed** | IT Operations, SRE |

---

## Navigation

Phase 00 - Entry Points | Step B: Concept to Project