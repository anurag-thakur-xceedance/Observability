[Previous: Step 20 - Unit Testing](Step-20-Unit-Testing.md) | [Next: Step 22 - Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md)

# Step 21: Test Reviewer Additions

## Overview
| **Attribute** | **Value** |
|---|---|
| **Step Number** | 21 |
| **Phase** | Develop |
| **Previous** | [Step 20: Unit Testing](Step-20-Unit-Testing.md) |
| **Next** | [Step 22: Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md) |
| **Responsible Roles** | Development Team, QA Team |
| **Accountable** | QA Lead or Development Lead |
| **Supporting Roles** | Technical Architect, Solution Architect |
| **Tools** | Coverage tooling, CI/CD platform, approved AI assistant, test framework |

---

## Purpose
Step 21 strengthens the unit test baseline by reviewing the implemented test suite for coverage gaps, weak assertions, missing edge cases, and overlooked risk scenarios. It is the quality-improvement work item that follows initial test creation and helps ensure that the change is sufficiently protected before formal code review progresses further.

This step exists to improve test adequacy, not simply to increase test count. The expected outcome is a more effective and defensible test suite that better reflects the real behavioural risk of the change.

---

## Inputs
| **Input** | **Source** | **Description** |
|---|---|---|
| **Unit test suite** | Step 20 | Initial automated tests created or updated for the change. |
| **Coverage report** | Step 20 and CI/CD platform | Current line, branch, and execution coverage evidence. |
| **Implemented code** | Step 20 | The code under review for missing behavioural coverage. |
| **Test strategy** | Step 13 | Approved testing expectations and quality thresholds. |
| **Approved work scope** | Sprint backlog and work items | Scope against which missing test scenarios are assessed. |

---

## Activities
### 21.1 Review Coverage Gaps
The team reviews coverage reports and implemented logic to identify code paths that remain untested or under-tested.

Coverage review must consider:
- untested methods or functions
- unexecuted decision branches
- exception and fallback paths
- validation failures and boundary conditions
- risky code added in the current change set

### 21.2 Evaluate Test Quality
The review must assess whether existing tests are meaningful, maintainable, and likely to detect defects.

The review should check for:
- weak or overly broad assertions
- tests that only verify implementation detail
- excessive mocking that hides true behaviour
- poor test naming or unclear purpose
- unstable, duplicated, or order-dependent tests

### 21.3 Add Missing High-Value Tests
Where important scenarios are missing, the team adds or updates tests to cover the required behaviour before the change proceeds further.

Priority should be given to:
- business-critical decision paths
- security-sensitive or validation-heavy logic
- defect-prone edge cases
- regression-prone areas changed in the current work item

### 21.4 Review AI-Assisted Suggestions
Where approved AI assistance is used, generated suggestions must be reviewed critically before adoption.

The team must confirm that suggested tests are:
- relevant to the implemented change
- technically correct
- maintainable under team standards
- not duplicating existing coverage

### 21.5 Confirm Test Readiness
The developer or assigned test reviewer confirms that the revised test suite is ready for downstream review and quality controls.

---

## Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Enhanced unit test suite** | Source control repository | Revised tests with improved quality, coverage, and edge-case handling. |
| **Coverage review evidence** | CI/CD platform and engineering records | Documented or observable evidence of coverage review and improvement. |
| **Additional test scenarios** | Source control repository and work item records | Newly added high-value test cases that address identified gaps. |
| **Test readiness confirmation** | Downstream review steps | Confirmation that tests are sufficient for the next review stage. |

---

## Quality Gates / Exit Criteria
- [ ] Coverage gaps have been reviewed against the implemented scope.
- [ ] High-risk missing scenarios have been added or explicitly justified.
- [ ] Weak or low-value tests have been improved where necessary.
- [ ] Test suite remains stable and executable after updates.
- [ ] The change is ready to proceed to Step 22 and subsequent review controls.

---

## AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Coverage analysis** | Coverage tooling and CI/CD platform | Identifies untested lines, branches, and execution patterns. |
| **Test suggestion support** | Approved AI assistant | Suggests additional test scenarios, edge cases, and assertion improvements. |
| **Automated execution** | CI/CD pipeline | Confirms that the updated test suite remains stable after additions. |

---

## Observability and Metrics
| **Metric / Reference** | **Type** | **Description** |
|---|---|---|
| **Coverage improvement rate** | Quality metric | Increase in relevant coverage after the review-driven updates. |
| **High-risk gaps closed** | Quality metric | Number of significant coverage gaps resolved before code review. |
| **Test stability** | Reliability metric | Consistency of results after review-driven changes. |
| **Defect escape indicator** | Quality trend metric | Whether later defects should have been caught in this step. |

---

## Best Practices
- Focus on meaningful coverage, not raw test count.
- Prioritize high-risk gaps over superficial completeness.
- Keep additional tests readable and behaviour-oriented.
- Reject AI suggestions that add noise without value.
- Ensure test additions are made before code review is treated as complete.

---

## RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, QA Team |
| **Accountable** | QA Lead or Development Lead |
| **Consulted** | Technical Architect, Solution Architect |
| **Informed** | Reviewers, Engineering Manager |

---

## Related Artefacts
- Coverage reports
- Unit test suite
- Work item acceptance criteria
- CI test logs

---

## Related Steps
- **Upstream:** [Step 20: Unit Testing](Step-20-Unit-Testing.md)
- **Downstream:** [Step 22: Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md)

---

## Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **1.0** | **2026-03-27** |  | **Initial draft aligned to Confluence baseline.** |
| **1.1** | **2026-05-28** | **OpenCode** | **Refined as a Confluence-ready enterprise version with clearer test review intent, stronger quality controls, and formalised outputs and metrics.** |

[Previous: Step 20 - Unit Testing](Step-20-Unit-Testing.md) | [Next: Step 22 - Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md)
