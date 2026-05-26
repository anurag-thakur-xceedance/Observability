# Step 36: Repo Secret Scanning

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 36 |
| **Phase** | Secure, Govern & Validate |
| **Previous Step** | [Step 35: Dependency Check](Step-35-Dependency-Check.md) |
| **Next Step** | [Step 37: Container Image Scan](Step-37-Container-Image-Scan.md) |
| **Responsible Role(s)** | Security Team, CI/CD Pipeline |
| **Tools** | GitHub Advanced Security, TruffleHog, GitGuardian, Azure DevOps or Jira |

---

## Purpose

Comprehensive repository-wide scanning for secrets, credentials, API keys, and sensitive data across the entire Git history. This extends beyond PR-level secret detection to ensure no credentials are exposed in the codebase.

---

## Process Flow

---

## Activities

### 36.1 Full Repository Scanning

**Scan entire repository including history:**
- Scan all branches (main, feature, release)
- Analyze complete Git history
- Check all file types and extensions
- Include configuration files
- Scan documentation and comments
- Review archived/deleted files in history

**Scan Scope:**
yamlsecret<em>scan:
scope:
branches: all
history: full
file</em>types:
- source<em>code: true
- config</em>files: true
- documentation: true
- build\_artifacts: false</p>
<p>include\_patterns:
- "<strong>/<em>.json"
- "</strong>/</em>.yaml"
- "<strong>/<em>.env</em>"
- "</strong>/<em>.config"
- "</em><em>/</em>.xml"
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>36.2 Pattern Matching and Detection</h3>
<p><strong>Match against comprehensive secret patterns:</strong>
- API keys (AWS, Azure, GCP, third-party)
- Authentication tokens (OAuth, JWT, PAT)
- Database credentials
- Private keys (SSH, SSL/TLS, PGP)
- Encryption keys and certificates
- Cloud provider credentials
- Service account passwords
- Webhook secrets</p>
<p><strong>Secret Pattern Examples:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">regex</ac:parameter>
<ac:plain-text-body><![CDATA[aws<em>access</em>key: AKIA[0-9A-Z]{16}</p>
<p>github<em>pat: ghp</em>[a-zA-Z0-9]{36}</p>
<p>azure\_storage: [a-zA-Z0-9+/]{88}==</p>
<p>private\_key: -----BEGIN (RSA |)PRIVATE KEY-----</p>
<p>jwt: eyJ[a-zA-Z0-9<em>-]+.eyJ[a-zA-Z0-9</em>-]+.[a-zA-Z0-9\_-]+</p>
<p>db\_url: (postgres|mysql|mongodb):\/\/[^:]+:[^@]+@
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>36.3 Historical Git Analysis</h3>
<p><strong>Analyze Git commit history for leaked secrets:</strong>
- Scan all commits, not just current state
- Identify secrets in deleted files
- Find secrets that were later removed
- Check commit messages and author info
- Analyze branch history
- Review merge commits</p>
<p><strong>Historical Scan Considerations:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Why Scan History?
- Secrets in history are still accessible
- Git history is public in open-source repos
- Attackers actively mine Git history
- Deleted files remain in history
- Secrets may have been valid for years</p>
<h2>Remediation for Historical Secrets</h2>
<ol>
<li>Revoke the exposed secret immediately</li>
<li>Rotate to new credentials</li>
<li>Consider Git history rewrite (complex)</li>
<li>Document in security incident log
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ol>
<h3>36.4 Alert Triage and Validation</h3>
<p><strong>Prioritize and validate findings:</strong>
- Classify by secret type and severity
- Verify if secrets are still active
- Test secret validity where possible
- Filter false positives
- Check against allowlist
- Determine exposure window
- Assess potential impact</p>
<p><strong>Triage Process:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Priority Levels
1. <strong>P0 - Critical</strong>: Active production credentials
2. <strong>P1 - High</strong>: Active non-production credentials
3. <strong>P2 - Medium</strong>: Expired or revoked credentials
4. <strong>P3 - Low</strong>: Test/dummy credentials
5. <strong>P4 - Info</strong>: False positives</p>
<h2>Validation Steps</h2>
<ul>
<li>Confirm it's a real secret (not a sample)</li>
<li>Check if secret is still active</li>
<li>Identify affected systems</li>
<li>Determine exposure duration</li>
<li>Assess business impact
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul>
<h3>36.5 Remediation and Tracking</h3>
<p><strong>Manage secret remediation lifecycle:</strong>
- Create high-priority security tickets
- Assign to responsible teams
- Track revocation and rotation
- Update secret references in secure stores
- Document remediation actions
- Verify successful rotation
- Close alerts after validation</p>
<hr />
<h2>Best Practices</h2>
<h3>Secret Management</h3>
<p>[PASS] <strong>DO:</strong>
- Use secret management tools (Azure Key Vault, AWS Secrets Manager)
- Store secrets as environment variables
- Rotate secrets regularly
- Use short-lived credentials where possible
- Implement least-privilege access</p>
<p>[FAIL] <strong>DON'T:</strong>
- Commit secrets to version control
- Store secrets in code comments
- Use default or weak passwords
- Share secrets via email or chat
- Hardcode credentials in configuration</p>
<h3>Scanning Strategy</h3>
<p>[PASS] <strong>DO:</strong>
- Scan on every commit automatically
- Review all findings promptly
- Maintain accurate allowlists
- Educate developers on secure practices
- Monitor for new secret patterns</p>
<p>[FAIL] <strong>DON'T:</strong>
- Disable scanning to pass builds
- Ignore "low severity" findings
- Add secrets to allowlist without review
- Skip historical scans
- Delay secret revocation</p>
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
<td>Active Secrets in Repo</td>
<td>0</td>
<td>No live credentials in codebase</td>
</tr>
<tr>
<td>Mean Time to Revoke</td>
<td>&lt;1 hour</td>
<td>Time from detection to revocation</td>
</tr>
<tr>
<td>False Positive Rate</td>
<td>&lt;20%</td>
<td>Percentage of invalid alerts</td>
</tr>
<tr>
<td>Historical Secrets Remediated</td>
<td>100%</td>
<td>All historical secrets rotated</td>
</tr>
<tr>
<td>Developer Training Completion</td>
<td>100%</td>
<td>Team trained on secret management</td>
</tr>
<tr>
<td>Secret Detection Coverage</td>
<td>100%</td>
<td>All repos scanned</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Entry Criteria:</strong>
- Repository access configured
- Secret scanning tools enabled
- Pattern database updated
- Allowlist maintained</p>
<p><strong>Exit Criteria:</strong>
- Full repository scanned
- Git history analyzed
- All active secrets revoked and rotated
- High-priority findings resolved
- Remediation tasks tracked
- Historical exposure documented</p>
<hr />
<h2>Secret Remediation Example</h2>
<p><strong>Scenario: AWS Access Key Leaked</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Incident Timeline
- <strong>2026-03-10 09:15</strong>: Secret detected in commit abc123
- <strong>2026-03-10 09:20</strong>: Alert sent to security team
- <strong>2026-03-10 09:25</strong>: Secret confirmed active
- <strong>2026-03-10 09:30</strong>: AWS access key revoked
- <strong>2026-03-10 09:45</strong>: New key generated and stored in Key Vault
- <strong>2026-03-10 10:00</strong>: Application updated with new credentials
- <strong>2026-03-10 10:15</strong>: Verified old key no longer works
- <strong>2026-03-10 10:30</strong>: Incident closed</p>
<h2>Actions Taken</h2>
<ol>
<li>Revoked exposed AWS access key (AKIA...)</li>
<li>Generated new access key</li>
<li>Stored in Azure Key Vault</li>
<li>Updated CI/CD pipeline configuration</li>
<li>Reviewed CloudTrail logs for unauthorized access</li>
<li>Added Git pre-commit hook to prevent future leaks
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ol>
<hr />
<h2>Tool Configuration</h2>
<p><strong>TruffleHog Configuration:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[trufflehog:
scan\_type: filesystem
path: .</p>
<p>rules:
- name: aws-access-key
regex: 'AKIA[0-9A-Z]{16}'
severity: critical</p>
<pre><code>- name: private-key
regex: '-----BEGIN (RSA |)PRIVATE KEY-----'
severity: critical
</code></pre>
<p>exclude:
paths:
- tests/fixtures/
- docs/examples/</p>
<pre><code>patterns:
- "example\_key\_12345" # Known test pattern
</code></pre>
<p>]]&gt;</ac:plain-text-body>
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
<td>Secret Detection</td>
<td>GitHub Advanced Security</td>
<td>Native GitHub secret scanning</td>
</tr>
<tr>
<td>Historical Scanning</td>
<td>TruffleHog</td>
<td>Deep Git history analysis</td>
</tr>
<tr>
<td>Real-time Monitoring</td>
<td>GitGuardian</td>
<td>Continuous secret monitoring</td>
</tr>
<tr>
<td>Pattern Matching</td>
<td>Azure DevOps or Jira</td>
<td>Azure Repos secret scanning</td>
</tr>
<tr>
<td>Smart Triage</td>
<td>AI/ML</td>
<td>Intelligent false positive filtering</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>Secret Scanning Reports</li>
<li>Secret Pattern Configuration</li>
<li>Allowlist Documentation</li>
<li>Remediation Procedures</li>
<li>Secret Rotation Guide</li>
<li>Incident Response Playbook</li>
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
<td>Development Team, DevOps, Cloud Team</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>Development Lead, CISO</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="Step-35-Dependency-Check.md">Step 35: Dependency Check</a></li>
<li><strong>Downstream:</strong> <a href="Step-37-Container-Image-Scan.md">Step 37: Container Image Scan</a></li>
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
<td>Enhanced with comprehensive secret scanning workflows</td>
</tr>
</tbody>
</table>