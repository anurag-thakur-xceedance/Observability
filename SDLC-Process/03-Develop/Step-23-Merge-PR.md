# Step 23: Merge PR

**Phase:** Develop
**Owner:** Development Team
**Duration:** 15-30 minutes
**Prerequisites:** Code developed and tested (Step 20), Comment analysis complete (Step 22)

---

## Purpose

Create and submit pull requests linking code changes to work items, initiating the formal code review and CI/CD pipeline. Ensures traceability and proper review workflow.

---

## Process Flow

---

## Activities

### 23.1 Pull Request Creation

**Create PR with proper branch naming:**

- Branch naming: `feature/WORKITEM-123-short-description`
- Target branch: `main` or `develop` (per team strategy)
- Source branch: Feature branch with commits

**Branch Strategy Examples:**

- `feature/US-456-add-payment-gateway` (User story)
- `bugfix/BUG-789-fix-login-error` (Bug fix)
- `hotfix/PROD-321-critical-security-patch` (Hotfix)

### 23.2 Work Item Linking

**Link PR to related work items:**

- Reference work items in PR title or description
- Use keywords for automatic linking: `Fixes #123`, `Closes AB#456`
- Ensure bidirectional traceability (PR → Work Item, Work Item → PR)

**Linking Examples:**
noneTitle: Add payment gateway integration (Fixes AB#456)
<p>Description: Implements payment gateway integration for checkout flow.</p>
<p>Related Work Items:</p>
<ul>
<li>Implements: User Story AB#456</li>
<li>Depends on: Task AB#457 (API credentials)</li>
<li>Relates to: Bug AB#450 (payment validation)

### 23.3 Description and Context

**Provide clear PR description:**

- **What:** Summary of changes
- **Why:** Business context and rationale
- **How:** Technical approach overview
- **Testing:** How to test the changes
- **Screenshots:** For UI changes

**PR Template Example:**
none## Summary
<p>Adds Stripe payment gateway integration for checkout flow.</p>
<h2>Changes</h2>
<ul>
<li>Integrated Stripe SDK v3</li>
<li>Implemented payment processing service</li>
<li>Added payment success/failure handling</li>
<li>Updated checkout UI with payment form</li>
</ul>
<h2>Testing</h2>
<ol>
<li>Navigate to checkout page</li>
<li>Enter test card: 4242 4242 4242 4242</li>
<li>Complete payment</li>
<li>Verify order confirmation</li>
</ol>
<h2>Related Work Items</h2>
<p>Closes AB#456</p>
<h2>Checklist</h2>
<ul>
<li>[x] Unit tests added (85% coverage)</li>
<li>[x] Integration tests added</li>
<li>[x] Documentation updated</li>
<li>[x] No security vulnerabilities introduced

### 23.4 Reviewer Assignment

**Assign appropriate reviewers:**

- At least 2 reviewers (per team policy)
- Include domain expert for complex changes
- Include security reviewer for security-sensitive code
- Notify reviewers via PR comments or direct message

**Reviewer Selection Criteria:**

- **Code owner:** Team member responsible for affected area
- **Domain expert:** Knowledge of business logic
- **Security reviewer:** For auth, payments, data handling
- **Junior developer:** For learning and knowledge sharing

### 23.5 PR Submission

**Submit PR and monitor status:**

- Ensure all pre-submit checks pass (tests, linting)
- Monitor CI/CD pipeline status
- Respond to reviewer comments promptly
- Address feedback and update PR

**PR Checklist Before Submission:**

- [ ] All tests passing locally
- [ ] Code follows style guide
- [ ] Comments and documentation updated
- [ ] Work items linked
- [ ] Reviewers assigned
- [ ] Breaking changes documented (if any)

---

## Key Artifacts

**Inputs:**

- Developed code and tests
- Work item IDs
- Comment analysis results

**Outputs:**

- Pull request (submitted)
- Work item links (traceability)
- PR description (context)
- Reviewer assignments

---

## Best Practices

✅ **DO:**

- Keep PRs small and focused (<400 lines preferred)
- Write clear, descriptive PR titles and descriptions
- Link all related work items
- Assign reviewers promptly
- Respond to feedback quickly (<24 hours)

❌ **DON'T:**

- Create massive PRs (>1000 lines) unless unavoidable
- Submit PRs with failing tests
- Skip PR description ("see code for details")
- Assign reviewers without context
- Ignore reviewer comments

---

## Metrics & Observability

| Metric | Target | Description |
| --- | --- | --- |
| **PR Size** | <400 lines | Lines changed per PR (smaller is better) |
| **PR Creation Time** | <30 minutes | Time to create and submit PR |
| **Work Item Linkage** | 100% | PRs with linked work items / Total PRs |
| **Time to First Review** | <4 hours | Time from PR submission to first review |
| **Time from Inception to PR (DORA)** | <3 days | Time from work item start to PR submission |

**DORA Metric Tracking:**

- D5: Time From Inception to PR (measures development velocity)

---

## Quality Gates

- [ ] PR created with proper format and branch naming
- [ ] Work items linked (100% traceability)
- [ ] PR description complete and clear
- [ ] Reviewers assigned (minimum 2)
- [ ] PR submitted successfully
- [ ] CI/CD pipeline triggered

**Exit Criteria:** PR submitted, reviewers assigned, CI/CD checks running.

---

## AI/Automation Support

**WorkItem Intelligence (PR META):**

- Auto-detects work items from branch names
- Suggests reviewers based on code ownership
- Generates PR description template from commits
- Validates work item linkage completeness

---

## Related Steps

- **Step 20:** Unit Testing (code source)
- **Step 22:** Comment Aware Reasoning (documentation check)
- **Step 24:** Linting (automated checks triggered)
- **Step 25:** Code Review (human review)
- **Step 28:** Secrets Scan (security checks)

---

## Summary

Step 23 formalizes code changes through pull requests, ensuring proper traceability to work items and initiating automated quality checks and peer review. Well-structured PRs accelerate review and maintain project visibility.

**Key Outcomes:**

- PR created and submitted
- 100% work item traceability
- Reviewers assigned
- CI/CD pipeline triggered
- Clear context for reviewers

---

## Navigation

|
 |