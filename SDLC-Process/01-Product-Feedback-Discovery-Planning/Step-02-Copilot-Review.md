# Step 02: Copilot Review

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 2 |
| **Phase** | Product Feedback & Discovery |
| **Previous Step** | Step 1: Design Stakeholders |
| **Next Step** | Step 3: Architecture Artefact Store |
| **Responsible Role(s)** | AI/Automation, Development Team |
| **Tools** | GitHub Copilot, Streamline ACT MCP Layer |

---

## Purpose

AI-assisted review of work items and requirements using Copilot and the Streamline ACT MCP Layer. This augmented step provides intelligent suggestions, identifies potential issues, and enhances the quality of work item definitions.

---

## Inputs

| Input | Source | Description |
| --- | --- | --- |
| Refined Work Items | Step 1 | Work items from stakeholder review |
| Historical Patterns | AI/ML Models | Past project patterns and learnings |
| Best Practices | Knowledge Base | Industry and organisational best practices |

---

## Activities

### 2.1 AI-Assisted Work Item Analysis

**Owner:** AI/Automation (GitHub Copilot, Streamline ACT MCP)
**Duration:** Minutes to hours (automated)

#### Process Steps:

1. **Work Item Content Analysis**

- AI reviews work item text for: - **Completeness:** All required fields populated - **Clarity:** Language is clear and unambiguous - **Consistency:** Terminology consistent across items - **Structure:** Follows user story format or standards - **Testability:** Acceptance criteria are measurable

1. **Natural Language Processing**

- Extract key information: - User roles and personas - Actions and interactions - Expected outcomes and benefits - Business rules and constraints - Technical terms and concepts - Identify implicit requirements not explicitly stated - Detect ambiguous or vague language

1. **Quality Scoring**

- Score work items on multiple dimensions: - **Completeness Score:** 0-100% based on field coverage - **Clarity Score:** Language complexity and readability - **Specificity Score:** Concrete vs. abstract requirements - **Testability Score:** How measurable acceptance criteria are - Provide overall quality grade (A-F) - Highlight areas needing improvement

1. **Best Practice Comparison**

- Compare work items to: - Industry best practices (INVEST criteria) - Organizational templates and standards - High-quality examples from past projects - Identify deviations from standards - Suggest improvements to align with best practices

**AI Analysis Output:**

- Quality scores for each work item
- Completeness analysis
- Clarity assessment
- Best practice recommendations

---

### 2.2 Suggestion Generation

**Owner:** AI/Automation
**Duration:** Minutes (automated)

#### Process Steps:

1. **Improvement Suggestions**

- Generate specific suggestions for each work item: - **Missing Information:** Fields or details to add - **Clarity Improvements:** Reworded descriptions for clarity - **Acceptance Criteria:** Additional test scenarios to consider - **Examples:** Concrete examples to illustrate requirements - **Edge Cases:** Boundary conditions or error scenarios - **Alternative Approaches:** Different ways to solve the problem

1. **Historical Pattern Matching**

- Compare current work items to historical data: - Similar features implemented in the past - Common patterns and solutions - Lessons learned from previous sprints - Successful implementation approaches - Suggest reusable components or patterns - Recommend proven technical approaches

1. **Decomposition Recommendations**

- Analyze large or complex work items - Suggest decomposition strategies: - Break by user role or persona - Split by functional area or workflow - Separate by technical layer (UI, API, data) - Divide by MVP vs. enhancements - Provide example decomposition structure

1. **Related Work Identification**

- Find related work items in backlog: - Similar functionality or features - Shared components or services - Common user workflows - Related technical areas - Suggest grouping for efficient implementation - Recommend story mapping or sequencing

1. **Template and Example Suggestions**

- Suggest relevant templates: - User story templates for specific patterns - Acceptance criteria templates - Technical specification templates - Provide example work items from knowledge base - Offer standard phrasing for common scenarios

**Suggestion Categories:**

- **Critical:** Must address before proceeding (missing requirements)
- **High:** Strongly recommended (clarity improvements)
- **Medium:** Should consider (enhancements)
- **Low:** Nice to have (optional improvements)

---

### 2.3 Risk Pattern Recognition

**Owner:** AI/Automation (WorkItem Intelligence)
**Duration:** Minutes (automated)

#### Process Steps:

1. **Historical Risk Analysis**

- Analyze patterns from past projects: - Work items that caused delays or issues - Features that had high defect rates - Items that required significant rework - Implementations that exceeded estimates - Identify common risk indicators: - Vague or incomplete requirements - High technical complexity - External dependencies - New or untested technologies - Tight timelines

1. **Risk Signal Detection**

- Scan work items for risk indicators: - **Technical Risks:** - Complex algorithms or processing - Performance-sensitive operations - Security-critical functionality - Third-party integrations - Data migration requirements - **Requirement Risks:** - Ambiguous acceptance criteria - Missing stakeholder input - Conflicting requirements - Incomplete specifications - **Dependency Risks:** - External team dependencies - Third-party service dependencies - Infrastructure prerequisites - Data availability issues - **Estimation Risks:** - Large story points (>13) - High uncertainty or unknowns - New technology or domain - Lack of team experience

1. **Risk Scoring and Prioritization**

- Calculate risk scores for each work item: ``` Risk Score = (Probability × Impact) + Complexity Factor

Probability: 1-5 (based on historical data) Impact: 1-5 (schedule, quality, cost impact) Complexity: 0-3 (additional risk factor) ``` - Categorize risks: - **Critical (10-13):** High probability and high impact - **High (7-9):** Significant risk requiring mitigation - **Medium (4-6):** Moderate risk, monitor closely - **Low (1-3):** Acceptable risk

1. **Early Warning Indicators**

- Flag items with red flags: - "First time" or "never done before" - "Complex" or "difficult" language - Multiple external dependencies - Tight deadline constraints - Lack of clear success criteria - Mentions of "might," "could," or "possibly"

**Risk Pattern Output:**

| Work Item | Risk Score | Risk Category | Key Risk Factors | Recommended Actions |
| --- | --- | --- | --- | --- |
| WI-123 | 9 | High | External API dependency, tight timeline | Spike for API research, buffer time |
| WI-124 | 11 | Critical | New technology, vague requirements | Refine requirements, POC needed |

---

### 2.4 Dependency Detection

**Owner:** AI/Automation
**Duration:** Minutes (automated)

#### Process Steps:

1. **Dependency Pattern Recognition**

- Analyze work item content for dependency indicators: - **Technical Dependencies:** - References to shared components, services, or APIs - Database schema or data model mentions - Infrastructure or platform requirements - Framework or library dependencies - **Functional Dependencies:** - Prerequisites in acceptance criteria - References to other features or workflows - User journey dependencies - Data flow requirements - **Team Dependencies:** - Cross-team collaboration mentions - Shared resource requirements - Integration points with other systems

1. **Semantic Analysis**

- Use NLP to detect implicit dependencies: - "Requires," "depends on," "needs," "after" language - References to other work items or features - Mentions of prerequisite functionality - Integration or data sharing implications - Identify chronological dependencies (sequence) - Detect parallel work opportunities

1. **Knowledge Graph Mapping**

- Build dependency graph across backlog: - Map relationships between work items - Identify dependency chains - Find circular dependencies (anti-pattern) - Detect bottleneck items (many dependents) - Visualize dependency network - Calculate critical path

1. **External Dependency Identification**

- Detect dependencies on external factors: - **Third-Party Services:** APIs, platforms, vendors - **Other Teams:** Shared services, data sources - **Infrastructure:** Cloud resources, networks, security - **Business Processes:** Approvals, sign-offs, data access - **Regulatory/Compliance:** Certifications, audits - Flag high-risk external dependencies - Suggest contingency plans

1. **Dependency Impact Analysis**

- Assess dependency impact: - **Blocking Dependencies:** Must complete before starting - **Parallel Dependencies:** Can work simultaneously with coordination - **Soft Dependencies:** Nice to have, not blocking - Calculate dependency risk: ``` Dependency Risk = Certainty of Delivery × Impact of Delay

Certainty: 1 (certain) to 5 (uncertain) Impact: 1 (low) to 5 (critical) ``` - Prioritize dependency resolution

**Dependency Detection Output:**

- Dependency graph visualization
- List of all detected dependencies by type
- Risk-scored dependencies
- Recommended sequencing or parallelization
- External dependencies requiring coordination

---

### 2.5 Human Review of Suggestions

**Owner:** Product Owner, Development Lead, Technical Lead
**Duration:** 1-2 business days

#### Process Steps:

1. **Review AI Analysis Results**

- Review AI-generated reports: - Quality scores and assessments - Improvement suggestions - Identified risks - Detected dependencies - Assess validity and relevance of AI findings - Identify false positives or misinterpretations

1. **Prioritize Suggestions**

- Categorize suggestions by priority: - **Must Address:** Critical gaps or risks - **Should Address:** Important improvements - **Could Address:** Nice-to-have enhancements - **Won't Address:** Not relevant or incorrect - Focus on high-impact, high-certainty suggestions - Defer low-priority items for future refinement

1. **Validate Risk Assessments**

- Review AI-identified risks: - Confirm risk assessment accuracy - Adjust risk scores based on domain knowledge - Add context or mitigating factors AI missed - Identify additional risks not detected by AI - Update risk register with validated risks - Plan mitigation strategies for high risks

1. **Verify Dependency Analysis**

- Review detected dependencies: - Confirm dependency relationships - Add missing dependencies AI didn't detect - Remove false positive dependencies - Clarify dependency type (blocking, soft, parallel) - Update dependency map in Azure DevOps or Jira - Coordinate with dependency owners

1. **Apply Approved Changes**

- Update work items with approved suggestions: - Enhance descriptions with AI-recommended improvements - Add suggested acceptance criteria - Document identified risks - Link dependency relationships - Add technical notes or considerations - Tag items requiring further discussion - Mark items as reviewed by AI

1. **Document AI Review Feedback**

- Record which suggestions were accepted/rejected - Provide feedback on AI accuracy and usefulness: - True positives: Correct and valuable insights - False positives: Incorrect suggestions - False negatives: Missed issues (for AI learning) - Use feedback to improve AI models over time

**Human Review Deliverables:**

- AI suggestion review summary
- Updated work items with accepted improvements
- Validated risk and dependency lists
- Feedback for AI model improvement
- Items flagged for additional human discussion

**Review Best Practices:**

- Don't blindly accept all AI suggestions
- Use AI as a second pair of eyes, not a replacement
- Combine AI insights with human judgment and context
- Provide feedback to improve AI over time
- Focus on high-impact AI recommendations first
- Use AI to scale review capacity, not replace expertise

**AI-Human Collaboration Matrix:**

| Task | AI Strength | Human Strength | Best Approach |
| --- | --- | --- | --- |
| Pattern Recognition | High | Medium | AI identifies, human validates |
| Context Understanding | Low | High | Human reviews with AI assistance |
| Consistency Checking | High | Medium | AI checks, human resolves conflicts |
| Risk Assessment | Medium | High | AI flags, human assesses and mitigates |
| Dependency Detection | Medium | High | AI detects, human confirms and adds context |
| Creative Solutions | Low | High | Human creates, AI suggests alternatives |

---

## Outputs

| Output | Destination | Description |
| --- | --- | --- |
| Enhanced Work Items | Step 3 | Work items with AI enhancements |
| AI Suggestions | Development Team | Recommendations for consideration |
| Identified Risks | Risk Register | AI-detected potential risks |

---

## Quality Gates / Exit Criteria

- [ ] AI analysis completed
- [ ] Suggestions reviewed by human
- [ ] Critical suggestions addressed
- [ ] Work items updated as appropriate

---

## AI/Automation Augmentation

| Capability | Tool/Service | Description |
| --- | --- | --- |
| Copilot Review | GitHub Copilot | AI-assisted code and content review |
| WorkItem Intelligence | Streamline ACT MCP Layer | Intelligent work item analysis |

---

## Observability & Metrics

| Reference | Type | Description |
| --- | --- | --- |

---

## Related Artefacts

- AI Suggestion Log
- Copilot Configuration

---

## RACI Matrix

| Role | Responsibility |
| --- | --- |
| **Responsible** | AI/Automation |
| **Accountable** | Development Lead |
| **Consulted** | Product Owner, Architecture |
| **Informed** | Development Team |

---

## Related Steps

- **Upstream:** Step 1: Design Stakeholders
- **Downstream:** Step 3: Architecture Artefact Store

---

## Revision History

| Version | Date | Author | Changes |
| --- | --- | --- | --- |
| 1 | 2026-03-25 | Simon Armstrong | Initial draft |

---

## Navigation

|
 |