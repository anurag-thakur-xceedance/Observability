[Previous: Step 23 - Merge PR](Step-23-Merge-PR.md) | [Next: Step 25 - Code Review](Step-25-Code-Review.md)

# Step 24: Linting

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |

## 24.1 Overview
| **Attribute** | **Value** |
|---|---|
| **Responsible Roles** | Development Team, CI/CD Pipeline |
| **Accountable** | Development Lead |
| **Supporting Roles** | DevOps Engineer, Development Lead |
| **Tools** | Linting tools, static analysis tools, CI/CD pipeline |


## 24.2 Purpose
Step 24 applies automated linting and code-style validation to the submitted change so that structural, formatting, and rule-based quality issues are identified before human review spends time on avoidable defects. The purpose is to ensure consistent coding standards and to catch common issues early in the review workflow.


## 24.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| **Submitted pull request** | Step 23 | The change set now in the review pipeline. |
| **Code standards and lint rules** | Engineering standards | Approved lint rules, formatting expectations, and language-specific checks. |
| **Project source code** | Source control repository | The files changed in the pull request. |


## 24.4 Activities
### 24.4.1 Run Automated Linting
The CI/CD workflow executes the approved linting and formatting rules against the pull request change set.

Typical tooling includes:
- **JavaScript or TypeScript:** `ESLint`, `Prettier`
- **Python:** `Pylint`, `Flake8`, `Black`
- **Java:** `Checkstyle`, `SpotBugs`
- **C#:** `StyleCop`, `Roslyn Analyzers`
- **Go:** `golint`, `gofmt`

Execution is typically triggered:
- **Pull Request Creation:** Run when the pull request is first created.
- **Branch Update:** Run on each commit to the pull request branch.
- **Pre-Approval Check:** Run before merge approval or equivalent review completion.

### 24.4.2 Style Check
The linting stage enforces coding style consistency across the submitted change set.

The checks should enforce consistency across areas such as:
- **Indentation and Spacing:** Indentation and spacing rules.
- **Naming Conventions:** Consistent naming across the codebase.
- **Line Length:** Repository-defined line length limits.
- **Import Ordering:** Import or using statement ordering.
- **Formatting Structure:** Bracket placement and formatting.

Common style issues include:
- **Indentation Issues:** Inconsistent indentation.
- **Missing Semicolons:** Missing semicolons in JavaScript where required by the rule set.
- **Trailing Whitespace:** Unnecessary whitespace at line endings.
- **Long Lines:** Lines exceeding repository limits.
- **Import Sorting:** Unsorted imports.

### 24.4.3 Potential Issue Identification
The linting stage also detects code quality issues and likely bug patterns before human review.

Potential issue identification should detect:
- **Unused Variables:** Variables declared but not used.
- **Unreachable Code:** Code paths that can never execute.
- **Type Safety Issues:** Type mismatches or unsafe implicit typing.
- **Complexity Hotspots:** Excessive function complexity.

Severity levels should be interpreted consistently:
- **Error:** Must fix and blocks progression
- **Warning:** Should fix or explicitly justify according to policy
- **Info:** Non-blocking suggestion for improvement

### 24.4.4 Report Generation
Generate a detailed lint report so the author and reviewers can see exactly what must be corrected.

The lint report should provide:
- **Location Detail:** File and line references for each finding.
- **Severity Classification:** The severity level assigned to each finding.
- **Rule Reference:** The specific rule violated.
- **Suggested Remediation:** Suggested fixes where available.

Example lint report format:

```text
src/services/payment.ts
Line 45: Error 'userId' is assigned but never used (no-unused-vars)
Line 67: Warning Function has complexity 15 (max 10) (complexity)
Line 89: Error Missing return type annotation (explicit-module-boundary-types)

src/utils/validator.ts
Line 23: Warning Line length exceeds 120 characters (max-len)
Line 45: Info Consider using template literal (prefer-template)

2 errors, 2 warnings, 1 info
Linting failed
```

### 24.4.5 Resolve Blocking Findings
The author corrects linting errors and any agreed critical warnings before the pull request advances.

Developers should:
- **Fix Blocking Errors:** Fix all blocking lint errors before merge progression.
- **Address Required Warnings:** Address warnings where required by team standards or reviewer expectation.
- **Use Auto-Fixes:** Apply auto-fixes where available.
- **Re-submit the Change:** Update the change set and push the correction for re-validation.

Typical auto-fix commands may include:
- `npm run lint:fix`
- `black .`
- `gofmt -w .`

### 24.4.6 Re-run Validation
Linting is re-run after fixes to confirm the change is compliant and stable.

The change can proceed only when blocking findings are resolved and the pull request check is in a pass state.


## 24.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Lint report** | CI/CD platform and pull request checks | Machine-generated record of errors, warnings, and informational findings. |
| **Corrected change set** | Source control repository | Pull request updated to comply with code standards. |
| **Lint status result** | Downstream review steps | Pass or fail result used before deeper human review proceeds. |


## 24.6 Key Artifacts
**Inputs:**
- Pull request code changes
- Linting configuration files such as `.eslintrc`, `.pylintrc`, or equivalent
- Repository coding standards and formatting rules

**Outputs:**
- Lint report posted to the pull request or pipeline output
- Pass or fail status recorded in the pull request checks
- Issue list with file and line references
- Auto-fix output or remediation evidence where applicable


## 24.7 Quality Gates / Exit Criteria
- [ ] Linting has run successfully against the change set.
- [ ] Blocking lint errors have been corrected.
- [ ] Agreed critical warnings are resolved or explicitly accepted by policy.
- [ ] Pull request is ready for human code review.


## 24.8 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Automated lint execution** | CI/CD pipeline | Runs standards checks consistently on every relevant pull request change. |
| **Fix suggestion support** | Approved AI assistant | Suggests likely remediations for rule violations. |
| **Rule enforcement** | Lint and static analysis tools | Applies team standards without requiring manual inspection first. |


## 24.9 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| **Lint Pass Rate** | >=95% of pull requests pass linting on the first attempt | Pull request check results and CI/CD pipeline trend reports | Percentage of pull requests that pass linting on the first attempt. |
| **Average Lint Findings per PR** | <5 findings per pull request on average | Lint reports aggregated across pull requests | Typical lint burden introduced per change set. |
| **Auto-fix Rate** | >=60% of eligible findings corrected automatically | Lint tool auto-fix logs and remediation reports | Percentage of total findings corrected automatically. |
| **Lint Execution Time** | <3 minutes per pull request validation run | CI/CD pipeline timing records | Time required to run linting against the pull request change set. |
| **Disabled Rules** | <5 active rule exceptions at repository level | Lint configuration review and repository standards audit | Number of disabled linting rules or equivalent exceptions in active use. |


## 24.10 Best Practices
**DO:**
- **Run Linting Early:** Run linting locally before push wherever practical.
- **Treat Blocking Findings as Defects:** Treat blocking lint findings as defects, not cosmetic suggestions.
- **Keep Rules Consistent:** Keep lint rules consistent across the repository.
- **Use Safe Auto-Fixes:** Use auto-fix capabilities for simple issues where safe and approved.
- **Standardise Configuration:** Maintain lint configuration consistency across teams and repositories.

**DON'T:**
- **Suppress Rules Casually:** Do not suppress rules unless an approved exception exists.
- **Ignore Warning Impact:** Do not ignore warnings without understanding their impact.
- **Skip Small-Change Linting:** Do not skip linting for small changes.
- **Bypass Standards Inline:** Do not overuse inline disable comments to bypass standards.


## 24.11 Summary and Key Outcomes
Step 24 applies automated linting to the submitted change so that style violations, rule breaches, and likely low-level defects are identified and corrected before human review begins.

Key Outcomes:
- **Automated Standards Enforcement:** Coding standards and formatting rules are applied consistently.
- **Earlier Defect Detection:** Low-level defects and maintainability issues are identified before human review.
- **Cleaner Review Input:** Reviewers receive a pull request with fewer avoidable style and rule violations.
- **Consistent Repository Quality:** Linting supports uniform quality expectations across the codebase.
- **Review Workflow Readiness:** The change is better prepared for meaningful human code review.


## 24.12 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, CI/CD Pipeline |
| **Accountable** | Development Lead |
| **Consulted** | DevOps Engineer, Development Lead |
| **Informed** | Reviewers, Engineering Manager |


## 24.13 Related Steps
- **Upstream:** [Step 23: Merge PR](Step-23-Merge-PR.md)
- **Downstream:** [Step 25: Code Review](Step-25-Code-Review.md)


## 24.14 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |

[Previous: Step 23 - Merge PR](Step-23-Merge-PR.md) | [Next: Step 25 - Code Review](Step-25-Code-Review.md)
