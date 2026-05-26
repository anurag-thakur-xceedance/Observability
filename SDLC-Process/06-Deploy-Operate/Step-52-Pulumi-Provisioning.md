# Step 52: Pulumi Provisioning

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 52 |
| **Phase** | Deploy |
| **Previous Step** | [Step 51: SBOM Pen Test Evaluator](../05-Test/Step-51-SBOM-Pen-Test-Evaluator.md) |
| **Next Step** | [Step 53: Staging Pre-Prod Deploy](Step-53-Staging-Pre-Prod-Deploy.md) |
| **Responsible Role(s)** | DevOps, SRE |
| **Tools** | Pulumi, Unleash Feature Flags, Azure |

---

## Purpose

Provision production infrastructure using Infrastructure as Code (Pulumi) and configure feature flags for controlled release. This ensures infrastructure is ready for deployment with proper feature flag configuration following "dark by default" principles.

---

## Process Flow

---

## Activities

### 52.1 Infrastructure Provisioning

**Provision production infrastructure:**
- Review Pulumi stack configuration
- Execute `pulumi up` for production stack
- Provision compute resources (Azure App Services, VMs, Kubernetes)
- Provision networking (VNets, subnets, NSGs, load balancers)
- Provision data stores (Azure SQL, CosmosDB, storage accounts)
- Provision monitoring infrastructure (Application Insights, Log Analytics)

### 52.2 Feature Flag Configuration

**Configure Unleash feature flags:**
- Create feature flag definitions in Unleash
- Set all features to "dark by default" (disabled)
- Configure user segments for progressive rollout
- Define activation strategies (gradual rollout, A/B testing)
- Set up flag dependencies and constraints
- Document flag activation plan

### 52.3 Infrastructure Validation

**Validate provisioned infrastructure:**
- Verify all resources created successfully
- Test network connectivity
- Validate DNS configuration
- Check security group rules
- Verify SSL/TLS certificates
- Test database connectivity

### 52.4 Security Configuration

**Apply production security settings:**
- Enable Azure Key Vault integration
- Configure managed identities
- Apply network security policies
- Enable DDoS protection
- Configure WAF rules
- Verify encryption at rest and in transit

### 52.5 Deployment Readiness Check

**Verify ready for deployment:**
- Confirm infrastructure health
- Validate monitoring and alerting setup
- Check backup configurations
- Verify disaster recovery readiness
- Review deployment runbook
- Obtain sign-off from SRE and Security

---

## Best Practices

[PASS] **DO:**
- Use Pulumi state backends (Azure Storage)
- Tag all resources for cost tracking
- Apply least privilege access
- Enable diagnostic logging on all resources
- Use infrastructure validation checks
- Document infrastructure dependencies

[FAIL] **DON'T:**
- Manually modify infrastructure (use IaC only)
- Share credentials in Pulumi configs
- Skip validation steps
- Deploy without backup plans
- Ignore cost optimization
- Provision resources without tags

---

## Pulumi Stack Configuration Example

yamlconfig:
azure-native:location: australiaeast
app:environment: production
app:instanceCount: 3
app:enableAutoScaling: true
app:minInstances: 2
app:maxInstances: 10
app:featureFlagsEndpoint: https://unleash.company.com
monitoring:
enableApplicationInsights: true
retentionDays: 90
security:
enableWAF: true
enableDDoSProtection: true
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Feature Flag Configuration Template</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[feature<em>name: new</em>dashboard
description: "New analytics dashboard with real-time data"
enabled: false # Dark by default
strategies:
- name: gradual-rollout
parameters:
percentage: 0 # Start at 0%
stickiness: userId
- name: user-segment
parameters:
segment: beta\_testers
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
<td>Provisioning Time</td>
<td>&lt;15 min</td>
<td>Time to provision infrastructure</td>
</tr>
<tr>
<td>Infrastructure Uptime</td>
<td>99.9%</td>
<td>Infrastructure availability</td>
</tr>
<tr>
<td>Feature Flag Latency</td>
<td>&lt;50ms</td>
<td>Flag evaluation time</td>
</tr>
<tr>
<td>Cost Variance</td>
<td>&lt;5%</td>
<td>Actual vs estimated cost</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Entry Criteria:</strong>
- All testing phases completed successfully
- IAC configurations reviewed and approved
- Production specifications finalized
- Security requirements documented</p>
<p><strong>Exit Criteria:</strong>
- Infrastructure provisioned successfully
- All resources validated and healthy
- Feature flags configured (dark by default)
- Security settings applied and verified
- Monitoring and alerting operational
- Deployment readiness confirmed</p>
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
<td>Test Phase Summary</td>
<td>Step 51</td>
<td>Complete test phase results</td>
</tr>
<tr>
<td>IAC Configurations</td>
<td>Step 11</td>
<td>Approved infrastructure code</td>
</tr>
<tr>
<td>Feature Flag Config</td>
<td>Product Owner</td>
<td>Feature release configuration</td>
</tr>
<tr>
<td>Production Specifications</td>
<td>Architecture</td>
<td>Production environment specs</td>
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
<td>Provisioned Infrastructure</td>
<td>Step 53</td>
<td>Ready production environment</td>
</tr>
<tr>
<td>Feature Flag State</td>
<td>Unleash</td>
<td>Configured feature flags</td>
</tr>
<tr>
<td>Infrastructure Report</td>
<td>SRE</td>
<td>Provisioning details</td>
</tr>
<tr>
<td>Readiness Confirmation</td>
<td>DevOps</td>
<td>Deployment readiness</td>
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
<td>Pulumi Provisioning</td>
<td>Pulumi</td>
<td>Automated infrastructure provisioning</td>
</tr>
<tr>
<td>Unleash Feature Flags</td>
<td>Unleash</td>
<td>Feature flag management</td>
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
<td>O4</td>
<td>Observability</td>
<td>Azure Infrastructure monitoring</td>
</tr>
<tr>
<td>O15</td>
<td>Observability</td>
<td>Feature Toggle integration</td>
</tr>
<tr>
<td>O20</td>
<td>Observability</td>
<td>Infra Cost Tracking</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>Pulumi Stack Configurations</li>
<li>Feature Flag Configuration Template</li>
<li>Production Environment Specifications</li>
<li>Infrastructure Validation Checklist</li>
<li>Provisioning Runbook</li>
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
<td>DevOps, SRE</td>
</tr>
<tr>
<td><strong>Accountable</strong></td>
<td>DevOps Lead</td>
</tr>
<tr>
<td><strong>Consulted</strong></td>
<td>Architecture, Security</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>Development Team, Product Owner</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="../05-Test/Step-51-SBOM-Pen-Test-Evaluator.md">Step 51: SBOM Pen Test Evaluator</a></li>
<li><strong>Downstream:</strong> <a href="Step-53-Staging-Pre-Prod-Deploy.md">Step 53: Staging Pre-Prod Deploy</a></li>
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
<td>Enhanced with provisioning workflows</td>
</tr>
</tbody>
</table>