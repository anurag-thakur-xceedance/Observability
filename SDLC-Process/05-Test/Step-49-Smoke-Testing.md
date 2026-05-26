# Step 49: Smoke Testing

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 49 |
| **Phase** | Test |
| **Previous Step** | [Step 48: Compatibility Testing](Step-48-Compatibility-Testing.md) |
| **Next Step** | [Step 50: Surface Area Testing Pen Test](Step-50-Surface-Area-Testing-Pen-Test.md) |
| **Responsible Role(s)** | QA Team, DevOps |
| **Tools** | Smoke Test Suite, Azure DevOps or Jira, CI/CD Pipeline |

---

## Purpose

Execute rapid smoke tests to validate critical functionality and build stability before proceeding to security penetration testing. Smoke tests provide quick confidence that the application is ready for deeper testing and deployment activities.

---

## Process Flow

---

## Activities

### 49.1 Critical Path Testing

**Validate essential user journeys:**
- User can log in successfully
- Core navigation works
- Critical transactions complete
- Database connectivity confirmed
- API endpoints respond
- Key integrations functional

### 49.2 Core Functionality Validation

**Test primary features:**
- Application launches successfully
- Main workflows functional
- Data can be created, read, updated, deleted
- Search functionality works
- Reports generate correctly
- Admin features accessible

### 49.3 Build Stability Assessment

**Verify build quality:**
- No critical errors in logs
- Services start successfully
- Health checks pass
- Database migrations applied
- Configuration loaded correctly
- Dependencies resolved

### 49.4 Go/No-Go Decision

**Determine deployment readiness:**
- All smoke tests passed
- No critical blockers identified
- Build meets minimum quality standards
- Ready for penetration testing
- Approved for deployment pipeline

---

## Best Practices

[PASS] **DO:**
- Keep smoke tests fast (<10 minutes)
- Focus on critical paths only
- Run smoke tests on every build
- Fail fast on critical issues
- Automate smoke test execution

[FAIL] **DON'T:**
- Include detailed functional tests
- Test edge cases in smoke suite
- Skip smoke tests to save time
- Continue testing if smoke fails
- Make smoke tests environment-dependent

---

## Key Metrics

| Metric | Target | Description |
| --- | --- | --- |
| Smoke Test Execution Time | <10 min | Time to complete smoke tests |
| Pass Rate | 100% | All smoke tests must pass |
| Coverage | 100% | All critical paths tested |
| Build Stability | 100% | Build starts without errors |

---

## Quality Gates

**Exit Criteria:**
- All critical paths tested and passed
- Core functionality validated
- Build confirmed stable
- No critical blockers
- Go decision obtained
- Ready for penetration testing

---

## Smoke Test Suite Example

yamlsmoke<em>tests:
authentication:
- login</em>with<em>valid</em>credentials
- logout\_successfully</p>
<p>core<em>functionality:
- create</em>new<em>record
- view</em>existing<em>record
- update</em>record
- delete\_record</p>
<p>api<em>health:
- health</em>check<em>endpoint
- database</em>connectivity
- cache\_connectivity</p>
<p>critical<em>integrations:
- payment</em>gateway<em>ping
- email</em>service<em>health
- external</em>api\_connectivity
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>Smoke Test Suite</li>
<li>Critical Path Definitions</li>
<li>Build Stability Criteria</li>
<li>Smoke Test Reports</li>
<li>Go/No-Go Decision Log</li>
</ul>
<hr />
<h2>RACI Matrix</h2>
<table>
<thead>
<tr>
<th>Role</th>
<th>Responsibility</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Responsible</strong></td>
<td>QA Team, DevOps</td>
</tr>
<tr>
<td><strong>Accountable</strong></td>
<td>QA Lead</td>
</tr>
<tr>
<td><strong>Consulted</strong></td>
<td>Development Lead</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>Product Owner, Scrum Master</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="Step-48-Compatibility-Testing.md">Step 48: Compatibility Testing</a></li>
<li><strong>Downstream:</strong> <a href="Step-50-Surface-Area-Testing-Pen-Test.md">Step 50: Surface Area Testing Pen Test</a></li>
</ul>
<hr />
<h2>Revision History</h2>
<table>
<thead>
<tr>
<th>Version</th>
<th>Date</th>
<th>Author</th>
<th>Changes</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>2026-03-25</td>
<td>Simon Armstrong</td>
<td>Initial draft</td>
</tr>
<tr>
<td>2.0</td>
<td>2026-03-10</td>
<td>OpenCode</td>
<td>Enhanced with smoke testing workflows</td>
</tr>
</tbody>
</table>