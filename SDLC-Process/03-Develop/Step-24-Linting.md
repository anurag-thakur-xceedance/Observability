# Step 24: Linting

**Phase:** Develop
**Owner:** CI/CD Pipeline, Development Team
**Duration:** 2-5 minutes (automated)
**Prerequisites:** PR submitted (Step 23)

---

## Purpose

Automated code linting enforces coding standards, identifies potential issues, and ensures consistency across the codebase. Runs as part of CI/CD pipeline before code review.

---

## Process Flow

---

## Activities

### 24.1 Automated Lint Execution

**CI/CD automatically runs linters on PR code:**

- **JavaScript/TypeScript:** ESLint, Prettier
- **Python:** Pylint, Flake8, Black
- **Java:** Checkstyle, SpotBugs
- **C#:** StyleCop, Roslyn Analyzers
- **Go:** golint, gofmt

**Execution Triggers:**

- On PR creation
- On each commit to PR branch
- Before merge approval

### 24.2 Style Check

**Enforce coding style consistency:**

- Indentation (tabs vs. spaces, width)
- Naming conventions (camelCase, snake\_case, PascalCase)
- Line length limits (typically 80-120 characters)
- Import/using statement organization
- Bracket placement and spacing

**Common Style Issues:**

- Inconsistent indentation
- Missing semicolons (JavaScript)
- Trailing whitespace
- Long lines exceeding limit
- Unsorted imports

### 24.3 Potential Issue Identification

**Detect code quality and potential bugs:**

- **Unused variables:** Variables declared but never used
- **Unreachable code:** Code after return/break statements
- **Type errors:** Type mismatches, implicit any usage
- **Complexity:** Functions exceeding cyclomatic complexity thresholds
- **Security:** Potential vulnerabilities (eval, SQL injection patterns)

**Issue Severity Levels:**

- **Error:** Must fix (blocks merge)
- **Warning:** Should fix (reviewer discretion)
- **Info:** Suggestions for improvement

### 24.4 Report Generation

**Generate detailed lint report:**

- List of violations by file and line number
- Severity (error, warning, info)
- Rule violated (with explanation)
- Suggested fixes (auto-fixable issues)

**Example Lint Report:**

``` src/services/payment.ts Line 45: Error 'userId' is assigned but never used (no-unused-vars) Line 67: Warning Function has complexity 15 (max 10) (complexity) Line 89: Error Missing return type annotation (explicit-module-boundary-types)

src/utils/validator.ts Line 23: Warning Line length exceeds 120 characters (max-len) Line 45: Info Consider using template literal (prefer-template)

2 errors, 2 warnings, 1 info ❌ Linting failed 
```

### 24.5 Issue Resolution

**Developer addresses linting issues:**

- Fix errors (required before merge)
- Address warnings (at developer discretion, subject to review)
- Apply auto-fixes where available (`eslint --fix`, `black .`)
- Push updated code to re-trigger linting

**Auto-fix Example:**

```bash # JavaScript/TypeScript npm run lint:fix

# Python black . && flake8

# Go gofmt -w . && golint ./... 
```

---

## Key Artifacts

**Inputs:**

- PR code changes
- Linting configuration files (.eslintrc, .pylintrc, etc.)
- Team coding standards

**Outputs:**

- Lint report (posted to PR)
- Pass/fail status (PR check)
- Issue list with line numbers
- Auto-fix suggestions

---

## Best Practices

✅ **DO:**

- Run linters locally before pushing (`pre-commit hooks`)
- Use auto-fix capabilities to resolve simple issues
- Maintain consistent linting configuration across team
- Treat linting errors as blocking (must fix)
- Regularly update linter rules and dependencies

❌ **DON'T:**

- Disable linting rules without team consensus
- Ignore warnings (they often indicate real issues)
- Skip linting on "small changes" (consistency matters)
- Use `// eslint-disable` comments excessively
- Push code without running linters locally

---

## Metrics & Observability

| Metric | Target | Description |
| --- | --- | --- |
| **Lint Pass Rate** | ≥95% | PRs passing linting on first attempt |
| **Avg Issues per PR** | <5 | Average linting issues per PR |
| **Auto-fix Rate** | ≥60% | Issues fixed automatically / Total issues |
| **Lint Execution Time** | <3 minutes | Time to run linters on PR |
| **Disabled Rules** | <5 | Number of disabled linting rules |

**Tracking:**

- Lint results visible in PR checks
- Trend analysis (are linting violations increasing?)
- Most common violations (focus improvement efforts)

---

## Quality Gates

- [ ] Linting executed successfully (no execution errors)
- [ ] No linting errors (zero blocking issues)
- [ ] Warnings addressed or acknowledged by reviewers
- [ ] Style compliance achieved
- [ ] PR check marked as passed

**Exit Criteria:** All linting errors resolved, PR check green, ready for human code review.

---

## Linting Configuration Example

**ESLint (.eslintrc.json):**

```json { "extends": ["eslint:recommended", "plugin:@typescript-eslint/recommended"], "rules": { "no-unused-vars": "error", "no-console": "warn", "max-len": ["warn", { "code": 120 }], "complexity": ["warn", 10], "no-eval": "error" } } 
```

**Pylint (.pylintrc):**

```ini [MESSAGES CONTROL] disable=C0111 # missing-docstring (handled separately)

[FORMAT] max-line-length=120

[DESIGN] max-args=7 max-locals=15 max-complexity=10 
```

---

## Related Steps

- **Step 23:** Merge PR (triggers linting)
- **Step 25:** Code Review (follows linting)
- **Step 20:** Unit Testing (tests must also pass)
- **Step 28:** Secrets Scan (additional security checks)

---

## Summary

Step 24 automatically enforces coding standards and identifies quality issues through linting, ensuring consistency and catching potential bugs before human review. This accelerates code review by eliminating style debates and focusing reviewers on logic and design.

**Key Outcomes:**

- Zero linting errors (all PRs)
- Consistent code style across codebase
- Potential issues identified early
- Faster code review (no style discussions)
- CI/CD gate ensuring quality

---

## Navigation

|
 |