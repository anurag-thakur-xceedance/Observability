[Previous: Step 19 - IaC Jobs Runner](Step-19-IAC-Jobs-Runner.md) | [Next: Step 21 - Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md)

# Step 20: Unit Testing

## Overview
| **Attribute** | **Value** |
|---|---|
| **Step Number** | 20 |
| **Phase** | Develop |
| **Previous** | [Step 19: IaC Jobs Runner](Step-19-IAC-Jobs-Runner.md) |
| **Next** | [Step 21: Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md) |
| **Responsible Roles** | Development Team, Development Lead |
| **Accountable** | Development Lead |
| **Supporting Roles** | QA Lead, Solution Architect, Technical Architect |
| **Tools** | Unit test framework, build tooling, code coverage tooling, CI/CD pipeline, approved AI assistant |

---

## Purpose
Step 20 is the engineering work item through which code is implemented with unit-level quality verification. It ensures that every change introduced during development is supported by automated tests that verify expected behaviour, failure handling, and relevant edge conditions before the change proceeds into deeper review and downstream validation.

This step is intended to embed quality at the point of implementation. Unit testing is not treated as a late-stage quality activity. It is part of the development workflow and is expected to evolve alongside the code so that the resulting change is testable, maintainable, and sufficiently protected against regression.

---

## Inputs
| **Input** | **Source** | **Description** |
|---|---|---|
| **Technical design and implementation guidance** | Step 12 | Approved design, implementation boundaries, interface expectations, and architectural constraints. |
| **Test strategy and standards** | Step 13 | Test approach, coverage expectations, framework standards, and quality criteria. |
| **Provisioned environment and dependencies** | Step 19 | Development environment and supporting runtime dependencies needed for coding and test execution. |
| **Approved work scope** | Sprint backlog and work items | The feature, defect, enhancement, or platform change to be implemented. |
| **Coding standards** | Engineering standards and references | Naming, structure, maintainability, secure coding, and test quality expectations. |

---

## Activities
### 20.1 Implement Code with Test-First or Test-Aligned Discipline
Development proceeds using a disciplined implementation approach in which unit tests are written before or alongside production code. The objective is to ensure that code changes are framed by expected behaviour and that implementation remains aligned to the approved requirement and technical design.

Expected implementation discipline includes:
- defining the expected behaviour before completing the implementation
- keeping functions, classes, and modules small enough to test in isolation
- designing code with dependency boundaries that support mocking and controlled substitution
- ensuring that new code is reviewable, deterministic, and testable without requiring manual setup

**Where strict test-first development is not practical, developers must still produce unit tests as part of the same work item and before the change is considered ready for review.**

### 20.2 Create Unit Tests for Core Behaviour
Unit tests must validate the expected behaviour of the smallest meaningful unit of code in isolation from external systems. Tests should focus on correctness, determinism, and maintainability.

Unit tests should cover:
- expected or happy-path behaviour
- boundary conditions and edge cases
- invalid inputs and defensive handling
- exception, error, and fallback behaviour
- business rule branching and conditional logic
- contract expectations for methods, functions, and internal services

External dependencies such as databases, queues, APIs, filesystems, clocks, and third-party services must be mocked, stubbed, or otherwise isolated unless the test is intentionally part of another test category.

### 20.3 Apply Sound Test Design Practices
Tests must be understandable, deterministic, and maintainable. Every test should clearly express what scenario is being validated and why the outcome matters.

Expected practices include:
- descriptive test naming that states the condition and expected outcome
- use of the Arrange, Act, Assert structure or an equivalent team standard
- one primary behavioural concern per test
- independence from test execution order
- repeatable outcomes regardless of machine, user, or time of day

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

### 20.4 Validate White-Box and Black-Box Concerns
Unit testing in this phase must address both internal implementation coverage and externally visible behavioural correctness.

White-box concerns include:
- line and branch coverage
- conditional and exception path execution
- algorithmic edge conditions
- internal state transitions where relevant and justified

Black-box concerns include:
- input and output correctness
- business rule execution
- contract-level behaviour of a unit or internal service
- expected validation and error messaging outcomes

Coverage targets must be used as a quality indicator, not as a substitute for thoughtful test design.

### 20.5 Execute Unit Tests Continuously
Unit tests must be run repeatedly during development so failures are detected early and corrected before the code progresses further.

Execution points should include:
- local execution before commit or push
- pre-push or pre-merge pipeline validation where configured
- CI execution on pull requests and relevant branch updates
- focused reruns when code or tests are modified during review feedback cycles

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

### 20.6 Review Test Adequacy Before Handoff
Before the change moves to the next step, the developer or technical lead confirms that the unit test suite is adequate for the implemented change.

This review should confirm:
- the implemented scope is fully covered by meaningful tests
- no critical branch or failure path has been ignored
- test names, structure, and assertions are understandable
- mocks are appropriate and not hiding behavioural defects
- test execution results are stable and repeatable

---

## Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Implemented feature code** | Source control repository | Production code aligned to the approved work scope and technical design. |
| **Unit test suite** | Source control repository | Automated tests stored alongside or adjacent to the production code under the team standard. |
| **Coverage results** | CI/CD platform and quality records | Coverage evidence showing executed lines, branches, and relevant behavioural coverage. |
| **Test execution evidence** | CI/CD platform and engineering records | Test run outcomes, logs, and failure history for the work item. |
| **Developer readiness for review** | Downstream review steps | A code change that is sufficiently validated to proceed into review and quality control activities. |

---

## Quality Gates / Exit Criteria
- [ ] The approved work scope has been implemented in code.
- [ ] Unit tests have been written or updated for all relevant new or changed logic.
- [ ] All unit tests pass consistently in the approved execution path.
- [ ] Coverage meets or exceeds team or organisational minimum thresholds, or any exception is explicitly documented and approved.
- [ ] Critical business rules, edge cases, and failure paths have been validated.
- [ ] No unresolved test instability, flaky outcomes, or knowingly broken assertions remain.
- [ ] The change is ready to proceed to Step 21 and subsequent review activities.

The step is complete only when the code and the corresponding unit tests are committed, executable, repeatable, and sufficient to support downstream review with confidence.

---

## AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Test case suggestion** | Approved AI assistant | Suggests candidate unit test scenarios based on requirements, code structure, and edge conditions. |
| **Boilerplate generation** | Approved AI assistant | Accelerates the creation of initial unit test scaffolding while remaining subject to developer review. |
| **Coverage awareness** | Coverage tooling and CI/CD platform | Highlights untested paths, regressions in coverage, and newly introduced gaps. |
| **Execution automation** | CI/CD pipeline | Runs unit tests automatically and stores evidence for downstream review. |

AI-generated tests must be reviewed, corrected, and validated by the responsible engineer before they are treated as quality evidence.

---

## Observability and Metrics
| **Metric / Reference** | **Type** | **Description** |
|---|---|---|
| **Line coverage** | Quality metric | Percentage of executable lines exercised during unit testing. |
| **Branch coverage** | Quality metric | Percentage of decision branches exercised during unit testing. |
| **Unit test pass rate** | Quality metric | Percentage of unit tests passing during local and CI execution. |
| **Test execution time** | Flow metric | Time required to complete the approved unit test suite. |
| **Flaky test rate** | Stability metric | Frequency of inconsistent outcomes from the same test suite without code changes. |
| **Defect escape indicator** | Quality trend metric | Defects later found in review, integration, or testing that should have been caught by unit tests. |

Expected telemetry includes CI test results, coverage reports, test duration trends, and failure logs linked to the relevant work item and commit.

---

## Best Practices
- Write or update unit tests as part of the same work item as the code change.
- Keep tests focused, readable, and deterministic.
- Prefer clear assertions over vague truthiness checks.
- Mock only what is necessary to isolate the unit under test.
- Test behaviour and business rules, not incidental implementation detail.
- Ensure the test suite is fast enough to support frequent execution by developers.
- Use coverage data to find blind spots, not to justify weak tests.
- Treat failing or flaky unit tests as blockers that require prompt correction.

---

## Common Failure Modes and Prevention
| **Failure Mode** | **Typical Cause** | **Preventive Control** |
|---|---|---|
| **Untested logic introduced** | Code added without corresponding test updates | Require unit tests for all relevant new or changed logic before review. |
| **False confidence from high coverage** | Superficial assertions or low-value tests | Review test quality, branch coverage, and meaningful behavioural assertions. |
| **Flaky unit tests** | Hidden timing, shared state, or environment dependence | Enforce deterministic setup, dependency isolation, and stable test data. |
| **Over-mocking** | Excessive abstraction hiding true behaviour | Mock only external dependencies and keep business logic under direct test. |
| **Slow developer feedback loop** | Large or poorly structured test suite | Keep unit tests small, isolated, and fast; move broader concerns to higher test layers. |

---

## RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, Development Lead |
| **Accountable** | Development Lead |
| **Consulted** | QA Lead, Technical Architect, Solution Architect |
| **Informed** | Reviewers, Product Owner, DevOps Engineer |

---

## Related Artefacts
- Approved work item or backlog record
- Technical design and implementation guidance
- Unit test code and test fixtures
- Coverage reports and CI test logs
- Coding standards and test standards reference

---

## Related Steps
- **Upstream:** [Step 19: IaC Jobs Runner](Step-19-IAC-Jobs-Runner.md)
- **Downstream:** [Step 21: Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md)

---

## Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **1.0** | **2026-03-27** |  | **Initial draft aligned to Confluence baseline.** |
| **1.1** | **2026-05-28** | **OpenCode** | **Refined as a Confluence-ready enterprise version with corrected formatting, explicit work-item framing, stronger unit-test quality controls, proper examples, measurable exit criteria, and updated navigation.** |

[Previous: Step 19 - IaC Jobs Runner](Step-19-IAC-Jobs-Runner.md) | [Next: Step 21 - Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md)
