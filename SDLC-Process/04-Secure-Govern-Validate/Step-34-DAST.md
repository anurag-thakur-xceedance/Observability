# Step 34: DAST

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 34 |
| **Phase** | Secure, Govern & Validate |
| **Previous Step** | [Step 33: SAST](Step-33-SAST.md) |
| **Next Step** | [Step 35: Dependency Check](Step-35-Dependency-Check.md) |
| **Responsible Role(s)** | Security Team, CI/CD Pipeline |
| **Tools** | OWASP ZAP, Burp Suite, Acunetix |

---

## Purpose

Dynamic Application Security Testing (DAST) identifies security vulnerabilities by testing running applications in their runtime environment. This black-box testing approach discovers issues that only manifest during execution, complementing static analysis.

---

## Process Flow

---

## Activities

### 34.1 Application Crawling and Discovery

**Map the application attack surface:**
- Crawl all accessible pages and endpoints
- Discover API routes and parameters
- Map form inputs and data entry points
- Identify authentication mechanisms
- Catalog cookies and session tokens
- Document application workflow

**Crawl Configuration:**
yamldast\_config:
tool: owasp-zap
target: https://staging.example.com</p>
<p>crawl<em>settings:
max</em>depth: 5
max<em>duration: 30m
exclude</em>paths:
- /admin/
- /logout
- /delete-account</p>
<p>authentication:
type: form
login<em>url: /login
username</em>field: email
password\_field: password
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>34.2 Runtime Vulnerability Detection</h3>
<p><strong>Test for common web vulnerabilities:</strong>
- SQL Injection attacks
- Cross-Site Scripting (XSS)
- Cross-Site Request Forgery (CSRF)
- Server-Side Request Forgery (SSRF)
- XML External Entity (XXE) attacks
- Command injection vulnerabilities
- Path traversal attempts
- Insecure redirects and forwards</p>
<p><strong>Attack Simulation:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## XSS Testing Examples
- Reflected XSS: <code>&lt;script&gt;alert('XSS')&lt;/script&gt;</code>
- Stored XSS: Persistent malicious scripts
- DOM-based XSS: Client-side manipulation</p>
<h2>SQL Injection Payloads</h2>
<ul>
<li>Basic: <code>' OR '1'='1</code></li>
<li>Union-based: <code>' UNION SELECT null, null--</code></li>
<li>Time-based: <code>'; WAITFOR DELAY '00:00:05'--</code>
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul>
<h3>34.3 API Security Testing</h3>
<p><strong>Validate API endpoint security:</strong>
- Test authentication and authorization
- Validate input validation and sanitization
- Check for mass assignment vulnerabilities
- Test rate limiting and throttling
- Verify proper error handling
- Check for information disclosure
- Test for injection attacks in API parameters
- Validate content-type handling</p>
<p><strong>API Test Cases:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[api<em>tests:
- endpoint: /api/users/{id}
tests:
- unauthorized</em>access
- privilege<em>escalation
- sql</em>injection<em>in</em>params
- excessive<em>data</em>exposure</p>
<ul>
<li>endpoint: /api/orders
tests:
<ul>
<li>rate<em>limiting</li>
<li>mass</em>assignment</li>
<li>authentication\_bypass
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul></li>
</ul>
<h3>34.4 Authentication and Authorization Testing</h3>
<p><strong>Test access control mechanisms:</strong>
- Brute force protection
- Session management security
- Password policy enforcement
- Multi-factor authentication bypass
- Privilege escalation attempts
- Horizontal authorization bypass
- Vertical authorization bypass
- Token manipulation and replay</p>
<p><strong>Authorization Tests:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Test Scenarios
1. <strong>Horizontal Privilege Escalation</strong>
- User A accesses User B's data
- Test: GET /api/users/123/profile (as User 456)</p>
<ol start="2">
<li><p><strong>Vertical Privilege Escalation</strong></p>
<ul>
<li>Regular user accesses admin functions</li>
<li>Test: POST /api/admin/users (as regular user)</li>
</ul></li>
<li><p><strong>Session Management</strong></p>
<ul>
<li>Session fixation attacks</li>
<li>Concurrent session handling</li>
<li>Session timeout validation
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul></li>
</ol>
<h3>34.5 Reporting and Remediation</h3>
<p><strong>Generate actionable security reports:</strong>
- Categorize findings by severity
- Provide proof-of-concept exploits
- Include remediation recommendations
- Map to OWASP Top 10 categories
- Track findings in security system
- Create tickets for development team</p>
<hr />
<h2>Best Practices</h2>
<h3>DAST Execution</h3>
<p>[PASS] <strong>DO:</strong>
- Run DAST in dedicated test environment
- Use authenticated scanning for full coverage
- Test all user roles and permission levels
- Schedule scans during low-traffic periods
- Maintain scan configurations in version control</p>
<p>[FAIL] <strong>DON'T:</strong>
- Run aggressive scans on production
- Test without proper authorization
- Skip authentication testing
- Ignore false positives without analysis
- Run DAST without rate limiting considerations</p>
<h3>Vulnerability Management</h3>
<p>[PASS] <strong>DO:</strong>
- Prioritize runtime vulnerabilities over theoretical risks
- Verify all findings with manual testing
- Fix critical issues before deployment
- Retest after remediation
- Document all accepted risks</p>
<p>[FAIL] <strong>DON'T:</strong>
- Dismiss findings without investigation
- Deploy with unresolved critical vulnerabilities
- Skip retesting after fixes
- Allow sensitive data exposure
- Ignore API-specific vulnerabilities</p>
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
<td>Critical Runtime Vulnerabilities</td>
<td>0</td>
<td>No critical issues in deployed app</td>
</tr>
<tr>
<td>High Severity Issues</td>
<td>0</td>
<td>No high-risk vulnerabilities</td>
</tr>
<tr>
<td>API Endpoint Coverage</td>
<td>100%</td>
<td>All APIs tested</td>
</tr>
<tr>
<td>Mean Time to Remediate</td>
<td>&lt;48 hours</td>
<td>Time to fix critical issues</td>
</tr>
<tr>
<td>False Positive Rate</td>
<td>&lt;15%</td>
<td>Invalid findings percentage</td>
</tr>
<tr>
<td>Scan Duration</td>
<td>&lt;60 min</td>
<td>Time to complete full scan</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Entry Criteria:</strong>
- Application deployed to test environment
- SAST scan completed and passed
- API endpoints documented
- Test credentials configured
- DAST tool configured</p>
<p><strong>Exit Criteria:</strong>
- DAST scan completed successfully
- Zero critical vulnerabilities
- Zero high vulnerabilities (or approved exceptions)
- All API endpoints tested
- Authentication mechanisms validated
- Security quality gate passed
- Findings documented and assigned</p>
<hr />
<h2>Common DAST Findings</h2>
<p><strong>Example: SQL Injection Detection</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">http</ac:parameter>
<ac:plain-text-body><![CDATA[GET /api/users?id=1' OR '1'='1 HTTP/1.1
Host: example.com</p>
<p>HTTP/1.1 200 OK
[Returns all user records]
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<p><strong>Example: XSS Detection</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">http</ac:parameter>
<ac:plain-text-body><![CDATA[POST /api/comments HTTP/1.1
Content-Type: application/json</p>
<p>{
"text": "<script>alert(document.cookie)</script>"
}</p>
<div class="comment">
<script>alert(document.cookie)</script>
</div>
<p>]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>DAST Tool Configuration</h2>
<p><strong>OWASP ZAP Configuration:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[zap\_config:
context:
name: "Production API Test"
urls:
- https://staging.example.com/\*</p>
<p>authentication:
type: json<em>based
login</em>request: |
POST /api/auth/login
{"email":"test@example.com","password":"TestPass123"}</p>
<p>scan\_policy:
strength: HIGH
threshold: MEDIUM</p>
<p>active<em>scan:
- sql</em>injection
- xss
- path<em>traversal
- command</em>injection</p>
<p>passive<em>scan:
- information</em>disclosure
- insecure<em>headers
- cookies</em>security
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>AI/Automation Capabilities</h2>
<table>
<thead>
<tr>
<th>Capability</th>
<th>Tool/Service</th>
<th>Purpose</th>
</tr>
</thead>
<tbody>
<tr>
<td>Active Scanning</td>
<td>OWASP ZAP</td>
<td>Automated vulnerability scanning</td>
</tr>
<tr>
<td>Professional Testing</td>
<td>Burp Suite</td>
<td>Advanced security testing</td>
</tr>
<tr>
<td>Continuous DAST</td>
<td>Acunetix</td>
<td>Scheduled security scans</td>
</tr>
<tr>
<td>API Testing</td>
<td>Postman/Newman</td>
<td>API security validation</td>
</tr>
<tr>
<td>Intelligent Fuzzing</td>
<td>AI Tools</td>
<td>Smart payload generation</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>DAST Configuration Files</li>
<li>Security Scan Reports</li>
<li>API Endpoint Inventory</li>
<li>Authentication Test Cases</li>
<li>Vulnerability Remediation Tickets</li>
<li>Security Quality Gate Results</li>
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
<td>Security Team, CI/CD Pipeline</td>
</tr>
<tr>
<td><strong>Accountable</strong></td>
<td>Security Lead</td>
</tr>
<tr>
<td><strong>Consulted</strong></td>
<td>Development Team, Security Architect</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>Development Lead, QA Lead, DevOps</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="Step-33-SAST.md">Step 33: SAST</a></li>
<li><strong>Downstream:</strong> <a href="Step-35-Dependency-Check.md">Step 35: Dependency Check</a></li>
<li><strong>Related:</strong> <a href="../05-Test/Step-44-Contract-API-Testing.md">Step 44: Contract API Testing</a></li>
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
<td>Enhanced with DAST workflows and runtime security testing</td>
</tr>
</tbody>
</table>