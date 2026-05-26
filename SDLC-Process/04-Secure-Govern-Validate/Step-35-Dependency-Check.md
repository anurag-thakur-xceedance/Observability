# Step 35: Dependency Check

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 35 |
| **Phase** | Secure, Govern & Validate |
| **Previous Step** | [Step 34: DAST](Step-34-DAST.md) |
| **Next Step** | [Step 36: Repo Secret Scanning](Step-36-Repo-Secret-Scanning.md) |
| **Responsible Role(s)** | Security Team, CI/CD Pipeline |
| **Tools** | Snyk, OWASP Dependency-Check, Dependabot, npm audit |

---

## Purpose

Analyze third-party dependencies for known security vulnerabilities, license compliance issues, and outdated packages. This step ensures the supply chain security of all external libraries and components used in the application.

---

## Process Flow

---

## Activities

### 35.1 Dependency Inventory Generation

**Create comprehensive dependency list:**
- Parse dependency manifest files
- Build complete dependency tree
- Include transitive dependencies
- Identify direct vs indirect dependencies
- Track dependency versions
- Document dependency relationships

**Supported Manifest Files:**
markdown- <strong>Node.js</strong>: package.json, package-lock.json, yarn.lock
- <strong>Python</strong>: requirements.txt, Pipfile.lock, poetry.lock
- <strong>Java</strong>: pom.xml, build.gradle, build.gradle.kts
- <strong>.NET</strong>: packages.config, \*.csproj, paket.lock
- <strong>Ruby</strong>: Gemfile, Gemfile.lock
- <strong>Go</strong>: go.mod, go.sum
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>35.2 Vulnerability Scanning</h3>
<p><strong>Scan dependencies against vulnerability databases:</strong>
- Check against National Vulnerability Database (NVD)
- Query GitHub Advisory Database
- Review Snyk vulnerability database
- Check language-specific security advisories
- Identify Common Vulnerabilities and Exposures (CVEs)
- Calculate CVSS scores for findings</p>
<p><strong>Scan Configuration:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[dependency\_scan:
tools:
- snyk
- owasp-dependency-check
- github-dependabot</p>
<p>vulnerability\_sources:
- nvd
- github-advisory
- snyk-intel
- npm-audit</p>
<p>scan\_depth: full # Include transitive dependencies</p>
<p>quality\_gate:
critical: 0
high: 0
medium: 5 # Warning threshold
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>35.3 License Compliance Check</h3>
<p><strong>Verify license compatibility:</strong>
- Identify all dependency licenses
- Check against approved license list
- Flag copyleft licenses (GPL, AGPL)
- Identify license conflicts
- Verify commercial license compliance
- Document license obligations</p>
<p><strong>License Categories:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Approved Licenses
[PASS] <strong>Permissive</strong>: MIT, Apache 2.0, BSD, ISC
[PASS] <strong>Weak Copyleft</strong>: LGPL, MPL
[WARN] <strong>Strong Copyleft</strong>: GPL, AGPL (requires review)
[FAIL] <strong>Proprietary</strong>: Commercial licenses without agreement</p>
<h2>Common Conflicts</h2>
<ul>
<li>GPL + Proprietary code</li>
<li>AGPL + SaaS applications</li>
<li>Multiple copyleft licenses
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul>
<h3>35.4 Risk Assessment and Prioritization</h3>
<p><strong>Evaluate vulnerability risk:</strong>
- Assess exploitability and impact
- Determine reachability (is vulnerable code actually used?)
- Consider runtime environment exposure
- Evaluate available patches/updates
- Calculate remediation priority
- Document risk acceptance for low-priority items</p>
<p><strong>Risk Matrix:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter></p>
<table>
<thead>
<tr>
<th><ac:plain-text-body><![CDATA[</th>
<th>Severity</th>
<th>Exploitable</th>
<th>Patch Available</th>
<th>Action</th>
</tr>
</thead>
<tbody>
<tr>
<td>Critical</td>
<td>Yes</td>
<td>Yes</td>
<td>Fix immediately</td>
</tr>
<tr>
<td>Critical</td>
<td>Yes</td>
<td>No</td>
<td>Mitigate/Replace</td>
</tr>
<tr>
<td>High</td>
<td>Yes</td>
<td>Yes</td>
<td>Fix within 24h</td>
</tr>
<tr>
<td>High</td>
<td>No</td>
<td>Yes</td>
<td>Fix within 7 days</td>
</tr>
<tr>
<td>Medium</td>
<td>Yes</td>
<td>Yes</td>
<td>Fix within 30 days</td>
</tr>
<tr>
<td>Low</td>
<td>No</td>
<td>Yes</td>
<td>Fix in next sprint</td>
</tr>
</tbody>
</table>
<p>]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>35.5 Upgrade Recommendations</h3>
<p><strong>Provide actionable remediation guidance:</strong>
- Recommend specific version upgrades
- Identify breaking changes in upgrades
- Suggest alternative dependencies
- Provide upgrade impact analysis
- Generate upgrade pull requests
- Test compatibility after upgrades</p>
<hr />
<h2>Best Practices</h2>
<h3>Dependency Management</h3>
<p>[PASS] <strong>DO:</strong>
- Scan dependencies on every build
- Pin dependency versions in production
- Keep dependencies up to date regularly
- Use lock files for reproducible builds
- Review transitive dependencies</p>
<p>[FAIL] <strong>DON'T:</strong>
- Use dependencies with known critical CVEs
- Ignore security advisories
- Use wildcard version ranges in production
- Add dependencies without security review
- Skip license compliance checks</p>
<h3>Vulnerability Remediation</h3>
<p>[PASS] <strong>DO:</strong>
- Fix critical vulnerabilities immediately
- Test thoroughly after updates
- Document risk acceptance decisions
- Monitor for new vulnerabilities continuously
- Maintain security patch schedule</p>
<p>[FAIL] <strong>DON'T:</strong>
- Deploy with unpatched critical vulnerabilities
- Update all dependencies blindly without testing
- Ignore indirect dependency vulnerabilities
- Defer security updates indefinitely
- Disable dependency scanning to pass builds</p>
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
<td>No critical CVEs in dependencies</td>
</tr>
<tr>
<td>High Vulnerabilities</td>
<td>0</td>
<td>No high-severity issues</td>
</tr>
<tr>
<td>Dependency Freshness</td>
<td>&gt;80%</td>
<td>Percentage using latest stable version</td>
</tr>
<tr>
<td>Mean Time to Patch</td>
<td>&lt;7 days</td>
<td>Time to remediate vulnerabilities</td>
</tr>
<tr>
<td>License Compliance</td>
<td>100%</td>
<td>All dependencies have approved licenses</td>
</tr>
<tr>
<td>Transitive Dependency Depth</td>
<td>&lt;5 levels</td>
<td>Complexity of dependency tree</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Entry Criteria:</strong>
- Dependency manifest files committed
- Dependency lock files present
- Vulnerability databases updated
- License policy defined</p>
<p><strong>Exit Criteria:</strong>
- Dependency scan completed
- Zero critical vulnerabilities
- Zero high vulnerabilities (or approved exceptions)
- License compliance verified
- Remediation plan for medium/low issues
- Dependency inventory documented</p>
<hr />
<h2>Example Dependency Report</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Dependency Vulnerability Report</p>
<h3>Critical Issues (0)</h3>
<p>None</p>
<h3>High Severity (1)</h3>
<ul>
<li><strong>lodash@4.17.15</strong>
<ul>
<li>CVE: CVE-2020-8203</li>
<li>CVSS: 7.4 (High)</li>
<li>Issue: Prototype Pollution</li>
<li>Fix: Upgrade to lodash@4.17.21</li>
<li>Impact: Breaking changes in deepClone()</li>
</ul></li>
</ul>
<h3>Medium Severity (3)</h3>
<ul>
<li><strong>express@4.16.0</strong> - CVE-2022-24999 (CVSS 6.1)</li>
<li><strong>axios@0.19.0</strong> - CVE-2020-28168 (CVSS 5.9)</li>
<li><strong>moment@2.24.0</strong> - CVE-2022-24785 (CVSS 5.5)</li>
</ul>
<h3>License Issues (1)</h3>
<p>[WARN] <strong>gpl-library@1.0.0</strong> - GPL-3.0 (requires legal review)
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Tool Configuration</h2>
<p><strong>Snyk Configuration:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[version: v1.22.0
language-settings:
python:
severity-threshold: medium</p>
<p>ignore:
'SNYK-JS-LODASH-567746':
- '\*':
reason: False positive - not using vulnerable function
expires: 2026-06-01</p>
<p>patch:
'SNYK-JS-EXPRESS-2396632':
- express:
patched: '2026-03-01'
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
<td>Vulnerability Scanning</td>
<td>Snyk</td>
<td>Continuous dependency monitoring</td>
</tr>
<tr>
<td>CVE Detection</td>
<td>OWASP Dependency-Check</td>
<td>Open-source vulnerability detection</td>
</tr>
<tr>
<td>Auto-Updates</td>
<td>Dependabot</td>
<td>Automated dependency update PRs</td>
</tr>
<tr>
<td>License Scanning</td>
<td>FOSSA</td>
<td>License compliance automation</td>
</tr>
<tr>
<td>Risk Analysis</td>
<td>AI/ML</td>
<td>Intelligent vulnerability prioritization</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>Dependency Manifest Files (package.json, requirements.txt)</li>
<li>Dependency Lock Files</li>
<li>Vulnerability Scan Reports</li>
<li>License Compliance Reports</li>
<li>Approved Dependency List</li>
<li>Security Patch Schedule</li>
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
<td>Development Team, Legal/Compliance</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>Development Lead, Architecture Team</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="Step-34-DAST.md">Step 34: DAST</a></li>
<li><strong>Downstream:</strong> <a href="Step-36-Repo-Secret-Scanning.md">Step 36: Repo Secret Scanning</a></li>
<li><strong>Related:</strong> <a href="Step-38-SBOM.md">Step 38: SBOM</a></li>
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
<td>Enhanced with dependency scanning workflows</td>
</tr>
</tbody>
</table>