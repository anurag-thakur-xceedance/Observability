# Step 09: PR META Design Feedback

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 9 |
| **Phase** | Planning (Azure DevOps or Jira) |
| **Previous Step** | Step 8: Resource Timeline Suggester |
| **Next Step** | Step 10: Architecture Design |
| **Responsible Role(s)** | AI/Automation, Development Team |
| **Tools** | WorkItem Intelligence, PR META |

---

## Purpose

Intelligent analysis of pull request metadata and patterns to provide design feedback. PR META uses WorkItem Intelligence to correlate code changes with work items and identify design improvements. This proactive analysis helps teams learn from past patterns and improve future designs before development begins.

---

## Process Flow

```mermaid graph TD A[Historical PR Data] --> B[9.1 PR Pattern Analysis] B --> C[9.2 Design Correlation] C --> D[9.3 Feedback Generation] D --> E[9.4 Work Item Update] E --> F[9.5 Design Recommendation] F --> G[Design Insights] G --> H[Architecture Phase] ```

---

## Inputs

| Input | Source | Description |
| --- | --- | --- |
| Resource Suggestions | Step 8 | AI resource recommendations |
| Historical PR Data | Repository | Past pull request patterns |
| Work Item Links | Azure DevOps or Jira | Work item to PR correlations |

---

## Activities

### 9.1 PR Pattern Analysis

**Owner:** AI/Automation
**Duration:** 10-15 minutes (automated)

#### Process Steps:

1. **Collect Historical PR Data**

- Gather pull request history from repository: - Last 6-12 months of merged PRs - PR metadata (title, description, labels, reviewers) - PR metrics (size, review time, iteration count) - Code change statistics (files changed, lines added/removed) - Review comments and discussions - Linked work items and commits - Filter relevant PRs: - Exclude automated PRs (dependabot, etc.) - Focus on feature and bugfix PRs - Include refactoring and technical debt PRs

1. **Analyze PR Size Patterns**

- Calculate PR size metrics: - **Lines Changed:** Total additions + deletions - **Files Modified:** Number of files touched - **Complexity Score:** Cyclomatic complexity changes - Identify size patterns: - Small PRs (<200 lines): Faster review, lower risk - Medium PRs (200-500 lines): Moderate review time - Large PRs (500-1000 lines): Slow review, higher risk - Extra Large PRs (>1000 lines): Very slow, high risk - Calculate correlations: - PR size vs. review time - PR size vs. defect rate - PR size vs. iteration count

1. **Analyze Review Patterns**

- Extract review metrics: - **Time to First Review:** From PR creation to first comment - **Time to Approval:** From creation to approval - **Review Iterations:** Number of revision cycles - **Reviewer Count:** Number of reviewers involved - **Comment Density:** Comments per 100 lines of code - Identify bottlenecks: - PRs with delayed reviews - PRs requiring many iterations - PRs with specific reviewer dependencies - PRs blocked on clarifications

1. **Identify Code Change Patterns**

- Analyze what types of changes occur together: - Frontend + Backend changes (common pattern) - Database schema + migration scripts - API changes + documentation updates - Configuration changes + code changes - Detect change hotspots: - Files frequently changed together - Components with high change frequency - Areas with frequent bugs or rework - Calculate coupling metrics: - Logical coupling (files changed together) - Temporal coupling (changes in same timeframe)

1. **Extract Work Item Correlation**

- Link PRs to work items: - Parse PR descriptions for work item IDs - Extract links from branch names - Use Azure DevOps or Jira API to fetch linked items - Analyze work item patterns: - Story size vs. PR size correlation - Story points vs. actual PR complexity - Work item type vs. PR characteristics - Epic/Feature groupings and PR patterns

1. **Detect Anti-Patterns**

- Identify problematic patterns: - **God PRs:** Massive changes (>1000 lines) - **Scope Creep:** PRs addressing multiple unrelated items - **Missing Tests:** Code changes without test coverage - **Missing Documentation:** API changes without doc updates - **Long-Lived Branches:** PRs open for weeks - **High Churn:** Files changed repeatedly in short time - Calculate anti-pattern frequency and impact

**PR Pattern Analysis Report Template:**

| Pattern Category | Metric | Average | Best Practice | Gap | Trend |
| --- | --- | --- | --- | --- | --- |
| PR Size | Lines changed per PR | 425 lines | <300 lines | +125 lines | ⚠️ Increasing |
| PR Size | Files changed per PR | 8 files | <5 files | +3 files | ➡️ Stable |
| Review Time | Time to first review | 4.2 hours | <2 hours | +2.2 hours | ✅ Improving |
| Review Time | Time to approval | 18 hours | <24 hours | ✅ Within target | ✅ Good |
| Review Quality | Review iterations | 2.3 cycles | <2 cycles | +0.3 cycles | ➡️ Stable |
| Test Coverage | PRs with tests | 78% | >90% | -12% | ⚠️ Declining |

**Anti-Pattern Detection:**

| Anti-Pattern | Occurrences (Last 3 Months) | Impact | Example PRs | Recommendation |
| --- | --- | --- | --- | --- |
| God PRs (>1000 lines) | 12 PRs | High | PR#456, PR#489 | Break down into smaller PRs |
| Missing Tests | 22 PRs | High | PR#501, PR#512 | Enforce test coverage checks |
| Scope Creep | 8 PRs | Medium | PR#478 | Single responsibility per PR |
| Long-Lived Branches | 15 PRs | Medium | PR#445 (21 days) | Encourage frequent integration |

---

### 9.2 Design Correlation

**Owner:** AI/Automation
**Duration:** 10-15 minutes (automated)

#### Process Steps:

1. **Link PRs to Architecture Decisions**

- Correlate PRs with ADRs (Architecture Decision Records): - Parse PR descriptions for ADR references - Detect code patterns matching ADR implementations - Identify PRs implementing specific decisions - Analyze alignment: - PRs following documented architecture - PRs deviating from architectural guidelines - PRs introducing new patterns not in ADRs

1. **Analyze Design Pattern Usage**

- Detect design patterns in code: - **Creational:** Singleton, Factory, Builder - **Structural:** Adapter, Facade, Decorator - **Behavioral:** Observer, Strategy, Command - Track pattern evolution: - New patterns introduced - Existing patterns refactored - Pattern consistency across codebase - Identify pattern misuse or anti-patterns

1. **Correlate Changes with Components**

- Map PRs to architecture components: - Frontend (UI, Components, State Management) - Backend (API, Business Logic, Services) - Data Layer (Database, Caching, Storage) - Infrastructure (Config, Deployment, Monitoring) - Analyze component change frequency: - High-change components (potential instability) - Stable components (mature, well-designed) - Cross-cutting changes (affecting multiple layers)

1. **Identify Design Debt**

- Detect design debt indicators: - **High Coupling:** Changes ripple across many files - **Low Cohesion:** Unrelated changes in same component - **Duplicate Code:** Similar code in multiple PRs - **Complex Methods:** High cyclomatic complexity - **Missing Abstractions:** Repeated patterns not abstracted - Calculate design debt metrics: - Technical debt ratio - Code duplication percentage - Average component coupling - Cohesion scores per module

1. **Analyze Refactoring Patterns**

- Track refactoring activities: - Rename refactorings (improving clarity) - Extract method/class (improving modularity) - Move class/method (improving organization) - Simplify conditionals (reducing complexity) - Measure refactoring impact: - Complexity reduction achieved - Readability improvements - Test coverage changes - Bug introduction rate post-refactoring

1. **Generate Design Insights**

- Synthesize findings into insights: - Architectural alignment score - Design pattern consistency - Component stability analysis - Design debt assessment - Refactoring effectiveness

**Design Correlation Report Template:**

| Work Item | PRs | Component | Design Pattern | ADR Reference | Alignment | Design Debt | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| WI-501 | PR#523 | Auth Service | Strategy Pattern | ADR-012 | ✅ Aligned | Low | Well-structured implementation |
| WI-502 | PR#524, PR#527 | Dashboard UI | Observer Pattern | ADR-008 | ⚠️ Partial | Medium | 2 PRs indicate scope underestimation |
| WI-503 | PR#525 | Database Layer | Repository Pattern | ADR-015 | ❌ Deviation | High | Used ORM directly, bypassing repository |

**Component Change Frequency:**

| Component | PRs (Last 3 Months) | Change Type | Stability Score | Risk Level | Recommendation |
| --- | --- | --- | --- | --- | --- |
| Auth Service | 8 PRs | Feature + Bug | 7/10 (Stable) | ✅ Low | Continue current approach |
| Dashboard UI | 23 PRs | Mostly Feature | 5/10 (Moderate) | ⚠️ Medium | Consider refactoring for stability |
| Payment Gateway | 4 PRs | Bug fixes | 6/10 (Stable) | ✅ Low | Mature component |
| User Profile | 31 PRs | High churn | 3/10 (Unstable) | ⚠️ High | Refactoring needed, design issues |

---

### 9.3 Feedback Generation

**Owner:** AI/Automation
**Duration:** 10-15 minutes (automated)

#### Process Steps:

1. **Synthesize Analysis Results**

- Combine insights from: - PR pattern analysis (9.1) - Design correlation findings (9.2) - Historical performance data - Team velocity and quality metrics - Identify key themes: - Recurring issues - Positive patterns to reinforce - Areas needing improvement - Opportunities for optimization

1. **Generate Pattern-Based Feedback**

- Create feedback for common patterns: - **Large PRs:** "Work item WI-502 historically generates 500+ line PRs. Consider breaking into smaller stories." - **Cross-Component Changes:** "This work item affects 3 components. Plan for coordination and integration testing." - **High-Risk Areas:** "Changes to User Profile component have 15% bug rate. Extra QA attention recommended." - **Testing Gaps:** "Similar work items had missing test coverage. Ensure comprehensive test plan."

1. **Prioritize Feedback by Impact**

- Rank feedback items: - **Critical:** High impact on delivery or quality - **High:** Significant impact, should address - **Medium:** Moderate impact, consider addressing - **Low:** Minor improvement opportunity - Focus on actionable items: - Specific, not generic - Tied to concrete data - Include suggested actions - Reference relevant examples

1. **Generate Predictive Warnings**

- Use ML models to predict risks: - **PR Size Prediction:** "Based on requirements, expect 3 PRs totaling 800-1000 lines" - **Review Time Prediction:** "Estimated 2-3 days for code review based on complexity" - **Defect Probability:** "35% chance of post-release defect based on similar changes" - **Rework Likelihood:** "Medium risk of rework due to unclear acceptance criteria" - Provide confidence levels for predictions

1. **Create Recommendations for Improvement**

- Suggest specific improvements: - Story decomposition strategies - Test coverage requirements - Documentation needs - Review checklist items - Architectural considerations - Link to best practices and examples: - "See PR#445 for good example of test coverage" - "Refer to ADR-012 for authentication pattern" - "Follow component structure in module X"

1. **Format Feedback for Consumption**

- Structure feedback clearly: - Executive summary (key points) - Detailed findings with data - Specific recommendations - Action items with owners - Supporting evidence and links - Use visualization: - Charts showing trends - Heatmaps for high-risk areas - Comparison tables

**Feedback Report Template:**

### Work Item: WI-502 - Dashboard Redesign

**Executive Summary:**

⚠️ Medium Risk | 2 Action Items | Based on 15 similar historical work items

**Key Findings:**

1. **PR Size Risk** (Priority: High)

- **Finding:** Similar dashboard changes averaged 650 lines across 2.3 PRs - **Impact:** 40% of large UI PRs required rework after initial review - **Recommendation:** Break into smaller PRs focusing on individual dashboard widgets - **Evidence:** PR#401, PR#425, PR#467 all required significant rework

1. **Testing Gap** (Priority: High)

- **Finding:** 30% of dashboard PRs had missing integration tests - **Impact:** Led to 3 production incidents in Q1 2026 - **Recommendation:** Create comprehensive test plan including E2E tests - **Evidence:** Incidents INC-234, INC-267, INC-289

1. **Cross-Component Coordination** (Priority: Medium)

- **Finding:** Dashboard changes typically require backend API updates - **Impact:** 18-hour average delay when coordination not planned - **Recommendation:** Coordinate with backend team early, align PR timing - **Evidence:** PR#445 delayed 2 days waiting for API changes

**Predictive Insights:**

| Prediction | Confidence | Details |
| --- | --- | --- |
| PR Size | 85% | Expect 2-3 PRs, 600-800 total lines |
| Review Time | 78% | 3-4 days total review time |
| Defect Risk | 65% | Medium risk (similar to 40% of past dashboard changes) |
| Test Coverage | 72% | Will achieve 75-80% coverage based on pattern |

**Recommended Actions:**

1. ✅ **Decompose Story** (Owner: Product Owner)

- Break into 3 smaller stories: Widget A, Widget B, Dashboard Layout - Each story should be <5 story points

1. ✅ **Define Test Strategy** (Owner: QA Lead)

- Unit tests for each widget component - Integration tests for data fetching - E2E tests for critical user flows

---

### 9.4 Work Item Update

**Owner:** AI/Automation
**Duration:** 5-10 minutes (automated)

#### Process Steps:

1. **Attach PR META Analysis to Work Items**

- Add analysis results to Azure DevOps or Jira work items: - Comment with key findings - Attach detailed analysis report - Add tags for risk level - Update custom fields (if configured) - Ensure visibility: - Notify assigned developer - Notify Scrum Master - Update work item state if needed

1. **Add Risk Labels and Tags**

- Apply relevant tags: - `pr-meta-high-risk` for high-risk items - `pr-meta-large-pr` for expected large PRs - `pr-meta-cross-component` for multi-component work - `pr-meta-testing-focus` for items needing extra test attention - Update risk fields: - Risk level (High/Medium/Low) - Risk description - Mitigation suggestions

1. **Update Acceptance Criteria**

- Enhance acceptance criteria based on insights: - Add specific test coverage requirements - Include performance benchmarks - Specify documentation needs - Add code review checkpoints - Example additions: - "Test coverage >80% for new components" - "PR size <400 lines (consider breaking down)" - "Include API documentation updates"

1. **Link Related Historical PRs**

- Add references to relevant past PRs: - Similar work items and their PRs - Good examples to follow - Examples of issues to avoid - Format links clearly: - "Similar implementation: PR#445" - "Good test example: PR#467" - "Avoid pattern from: PR#401 (led to rework)"

1. **Update Effort Estimates**

- Adjust estimates based on PR META insights: - If predictions show larger scope than estimated - If testing gaps identified requiring more work - If complexity higher than initial assessment - Document adjustment rationale: - Original estimate - PR META prediction - Recommended revised estimate - Justification

1. **Create Sub-Tasks if Needed**

- Break down work items with high complexity: - Create sub-tasks for each PR - Create specific testing sub-tasks - Create documentation sub-tasks - Link to parent work item: - Maintain traceability - Track progress granularly

**Work Item Update Template:**

```markdown

## PR META Analysis - Added March 10, 2026

### Summary

⚠️ Medium Risk | Expected 2-3 PRs | Extra testing attention needed

### Key Insights

1. **PR Size:** Historical similar work averages 650 lines across 2.3 PRs
2. **Testing Gap Risk:** 30% of similar items had missing tests
3. **Cross-Component:** Backend coordination needed

### Recommendations

- ✅ Break into smaller stories (<400 lines per PR)
- ✅ Define comprehensive test plan upfront
- ✅ Coordinate with backend team for API changes

### Historical References

- Good example: PR#445 (well-structured, good tests)
- Avoid pattern: PR#401 (too large, required rework)

### Predictive Metrics

- Estimated PR size: 600-800 lines
- Estimated review time: 3-4 days
- Defect risk: Medium (35% probability)

See attached detailed report for full analysis. ```

---

### 9.5 Design Recommendation

**Owner:** AI/Automation with Architecture Review
**Duration:** 15-30 minutes (automated analysis + human review)

#### Process Steps:

1. **Generate Architecture Recommendations**

- Suggest architectural approaches based on patterns: - Recommended design patterns for the work type - Component structure suggestions - API design considerations - Data modeling recommendations - Reference existing architecture: - Link to relevant ADRs - Point to similar implementations - Highlight reusable components

1. **Suggest Code Organization**

- Recommend code structure: - File organization patterns - Module/package structure - Naming conventions - Folder hierarchy - Based on successful past patterns: - "Organize like component X (PR#445)" - "Follow pattern from ADR-012" - "Use service structure from module Y"

1. **Recommend Testing Strategies**

- Suggest comprehensive test approach: - **Unit Tests:** What to unit test, coverage targets - **Integration Tests:** Key integration points - **E2E Tests:** Critical user flows - **Performance Tests:** Load/stress testing needs - Provide test examples: - Link to well-tested similar features - Suggest test frameworks or libraries - Recommend test data strategies

1. **Identify Reusability Opportunities**

- Detect opportunities to reuse existing code: - Similar functionality already implemented - Shared components that can be extended - Common utilities that can be leveraged - Patterns that can be abstracted - Recommend refactoring if needed: - Extract shared logic before implementing - Consolidate duplicate code - Create abstractions for common patterns

1. **Document Quality Requirements**

- Specify documentation needs: - API documentation (OpenAPI/Swagger) - Inline code comments for complex logic - README updates for new features - Architecture diagram updates - Runbook/operational guide updates - Reference documentation standards: - Link to documentation templates - Highlight good examples

1. **Create Design Recommendation Report**

- Compile comprehensive recommendations: - Prioritized by importance - Actionable and specific - Include rationale and evidence - Link to examples and references - Distribute to stakeholders: - Add to work item - Notify Architecture team - Share with assigned developer

**Design Recommendation Report Template:**

### Design Recommendations: WI-502 - Dashboard Redesign

**Architecture Recommendations:**

1. **Component Structure** (Priority: High)

- **Recommendation:** Use component composition pattern - **Rationale:** Dashboard has 5 distinct widgets; composition enables reusability - **Reference:** See Dashboard v1 implementation (PR#301), ADR-018 - **Example Code Structure:** ``` /components /Dashboard DashboardContainer.tsx /widgets WidgetA.tsx WidgetB.tsx WidgetC.tsx /shared WidgetFrame.tsx ```

1. **State Management** (Priority: High)

- **Recommendation:** Use Redux Toolkit with normalized state - **Rationale:** Multiple widgets sharing data; avoid prop drilling - **Reference:** ADR-022 (State Management Strategy) - **Anti-Pattern to Avoid:** Local state in each widget (caused issues in PR#401)

1. **Data Fetching** (Priority: Medium)

- **Recommendation:** Use React Query for server state - **Rationale:** Built-in caching, automatic refetching, better UX - **Reference:** Successfully implemented in Analytics Dashboard (PR#445)

**Testing Strategy:**

| Test Type | Coverage Target | Key Areas | Example Reference |
| --- | --- | --- | --- |
| Unit Tests | >80% | Widget components, state logic | PR#445 tests |
| Integration Tests | All data flows | API integration, Redux actions | PR#467 tests |
| E2E Tests | Critical paths | User can view all widgets, refresh data | Cypress suite in /e2e |
| Visual Tests | Key views | Dashboard layout, responsive design | Storybook stories |

**Code Quality Checklist:**

- [ ] Follow component structure from ADR-018
- [ ] Implement error boundaries for each widget
- [ ] Add loading states for async operations
- [ ] Include accessibility attributes (ARIA labels)
- [ ] Responsive design (mobile, tablet, desktop)
- [ ] Performance optimization (lazy loading, memoization)
- [ ] Documentation (JSDoc for components)

**Reusability Opportunities:**

1. **Existing Components to Reuse:**

- `WidgetFrame` component from Analytics Dashboard - `DataRefreshButton` from Reporting module - `EmptyState` component from shared library

1. **Consider Creating:**

- Generic `WidgetContainer` component (could benefit 3+ future dashboards) - Dashboard layout hook (`useDashboardLayout`)

**Estimated Complexity:**

- **Overall:** Medium-High
- **New Code:** 600-800 lines (predicted)
- **Reused Code:** 200-300 lines (from existing components)
- **Test Code:** 400-500 lines (for comprehensive coverage)

---



---

## Best Practices

### ✅ DO

- **Act on PR META insights early** - Review feedback during planning, not just before coding
- **Use historical data as a guide** - Learn from past patterns to avoid repeating issues
- **Validate predictions with team** - Discuss PR META findings with developers for context
- **Break down large predicted PRs** - If analysis predicts >500 lines, decompose the work item
- **Focus on high-priority feedback** - Address critical and high-impact items first
- **Link to good examples** - Reference successful past PRs as templates
- **Track prediction accuracy** - Monitor how actual PRs compare to predictions
- **Update estimates based on insights** - Adjust story points when PR META reveals complexity
- **Create test plans proactively** - Address testing gaps identified in analysis
- **Share learnings with team** - Use retrospectives to discuss PR META insights

### ❌ DON'T

- **Ignore high-risk warnings** - PR META flags are based on real historical data
- **Treat predictions as absolute** - They are estimates with confidence levels, not certainties
- **Skip human review** - AI analysis augments, doesn't replace, human judgment
- **Dismiss developer expertise** - Developers know context AI doesn't have
- **Blindly follow all recommendations** - Prioritize based on impact and effort
- **Over-engineer based on predictions** - Balance preparation with YAGNI principle
- **Use PR META as blame tool** - Focus on learning and improvement, not criticism
- **Neglect to update work items** - PR META insights are valuable only if accessible
- **Forget to close the loop** - After delivery, validate if predictions were accurate
- **Apply recommendations without context** - Consider specific work item circumstances

---

## Outputs

| Output | Destination | Description |
| --- | --- | --- |
| PR META Analysis | Step 10 | PR pattern analysis results |
| Design Recommendations | Architecture | Suggestions for design improvements |
| Updated Work Items | Azure DevOps or Jira | Items with PR META insights |

---

## Quality Gates / Exit Criteria

- [ ] PR pattern analysis completed
- [ ] Design correlations identified
- [ ] Recommendations generated
- [ ] Work items updated

---

## AI/Automation Augmentation

| Capability | Tool/Service | Description |
| --- | --- | --- |
| PR META | WorkItem Intelligence | PR metadata analysis and design feedback |
| Design Feedback | AI/ML Models | Pattern-based design recommendations |

---

## Observability & Metrics

| Reference | Type | Description | Target |
| --- | --- | --- | --- |
| D5 | DORA | Time From Inception to PR | Track if PR META reduces time by enabling better planning |
| PR-1 | PR META | Prediction Accuracy Rate | >80% (predicted vs. actual PR size/complexity) |
| PR-2 | PR META | Early Risk Detection Rate | >85% (issues flagged before coding) |
| PR-3 | Quality | Defect Rate Reduction | -20% (compared to items without PR META) |
| PR-4 | Quality | PR Rework Rate | <15% (PRs requiring significant rework after review) |
| PR-5 | Efficiency | Average PR Size | <400 lines (move toward smaller PRs) |
| PR-6 | Efficiency | Review Time Improvement | -25% (faster reviews due to better preparation) |
| PR-7 | Process | Test Coverage Rate | >85% (items with comprehensive test plans) |
| PR-8 | Process | Recommendation Adoption Rate | >70% (design recommendations followed) |
| PR-9 | Outcome | Sprint Completion Rate | >90% (better estimates from PR META) |

---

## Related Artefacts

- PR META Analysis Report
- Design Recommendation Log

---

## RACI Matrix

| Role | Responsibility |
| --- | --- |
| **Responsible** | AI/Automation |
| **Accountable** | Development Lead |
| **Consulted** | Architecture, Development Team |
| **Informed** | Product Owner |

---

## Related Steps

- **Upstream:** Step 8: Resource Timeline Suggester
- **Downstream:** Step 10: Architecture Design

---

## Revision History

| Version | Date | Author | Changes |
| --- | --- | --- | --- |
| 1 | 2026-03-25 | Simon Armstrong | Initial draft |

---

## Navigation

|
 |