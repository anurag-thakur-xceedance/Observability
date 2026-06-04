[Previous: Step 24 - Linting](Step-24-Linting.md) | [Next: Step 26 - Code Review Continued](Step-26-Code-Review-Continued.md)

# Step 25: Code Review

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |

## 25.1 Overview
| **Attribute** | **Value** |
|---|---|
| **Responsible Roles** | Development Team, Reviewers |
| **Accountable** | Development Lead |
| **Supporting Roles** | Security Engineer, Technical Architect, QA Lead |
| **Tools** | Source control platform, review workflow, approved AI assistant |


## 25.2 Purpose
Step 25 provides the primary human quality control within the development phase. It validates correctness, maintainability, security, architectural alignment, and readiness beyond what automated checks can confirm.

The purpose of code review is not only to approve code, but to improve the change and reduce delivery risk before merge progression continues.


## 25.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| **Lint-compliant pull request** | Step 24 | Pull request that has passed the automated linting gate. |
| **Implemented code and tests** | Steps 20-24 | The change set, test suite, and automated check results under review. |
| **Architecture and design guidance** | Phase 02 and work item records | Approved design expectations and constraints. |
| **Review policy** | Engineering standards | Team review rules, approval thresholds, and escalation expectations. |


## 25.4 Activities
### 25.4.1 Review Functional Correctness
Reviewers assess whether the implementation satisfies the approved scope and whether the logic is correct.

Reviewers should evaluate:
- **Logic Correctness:** Whether the code does what it is intended to do.
- **Edge-Case Handling:** Boundary conditions and unusual scenarios.
- **Error Handling:** Whether failures are handled appropriately and predictably.
- **Acceptance Alignment:** Alignment to approved acceptance criteria and technical expectations.

Typical functional review checks include:
- [ ] Logic is correct and handles expected edge cases
- [ ] Error handling is appropriate
- [ ] The change matches the approved work scope

### 25.4.2 Review Quality and Maintainability
Reviewers assess readability, cohesion, duplication, structure, and long-term maintainability.

Maintainability review should consider:
- **Readability:** Whether the code is readable and self-documenting without relying on excessive explanation.
- **Cohesion:** Whether functions and classes are small, focused, and aligned to a single concern.
- **Duplication:** Reuse opportunities and adherence to the DRY principle.
- **Design Quality:** Appropriateness of design patterns and SOLID principles.
- **Performance:** Obvious performance concerns where visible in the code.
- **Control Flow:** Whether the implementation is easy to reason about.
- **Naming Clarity:** Whether variable, function, class, and module names support maintainability.
- **Testability:** Whether the structure supports maintainable automated tests.

Typical quality checks include:
- [ ] Code is readable and self-documenting
- [ ] Functions are small and focused
- [ ] No unnecessary duplication exists and the DRY principle is respected
- [ ] The design is appropriate for the change
- [ ] Performance concerns are acceptable for the expected usage
- [ ] Naming and structure support long-term maintainability
- [ ] The code is testable and does not create avoidable maintenance burden

### 25.4.3 Review Security and Risk Concerns
Reviewers inspect for insecure practices, missing validation, inappropriate access assumptions, or other risks that require correction.

Check for security issues:
- **Input Validation:** User inputs are validated and sanitised.
- **Authentication/Authorization:** Proper access controls are implemented.
- **Data Protection:** Sensitive data is encrypted, protected, and handled safely.
- **SQL Injection:** Parameterized queries or equivalent safe data-access patterns are used.
- **XSS:** Output encoding or equivalent output-safety controls are applied.

Typical security red flags include:
- **Hardcoded Credentials:** Secrets or credentials embedded directly in code or configuration.
- **Unvalidated Input:** User-controlled input accepted without appropriate validation or sanitisation.
- **Missing Authorisation:** Access-control checks not enforced where required.
- **Unsafe Query Construction:** Direct query building or equivalent insecure data-access patterns.
- **Sensitive Logging:** Sensitive data exposed through logs or diagnostics.

### 25.4.4 Provide Actionable Feedback
Comments should be specific, respectful, and prioritised according to severity and expected action.

Feedback should:
- **Location-Specific:** Reference line numbers or concrete code locations.
- **Risk-Aware:** Explain why the issue matters.
- **Actionable:** Suggest an improvement where possible.
- **Code-Focused:** Focus on the code and risk, not the person.
- **Balanced:** Include useful positive reinforcement where appropriate.

Feedback categories should be used consistently:
- **Must Fix:** Blocking issues preventing approval
- **Should Fix:** Important but not necessarily blocking
- **Nice to Have:** Improvement suggestions
- **Question:** Clarification or discussion point

### 25.4.5 Determine Review Outcome
The review outcome should clearly indicate whether the change is approved, conditionally approved, or requires rework before it can proceed.

Typical review outcomes include:
- **Approve:** Code is acceptable and ready to progress
- **Approve with Comments:** Minor suggestions remain, but the change can proceed
- **Request Changes:** Issues must be addressed before progression
- **Comment:** Discussion continues without final decision yet

Approval readiness should confirm:
- [ ] All required tests are passing
- [ ] No material security concerns remain
- [ ] Code quality is acceptable
- [ ] Standards compliance expectations are met
- [ ] Documentation is adequate for maintainability


## 25.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Review comments** | Pull request workflow | Structured feedback on quality, correctness, risk, and maintainability. |
| **Review decision** | Pull request workflow | Approval, request for changes, or equivalent review state. |
| **Risk findings** | Development Team and engineering records | Issues or concerns requiring rework or clarification. |


## 25.6 Key Artifacts
**Inputs:**
- Pull request with code changes
- Lint report and automated check results from Step 24
- Coding standards, design guidance, and review policy
- Supporting architecture or work-item context where relevant

**Outputs:**
- Review comments and discussion threads
- Approval, conditional approval, or request-for-change outcome
- Recorded risk findings and rework expectations
- Review timestamp and reviewer participation evidence


## 25.7 Quality Gates / Exit Criteria
- [ ] Required reviewers have reviewed the change.
- [ ] Material quality, correctness, and security concerns have been identified.
- [ ] The review outcome is clearly recorded.
- [ ] The change is ready either for rework in Step 26 or for final approval progression.


## 25.8 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Review assistance** | Approved AI assistant | Suggests likely code review focus areas or quality concerns for reviewer consideration. |
| **Reviewer routing support** | Source control workflow | Helps apply code owner or reviewer assignment rules. |
| **Evidence aggregation** | Pull request checks | Brings test, lint, and change evidence into the review context. |


## 25.9 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| **Time to First Review** | <4 hours | Pull request timestamps and reviewer activity records | Time from pull request submission to the first human review. |
| **Review Depth** | >=2 reviewers | Approval records and reviewer participation data | Number of reviewers engaged per pull request. |
| **Review Completion Time** | <24 hours | Pull request review timestamps from first review to final decision | Time from first review to review closure or approval. |
| **Defect Detection** | 3-5 meaningful findings per PR on average | Review comment categorisation and defect trend reporting | Measures whether code review is surfacing substantive issues before merge. |
| **Review Turnaround** | <8 hours on average | Pull request workflow analytics and review cycle reporting | Average active time spent in review before progression. |


## 25.10 Best Practices
**DO:**
- Focus on correctness, risk, and maintainability before style issues already covered by automation.
- Make comments specific and actionable.
- Review with the approved design and acceptance criteria in mind.
- Review within the expected team service window where practical.
- Recognise good implementation decisions as well as issues.

**DON'T:**
- Give rubber-stamp approval without meaningful review.
- Block pull requests over trivial style issues already enforced by automation.
- Approve code that you do not understand.


## 25.11 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, Reviewers |
| **Accountable** | Development Lead |
| **Consulted** | Security Engineer, Technical Architect, QA Lead |
| **Informed** | Engineering Manager, Product Owner |


## 25.12 Related Steps
- **Upstream:** [Step 24: Linting](Step-24-Linting.md)
- **Downstream:** [Step 26: Code Review Continued](Step-26-Code-Review-Continued.md)


## 25.13 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |

[Previous: Step 24 - Linting](Step-24-Linting.md) | [Next: Step 26 - Code Review Continued](Step-26-Code-Review-Continued.md)
