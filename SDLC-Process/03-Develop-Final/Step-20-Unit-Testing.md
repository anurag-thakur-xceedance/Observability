[Previous: Step 19 - IaC Jobs Runner](Step-19-IAC-Jobs-Runner.md) | [Next: Step 21 - Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md)

# Step 20: Unit Testing

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |

## 20.1 Overview
| **Attribute** | **Value** |
|---|---|
| **Responsible Roles** | Development Team, Development Lead |
| **Accountable** | Development Lead |
| **Supporting Roles** | QA Lead, Solution Architect, Technical Architect |
| **Tools** | Unit test framework, build tooling, code coverage tooling, CI/CD pipeline, approved AI assistant |


## 20.2 Purpose
Step 20 is the engineering work item through which code is implemented with unit-level quality verification. It ensures that every change introduced during development is supported by automated tests that verify expected behaviour, failure handling, and relevant edge conditions before the change proceeds into deeper review and downstream validation.

This step is intended to embed quality at the point of implementation. Unit testing is not treated as a late-stage quality activity. It is part of the development workflow and is expected to evolve alongside the code so that the resulting change is testable, maintainable, and sufficiently protected against regression.


## 20.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| **Technical design and implementation guidance** | Step 12 | Approved design, implementation boundaries, interface expectations, and architectural constraints. |
| **Test strategy and standards** | Step 13 | Test approach, coverage expectations, framework standards, and quality criteria. |
| **Provisioned environment and dependencies** | Step 19 | Development environment and supporting runtime dependencies needed for coding and test execution. |
| **Approved work scope** | Sprint backlog and work items | The feature, defect, enhancement, or platform change to be implemented. |
| **Coding standards** | Engineering standards and references | Naming, structure, maintainability, secure coding, and test quality expectations. |


## 20.4 Activities
### 20.4.1 Implement Code with Test-First or Test-Aligned Discipline
Development proceeds using a disciplined implementation approach in which unit tests are written before or alongside production code. The objective is to ensure that code changes are framed by expected behaviour and that implementation remains aligned to the approved requirement and technical design.

Expected implementation discipline includes:
- Defining the expected behaviour before completing the implementation
- Keeping functions, classes, and modules small enough to test in isolation
- Designing code with dependency boundaries that support mocking and controlled substitution
- Ensuring that new code is reviewable, deterministic, and testable without requiring manual setup

**Note:** Where strict test-first development is not practical, developers must still produce unit tests as part of the same work item and before the change is considered ready for review.

Key Practices:
- Follow coding standards and style guides
- Implement the single responsibility principle
- Keep functions small and focused
- Use meaningful variable and function names
- Document complex logic with comments
- Define the expected behaviour before completing the implementation
- Design code with dependency boundaries that support mocking and controlled substitution
- Ensure that new code is reviewable, deterministic, and testable without requiring manual setup

### 20.4.2 Create Unit Tests for Core Behaviour
Unit tests must validate the expected behaviour of the smallest meaningful unit of code in isolation from external systems. Tests should focus on correctness, determinism, and maintainability.

| **Test Category** | **Expectation** |
|---|---|
| **Happy Paths** | Validate the expected successful behaviour for the main supported usage scenarios. |
| **Edge Cases** | Validate boundary conditions, unusual values, and low-frequency but valid scenarios. |
| **Error Cases** | Validate exception handling, defensive logic, invalid inputs, and fallback behaviour. |
| **Business Rule Branches** | Validate conditional logic, rule variations, and alternative execution paths. |
| **Contract Expectations** | Validate method, function, and internal service input-output behaviour and assumptions. |

External dependencies such as databases, queues, APIs, filesystems, clocks, and third-party services must be mocked, stubbed, or otherwise isolated unless the test is intentionally part of another test category.

### 20.4.3 Apply Sound Test Design Practices
Tests must be understandable, deterministic, and maintainable. Every test should clearly express what scenario is being validated and why the outcome matters.

Expected practices include:
- Descriptive test naming that states the condition and expected outcome
- Use of the Arrange, Act, Assert structure or an equivalent team standard
- One primary behavioural concern per test
- Independence from test execution order
- Repeatable outcomes regardless of machine, user, or time of day

Example unit test structure:

```javascript
test('calculateOrderTotal returns the sum of all item prices', () => {
  // Arrange
  const items = [{ price: 10 }, { price: 20 }, { price: 30 }];

  // Act
  const total = calculateOrderTotal(items);

  // Assert
  expect(total).toBe(60);
});
```

### 20.4.4 Validate White-Box and Black-Box Concerns
Unit testing in this phase must address both internal implementation coverage and externally visible behavioural correctness.

White-box concerns include:
- Line and branch coverage
- Conditional and exception path execution
- Algorithmic edge conditions
- Internal state transitions where relevant and justified

Black-box concerns include:
- Input and output correctness
- Business rule execution
- Contract-level behaviour of a unit or internal service
- Expected validation and error messaging outcomes

Coverage targets must be used as a quality indicator, not as a substitute for thoughtful test design.

### 20.4.5 Execute Unit Tests Continuously
Unit tests must be run repeatedly during development so failures are detected early and corrected before the code progresses further.

Execution points should include:
- Local execution before commit or push
- Pre-push or pre-merge pipeline validation, where configured
- CI execution on pull requests and relevant branch updates
- Focused reruns when code or tests are modified during review feedback cycles

Example commands:

```bash
# Run all tests
npm test

# Run tests with coverage
npm run test:coverage

# Run tests in watch mode
npm run test:watch

# Run a specific test file
npm test -- order.test.js
```

### 20.4.6 Review Test Adequacy Before Handoff
Before the change moves to the next step, the developer or technical lead confirms that the unit test suite is adequate for the implemented change.

This review should confirm:
- The implemented scope is fully covered by meaningful tests
- No critical branch or failure path has been ignored
- Test names, structure, and assertions are understandable
- Mocks are appropriate and do not hide behavioural defects
- Test execution results are stable and repeatable


## 20.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Implemented change validated at unit-test level** | Source control repository and CI/CD platform | The code change is developed and verified through meaningful unit tests aligned to the approved scope. |
| **Review-ready engineering baseline** | Downstream review steps | The change is stable, testable, and ready to proceed into test review and broader code review activities. |
| **Recorded quality evidence** | CI/CD platform and engineering records | Coverage, pass/fail outcomes, and supporting test execution evidence are available for downstream review and traceability. |


## 20.6 Key Artifacts
**Inputs:**
- Approved work item or backlog record
- Technical design and implementation guidance
- Coding standards and test standards reference
- Provisioned environment and supporting dependencies where required
- Existing unit test framework and test fixtures

**Outputs:**
- Implemented feature code aligned to the approved work scope
- Unit test suite created or updated for the change
- Coverage reports showing relevant test coverage outcomes
- CI test logs and execution evidence
- Developer-ready change set prepared for downstream review


## 20.7 Quality Gates / Exit Criteria
- [ ] The approved work scope has been implemented in code.
- [ ] Unit tests have been written or updated for all relevant new or changed logic.
- [ ] All unit tests pass consistently in the approved execution path.
- [ ] Coverage meets or exceeds team or organisational minimum thresholds, or any exception is explicitly documented and approved.
- [ ] Critical business rules, edge cases, and failure paths have been validated.
- [ ] No unresolved test instability, flaky outcomes, or knowingly broken assertions remain.
- [ ] The change is ready to proceed to Step 21 and subsequent review activities.

The step is complete only when the code and the corresponding unit tests are committed, executable, repeatable, and sufficient to support downstream review with confidence.


## 20.8 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Test case suggestion** | Approved AI assistant | Suggests candidate unit test scenarios based on requirements, code structure, and edge conditions. |
| **Boilerplate generation** | Approved AI assistant | Accelerates the creation of initial unit test scaffolding while remaining subject to developer review. |
| **Coverage awareness** | Coverage tooling and CI/CD platform | Highlights untested paths, regressions in coverage, and newly introduced gaps. |
| **Execution automation** | CI/CD pipeline | Runs unit tests automatically and stores evidence for downstream review. |

AI-generated tests must be reviewed, corrected, and validated by the responsible engineer before they are treated as quality evidence.


## 20.9 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| **Line Coverage** | >=80% unless an exception is approved | Coverage tooling in local execution and CI/CD reports | Percentage of executable lines exercised during unit testing. |
| **Branch Coverage** | >=70% unless an exception is approved | Coverage tooling and branch coverage reports in CI/CD | Percentage of decision branches exercised during unit testing. |
| **Unit Test Pass Rate** | 100% in the approved execution path | Local runs, pull request checks, and CI test results | Percentage of unit tests passing during local and CI execution. |
| **Test Execution Time** | <10 minutes for the approved unit test suite | CI pipeline timing, local execution timing, and trend reporting | Time required to complete the approved unit test suite. |
| **Flaky Test Rate** | 0 known flaky tests in active use | Repeated CI runs, rerun history, and engineering defect records | Frequency of inconsistent outcomes from the same test suite without code changes. |
| **Defect Escape Indicator** | <5 defects per release attributable to missed unit-test coverage, with a downward trend over time | Defect analysis, QA findings, and retrospective review | Defects later found in review, integration, or testing that should have been caught by unit tests. |

Expected telemetry includes CI test results, coverage reports, test duration trends, and failure logs linked to the relevant work item and commit.


## 20.10 Best Practices
**DO:**
- **Write Tests with the Change:** Write or update unit tests as part of the same work item as the code change.
- **Keep Tests Focused:** Keep tests focused, readable, and deterministic.
- **Prefer Clear Assertions:** Prefer clear assertions over vague truthiness checks.
- **Mock Only What Is Necessary:** Mock only what is necessary to isolate the unit under test.
- **Test Behaviour, Not Incidental Detail:** Test behaviour and business rules, not incidental implementation detail.
- **Keep the Suite Fast:** Ensure the test suite is fast enough to support frequent execution by developers.
- **Use Coverage as a Signal:** Use coverage data to find blind spots, not to justify weak tests.
- **Treat Instability as a Blocker:** Treat failing or flaky unit tests as blockers that require prompt correction.

**DON'T:**
- **Push Testing to a Late Stage:** Do not treat unit testing as a separate late-stage activity outside the implementation workflow.
- **Use Coverage Alone as Proof:** Do not rely on coverage numbers alone as proof of test quality.
- **Over-Mock the Unit:** Do not over-mock behaviour to the point that meaningful logic is no longer being tested.
- **Advance with Critical Gaps:** Do not move code forward when critical paths, business rules, or failure cases are not covered.


## 20.11 Common Failure Modes and Prevention
| **Failure Mode** | **Typical Cause** | **Preventive Control** |
|---|---|---|
| **Untested logic introduced** | Code added without corresponding test updates | Require unit tests for all relevant new or changed logic before review. |
| **False confidence from high coverage** | Superficial assertions or low-value tests | Review test quality, branch coverage, and meaningful behavioural assertions. |
| **Flaky unit tests** | Hidden timing, shared state, or environment dependence | Enforce deterministic setup, dependency isolation, and stable test data. |
| **Over-mocking** | Excessive abstraction hiding true behaviour | Mock only external dependencies and keep business logic under direct test. |
| **Slow developer feedback loop** | Large or poorly structured test suite | Keep unit tests small, isolated, and fast; move broader concerns to higher test layers. |


## 20.12 Summary and Key Outcomes
Step 20 embeds quality directly into implementation by requiring unit tests to evolve with the code so that the resulting change is behaviourally verified, regression-resistant, and ready for deeper review.

Key Outcomes:
- **Behaviourally Verified Implementation:** Features are developed with unit tests that validate intended behaviour and failure handling.
- **Meaningful Test Coverage:** Line, branch, and business-rule coverage provide useful protection rather than superficial metrics alone.
- **Stable Developer Feedback Loop:** Fast, repeatable unit-test execution supports continuous verification during implementation.
- **Review-Ready Code and Tests:** The code change and corresponding tests are ready for downstream test review and code review.
- **Reduced Defect Escape Risk:** Unit-level validation catches issues earlier in the development lifecycle.


## 20.13 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, Development Lead |
| **Accountable** | Development Lead |
| **Consulted** | QA Lead, Technical Architect, Solution Architect |
| **Informed** | Reviewers, Product Owner, DevOps Engineer |


## 20.14 Related Steps
- **Upstream:** [Step 19: IaC Jobs Runner](Step-19-IAC-Jobs-Runner.md)
- **Downstream:** [Step 21: Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md)


## 20.15 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |

