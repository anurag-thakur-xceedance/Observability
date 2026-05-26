# Step 37: Container Image Scan

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 37 |
| **Phase** | Secure, Govern & Validate |
| **Previous Step** | [Step 36: Repo Secret Scanning](Step-36-Repo-Secret-Scanning.md) |
| **Next Step** | [Step 38: SBOM](Step-38-SBOM.md) |
| **Responsible Role(s)** | Security Team, DevOps |
| **Tools** | Trivy, Aqua Security, Snyk Container, Docker Scout |

---

## Purpose

Scan container images for vulnerabilities, misconfigurations, and security issues before deployment. This ensures containers meet security standards and don't introduce vulnerabilities into production environments.

---

## Process Flow

---

## Activities

### 37.1 Container Vulnerability Scanning

**Scan container images for known vulnerabilities:**
- Scan OS-level packages (apt, yum, apk)
- Scan application dependencies
- Check language-specific packages
- Identify vulnerable binaries
- Scan all image layers
- Compare against CVE databases

**Scan Layers:**
dockerfileFROM node:18-alpine # &lt;- Scan base image
COPY package\*.json ./ # &lt;- Scan dependencies
RUN npm install # &lt;- Scan installed packages
COPY . . # &lt;- Scan application files
RUN npm run build # &lt;- Scan build artifacts
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>37.2 Configuration Security Analysis</h3>
<p><strong>Analyze container configuration and Dockerfile:</strong>
- Check for running as root user
- Validate exposed ports
- Review environment variables
- Check for privileged mode usage
- Validate health checks
- Review resource limits
- Check COPY/ADD instructions</p>
<p><strong>Configuration Checks:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Critical Configuration Issues
[FAIL] Running as root (USER root or no USER directive)
[FAIL] Using :latest tag for base images
[FAIL] Exposing unnecessary ports
[FAIL] Missing health checks
[FAIL] No resource limits defined
[FAIL] Secrets in environment variables
[FAIL] Writable filesystem</p>
<h2>Secure Configuration</h2>
<p>[PASS] Non-root user (USER appuser)
[PASS] Specific version tags
[PASS] Minimal exposed ports
[PASS] Health checks configured
[PASS] Resource limits set
[PASS] Secrets from secure stores
[PASS] Read-only filesystem where possible
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>37.3 Base Image Validation</h3>
<p><strong>Ensure base images meet security standards:</strong>
- Verify base image from approved registry
- Check base image CVE count
- Validate image signing/provenance
- Ensure base image is maintained
- Check for official vs community images
- Verify minimal/distroless images</p>
<p><strong>Approved Base Images:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[approved<em>base</em>images:
node:
- node:18-alpine
- node:20-alpine
- gcr.io/distroless/nodejs18-debian11</p>
<p>python:
- python:3.11-slim
- python:3.12-alpine
- gcr.io/distroless/python3-debian11</p>
<p>java:
- eclipse-temurin:17-jre-alpine
- gcr.io/distroless/java17-debian11
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>37.4 Security Policy Compliance</h3>
<p><strong>Validate against security policies:</strong>
- Check CVE severity thresholds
- Validate license compliance
- Ensure no high/critical vulnerabilities
- Verify security best practices
- Check image size limits
- Validate layer count limits</p>
<p><strong>Policy Example:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[container\_policy:
vulnerabilities:
critical: 0
high: 0
medium: 5</p>
<p>configuration:
require<em>non</em>root: true
require<em>health</em>check: true
max<em>image</em>size: 500MB
max\_layers: 20</p>
<p>base<em>images:
allow</em>latest<em>tag: false
require</em>signature: true
approved\_registries:
- docker.io/library
- mcr.microsoft.com
- gcr.io/distroless
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>37.5 Remediation and Optimization</h3>
<p><strong>Address findings and optimize images:</strong>
- Upgrade vulnerable packages
- Use more secure base images
- Remove unnecessary packages
- Implement multi-stage builds
- Apply security patches
- Rebuild with updated dependencies</p>
<hr />
<h2>Best Practices</h2>
<h3>Container Security</h3>
<p>[PASS] <strong>DO:</strong>
- Use minimal base images (Alpine, Distroless)
- Run as non-root user
- Use specific version tags (not :latest)
- Scan images before deployment
- Keep base images updated</p>
<p>[FAIL] <strong>DON'T:</strong>
- Run containers as root
- Use :latest tag in production
- Include build tools in production images
- Store secrets in images
- Ignore medium/low vulnerabilities</p>
<h3>Dockerfile Best Practices</h3>
<p>[PASS] <strong>DO:</strong>
- Use multi-stage builds to reduce size
- Combine RUN commands to reduce layers
- Use .dockerignore to exclude files
- Pin package versions
- Set resource limits</p>
<p>[FAIL] <strong>DON'T:</strong>
- Install unnecessary packages
- Use ADD when COPY suffices
- Store credentials in ENV
- Expose unnecessary ports
- Skip vulnerability scanning</p>
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
<td>No critical CVEs in images</td>
</tr>
<tr>
<td>High Vulnerabilities</td>
<td>0</td>
<td>No high-severity issues</td>
</tr>
<tr>
<td>Image Scan Coverage</td>
<td>100%</td>
<td>All images scanned before deployment</td>
</tr>
<tr>
<td>Average Image Size</td>
<td>&lt;200MB</td>
<td>Optimized container size</td>
</tr>
<tr>
<td>Scan Duration</td>
<td>&lt;5 min</td>
<td>Time to complete scan</td>
</tr>
<tr>
<td>Base Image Freshness</td>
<td>&lt;30 days</td>
<td>Age of base image</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Entry Criteria:</strong>
- Container image built successfully
- Image pushed to registry
- Dockerfile follows standards
- Build metadata available</p>
<p><strong>Exit Criteria:</strong>
- Image scanned successfully
- Zero critical vulnerabilities
- Zero high vulnerabilities (or approved)
- Configuration issues resolved
- Base image approved
- Policy compliance verified
- Scan report generated</p>
<hr />
<h2>Secure Dockerfile Example</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">dockerfile</ac:parameter>
<ac:plain-text-body><![CDATA[FROM node:18-alpine AS builder</p>
<p>WORKDIR /app</p>
<p>COPY package\*.json ./</p>
<p>RUN npm ci --only=production</p>
<p>COPY . .</p>
<p>RUN npm run build</p>
<p>FROM node:18-alpine</p>
<p>RUN addgroup -g 1001 -S nodejs &amp;&amp; \
adduser -S nodejs -u 1001</p>
<p>WORKDIR /app</p>
<p>COPY --from=builder --chown=nodejs:nodejs /app/dist ./dist
COPY --from=builder --chown=nodejs:nodejs /app/node<em>modules ./node</em>modules</p>
<p>USER nodejs</p>
<p>EXPOSE 3000</p>
<p>HEALTHCHECK --interval=30s --timeout=3s \
CMD node healthcheck.js || exit 1</p>
<p>CMD ["node", "dist/server.js"]
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Trivy Scan Configuration</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[trivy:
scan:
severity:
- CRITICAL
- HIGH
- MEDIUM</p>
<pre><code>security-checks:
- vuln # Vulnerabilities
- config # Misconfigurations
- secret # Secrets
ignore-unfixed: false
exit-code: 1 # Fail build on findings
</code></pre>
<p>policy:
file: .trivy/policy.rego</p>
<p>output:
format: json
report: trivy-report.json
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Common Vulnerabilities Found</h2>
<p><strong>Example Scan Results:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Critical Issues
- CVE-2023-12345: Remote Code Execution in libcurl (v7.68.0)
- Fix: Upgrade to libcurl v8.0.0+
- Affected: All images using Ubuntu 20.04 base</p>
<h2>High Issues</h2>
<ul>
<li>CVE-2023-67890: SQL Injection in postgres driver
<ul>
<li>Fix: Update pg package to v8.11.0+</li>
</ul></li>
</ul>
<h2>Configuration Issues</h2>
<ul>
<li>Container running as root (UID 0)
<ul>
<li>Fix: Add USER directive in Dockerfile</li>
</ul></li>
<li>No health check defined
<ul>
<li>Fix: Add HEALTHCHECK instruction
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul></li>
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
<td>Vulnerability Scanning</td>
<td>Trivy</td>
<td>Fast, comprehensive image scanning</td>
</tr>
<tr>
<td>Runtime Protection</td>
<td>Aqua Security</td>
<td>Container runtime security</td>
</tr>
<tr>
<td>Policy Enforcement</td>
<td>OPA/Gatekeeper</td>
<td>Admission control policies</td>
</tr>
<tr>
<td>Image Optimization</td>
<td>Docker Scout</td>
<td>Recommend optimizations</td>
</tr>
<tr>
<td>Continuous Scanning</td>
<td>Snyk Container</td>
<td>Monitor deployed images</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>Container Security Policy</li>
<li>Approved Base Images List</li>
<li>Dockerfile Best Practices Guide</li>
<li>Vulnerability Scan Reports</li>
<li>Image Build Manifests</li>
<li>Security Gate Results</li>
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
<td>Development Team, Cloud Architect</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>Development Lead, Operations</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="Step-36-Repo-Secret-Scanning.md">Step 36: Repo Secret Scanning</a></li>
<li><strong>Downstream:</strong> <a href="Step-38-SBOM.md">Step 38: SBOM</a></li>
<li><strong>Related:</strong> <a href="../03-Develop/Step-19-IAC-Jobs-Runner.md">Step 19: IAC Jobs Runner</a></li>
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
<td>Enhanced with container security scanning workflows</td>
</tr>
</tbody>
</table>