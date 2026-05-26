# Step 57: Application Asset Operation

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 57 |
| **Phase** | Operate |
| **Previous Step** | [Step 56: Deploy to Prod](Step-56-Deploy-To-Prod.md) |
| **Next Step** | Continuous operation / [Step 1: Design Stakeholders](../01-Product-Feedback-Discovery-Planning/Step-01-Design-Stakeholders.md) (next iteration) |
| **Responsible Role(s)** | SRE, Operations |
| **Tools** | Azure Monitor, Application Insights, ELK, Unleash, PagerDuty |

---

## Purpose

Ongoing operation, monitoring, and management of the live application in production. This step represents the continuous operational phase where the application is running, being monitored, receiving progressive feature rollouts, and providing feedback for the next development iteration.

---

## Process Flow

---

## Activities

### 57.1 Production Monitoring

**Continuous monitoring of production systems:**
- Monitor application performance metrics
- Track error rates and exceptions
- Monitor infrastructure health (CPU, memory, disk, network)
- Observe user behavior and usage patterns
- Track business KPIs and SLA compliance
- Monitor security events and anomalies

### 57.2 Incident Management

**Respond to and manage incidents:**
- Receive and triage alerts
- Execute incident response procedures
- Coordinate incident resolution
- Perform root cause analysis
- Document incidents and resolutions
- Conduct post-mortems

### 57.3 Performance Optimization

**Ongoing performance tuning:**
- Identify performance bottlenecks
- Optimize slow queries
- Adjust resource allocations
- Fine-tune caching strategies
- Optimize API endpoints
- Reduce infrastructure costs

### 57.4 Feature Flag Management

**Progressive feature enablement:**
- Execute gradual feature rollouts
- Monitor feature impact on metrics
- Adjust rollout percentages based on data
- Disable problematic features quickly
- Clean up fully-rolled-out flags
- Document flag lifecycle

### 57.5 Feedback Collection

**Collect operational and user feedback:**
- Gather customer feedback
- Log technical debt items
- Document operational pain points
- Collect feature requests
- Track incident learnings
- Identify improvement opportunities

---

## Best Practices

[PASS] **DO:**
- Maintain 24/7 monitoring coverage
- Respond to incidents within SLA
- Document all incidents and resolutions
- Conduct regular post-mortems
- Proactively optimize performance
- Clean up old feature flags
- Share learnings across teams
- Maintain runbooks and documentation

[FAIL] **DON'T:**
- Ignore warning signs
- Skip post-mortems
- Make untracked changes
- Deploy outside change windows
- Disable monitoring or alerts
- Leave tech debt undocumented
- Blame individuals for incidents
- Repeat the same mistakes

---

## Monitoring Dashboard Example

yamldashboard:
name: "Production Application Health"</p>
<p>sections:
application<em>health:
- metric: error</em>rate
threshold: 1%
alert: critical</p>
<pre><code> - metric: response\_time\_p95
threshold: 500ms
alert: warning
- metric: request\_rate
baseline: auto
alert: anomaly
infrastructure:
- metric: cpu\_utilization
threshold: 80%
alert: warning
- metric: memory\_utilization
threshold: 85%
alert: warning
- metric: disk\_utilization
threshold: 90%
alert: critical
business\_metrics:
- metric: active\_users
baseline: auto
alert: anomaly
- metric: transaction\_success\_rate
threshold: 99%
alert: warning
- metric: revenue\_per\_hour
baseline: auto
alert: anomaly
feature\_flags:
- metric: flag\_evaluation\_latency
threshold: 50ms
alert: warning
- metric: active\_flags\_count
info: display\_only
</code></pre>
<p>]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Incident Response Runbook Template</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[</p>
<h2>Severity Definitions</h2>
<ul>
<li><strong>SEV1 (Critical):</strong> Complete service outage, data loss, security breach</li>
<li><strong>SEV2 (High):</strong> Major feature unavailable, significant user impact</li>
<li><strong>SEV3 (Medium):</strong> Minor feature degradation, limited user impact</li>
<li><strong>SEV4 (Low):</strong> Cosmetic issues, no user impact</li>
</ul>
<h2>Response Procedures</h2>
<h3>SEV1 - Critical Incident</h3>
<ol>
<li><p><strong>Immediate Response (0-5 minutes)</strong></p>
<ul>
<li>Page on-call SRE and Engineering Lead</li>
<li>Create incident channel (#incident-YYYY-MM-DD)</li>
<li>Assign incident commander</li>
<li>Begin incident timeline documentation</li>
</ul></li>
<li><p><strong>Assessment (5-15 minutes)</strong></p>
<ul>
<li>Assess scope and impact</li>
<li>Identify affected systems</li>
<li>Check recent deployments</li>
<li>Review monitoring dashboards</li>
</ul></li>
<li><p><strong>Mitigation (15-30 minutes)</strong></p>
<ul>
<li>Execute rollback if deployment-related</li>
<li>Disable problematic feature flags</li>
<li>Scale resources if capacity issue</li>
<li>Apply emergency hotfix if required</li>
</ul></li>
<li><p><strong>Communication (Ongoing)</strong></p>
<ul>
<li>Notify stakeholders every 30 minutes</li>
<li>Update status page</li>
<li>Post updates in incident channel</li>
</ul></li>
<li><p><strong>Resolution &amp; Recovery</strong></p>
<ul>
<li>Verify systems restored</li>
<li>Confirm monitoring green</li>
<li>Document resolution</li>
<li>Schedule post-mortem</li>
</ul></li>
</ol>
<h3>Post-Incident Activities</h3>
<ul>
<li>Conduct blameless post-mortem within 48 hours</li>
<li>Document root cause and timeline</li>
<li>Identify action items to prevent recurrence</li>
<li>Update runbooks with learnings</li>
<li>Share findings with team
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul>
<hr />
<h2>Feature Flag Lifecycle Management</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[</p>
<h2>Phase 1: Dark Launch (Week 1)</h2>
<ul>
<li>Flag: enabled=false, percentage=0%</li>
<li>State: Deployed but inactive</li>
<li>Action: Monitor deployment stability</li>
</ul>
<h2>Phase 2: Internal Testing (Week 2)</h2>
<ul>
<li>Flag: enabled=true, percentage=5%</li>
<li>Audience: Internal users + beta testers</li>
<li>Action: Gather feedback, monitor metrics</li>
</ul>
<h2>Phase 3: Gradual Rollout (Weeks 3-4)</h2>
<ul>
<li>Flag: percentage increases 5% -> 25% -> 50% -> 100%</li>
<li>Audience: Progressive user base expansion</li>
<li>Action: Monitor KPIs, pause if issues</li>
</ul>
<h2>Phase 4: Full Rollout (Week 5+)</h2>
<ul>
<li>Flag: percentage=100%</li>
<li>Audience: All users</li>
<li>Action: Monitor stability for 1 week</li>
</ul>
<h2>Phase 5: Flag Cleanup (Week 6)</h2>
<ul>
<li>Flag: Remove from codebase</li>
<li>Action: Deploy flag removal</li>
<li>Document: Flag lifecycle completion
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
<td>Service Uptime</td>
<td>99.9%</td>
<td>Application availability</td>
</tr>
<tr>
<td>MTTR</td>
<td>&lt;1 hour</td>
<td>Mean time to recovery</td>
</tr>
<tr>
<td>Incident Response Time</td>
<td>&lt;15 min</td>
<td>Time to acknowledge</td>
</tr>
<tr>
<td>Error Rate</td>
<td>&lt;1%</td>
<td>Application error rate</td>
</tr>
<tr>
<td>Response Time P95</td>
<td>&lt;500ms</td>
<td>95th percentile response time</td>
</tr>
<tr>
<td>Feature Flag Latency</td>
<td>&lt;50ms</td>
<td>Flag evaluation time</td>
</tr>
<tr>
<td>Alert Noise</td>
<td>&lt;5%</td>
<td>False positive alerts</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Ongoing Operational Criteria:</strong>
- Monitoring active and healthy
- SLAs being met consistently
- Incidents handled within SLA
- Feedback loop established
- Post-mortems conducted for all SEV1/SEV2
- Tech debt documented
- Runbooks up to date
- On-call rotation maintained</p>
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
<td>Step 56</td>
<td>Live production application</td>
</tr>
<tr>
<td>Feature Flag Configuration</td>
<td>Unleash</td>
<td>Active feature flags</td>
</tr>
<tr>
<td>SLAs/SLOs</td>
<td>Operations</td>
<td>Service level objectives</td>
</tr>
<tr>
<td>Runbooks</td>
<td>Documentation</td>
<td>Operational procedures</td>
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
<td>Operational Metrics</td>
<td>Dashboards</td>
<td>System performance data</td>
</tr>
<tr>
<td>Incident Reports</td>
<td>SRE</td>
<td>Incident documentation</td>
</tr>
<tr>
<td>User Feedback</td>
<td>Step 1 (next iteration)</td>
<td>Production feedback</td>
</tr>
<tr>
<td>Tech Debt Items</td>
<td>Product Backlog</td>
<td>Identified improvements</td>
</tr>
<tr>
<td>Post-Mortem Reports</td>
<td>Knowledge Base</td>
<td>Incident learnings</td>
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
<td>Automated Monitoring</td>
<td>Azure Monitor</td>
<td>Continuous health monitoring</td>
</tr>
<tr>
<td>Anomaly Detection</td>
<td>ML Models</td>
<td>Detect unusual patterns</td>
</tr>
<tr>
<td>Auto-Scaling</td>
<td>Azure Autoscale</td>
<td>Dynamic resource scaling</td>
</tr>
<tr>
<td>Self-Healing</td>
<td>Custom Scripts</td>
<td>Automatic issue remediation</td>
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
<td>O1</td>
<td>Observability</td>
<td>Config management (CMDB)</td>
</tr>
<tr>
<td>O2</td>
<td>Observability</td>
<td>Licence Management</td>
</tr>
<tr>
<td>O3</td>
<td>Observability</td>
<td>Backups</td>
</tr>
<tr>
<td>O4</td>
<td>Observability</td>
<td>Pulumi (Azure)</td>
</tr>
<tr>
<td>O5</td>
<td>Observability</td>
<td>DR/BCP</td>
</tr>
<tr>
<td>O6</td>
<td>Observability</td>
<td>Event / Alert Processing</td>
</tr>
<tr>
<td>O7</td>
<td>Observability</td>
<td>Metrics collection</td>
</tr>
<tr>
<td>O8</td>
<td>Observability</td>
<td>Logging (ELK, App Insights)</td>
</tr>
<tr>
<td>O9</td>
<td>Observability</td>
<td>Alerting &amp; Notifications</td>
</tr>
<tr>
<td>O10</td>
<td>Observability</td>
<td>Visualization (Dashboards)</td>
</tr>
<tr>
<td>O11</td>
<td>Observability</td>
<td>Health Checks</td>
</tr>
<tr>
<td>O12</td>
<td>Observability</td>
<td>Anomaly Detection</td>
</tr>
<tr>
<td>O13</td>
<td>Observability</td>
<td>Trace Correlation</td>
</tr>
<tr>
<td>O14</td>
<td>Observability</td>
<td>Data Retention Policy</td>
</tr>
<tr>
<td>O15</td>
<td>Observability</td>
<td>Feature Toggle integration</td>
</tr>
<tr>
<td>O16</td>
<td>Observability</td>
<td>Tenant/Customer Context</td>
</tr>
<tr>
<td>O17</td>
<td>Observability</td>
<td>Self Healing</td>
</tr>
<tr>
<td>O18</td>
<td>Observability</td>
<td>Change/Release Correlation</td>
</tr>
<tr>
<td>O19</td>
<td>Observability</td>
<td>Chaos Engineering</td>
</tr>
<tr>
<td>O20</td>
<td>Observability</td>
<td>Infra Cost Tracking</td>
</tr>
<tr>
<td>O21</td>
<td>Observability</td>
<td>On Call rotation</td>
</tr>
<tr>
<td>O22</td>
<td>Observability</td>
<td>Postmortems, RCA, Continuous Improvement</td>
</tr>
<tr>
<td>D4</td>
<td>DORA</td>
<td>Mean Time To Recover</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>Operational Runbooks</li>
<li>Monitoring Dashboards</li>
<li>Incident Management Procedures</li>
<li>On-Call Rotation Schedule</li>
<li>Post-Mortem Templates</li>
<li>SLA/SLO Definitions</li>
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
<td>SRE, Operations</td>
</tr>
<tr>
<td><strong>Accountable</strong></td>
<td>SRE Lead</td>
</tr>
<tr>
<td><strong>Consulted</strong></td>
<td>Development Team, Security</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>Product Owner, Business Leadership</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="Step-56-Deploy-To-Prod.md">Step 56: Deploy to Prod</a></li>
<li><strong>Downstream:</strong> Continuous operation / Next development cycle begins at <a href="../01-Product-Feedback-Discovery-Planning/Step-01-Design-Stakeholders.md">Step 1</a></li>
</ul>
<hr />
<h2>Feedback Loops</h2>
<p>This step feeds back into the development cycle through:</p>
<p><strong>Customer Feedback -> Step 1: Design Stakeholders</strong>
- User feature requests
- Customer pain points
- Usage patterns and insights
- Business value validation</p>
<p><strong>Tech Debt -> Product Backlog</strong>
- Code quality improvements
- Architecture refactoring needs
- Performance optimization opportunities
- Infrastructure modernization</p>
<p><strong>Incident Learnings -> Risk Register &amp; Architecture</strong>
- Security vulnerabilities discovered
- Scalability limitations
- Reliability improvements needed
- Operational pain points</p>
<p><strong>Performance Insights -> Development &amp; Architecture</strong>
- Bottlenecks identified
- Optimization opportunities
- Resource utilization patterns
- Capacity planning data</p>
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
<td>Enhanced with operational workflows</td>
</tr>
</tbody>
</table>