[Previous: Step 20 - Unit Testing](Step-20-Unit-Testing.md) | [Next: Step 22 - Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md)

# Step 21: Test Reviewer Additions

| **Attribute** | **Value** |
|---|---|
| Document Owner | Simon Armstrong, VP Chief Architect |
| Approved By | Simon Armstrong (pending wider review) |
| Classification | Internal |
| Review Frequency | Half-Yearly |
| Next Review Due | 2026-12-01 |

## 21.1 Overview
| **Attribute** | **Value** |
|---|---|
| Responsible Roles | Development Team, QA Team |
| Accountable | QA Lead or Development Lead |
| Supporting Roles | Technical Architect, Solution Architect |
| Tools | Coverage tooling, CI/CD platform, approved AI assistant, test framework |


## 21.2 Purpose
Step 21 strengthens the unit test baseline by reviewing the implemented test suite for coverage gaps, weak assertions, missing edge cases, and overlooked risk scenarios. It is the quality-improvement work item that follows initial test creation and helps ensure that the change is sufficiently protected before formal code review progresses further.

This step exists to improve test adequacy, not simply to increase test count. The expected outcome is a more effective and defensible test suite that better reflects the real behavioural risk of the change.


## 21.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| Unit test suite | Step 20 | Initial automated tests created or updated for the change. |
| Coverage report | Step 20 and CI/CD platform | Current line, branch, and execution coverage evidence. |
| Implemented code | Step 20 | The code under review for missing behavioural coverage. |
| Test strategy | Step 13 | Approved testing expectations and quality thresholds. |
| Approved work scope | Sprint backlog and work items | Scope against which missing test scenarios are assessed. |


## 21.4 Activities
### 21.4.1 Review Coverage Gaps
The team reviews coverage reports and implemented logic to identify code paths that remain untested or under-tested.

Coverage review must consider:
- Untested methods or functions
- Unexecuted decision branches
- Exception and fallback paths
- Validation failures and boundary conditions
- Risky code added in the current change set

### 21.4.2 Evaluate Test Quality
The review must assess whether existing tests are meaningful, maintainable, and likely to detect defects.

The review should check for:
- Weak or overly broad assertions
- Tests that only verify implementation detail
- Excessive mocking that hides true behaviour
- Poor test naming or unclear purpose
- Unstable, duplicated, or order-dependent tests

### 21.4.3 Add Missing High-Value Tests
Where important scenarios are missing, the team adds or updates tests to cover the required behaviour before the change proceeds further.

Priority should be given to:
- Business-critical decision paths
- Security-sensitive or validation-heavy logic
- Defect-prone edge cases
- Regression-prone areas changed in the current work item

### 21.4.4 Review AI-Assisted Suggestions
Where approved AI assistance is used, generated suggestions must be reviewed critically before adoption.

The team must confirm that suggested tests are:
- Relevant to the implemented change
- Technically correct
- Maintainable under team standards
- Not duplicating existing coverage

### 21.4.5 Confirm Test Readiness
The developer or assigned test reviewer confirms that the revised test suite is ready for downstream review and quality controls.


## 21.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| Strengthened test baseline | Source control repository and CI/CD platform | The test suite is improved to better cover important behaviours, quality issues, and missing scenarios. |
| Review-driven quality evidence | CI/CD platform and engineering records | Coverage analysis, suggestion review, and test-improvement evidence are available for downstream review. |
| Downstream review readiness | Downstream review steps | The revised test baseline is sufficiently improved to support subsequent maintainability and code review activities. |


## 21.6 Key Artifacts
**Inputs:**
- Unit test code from Step 20
- Code coverage report
- Test execution results
- Test strategy and quality expectations from Step 13
- Approved work item scope and acceptance criteria

**Outputs:**
- Test review report covering identified coverage gaps and quality issues
- Additional test suggestions with prioritization and review decisions
- Edge case catalog of missing or newly identified behavioural scenarios
- Accepted test updates added directly to the change set or tracked for immediate action
- Review evidence showing which suggestions were accepted, rejected, or deferred


## 21.7 Quality Gates / Exit Criteria
- [ ] Coverage gaps have been reviewed against the implemented scope.
- [ ] High-risk missing scenarios have been added or explicitly justified.
- [ ] Weak or low-value tests have been improved where necessary.
- [ ] Test suite remains stable and executable after updates.
- [ ] The change is ready to proceed to Step 22 and subsequent review controls.

Exit Criteria: Test review report is complete, accepted suggestions are actioned or recorded, and the revised test suite is ready for downstream review.


## 21.8 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| Coverage analysis | Coverage tooling and CI/CD platform | Identifies untested lines, branches, and execution patterns. |
| Test suggestion support | Approved AI assistant | Suggests additional test scenarios, edge cases, and assertion improvements. |
| Automated execution | CI/CD pipeline | Confirms that the updated test suite remains stable after additions. |


## 21.9 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| Coverage Gaps Identified | 5-15 per review | Coverage tooling, CI analysis, and review notes | Gaps found through automated and reviewer-led analysis of the test suite. |
| Test Suggestions Generated | 10-30 per review | AI assistant output and review records | Additional tests suggested based on coverage, code risk, and defect patterns. |
| Suggestion Acceptance Rate | 60-80% | Accepted suggestions divided by total suggestions reviewed | Indicates whether generated suggestions are relevant and valuable to the team. |
| Coverage Improvement | +5-10% where meaningful gaps exist | Before-and-after coverage reports in CI/CD and quality records | Increase in useful line or branch coverage after test additions. |
| Review Time | Less than 30 minutes for analysis and triage | Review timestamps, work item records, or review session notes | Time required to complete automated analysis and human review of suggestions. |
| High-Risk Gaps Closed | All critical gaps addressed or explicitly justified | Review checklist and updated test evidence | Ensures important missing scenarios are not left unresolved before code review. |
| Test Stability | 100% stable in approved execution path | CI test runs and rerun history | Confirms that revised tests remain repeatable and do not introduce flakiness. |
| Defect Reduction Trend | Reduction over time across sprint and release cycles | QA defect records, escape analysis, and retrospective review | Measures whether stronger test review is reducing downstream defects. |


## 21.10 Best Practices
**DO:**
- Review AI suggestions critically and confirm that they add meaningful value.
- Prioritize suggestions by risk, business impact, and defect likelihood.
- Implement high-value suggestions immediately where they protect important behaviour.
- Document reasons for rejecting suggestions or deferring lower-value additions.
- Use reviewer-driven test improvement as a learning opportunity for future implementation quality.

**DON'T:**
- Accept all AI suggestions blindly without technical and behavioural validation.
- Ignore meaningful coverage gaps identified through analysis.
- Add tests just to increase coverage numbers without improving confidence.
- Skip human review of suggestions because the analysis is automated.
- Dismiss edge cases as unlikely without considering operational or business risk.


## 21.11 Summary and Key Outcomes
Step 21 strengthens the test suite by combining automated analysis with human review to identify coverage gaps, improve assertion quality, and add missing high-value scenarios before formal code review progresses further.

Key Outcomes:
- Coverage gaps are identified and addressed or explicitly justified.
- Additional high-value test scenarios are generated and reviewed.
- Edge cases and overlooked behavioural risks are surfaced earlier in the development lifecycle.
- Test quality improves through stronger assertions, better structure, and more meaningful coverage.
- Downstream review and QA receive a more robust and defensible test baseline.


## 21.12 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| Responsible | Development Team, QA Team |
| Accountable | QA Lead or Development Lead |
| Consulted | Technical Architect, Solution Architect |
| Informed | Reviewers, Engineering Manager |


## 21.13 Related Steps
- **Upstream:** [Step 20: Unit Testing](Step-20-Unit-Testing.md)
- **Downstream:** [Step 22: Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md)


## 21.14 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| 0.1 | 5 May 2026 | Anurag Thakur | Initial draft for Review |

[Previous: Step 20 - Unit Testing](Step-20-Unit-Testing.md) | [Next: Step 22 - Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md)
