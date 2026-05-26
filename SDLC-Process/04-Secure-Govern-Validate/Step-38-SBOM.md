# Step 38: SBOM

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 38 |
| **Phase** | Secure, Govern & Validate |
| **Previous Step** | [Step 37: Container Image Scan](Step-37-Container-Image-Scan.md) |
| **Next Step** | [Step 39: Security Phase Complete](Step-39-Security-Phase-Complete.md) |
| **Responsible Role(s)** | Security Team, DevOps |
| **Tools** | Syft, CycloneDX, SPDX Tools, Tern |

---

## Purpose

Generate and maintain a comprehensive Software Bill of Materials (SBOM) documenting all components, libraries, and dependencies. This provides supply chain transparency, supports vulnerability management, and meets compliance requirements.

---

## Process Flow

---

## Activities

### 38.1 Component Discovery and Inventory

**Identify all software components:**
- Scan source code dependencies
- Extract container image components
- Identify OS packages
- List application libraries
- Document build tools and SDKs
- Catalog transitive dependencies

**Component Sources:**
markdown## Application Components
- Direct dependencies (package.json, requirements.txt)
- Transitive/indirect dependencies
- Dev dependencies (if applicable)
- Runtime libraries</p>
<h2>Container Components</h2>
<ul>
<li>Base image OS packages</li>
<li>Installed system libraries</li>
<li>Application binaries</li>
<li>Configuration files</li>
</ul>
<h2>Build Components</h2>
<ul>
<li>Build tools and compilers</li>
<li>CI/CD pipeline dependencies
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul>
<h3>38.2 SBOM Generation</h3>
<p><strong>Create standards-compliant SBOM:</strong>
- Generate in SPDX or CycloneDX format
- Include component names and versions
- Document component relationships
- Add package URLs (PURL)
- Include file hashes
- Record timestamps and tool info</p>
<p><strong>SBOM Formats:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[bomFormat: CycloneDX
specVersion: "1.5"
version: 1
metadata:
component:
name: my-application
version: "2.3.1"
type: application</p>
<p>components:
- name: express
version: "4.18.2"
purl: "pkg:npm/express@4.18.2"
type: library
licenses:
- license:
id: MIT</p>
<ul>
<li>name: lodash
version: "4.17.21"
purl: "pkg:npm/lodash@4.17.21"
type: library
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul>
<h3>38.3 License Aggregation and Analysis</h3>
<p><strong>Document and analyze licenses:</strong>
- Extract license information for all components
- Identify license types (permissive, copyleft, proprietary)
- Check for license conflicts
- Generate license compliance report
- Flag components requiring legal review
- Document license obligations</p>
<p><strong>License Summary:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## License Distribution
- MIT: 145 components (72%)
- Apache 2.0: 32 components (16%)
- BSD-3-Clause: 18 components (9%)
- ISC: 5 components (2%)
- [WARN] GPL-3.0: 1 component (requires review)
- Unknown: 1 component (requires investigation)</p>
<h2>Compliance Status</h2>
<p>[PASS] 197/202 components compliant
[WARN] 1 component requires legal review
[FAIL] 1 component missing license info
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>38.4 Supply Chain Risk Analysis</h3>
<p><strong>Assess supply chain security:</strong>
- Identify unmaintained components
- Check for known vulnerabilities
- Assess project health metrics
- Review maintainer activity
- Identify single points of failure
- Document supply chain risks</p>
<p><strong>Risk Indicators:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## High-Risk Components
- <strong>outdated-lib@1.0.0</strong>
- Last update: 3 years ago
- Known CVEs: 2 (High severity)
- No active maintainers
- Action: Replace with modern alternative</p>
<ul>
<li><strong>niche-package@2.1.0</strong>
<ul>
<li>Single maintainer</li>
<li>Limited community adoption</li>
<li>Risk: Maintenance continuity</li>
<li>Action: Monitor and have backup plan
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul></li>
</ul>
<h3>38.5 SBOM Publication and Distribution</h3>
<p><strong>Publish and distribute SBOM:</strong>
- Sign SBOM for integrity verification
- Publish to artifact repository
- Register with security platforms
- Distribute to stakeholders
- Version control SBOM with releases
- Make available for audits</p>
<hr />
<h2>Best Practices</h2>
<h3>SBOM Management</h3>
<p>[PASS] <strong>DO:</strong>
- Generate SBOM for every release
- Use standardized formats (SPDX, CycloneDX)
- Include comprehensive metadata
- Sign SBOMs for verification
- Version SBOMs with releases</p>
<p>[FAIL] <strong>DON'T:</strong>
- Create SBOMs manually
- Omit transitive dependencies
- Skip license information
- Generate SBOMs only on request
- Ignore SBOM updates for patches</p>
<h3>Supply Chain Security</h3>
<p>[PASS] <strong>DO:</strong>
- Monitor components for vulnerabilities
- Track component end-of-life dates
- Verify component authenticity
- Maintain approved component list
- Review new dependencies before adoption</p>
<p>[FAIL] <strong>DON'T:</strong>
- Use components with no SBOM
- Ignore supply chain risks
- Skip due diligence on new dependencies
- Allow unmaintained components
- Disable supply chain monitoring</p>
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
<td>SBOM Generation Success</td>
<td>100%</td>
<td>SBOMs created for all releases</td>
</tr>
<tr>
<td>SBOM Completeness</td>
<td>&gt;95%</td>
<td>Percentage of components documented</td>
</tr>
<tr>
<td>License Identification</td>
<td>100%</td>
<td>All licenses documented</td>
</tr>
<tr>
<td>Unmaintained Components</td>
<td>&lt;5%</td>
<td>Components not updated in 2+ years</td>
</tr>
<tr>
<td>SBOM Generation Time</td>
<td>&lt;10 min</td>
<td>Time to generate SBOM</td>
</tr>
<tr>
<td>Supply Chain Score</td>
<td>&gt;80/100</td>
<td>Overall supply chain health</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Entry Criteria:</strong>
- Dependency analysis completed (Step 35)
- Container scan completed (Step 37)
- Application built and packaged
- Component inventory available</p>
<p><strong>Exit Criteria:</strong>
- SBOM generated successfully
- All components documented
- Licenses identified (&gt;98%)
- Supply chain risks analyzed
- SBOM validated against schema
- SBOM signed and published
- SBOM registered in security platform</p>
<hr />
<h2>SBOM Example (CycloneDX JSON)</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">json</ac:parameter>
<ac:plain-text-body><![CDATA[{
"bomFormat": "CycloneDX",
"specVersion": "1.5",
"version": 1,
"metadata": {
"timestamp": "2026-03-10T10:00:00Z",
"tools": [{
"name": "syft",
"version": "0.95.0"
}],
"component": {
"type": "application",
"name": "ecommerce-api",
"version": "3.2.1"
}
},
"components": [
{
"type": "library",
"name": "express",
"version": "4.18.2",
"purl": "pkg:npm/express@4.18.2",
"licenses": [{"license": {"id": "MIT"}}],
"hashes": [{
"alg": "SHA-256",
"content": "abc123..."
}]
}
]
}
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>SBOM Generation Tools</h2>
<p><strong>Syft Configuration:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[output:
- "json=sbom.json"
- "spdx-json=sbom.spdx.json"</p>
<p>package:
cataloger:
enabled:
- all</p>
<p>search:
scope: all-layers</p>
<p>file:
metadata:
cataloger:
enabled: true</p>
<p>source:
name: "my-application"
version: "2.3.1"
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>SBOM Use Cases</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Security
- Vulnerability tracking across releases
- Rapid response to new CVEs
- Component risk assessment</p>
<h2>Compliance</h2>
<ul>
<li>License compliance verification</li>
<li>Export control validation</li>
<li>Regulatory audit support</li>
</ul>
<h2>Operations</h2>
<ul>
<li>Incident response coordination</li>
<li>Patch management planning</li>
<li>Dependency tracking</li>
</ul>
<h2>Procurement</h2>
<ul>
<li>Third-party software assessment</li>
<li>Vendor risk evaluation</li>
<li>Contract compliance
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul>
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
<td>SBOM Generation</td>
<td>Syft</td>
<td>Extract components from images/code</td>
</tr>
<tr>
<td>Format Conversion</td>
<td>CycloneDX Tools</td>
<td>Convert between SBOM formats</td>
</tr>
<tr>
<td>Validation</td>
<td>SPDX Validator</td>
<td>Validate SBOM compliance</td>
</tr>
<tr>
<td>Container Analysis</td>
<td>Tern</td>
<td>Generate SBOM from containers</td>
</tr>
<tr>
<td>Risk Analysis</td>
<td>SecOps Intelligence</td>
<td>AI-driven supply chain analysis</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>SBOM Documents (SPDX/CycloneDX)</li>
<li>Component Inventory</li>
<li>License Compliance Report</li>
<li>Supply Chain Risk Assessment</li>
<li>Vulnerability Cross-Reference</li>
<li>SBOM Signing Certificates</li>
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
<td>DevOps Team, Security Team</td>
</tr>
<tr>
<td><strong>Accountable</strong></td>
<td>Security Lead</td>
</tr>
<tr>
<td><strong>Consulted</strong></td>
<td>Development Team, Legal, Compliance</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>Architecture, Product Management, Auditors</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="Step-37-Container-Image-Scan.md">Step 37: Container Image Scan</a></li>
<li><strong>Downstream:</strong> <a href="Step-39-Security-Phase-Complete.md">Step 39: Security Phase Complete</a></li>
<li><strong>Related:</strong> <a href="Step-35-Dependency-Check.md">Step 35: Dependency Check</a></li>
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
<td>Enhanced with SBOM generation workflows and standards</td>
</tr>
</tbody>
</table>