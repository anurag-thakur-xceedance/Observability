# Step 33: SAST

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 33 |
| **Phase** | Secure, Govern & Validate |
| **Previous Step** | [Step 32: Code Test Creator](Step-32-Code-Test-Creator.md) |
| **Next Step** | [Step 34: DAST](Step-34-DAST.md) |
| **Responsible Role(s)** | Security Team, CI/CD Pipeline |
| **Tools** | SonarQube, Checkmarx, CodeQL, Semgrep |

---

## Purpose

Static Application Security Testing (SAST) analyzes source code without execution to identify security vulnerabilities, code quality issues, and compliance violations early in the development lifecycle.

---

## Process Flow

---

## Activities

### 33.1 Static Code Analysis

**Execute comprehensive code scanning:**
- Run SAST tool against source code
- Analyze code patterns and structures
- Check against security rule sets
- Scan for known vulnerability patterns
- Review data flow and control flow
- Identify insecure coding practices

**Scan Configuration:**
yamlsast<em>config:
tool: sonarqube
scan</em>scope:
- src/
- lib/
- exclude:
- tests/
- node\_modules/</p>
<p>rule\_sets:
- owasp-top-10
- cwe-top-25
- custom-security-rules</p>
<p>quality\_profile: "strict-security"
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>33.2 Vulnerability Detection</h3>
<p><strong>Identify security vulnerabilities in code:</strong>
- SQL injection vulnerabilities
- Cross-Site Scripting (XSS)
- Authentication/authorization flaws
- Insecure cryptographic usage
- Hard-coded secrets and credentials
- Insecure deserialization
- XML External Entity (XXE) injection
- Path traversal vulnerabilities
- Command injection risks</p>
<p><strong>Common Vulnerability Categories:</strong>
- <strong>Injection Flaws</strong>: SQL, NoSQL, OS commands
- <strong>Broken Authentication</strong>: Weak password policies, session management
- <strong>Sensitive Data Exposure</strong>: Unencrypted data, weak encryption
- <strong>Access Control</strong>: Missing authorization checks
- <strong>Security Misconfiguration</strong>: Default credentials, verbose errors</p>
<h3>33.3 Code Quality Analysis</h3>
<p><strong>Assess code quality metrics:</strong>
- Code complexity and maintainability
- Code duplication detection
- Coding standard violations
- Technical debt assessment
- Test coverage analysis
- Documentation completeness</p>
<h3>33.4 Severity Classification</h3>
<p><strong>Categorize findings by risk level:</strong>
- <strong>Critical</strong>: Immediate threat, active exploit exists
- <strong>High</strong>: Serious vulnerability, easy to exploit
- <strong>Medium</strong>: Moderate risk, requires specific conditions
- <strong>Low</strong>: Minor issue, difficult to exploit
- <strong>Informational</strong>: Best practice recommendations</p>
<p><strong>Severity Matrix:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter></p>
<table>
<thead>
<tr>
<th><ac:plain-text-body><![CDATA[</th>
<th>Severity</th>
<th>SLA</th>
<th>Action Required</th>
</tr>
</thead>
<tbody>
<tr>
<td>Critical</td>
<td>Fix immediately</td>
<td>Block deployment</td>
</tr>
<tr>
<td>High</td>
<td>Fix within 24h</td>
<td>Block deployment</td>
</tr>
<tr>
<td>Medium</td>
<td>Fix within 7 days</td>
<td>Warning, may proceed</td>
</tr>
<tr>
<td>Low</td>
<td>Fix within 30 days</td>
<td>Info only</td>
</tr>
</tbody>
</table>
<p>]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>33.5 Remediation and Reporting</h3>
<p><strong>Provide actionable guidance:</strong>
- Generate detailed vulnerability reports
- Link to secure coding examples
- Provide specific fix recommendations
- Reference security standards (OWASP, CWE)
- Track remediation progress
- Update security dashboards</p>
<hr />
<h2>Best Practices</h2>
<h3>SAST Configuration</h3>
<p>[PASS] <strong>DO:</strong>
- Run SAST scans on every commit/PR
- Configure strict quality gates for production
- Maintain up-to-date rule sets
- Scan all branches, not just main
- Include security training for developers</p>
<p>[FAIL] <strong>DON'T:</strong>
- Skip SAST for "minor" changes
- Set quality gates too permissive
- Ignore informational findings
- Disable rules without security review
- Allow critical vulnerabilities in production</p>
<h3>Vulnerability Management</h3>
<p>[PASS] <strong>DO:</strong>
- Prioritize based on exploitability and impact
- Fix critical/high issues before deployment
- Track all findings to resolution
- Verify fixes with re-scanning
- Document accepted risks with justification</p>
<p>[FAIL] <strong>DON'T:</strong>
- Mark findings as false positives without review
- Defer critical security fixes
- Ignore repeated vulnerability patterns
- Deploy with unresolved critical issues
- Bypass security gates without approval</p>
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
<td>Critical Vulnerabilities</td>
<td>0</td>
<td>No critical issues in production code</td>
</tr>
<tr>
<td>High Vulnerabilities</td>
<td>0</td>
<td>No high-severity issues in production</td>
</tr>
<tr>
<td>Mean Time to Remediate (Critical)</td>
<td>&lt;24 hours</td>
<td>Time to fix critical vulnerabilities</td>
</tr>
<tr>
<td>False Positive Rate</td>
<td>&lt;10%</td>
<td>Percentage of invalid findings</td>
</tr>
<tr>
<td>Security Debt</td>
<td>Decreasing</td>
<td>Total medium/low vulnerabilities</td>
</tr>
<tr>
<td>Code Quality Score</td>
<td>&gt;A rating</td>
<td>SonarQube quality score</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Entry Criteria:</strong>
- Code committed to repository
- SAST tools configured
- Security rules up to date
- Previous critical issues resolved</p>
<p><strong>Exit Criteria:</strong>
- SAST scan completed successfully
- Zero critical vulnerabilities
- Zero high vulnerabilities (or approved exceptions)
- Security quality gate passed
- Findings documented in security system
- Remediation plan for medium/low issues</p>
<hr />
<h2>SonarQube Quality Gate Example</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[quality<em>gate:
name: "Strict Security Gate"
conditions:
- metric: vulnerabilities
operator: GREATER</em>THAN
error: 0
severity: CRITICAL</p>
<pre><code>- metric: vulnerabilities
operator: GREATER\_THAN
error: 0
severity: HIGH
- metric: security\_hotspots\_reviewed
operator: LESS\_THAN
error: 100
- metric: coverage
operator: LESS\_THAN
warning: 80
- metric: code\_smells
operator: GREATER\_THAN
warning: 50
</code></pre>
<p>]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Common SAST Findings</h2>
<p><strong>Example: SQL Injection</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">python</ac:parameter>
<ac:plain-text-body><![CDATA[def get\_user(username):
query = f"SELECT \* FROM users WHERE username = '{username}'"
return db.execute(query)</p>
<p>def get\_user(username):
query = "SELECT \* FROM users WHERE username = ?"
return db.execute(query, (username,))
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<p><strong>Example: Hard-coded Secrets</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">python</ac:parameter>
<ac:plain-text-body><![CDATA[API<em>KEY = "sk-1234567890abcdef"
db</em>password = "MyP@ssw0rd123"</p>
<p>import os
API<em>KEY = os.environ.get('API</em>KEY')
db<em>password = os.environ.get('DB</em>PASSWORD')
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
<td>Static Analysis</td>
<td>SonarQube</td>
<td>Continuous code quality and security</td>
</tr>
<tr>
<td>Vulnerability Detection</td>
<td>Checkmarx</td>
<td>Deep security analysis</td>
</tr>
<tr>
<td>Code Scanning</td>
<td>GitHub CodeQL</td>
<td>Query-based vulnerability detection</td>
</tr>
<tr>
<td>Fast Scanning</td>
<td>Semgrep</td>
<td>Lightweight pattern-based scanning</td>
</tr>
<tr>
<td>Auto-Remediation</td>
<td>AI Tools</td>
<td>Suggest fixes for common issues</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>SAST Configuration Files</li>
<li>Security Quality Gates</li>
<li>Vulnerability Management Reports</li>
<li>Remediation Tracking Dashboard</li>
<li>Security Policies and Standards</li>
<li>OWASP Top 10 Compliance Report</li>
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
<td>CI/CD Pipeline, Security Team</td>
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
<td>Development Lead, QA Lead, Compliance</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="Step-32-Code-Test-Creator.md">Step 32: Code Test Creator</a></li>
<li><strong>Downstream:</strong> <a href="Step-34-DAST.md">Step 34: DAST</a></li>
<li><strong>Related:</strong> <a href="../03-Develop/Step-28-Secrets-Scan.md">Step 28: Secrets Scan</a></li>
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
<td>Enhanced with SAST workflows and security scanning</td>
</tr>
</tbody>
</table>