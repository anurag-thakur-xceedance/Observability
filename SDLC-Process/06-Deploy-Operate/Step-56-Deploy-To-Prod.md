# Step 56: Deploy To Prod

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 56 |
| **Phase** | Deploy |
| **Previous Step** | [Step 55: Feature Flag Release](Step-55-Feature-Flag-Release.md) |
| **Next Step** | [Step 57: Application Asset Operation](Step-57-Application-Asset-Operation.md) |
| **Responsible Role(s)** | DevOps, SRE, Release Management |
| **Tools** | Azure DevOps or Jira Pipelines, CI/CD, Kubernetes, Docker |

---

## Purpose

Deploy the application to production environment with features dark by default. This is the final deployment step before the application goes live to users, executed with maximum safety controls and monitoring.

---

## Process Flow

---

## Activities

### 56.1 Production Deployment

**Deploy artifacts to production:**
- Execute pre-deployment checklist
- Create production backup (database, config)
- Deploy application artifacts
- Apply production configuration
- Execute database migrations
- Verify deployment integrity

### 56.2 Blue/Green or Canary Deployment

**Execute deployment strategy:**
- **Blue/Green:** Deploy to green environment, validate, switch traffic
- **Canary:** Deploy to small subset, monitor, gradually increase
- **Rolling:** Gradually replace instances with zero downtime
- Monitor error rates during deployment
- Validate performance metrics
- Execute rollback if thresholds breached

### 56.3 Configuration Verification

**Verify production configuration:**
- Validate environment variables loaded
- Confirm feature flags are dark by default
- Verify connection strings correct
- Check API keys and secrets
- Validate TLS/SSL certificates
- Confirm monitoring configuration

### 56.4 Health Monitoring

**Monitor deployment health:**
- Watch real-time health checks
- Monitor application logs
- Track error rates and exceptions
- Monitor response times
- Check resource utilization (CPU, memory, disk)
- Validate database performance

### 56.5 Rollback Readiness

**Ensure rollback capability:**
- Keep previous version running (blue/green)
- Document rollback procedure
- Test rollback capability
- Monitor rollback triggers
- Maintain rollback artifacts
- Define rollback decision criteria

---

## Best Practices

[PASS] **DO:**
- Use automated deployment pipelines
- Deploy during low-traffic periods
- Monitor deployments in real-time
- Test rollback procedures regularly
- Use immutable deployments
- Maintain deployment audit logs
- Communicate deployment status
- Have on-call team ready

[FAIL] **DON'T:**
- Deploy manually in production
- Skip backup procedures
- Deploy during peak hours
- Ignore warning signs
- Deploy without rollback plan
- Make manual configuration changes
- Deploy without monitoring
- Rush through validation steps

---

## Deployment Strategy Examples

### Blue/Green Deployment

yamldeployment<em>strategy: blue</em>green</p>
<p>phases:
1<em>deploy</em>green:
- Deploy new version to green environment
- Validate green environment health
- Run smoke tests on green
- Monitor green for 10 minutes</p>
<p>2<em>traffic</em>switch:
- Switch load balancer to green
- Monitor for 5 minutes
- Validate user traffic flowing correctly</p>
<p>3\_cleanup:
- Keep blue online for 1 hour
- Monitor production metrics
- Decommission blue if stable</p>
<p>rollback:
- Switch load balancer back to blue
- Execution time: &lt;2 minutes
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>Canary Deployment</h3>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[deployment\_strategy: canary</p>
<p>phases:
1<em>canary</em>5pct:
percentage: 5%
duration: 30 minutes
success<em>criteria:
- error</em>rate &lt; 1%
- response\_time &lt; 500ms</p>
<p>2<em>canary</em>25pct:
percentage: 25%
duration: 1 hour
success<em>criteria:
- error</em>rate &lt; 1%
- response\_time &lt; 500ms</p>
<p>3<em>canary</em>50pct:
percentage: 50%
duration: 2 hours
success<em>criteria:
- error</em>rate &lt; 0.5%
- response\_time &lt; 400ms</p>
<p>4<em>full</em>rollout:
percentage: 100%
duration: ongoing</p>
<p>rollback:
- Route all traffic to stable version
- Execution time: &lt;5 minutes
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Production Deployment Checklist</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[</p>
<h2>Pre-Deployment (T-30 minutes)</h2>
<ul>
<li>Smoke tests passed in staging</li>
<li>Feature flags configured (dark by default)</li>
<li>Backup created and verified</li>
<li>Rollback procedure documented and reviewed</li>
<li>On-call team notified and available</li>
<li>Change ticket approved</li>
<li>Stakeholders notified</li>
</ul>
<h2>Deployment (T-0)</h2>
<ul>
<li>Deployment pipeline triggered</li>
<li>Blue/green or canary deployment initiated</li>
<li>Health checks passing</li>
<li>Logs being collected</li>
<li>Monitoring dashboards active</li>
<li>No critical errors in logs</li>
</ul>
<h2>Post-Deployment (T+15 minutes)</h2>
<ul>
<li>All services healthy</li>
<li>API response times normal</li>
<li>Error rates within SLA</li>
<li>Database performance normal</li>
<li>User traffic flowing correctly</li>
<li>Feature flags responding</li>
<li>Monitoring data flowing</li>
</ul>
<h2>Validation (T+1 hour)</h2>
<ul>
<li>Production smoke tests passed</li>
<li>No customer complaints</li>
<li>SLA metrics within targets</li>
<li>No rollback triggered</li>
<li>Deployment report generated</li>
<li>Stakeholders notified of success</li>
</ul>
<h2>Rollback Decision Criteria</h2>
<ul>
<li>Error rate &gt;2%</li>
<li>Response time &gt;1000ms</li>
<li>Critical functionality broken</li>
<li>Database corruption detected</li>
<li>Security vulnerability discovered
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul>
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
<td>Deployment Frequency</td>
<td>Multiple per day</td>
<td>DORA metric - deploy cadence</td>
</tr>
<tr>
<td>Deployment Duration</td>
<td>&lt;30 min</td>
<td>Time to complete deployment</td>
</tr>
<tr>
<td>Change Failure Rate</td>
<td>&lt;5%</td>
<td>% of deployments requiring rollback</td>
</tr>
<tr>
<td>Deployment Success Rate</td>
<td>&gt;95%</td>
<td>Successful deployments/total</td>
</tr>
<tr>
<td>Rollback Time</td>
<td>&lt;10 min</td>
<td>Time to rollback if needed</td>
</tr>
<tr>
<td>MTTR</td>
<td>&lt;1 hour</td>
<td>Mean time to recovery</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Entry Criteria:</strong>
- Smoke tests passed in staging
- Feature flags configured dark by default
- Production infrastructure ready
- Deployment runbook reviewed
- Rollback plan documented
- Change approval obtained</p>
<p><strong>Exit Criteria:</strong>
- Deployment completed successfully
- All health checks passing
- Configuration verified
- Monitoring active and healthy
- Rollback capability confirmed
- No critical issues detected
- Deployment report generated</p>
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
<td>Dark Launch Confirmation</td>
<td>Step 55</td>
<td>Feature flags configured</td>
</tr>
<tr>
<td>Build Artifacts</td>
<td>CI/CD</td>
<td>Production-ready artifacts</td>
</tr>
<tr>
<td>Production Infrastructure</td>
<td>Step 52</td>
<td>Provisioned production environment</td>
</tr>
<tr>
<td>Deployment Runbook</td>
<td>DevOps</td>
<td>Deployment procedures</td>
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
<td>Deployed Application</td>
<td>Step 57</td>
<td>Application live in production</td>
</tr>
<tr>
<td>Deployment Report</td>
<td>Release Management</td>
<td>Deployment details</td>
</tr>
<tr>
<td>Health Status</td>
<td>SRE</td>
<td>Production health status</td>
</tr>
<tr>
<td>Rollback Package</td>
<td>DevOps</td>
<td>Ready rollback artifacts</td>
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
<td>Automated Deployment</td>
<td>Azure DevOps or Jira</td>
<td>CI/CD production deployment</td>
</tr>
<tr>
<td>Auto-Rollback</td>
<td>Custom Scripts</td>
<td>Automatic rollback on threshold breach</td>
</tr>
<tr>
<td>Health Monitoring</td>
<td>Azure Monitor</td>
<td>Real-time production monitoring</td>
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
<td>D2</td>
<td>DORA</td>
<td>Count of Deploys/Period</td>
</tr>
<tr>
<td>D3</td>
<td>DORA</td>
<td>Count of Defects/Issues Post Deploy (CFR)</td>
</tr>
<tr>
<td>D4</td>
<td>DORA</td>
<td>Cycle Time (Deployment)</td>
</tr>
<tr>
<td>O8</td>
<td>Observability</td>
<td>Logging (ELK, App Insights)</td>
</tr>
<tr>
<td>O11</td>
<td>Observability</td>
<td>Health Checks</td>
</tr>
<tr>
<td>O18</td>
<td>Observability</td>
<td>Change/Release Correlation</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>Production Deployment Runbook</li>
<li>Rollback Procedures</li>
<li>Blue/Green Deployment Guide</li>
<li>Canary Deployment Strategy</li>
<li>Production Deployment Checklist</li>
<li>Change Management Tickets</li>
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
<td>Release Manager</td>
</tr>
<tr>
<td><strong>Consulted</strong></td>
<td>Development Lead, Product Owner</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>All Stakeholders</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="Step-55-Feature-Flag-Release.md">Step 55: Feature Flag Release</a></li>
<li><strong>Downstream:</strong> <a href="Step-57-Application-Asset-Operation.md">Step 57: Application Asset Operation</a></li>
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
<td>Enhanced with deployment workflows</td>
</tr>
</tbody>
</table>