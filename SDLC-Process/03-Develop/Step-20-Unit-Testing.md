# Step 20: Unit Testing

**Phase:** Develop
**Owner:** Development Team
**Duration:** Ongoing throughout sprint
**Prerequisites:** Provisioned environment (Step 19), Technical specs (Step 12)

---

## Purpose

Develop features with comprehensive unit tests following Test-Driven Development (TDD) practices. Ensure code quality through both white box (coverage) and black box (functional) testing at the component level.

---

## Process Flow

---

## Activities

### 20.1 Feature Development

**Approach:** Test-Driven Development (TDD)

Develop features following technical specifications:

- Write failing test first (Red)
- Implement minimal code to pass test (Green)
- Refactor code for quality (Refactor)
- Repeat for each feature/requirement

**Key Practices:**

- Follow coding standards and style guides
- Implement single responsibility principle
- Keep functions small and focused
- Use meaningful variable and function names
- Document complex logic with comments

### 20.2 Unit Test Development

**Frameworks:** Jest (JavaScript), JUnit (Java), pytest (Python), NUnit (.NET)

Write comprehensive unit tests covering:

- **Happy paths:** Expected inputs produce expected outputs
- **Edge cases:** Boundary values, empty inputs, null handling
- **Error cases:** Invalid inputs, exceptions, error handling
- **Integration points:** Mocked external dependencies

**Test Structure (AAA Pattern):**

```javascript test('calculateOrderTotal adds item prices correctly', () => { // Arrange const items = [{price: 10}, {price: 20}, {price: 30}];

// Act const total = calculateOrderTotal(items);

// Assert expect(total).toBe(60); }); ```

### 20.3 Black Box Testing

Test components from external perspective (inputs → outputs):

- Validate functional requirements met
- Test component interfaces (APIs, methods)
- Ignore internal implementation details
- Focus on behavior and contracts

**Black Box Test Examples:**

- User input validation produces correct error messages
- API endpoint returns expected response format
- Business logic calculates correct results

### 20.4 White Box Testing

Test internal code paths and logic:

- Achieve code coverage targets (≥80% lines, ≥70% branches)
- Test all conditional branches
- Test exception handling paths
- Test edge cases in algorithms

**Coverage Metrics:**

- **Line Coverage:** % of code lines executed
- **Branch Coverage:** % of decision branches taken
- **Function Coverage:** % of functions called
- **Statement Coverage:** % of statements executed

### 20.5 Test Execution

Run unit tests continuously during development:

- **Local:** Run tests before commits (pre-commit hook)
- **CI Pipeline:** Run on every push to repository
- **IDE Integration:** Run tests on file save (watch mode)

**Test Execution Commands:**

```bash # Run all tests npm test

# Run with coverage report npm run test:coverage

# Run in watch mode (re-run on changes) npm run test:watch

# Run specific test file npm test -- order.test.js ```

---

## Key Artifacts

**Inputs:**

- Technical specifications (Step 12)
- Test approach and standards (Step 13)
- Sprint backlog items (Step 5)

**Outputs:**

- Feature code (committed to repository)
- Unit test code (alongside feature code)
- Code coverage reports
- Test execution results

---

## Best Practices

✅ **DO:**

- Write tests before or alongside code (TDD/BDD)
- Keep tests simple, fast, and independent
- Use descriptive test names (describe what is tested)
- Mock external dependencies (databases, APIs, file systems)
- Aim for ≥80% code coverage (quality over quantity)

❌ **DON'T:**

- Skip writing tests "to save time" (tech debt grows)
- Write tests that depend on other tests (isolation)
- Test external dependencies (mock them instead)
- Ignore failing tests (fix immediately or remove)
- Write tests just to hit coverage targets (test behavior)

---

## Metrics & Observability

| Metric | Target | Description |
| --- | --- | --- |
| **Code Coverage (Lines)** | ≥80% | Lines executed during tests / Total lines |
| **Code Coverage (Branches)** | ≥70% | Branches taken during tests / Total branches |
| **Test Pass Rate** | 100% | Passing tests / Total tests |
| **Test Execution Time** | <5 minutes | Time to run full unit test suite |
| **Tests per Feature** | ≥3 | Unit tests written / Features developed |
| **Defect Density** | <5 per KLOC | Defects found / 1000 lines of code |

**Tracking:**

- Coverage reports generated on every CI run
- Test results visible in PR checks
- Coverage trends tracked over time (should increase or stay stable)

---

## Quality Gates

- [ ] All features developed per specifications
- [ ] Unit tests written for all new code (no untested code merged)
- [ ] Code coverage ≥80% lines, ≥70% branches
- [ ] All unit tests passing (100% pass rate)
- [ ] No critical/high severity linting errors
- [ ] Code ready for review (Step 25)

**Exit Criteria:** Code and tests committed, passing all quality gates, ready for code review.

---

## AI/Automation Support

**WorkItem Intelligence (AI-Assisted):**

- Generate test cases from requirements
- Suggest test scenarios for edge cases
- Generate boilerplate test code
- Identify untested code paths
- Recommend refactoring opportunities

**Example Prompt:**

> "Generate unit tests for the `calculateShippingCost` function that handles various item weights, destinations, and shipping methods."

---

## Related Steps

- **Step 12:** Design And Implementation (technical specifications source)
- **Step 13:** Test Approach Definition (testing strategy and standards)
- **Step 19:** IAC Jobs Runner (development environment provisioning)
- **Step 21:** Test Reviewer Additions (AI-assisted test improvements)
- **Step 25:** Code Review (peer review of code and tests)

---

## Summary

Step 20 ensures high-quality code through comprehensive unit testing following TDD practices. Developers write tests alongside features, achieving ≥80% code coverage and 100% test pass rate before code review. AI assistance accelerates test generation and identifies gaps.

**Key Outcomes:**

- Features developed with unit tests (no untested code)
- ≥80% code coverage achieved
- All tests passing (green build)
- Code ready for peer review

---

## Navigation

|
 |