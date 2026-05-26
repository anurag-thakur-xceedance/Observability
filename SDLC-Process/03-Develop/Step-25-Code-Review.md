# Step 25: Code Review

**Phase:** Develop
**Owner:** Development Team, Reviewers
**Duration:** 2-8 hours (depending on PR size)
**Prerequisites:** PR submitted (Step 23), Linting passed (Step 24)

---

## Purpose

Human code review ensures quality, security, and knowledge sharing. Reviewers examine logic, design, security, and maintainability beyond automated checks.

---

## Process Flow

---

## Activities

### 25.1 Code Quality Review

**Reviewers evaluate:**

- **Logic Correctness:** Code does what it's intended to do
- **Design:** Appropriate patterns, SOLID principles
- **Readability:** Clear, maintainable code
- **Performance:** No obvious performance issues
- **Error Handling:** Proper exception handling

**Review Checklist:**

- [ ] Logic is correct and handles edge cases
- [ ] Code is readable and self-documenting
- [ ] No code duplication (DRY principle)
- [ ] Functions are small and focused
- [ ] Error handling is appropriate

### 25.2 Standards Compliance Check

**Verify adherence to:**

- Coding standards and style guide
- Design patterns and architecture
- API design conventions
- Database access patterns
- Naming conventions

### 25.3 Security Review

**Check for security issues:**

- **Input Validation:** User inputs validated and sanitized
- **Authentication/Authorization:** Proper access controls
- **Data Protection:** Sensitive data encrypted/protected
- **SQL Injection:** Parameterized queries used
- **XSS:** Output encoding applied

**Security Red Flags:**

- Hardcoded credentials or secrets
- Unvalidated user input
- Direct database queries (not parameterized)
- Missing authorization checks
- Sensitive data in logs

### 25.4 Feedback Provision

**Provide constructive feedback:**

- Be specific: Reference line numbers and code snippets
- Explain "why": Don't just say "change this," explain rationale
- Suggest improvements: Offer concrete alternatives
- Be respectful: Focus on code, not person
- Balance criticism with praise: Recognize good work

**Feedback Categories:**

- **Must Fix (Blocking):** Critical issues preventing approval
- **Should Fix (Non-blocking):** Important but not critical
- **Nice to Have:** Suggestions for improvement
- **Question:** Request clarification

### 25.5 Approval/Request Changes

**Reviewer decision:**

- **Approve:** Code meets all standards, ready to merge
- **Approve with Comments:** Minor suggestions, can merge
- **Request Changes:** Issues must be addressed before merge
- **Comment:** Discussion needed but no decision yet

**Approval Criteria:**

- [ ] All tests passing
- [ ] No security vulnerabilities
- [ ] Code quality acceptable
- [ ] Standards compliance met
- [ ] Documentation adequate

---

## Key Artifacts

**Inputs:**

- Pull request with code changes
- Lint report (Step 24)
- Coding standards documentation

**Outputs:**

- Review comments (feedback)
- Approval status (approve/request changes)
- Discussion threads
- Approval timestamp

---

## Best Practices

✅ **DO:**

- Review within 4-8 hours of PR submission
- Focus on important issues (don't nitpick trivial style)
- Ask questions when unclear
- Provide actionable feedback with examples
- Recognize good code and practices

❌ **DON'T:**

- Rubber-stamp reviews (actually review the code)
- Be overly critical or personal
- Block PRs on trivial style issues (linter should catch)
- Review PRs >500 lines without breaking up
- Approve code you don't understand

---

## Metrics & Observability

| Metric | Target | Description |
| --- | --- | --- |
| **Time to First Review** | <4 hours | Time from PR submission to first review |
| **Review Depth** | ≥2 reviewers | Number of reviewers per PR |
| **Review Completion Time** | <24 hours | Time from first review to final approval |
| **Defect Detection** | 3-5 per PR | Issues found during review |
| **Review Turnaround (DORA)** | <8 hours | Average time in review |

---

## Quality Gates

- [ ] Minimum 2 approvals received
- [ ] All review comments addressed or resolved
- [ ] No blocking issues remaining
- [ ] Security review completed (for security-sensitive code)
- [ ] Tests passing (green build)

**Exit Criteria:** PR approved by required reviewers, ready to address feedback (Step 26) or merge.

---

## Related Steps

- **Step 23:** Merge PR (PR source)
- **Step 24:** Linting (automated checks before review)
- **Step 26:** Code Review Continued (feedback resolution)
- **Step 28:** Secrets Scan (security checks)

---

## Summary

Step 25 provides human oversight beyond automated checks, ensuring code quality, security, and knowledge transfer through peer review. Constructive feedback improves both code and developer skills.

**Key Outcomes:**

- Code quality validated by peers
- Security issues identified
- Knowledge shared across team
- Standards compliance verified
- Feedback provided for improvement

---

## Navigation

|
 |