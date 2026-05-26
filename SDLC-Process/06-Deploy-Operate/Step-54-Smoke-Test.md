# Step 54: Smoke Test

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 54 |
| **Phase** | Deploy |
| **Previous Step** | [Step 53: Staging Pre-Prod Deploy](Step-53-Staging-Pre-Prod-Deploy.md) |
| **Next Step** | [Step 55: Feature Flag Release](Step-55-Feature-Flag-Release.md) |
| **Responsible Role(s)** | QA Team, SRE |
| **Tools** | Smoke Test Suite, Postman, Azure Monitor |

---

## Purpose

Execute smoke tests in the staging environment to validate the deployment before production release. This is the final validation gate before production deployment, ensuring critical functionality works in a production-like environment.

---

## Process Flow

---

## Activities

### 54.1 Health Check Validation

**Validate health endpoints:**
- Check application health endpoint (/health)
- Verify liveness probes responding
- Validate readiness probes
- Check database connectivity
- Verify cache connectivity
- Test external service connections

### 54.2 Critical Path Testing

**Execute critical user journeys:**
- User authentication (login/logout)
- Core CRUD operations
- Key business workflows
- Payment processing (if applicable)
- Report generation
- Search functionality

### 54.3 Integration Verification

**Verify external integrations:**
- Third-party API connectivity
- Payment gateway integration
- Email service functionality
- Authentication providers (OAuth, SAML)
- Message queue connectivity
- External data sources

### 54.4 Performance Baseline Check

**Quick performance validation:**
- API response times (<500ms for critical endpoints)
- Page load times (<3 seconds)
- Database query performance
- No memory leaks detected
- CPU usage within normal range
- No blocking operations

### 54.5 Production Readiness Decision

**Make go/no-go decision:**
- Review all smoke test results
- Check for critical blockers
- Verify monitoring is active
- Confirm rollback plan ready
- Obtain stakeholder sign-off
- Document decision and rationale

---

## Best Practices

[PASS] **DO:**
- Keep smoke tests fast (<10 minutes)
- Focus on critical paths only
- Run smoke tests automatically after deployment
- Fail fast on critical issues
- Monitor tests in real-time
- Document test failures clearly

[FAIL] **DON'T:**
- Include comprehensive functional tests
- Test edge cases in smoke suite
- Continue to production if smoke fails
- Skip smoke tests to save time
- Test non-critical features
- Run environment-dependent tests

---

## Smoke Test Suite Example

yamlsmoke<em>tests:
health</em>checks:
- test: application<em>health</em>endpoint
endpoint: /api/health
expected: 200 OK
timeout: 5s</p>
<pre><code>- test: database\_connectivity
endpoint: /api/health/database
expected: 200 OK
timeout: 10s
</code></pre>
<p>authentication:
- test: user<em>login
action: POST /api/auth/login
credentials: test</em>user
expected: JWT token returned</p>
<pre><code>- test: user\_logout
action: POST /api/auth/logout
expected: 200 OK
</code></pre>
<p>core<em>functionality:
- test: create</em>resource
action: POST /api/resources
expected: 201 Created</p>
<pre><code>- test: read\_resource
action: GET /api/resources/{id}
expected: 200 OK
- test: update\_resource
action: PUT /api/resources/{id}
expected: 200 OK
- test: delete\_resource
action: DELETE /api/resources/{id}
expected: 204 No Content
</code></pre>
<p>integrations:
- test: payment<em>gateway</em>health
endpoint: /api/integrations/payment/health
expected: 200 OK</p>
<pre><code>- test: email\_service\_health
endpoint: /api/integrations/email/health
expected: 200 OK
</code></pre>
<p>]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Production Readiness Checklist</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Pre-Production Smoke Test Checklist</p>
<h3>Health &amp; Connectivity</h3>
<ul>
<li>Application health endpoint responding (200 OK)</li>
<li>Database connectivity confirmed</li>
<li>Cache connectivity confirmed</li>
<li>All services reporting healthy</li>
</ul>
<h3>Core Functionality</h3>
<ul>
<li>User can log in successfully</li>
<li>User can log out successfully</li>
<li>CRUD operations work correctly</li>
<li>Core business workflows functional</li>
</ul>
<h3>Integrations</h3>
<ul>
<li>Payment gateway reachable</li>
<li>Email service operational</li>
<li>External APIs responding</li>
<li>Authentication providers working</li>
</ul>
<h3>Performance</h3>
<ul>
<li>API response times acceptable</li>
<li>No memory leaks detected</li>
<li>Resource usage within limits</li>
</ul>
<h3>Monitoring</h3>
<ul>
<li>Application Insights receiving data</li>
<li>Logs flowing to Log Analytics</li>
<li>Alerts configured and active</li>
</ul>
<h3>Deployment</h3>
<ul>
<li>Rollback plan documented and ready</li>
<li>Runbook reviewed by team</li>
<li>On-call rotation scheduled</li>
</ul>
<p><strong>Go/No-Go Decision:</strong> [ ] GO [ ] NO-GO</p>
<p><strong>Approved By:</strong> <strong><em>\_</strong><strong></em><em></strong><strong></em>\_ <em>\*Date:</em>\* <em></strong><strong></em><em></strong></em>
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Key Metrics</h2>
<table>
<thead>
<tr>
<th>Metric</th>
<th>Target</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>Smoke Test Duration</td>
<td>&lt;10 min</td>
<td>Time to complete all smoke tests</td>
</tr>
<tr>
<td>Pass Rate</td>
<td>100%</td>
<td>All smoke tests must pass</td>
</tr>
<tr>
<td>Critical Path Coverage</td>
<td>100%</td>
<td>All critical paths tested</td>
</tr>
<tr>
<td>Test Reliability</td>
<td>&gt;99%</td>
<td>Tests pass consistently</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Entry Criteria:</strong>
- Staging deployment completed successfully
- All services running and healthy
- Smoke test suite ready
- Test data prepared</p>
<p><strong>Exit Criteria:</strong>
- All health checks passing
- Critical paths validated
- Integrations verified
- Performance acceptable
- No critical blockers
- Production readiness confirmed (Go decision)</p>
<hr />
<h2>Inputs</h2>
<table>
<thead>
<tr>
<th>Input</th>
<th>Source</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>Deployed Application</td>
<td>Step 53</td>
<td>Application in staging</td>
</tr>
<tr>
<td>Smoke Test Suite</td>
<td>Test Repository</td>
<td>Critical path tests</td>
</tr>
<tr>
<td>Health Check Endpoints</td>
<td>Architecture</td>
<td>Health monitoring endpoints</td>
</tr>
</tbody>
</table>
<hr />
<h2>Outputs</h2>
<table>
<thead>
<tr>
<th>Output</th>
<th>Destination</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>Smoke Test Results</td>
<td>QA Lead</td>
<td>Staging validation results</td>
</tr>
<tr>
<td>Health Status</td>
<td>SRE</td>
<td>Service health confirmation</td>
</tr>
<tr>
<td>Production Readiness</td>
<td>Step 55</td>
<td>Go/No-Go decision</td>
</tr>
<tr>
<td>Test Report</td>
<td>Release Management</td>
<td>Staging test summary</td>
</tr>
</tbody>
</table>
<hr />
<h2>AI/Automation Augmentation</h2>
<table>
<thead>
<tr>
<th>Capability</th>
<th>Tool/Service</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>Automated Testing</td>
<td>Azure DevOps or Jira</td>
<td>Automated smoke test execution</td>
</tr>
<tr>
<td>Health Monitoring</td>
<td>Azure Monitor</td>
<td>Real-time health monitoring</td>
</tr>
</tbody>
</table>
<hr />
<h2>Observability &amp; Metrics</h2>
<table>
<thead>
<tr>
<th>Reference</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>O7</td>
<td>Observability</td>
<td>Metrics collection</td>
</tr>
<tr>
<td>O11</td>
<td>Observability</td>
<td>Health Checks</td>
</tr>
<tr>
<td>O8</td>
<td>Observability</td>
<td>Logging (ELK, App Insights)</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>Smoke Test Suite</li>
<li>Critical Path Definitions</li>
<li>Production Readiness Checklist</li>
<li>Health Check Definitions</li>
<li>Test Reports</li>
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
<td>QA Team, SRE</td>
</tr>
<tr>
<td><strong>Accountable</strong></td>
<td>QA Lead</td>
</tr>
<tr>
<td><strong>Consulted</strong></td>
<td>DevOps, Development Lead</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>Product Owner, Release Management</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="Step-53-Staging-Pre-Prod-Deploy.md">Step 53: Staging Pre-Prod Deploy</a></li>
<li><strong>Downstream:</strong> <a href="Step-55-Feature-Flag-Release.md">Step 55: Feature Flag Release</a></li>
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