# Step 20: Unit Testing - Execution Checklist

**Purpose:** Unit testing checklist for Development Team to ensure code quality, test coverage, and behavioral verification before code review.

**Version:** 0.1  
**Last Updated:** 9 June 2026  
**For:** Human engineers and AI agents

---

## Pre-Development Checklist

### 1. Prerequisites Available
- [ ] Technical design reviewed (Step 12)
- [ ] Test strategy understood (Step 13)
- [ ] Development environment ready (Step 19)
- [ ] Work item assigned and approved
- [ ] Coding standards referenced

---

## Development Execution Checklist

### 2. Test-First or Test-Aligned Implementation (20.4.1)
- [ ] **Expected behavior defined** before implementation complete
- [ ] **Functions/classes kept small** enough to test in isolation
- [ ] **Dependency boundaries designed** to support mocking
- [ ] **Code is deterministic** and testable without manual setup
- [ ] **Coding standards followed** (naming, structure, comments)
- [ ] **Single responsibility principle applied**

### 3. Core Behavior Tests Created (20.4.2)
- [ ] **Happy path tests written** (main supported scenarios)
- [ ] **Edge case tests written** (boundary conditions, unusual values)
- [ ] **Error case tests written** (exception handling, invalid inputs, fallback behavior)
- [ ] **Business rule tests written** (conditional logic, rule variations, alternative paths)
- [ ] **Contract tests written** (input-output behavior, method assumptions)
- [ ] **External dependencies mocked** (databases, APIs, filesystems, clocks, third-party services)

### 4. Test Design Quality (20.4.3)
- [ ] **Descriptive test names** (state condition and expected outcome)
- [ ] **Arrange-Act-Assert structure** used (or equivalent team standard)
- [ ] **One primary concern per test**
- [ ] **Tests are independent** (no execution order dependency)
- [ ] **Outcomes are repeatable** (same results regardless of machine, user, time)

### 5. Coverage Validation (20.4.4)
#### White-Box Coverage
- [ ] **Line coverage >=80%** (or exception approved)
- [ ] **Branch coverage >=70%** (or exception approved)
- [ ] **Conditional paths exercised**
- [ ] **Exception paths tested**

#### Black-Box Coverage
- [ ] **Input/output correctness validated**
- [ ] **Business rules executed**
- [ ] **Contract-level behavior verified**
- [ ] **Validation and error messaging tested**

### 6. Test Execution Requirements (20.4.5)
- [ ] ⚡ **Tests are FAST** (< 10 minutes full suite, < 1 second per test)
- [ ] 🖥️ **Tests run LOCALLY before commit/push**
- [ ] ☁️ **Integration tests excluded from unit suite** (run in CI only)
- [ ] 🔄 **Tests are deterministic** (no flaky tests)
- [ ] **All tests pass consistently**

### 7. Test Adequacy Review (20.4.6)
- [ ] **Implemented scope fully covered**
- [ ] **No critical branches ignored**
- [ ] **Test names/structure understandable**
- [ ] **Mocks are appropriate** (not hiding defects)
- [ ] **Execution results are stable**

---

## Quality Gates Met (20.7)

### 8. Exit Criteria
- [ ] **Approved work scope implemented in code**
- [ ] **Unit tests written/updated for all relevant logic**
- [ ] **All unit tests pass consistently**
- [ ] **Coverage meets minimum thresholds** (or exception documented/approved)
- [ ] **Critical rules, edge cases, and failure paths validated**
- [ ] **No unresolved test instability or broken assertions**
- [ ] **Ready for Step 21** (Test Reviewer Additions)

---

## Metrics Verification

### 9. Observability Metrics Check
- [ ] **Line coverage: >=80%** — Actual: ______%
- [ ] **Branch coverage: >=70%** — Actual: ______%
- [ ] **Unit test pass rate: 100%** — Actual: ______%
- [ ] **Test execution time: <10 minutes** — Actual: ______ minutes
- [ ] **Flaky test rate: 0** — Actual: ______ flaky tests
- [ ] **Metrics accessible in:** CI/CD pipeline ✓ / Local IDE ✓ / Coverage dashboard ✓

---

## Common Failure Prevention

Refer to [Step 20 Common Failure Modes](#2011-common-failure-modes-and-prevention) in the main document for:
- Untested logic prevention
- False confidence from high coverage mitigation
- Flaky unit test prevention
- Over-mocking avoidance
- Slow feedback loop fixes

---

## Sign-Off

**Developed By:** ___________________________  
**Date:** ___________________________  
**Work Item:** ___________________________  
**Coverage:** Line: _____% | Branch: _____%  
**Test Count:** _____ (Passed: _____ | Failed: _____ | Skipped: _____)

**Reviewed By (Development Lead):** ___________________________  
**Date:** ___________________________

---

## Machine-Readable Checklist

For AI agents and automation tools:

```json
{
  "step": "20",
  "title": "Unit Testing",
  "version": "0.1",
  "checklist_items": [
    {
      "id": "20.01",
      "category": "prerequisites",
      "item": "Technical design reviewed",
      "required": true,
      "automation_check": "step12.status == 'complete'"
    },
    {
      "id": "20.02",
      "category": "development",
      "item": "Functions/classes kept small and testable",
      "required": true,
      "automation_check": "complexity_metrics.average_complexity < 10"
    },
    {
      "id": "20.03",
      "category": "test_creation",
      "item": "Happy path tests written",
      "required": true,
      "automation_check": "test_categories.includes('happy_path')"
    },
    {
      "id": "20.04",
      "category": "test_creation",
      "item": "Edge case tests written",
      "required": true,
      "automation_check": "test_categories.includes('edge_cases')"
    },
    {
      "id": "20.05",
      "category": "test_creation",
      "item": "Error case tests written",
      "required": true,
      "automation_check": "test_categories.includes('error_handling')"
    },
    {
      "id": "20.06",
      "category": "test_quality",
      "item": "Arrange-Act-Assert structure used",
      "required": true,
      "automation_check": "test_structure.pattern == 'AAA'"
    },
    {
      "id": "20.07",
      "category": "coverage",
      "item": "Line coverage >= 80%",
      "required": true,
      "automation_check": "coverage.line >= 0.80 || coverage.exception_approved == true"
    },
    {
      "id": "20.08",
      "category": "coverage",
      "item": "Branch coverage >= 70%",
      "required": true,
      "automation_check": "coverage.branch >= 0.70 || coverage.exception_approved == true"
    },
    {
      "id": "20.09",
      "category": "execution",
      "item": "Tests are fast (< 10 minutes suite)",
      "required": true,
      "automation_check": "test_execution.duration_seconds < 600"
    },
    {
      "id": "20.10",
      "category": "execution",
      "item": "All tests pass consistently",
      "required": true,
      "automation_check": "test_results.pass_rate == 1.0 && test_results.flaky_count == 0"
    },
    {
      "id": "20.11",
      "category": "quality_gate",
      "item": "Ready for Step 21",
      "required": true,
      "automation_check": "coverage.adequate == true && tests.stable == true && scope.implemented == true"
    }
  ]
}
```

---

## AI Agent Guidance

When assisting with Step 20:

### DO
- ✅ Generate test scaffolding proactively when code changes are detected
- ✅ Suggest test scenarios covering happy path, edge cases, and error cases
- ✅ Identify untested branches and conditional paths
- ✅ Recommend mocking strategies for external dependencies
- ✅ Validate test names follow descriptive conventions
- ✅ Check test execution time and warn if > 1 second per test
- ✅ Remind engineer to run tests locally before commit

### DON'T
- ❌ Suggest skipping tests to "save time"
- ❌ Generate tests with assertions like `expect(true).toBe(true)`
- ❌ Over-mock business logic (only mock external dependencies)
- ❌ Create flaky tests with timing dependencies or random values
- ❌ Bypass coverage requirements without explicit approval
- ❌ Mix integration tests into the unit test suite

---

**Note for AI Agents:**  
Unit tests must be **fast**, **deterministic**, and **run before check-in**. Integration tests belong in Step 21+ and run in CI/CD, not locally. Never compromise test quality to meet coverage metrics.
