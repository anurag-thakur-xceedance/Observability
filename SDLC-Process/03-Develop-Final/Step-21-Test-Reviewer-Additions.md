[Previous: Step 20 - Unit Testing](Step-20-Unit-Testing.md) | [Next: Step 22 - Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md)

# Step 21: Test Reviewer Additions

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |

## 21.1 Overview
| **Attribute** | **Value** |
|---|---|
| **Responsible Roles** | Development Team, QA Team |
| **Accountable** | QA Lead or Development Lead |
| **Supporting Roles** | Technical Architect, Solution Architect |
| **Tools** | Coverage tooling, CI/CD platform, approved AI assistant, test framework |


## 21.2 Purpose
Step 21 strengthens the unit test baseline by reviewing the implemented test suite for coverage gaps, weak assertions, missing edge cases, and overlooked risk scenarios. It is the quality-improvement work item that follows initial test creation and helps ensure that the change is sufficiently protected before formal code review progresses further.

This step exists to improve test adequacy, not simply to increase test count. The expected outcome is a more effective and defensible test suite that better reflects the real behavioural risk of the change.


## 21.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| **Unit test suite** | Step 20 | Initial automated tests created or updated for the change. |
| **Coverage report** | Step 20 and CI/CD platform | Current line, branch, and execution coverage evidence. |
| **Implemented code** | Step 20 | The code under review for missing behavioural coverage. |
| **Test strategy** | Step 13 | Approved testing expectations and quality thresholds. |
| **Approved work scope** | Sprint backlog and work items | Scope against which missing test scenarios are assessed. |


## 21.4 Activities
### 21.4.1 Review Coverage Gaps
The team reviews coverage reports and implemented logic to identify code paths that remain untested or under-tested.

Coverage review must consider:
- **Untested Methods:** Methods or functions that are not exercised.
- **Unexecuted Branches:** Decision branches that have not been executed.
- **Exception and Fallback Paths:** Error handling and fallback behaviour that remain untested.
- **Validation and Boundary Conditions:** Validation failures and important boundary conditions.
- **Risky New Code:** Risk-prone code added in the current change set.

Typical review output should clearly identify where the gap exists, why it matters, and what additional tests are required.

Coverage Gap Report Example:

```text
Uncovered Code Paths:
- calculateDiscount(): lines 45-52 (error handling for negative prices)
- processRefund(): full refund branch not tested
- validateEmail(): international domain edge case not tested

Recommendation:
Add 3 additional tests to cover the identified gaps.
```

### 21.4.2 Evaluate Test Quality
The review must assess whether existing tests are meaningful, maintainable, and likely to detect defects. This should be understandable as a reviewer activity even when no AI tooling is used.

The review should check for:
- **Weak Assertions:** Weak or overly broad assertions.
- **Implementation-Detail Bias:** Tests that only verify implementation detail.
- **Excessive Mocking:** Excessive mocking that hides true behaviour.
- **Poor Test Naming:** Poor test naming or unclear purpose.
- **Instability or Duplication:** Unstable, duplicated, or order-dependent tests.

Quality review should also consider:
- **Assertion Strength:** Whether a test checks a precise expected outcome rather than a vague truthy result.
- **Test Independence:** Whether one test relies on another having run first.
- **Test Readability:** Clear naming, setup, and intent.
- **Appropriate Mock Usage:** Whether mocks isolate dependencies without hiding important real behaviour.
- **Test Data Quality:** Realistic values and meaningful edge-case coverage.

Common quality issues include:
- **Weak Assertions:** Broad success checks that do not confirm the actual expected value or behaviour.
- **Execution Order Dependence:** Tests that depend on execution order or shared state.
- **Unclear Test Descriptions:** Missing or unclear test descriptions.
- **Over-Mocking:** Too much behaviour is simulated and too little real logic is exercised.

### 21.4.3 Add Missing High-Value Tests
Where important scenarios are missing, the team adds or updates tests to cover the required behaviour before the change proceeds further.

Priority should be given to:
- **Business-Critical Paths:** Business-critical decision paths.
- **Security-Sensitive Logic:** Security-sensitive or validation-heavy logic.
- **Defect-Prone Edge Cases:** Edge cases with a history of defects or elevated risk.
- **Regression-Prone Changed Areas:** Areas changed in the current work item that are prone to regression.

Additional test suggestions may come from reviewer judgment, historical defect patterns, code complexity, or approved AI-assisted analysis, but every suggestion must be validated for relevance before adoption.

### 21.4.4 Identify Edge Cases and Missing Scenarios
The team identifies edge cases and realistic failure scenarios that are commonly missed in initial unit testing.

Typical edge-case categories include:
- Null or missing inputs
- Empty collections or zero-value data
- Boundary values just above or below important thresholds
- Invalid formats, special characters, or unexpected input combinations
- Date, time, and timezone-related conditions where relevant
- Async, retry, timeout, or fallback behaviours where the code uses them

Common missed scenarios should also be considered, including:
- **Special Character Handling:** Unicode, emojis, and SQL injection-style input patterns where relevant to the code being tested.
- **Concurrent Access Behaviour:** Race conditions, shared-state conflicts, and locking issues where the implementation supports parallel execution.
- **Large Dataset Behaviour:** High-volume inputs, including performance-sensitive scenarios such as 1000+ items where scale may affect correctness or stability.

Edge Case Categories:
- **Numeric Boundaries:** 0, -1, maximum integer values, and overflow-related conditions.
- **String Edge Cases:** Empty strings, very long strings, and special-character combinations.
- **Date and Time Edge Cases:** Leap years, time-zone changes, and daylight-saving transitions.
- **Collection Edge Cases:** Empty collections, single-item collections, and duplicate entries.
- **Async Edge Cases:** Timeouts, retries, delayed failures, and fallback execution paths.

### 21.4.5 Review Suggested Additions and Confirm Readiness
Where approved AI assistance is used, generated suggestions must be reviewed critically before adoption. Human review remains mandatory.

The reviewer or QA lead must confirm that suggested tests are:
- **Relevant:** Relevant to the implemented change.
- **Technically Correct:** Technically correct.
- **Maintainable:** Maintainable under team standards.
- **Non-Duplicative:** Not duplicating existing coverage.

The developer or assigned test reviewer then confirms that the revised test suite is ready for downstream review and quality controls.


## 21.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Strengthened test baseline** | Source control repository and CI/CD platform | The test suite is improved to better cover important behaviours, quality issues, and missing scenarios. |
| **Review-driven quality evidence** | CI/CD platform and engineering records | Coverage analysis, suggestion review, and test-improvement evidence are available for downstream review. |
| **Downstream review readiness** | Downstream review steps | The revised test baseline is sufficiently improved to support subsequent maintainability and code review activities. |


## 21.6 Key Artifacts
**Inputs:**
- Unit test code from Step 20
- Code coverage report
- Test execution results
- Test strategy and quality expectations from Step 13
- Approved work item scope and acceptance criteria

**Outputs:**
- Test review report covering identified coverage gaps and quality issues
- Additional test suggestions with prioritisation and review decisions
- Edge case catalog of missing or newly identified behavioural scenarios
- Accepted test updates added directly to the change set or tracked for immediate action
- Review evidence showing which suggestions were accepted, rejected, or deferred


## 21.7 Quality Gates / Exit Criteria
- [ ] Coverage gaps have been reviewed against the implemented scope.
- [ ] High-risk missing scenarios have been added or explicitly justified.
- [ ] Weak or low-value tests have been improved where necessary.
- [ ] Test suite remains stable and executable after updates.
- [ ] The change is ready to proceed to Step 22 and subsequent review controls.

**Exit Criteria:** Test review report is complete, accepted suggestions are actioned or recorded, and the revised test suite is ready for downstream review.


## 21.8 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Coverage analysis** | Coverage tooling and CI/CD platform | Identifies untested lines, branches, and execution patterns. |
| **Test suggestion support** | Approved AI assistant | Suggests additional test scenarios, edge cases, and assertion improvements. |
| **Automated execution** | CI/CD pipeline | Confirms that the updated test suite remains stable after additions. |


## 21.9 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| **Coverage Gaps Identified** | 5-15 per review | Coverage tooling, CI analysis, and review notes | Gaps found through automated and reviewer-led analysis of the test suite. |
| **Test Suggestions Generated** | 10-30 per review | AI assistant output and review records | Additional tests suggested based on coverage, code risk, and defect patterns. |
| **Suggestion Acceptance Rate** | 60-80% | Accepted suggestions divided by total suggestions reviewed | Indicates whether generated suggestions are relevant and valuable to the team. |
| **Coverage Improvement** | +5-10% where meaningful gaps exist | Before-and-after coverage reports in CI/CD and quality records | Increase in useful line or branch coverage after test additions. |
| **Review Time** | <30 minutes for analysis and triage | Review timestamps, work item records, or review session notes | Time required to complete automated analysis and human review of suggestions. |
| **High-Risk Gaps Closed** | 100% of critical gaps addressed or explicitly justified before progression | Review checklist and updated test evidence | Ensures important missing scenarios are not left unresolved before code review. |
| **Test Stability** | 100% stable in approved execution path | CI test runs and rerun history | Confirms that revised tests remain repeatable and do not introduce flakiness. |
| **Defect Reduction Trend** | >=20% reduction in downstream test-related defects over the agreed reporting period | QA defect records, escape analysis, and retrospective review | Measures whether stronger test review is reducing downstream defects. |


## 21.10 Best Practices
**DO:**
- **Review AI Suggestions Critically:** Confirm that they add meaningful value.
- **Prioritise by Risk and Impact:** Prioritise suggestions by risk, business impact, and defect likelihood.
- **Implement High-Value Suggestions Promptly:** Implement high-value suggestions immediately where they protect important behaviour.
- **Document Rejections and Deferrals:** Document reasons for rejecting suggestions or deferring lower-value additions.
- **Use Review as a Learning Opportunity:** Use reviewer-driven test improvement as a learning opportunity for future implementation quality.

**DON'T:**
- **Accept Suggestions Blindly:** Do not accept all AI suggestions without technical and behavioural validation.
- **Ignore Meaningful Coverage Gaps:** Do not ignore meaningful coverage gaps identified through analysis.
- **Optimise for Coverage Numbers Alone:** Do not add tests just to increase coverage numbers without improving confidence.
- **Skip Human Review:** Do not skip human review of suggestions because the analysis is automated.
- **Dismiss Edge Cases Prematurely:** Do not dismiss edge cases as unlikely without considering operational or business risk.


## 21.11 Summary and Key Outcomes
Step 21 strengthens the test suite by combining automated analysis with human review to identify coverage gaps, improve assertion quality, and add missing high-value scenarios before formal code review progresses further.

Key Outcomes:
- **Coverage Gap Closure:** Coverage gaps are identified and addressed or explicitly justified.
- **Additional High-Value Scenarios:** Additional high-value test scenarios are generated and reviewed.
- **Earlier Risk Visibility:** Edge cases and overlooked behavioural risks are surfaced earlier in the development lifecycle.
- **Improved Test Quality:** Test quality improves through stronger assertions, better structure, and more meaningful coverage.
- **Stronger Downstream Baseline:** Downstream review and QA receive a more robust and defensible test baseline.


## 21.12 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, QA Team |
| **Accountable** | QA Lead or Development Lead |
| **Consulted** | Technical Architect, Solution Architect |
| **Informed** | Reviewers, Engineering Manager |


## 21.13 Related Steps
- **Upstream:** [Step 20: Unit Testing](Step-20-Unit-Testing.md)
- **Downstream:** [Step 22: Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md)


## 21.14 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |

