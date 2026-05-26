# Step 55: Feature Flag Release

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 55 |
| **Phase** | Deploy |
| **Previous Step** | [Step 54: Smoke Test](Step-54-Smoke-Test.md) |
| **Next Step** | [Step 56: Deploy to Prod](Step-56-Deploy-To-Prod.md) |
| **Responsible Role(s)** | Release Management, Product Owner |
| **Tools** | Unleash Feature Flags |

---

## Purpose

Configure feature flags for production release using Unleash. Features are deployed "dark by default" and progressively enabled through feature flag management, enabling safe, controlled rollouts and quick rollbacks without code deployments.

---

## Process Flow

---

## Activities

### 55.1 Feature Flag Review

**Review feature flags for release:**
- List all features in this release
- Identify feature dependencies
- Review business requirements
- Define success criteria for each feature
- Document expected user impact
- Identify rollback triggers

### 55.2 Dark Launch Configuration

**Configure features as dark (disabled):**
- Set all new features to `enabled: false`
- Verify flags default to "off" state
- Test flag evaluation in staging
- Confirm no features auto-enable
- Document default states
- Validate kill switch functionality

### 55.3 Progressive Rollout Setup

**Configure gradual rollout:**
- Define rollout percentages (e.g., 5% -> 25% -> 50% -> 100%)
- Set rollout schedule and milestones
- Configure stickiness (userId, sessionId)
- Define rollout pause criteria
- Set monitoring thresholds
- Plan rollout communication

### 55.4 User Segment Configuration

**Configure targeted rollout:**
- Define beta tester segment
- Configure internal user segment
- Set up customer tier segments (premium, enterprise)
- Create geographic segments if needed
- Define canary user groups
- Document segment criteria

### 55.5 Flag Activation Planning

**Plan flag activation sequence:**
- Define activation order (dependencies first)
- Schedule activation timeline
- Assign activation ownership
- Create activation runbook
- Define success metrics
- Document rollback procedures

---

## Best Practices

[PASS] **DO:**
- Always start with features disabled (dark by default)
- Use gradual rollouts for high-risk features
- Define clear rollback criteria
- Monitor metrics during rollout
- Document activation plans
- Test flags in staging first
- Use stickiness for consistent user experience

[FAIL] **DON'T:**
- Enable features directly to 100%
- Skip testing flag toggles
- Deploy without kill switch
- Use flags for permanent code branching
- Leave old flags in code indefinitely
- Create complex flag dependencies
- Enable features without monitoring

---

## Feature Flag Configuration Examples

### Example 1: Gradual Rollout

yamlfeature:
name: new<em>dashboard</em>ui
description: "Redesigned analytics dashboard"
type: release
enabled: false # Dark by default</p>
<p>strategies:
- name: gradual-rollout-user-id
parameters:
percentage: 0 # Start at 0%, increase gradually
groupId: new<em>dashboard</em>ui
stickiness: userId # Consistent experience per user</p>
<pre><code> constraints: []
</code></pre>
<p>variants: []</p>
<p>rollout<em>plan:
phase</em>1: 5% # Internal users + beta testers
phase<em>2: 25% # Friendly customers
phase</em>3: 50% # Half user base
phase\_4: 100% # All users</p>
<p>success<em>criteria:
- error</em>rate &lt; 1%
- response<em>time &lt; 500ms
- user</em>satisfaction &gt; 4.0/5.0</p>
<p>rollback<em>triggers:
- error</em>rate &gt; 2%
- response<em>time &gt; 1000ms
- critical</em>bug\_reported
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>Example 2: User Segment Targeting</h3>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[feature:
name: premium\_analytics
description: "Advanced analytics for premium customers"
type: release
enabled: false</p>
<p>strategies:
- name: user-with-id
parameters:
userIds: "internal-team,beta-testers"</p>
<pre><code>- name: custom-strategy
parameters:
segment: premium\_customers
constraints:
- contextName: tier
operator: IN
values: ["premium", "enterprise"]
- contextName: region
operator: IN
values: ["AU", "NZ"]
</code></pre>
<p>]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>Example 3: A/B Testing</h3>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[feature:
name: checkout<em>flow</em>experiment
description: "A/B test new checkout flow"
type: experiment
enabled: false</p>
<p>strategies:
- name: gradual-rollout-user-id
parameters:
percentage: 50
groupId: checkout\_experiment
stickiness: userId</p>
<p>variants:
- name: control
weight: 50
stickiness: default
payload:
type: string
value: "original"</p>
<pre><code>- name: treatment
weight: 50
stickiness: default
payload:
type: string
value: "new\_flow"
</code></pre>
<p>]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Feature Flag Activation Runbook Template</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[</p>
<h2>Feature Details</h2>
<ul>
<li><strong>Feature:</strong> New Dashboard UI</li>
<li><strong>Flag Name:</strong> new<em>dashboard</em>ui</li>
<li><strong>Type:</strong> Gradual Rollout</li>
<li><strong>Owner:</strong> Product Owner / Release Manager</li>
</ul>
<h2>Prerequisites</h2>
<ul>
<li>Production deployment complete</li>
<li>Monitoring dashboards ready</li>
<li>Rollback procedures documented</li>
<li>Team on-call and ready</li>
</ul>
<h2>Activation Phases</h2>
<h3>Phase 1: Internal Testing (0% -> 5%)</h3>
<ul>
<li><strong>Duration:</strong> 24 hours</li>
<li><strong>Audience:</strong> Internal users + beta testers</li>
<li><strong>Success Criteria:</strong> No critical issues, error rate &lt;1%</li>
<li><strong>Monitoring:</strong> Real-time dashboard monitoring</li>
<li><strong>Rollback:</strong> Immediate if error rate &gt;2%</li>
</ul>
<h3>Phase 2: Friendly Customers (5% -> 25%)</h3>
<ul>
<li><strong>Duration:</strong> 48 hours</li>
<li><strong>Audience:</strong> Selected friendly customers</li>
<li><strong>Success Criteria:</strong> Positive feedback, performance acceptable</li>
<li><strong>Monitoring:</strong> Customer feedback + metrics</li>
<li><strong>Rollback:</strong> Within 1 hour if issues reported</li>
</ul>
<h3>Phase 3: Broader Rollout (25% -> 50%)</h3>
<ul>
<li><strong>Duration:</strong> 72 hours</li>
<li><strong>Audience:</strong> Half user base</li>
<li><strong>Success Criteria:</strong> SLA maintained, no escalations</li>
<li><strong>Monitoring:</strong> Full observability stack</li>
<li><strong>Rollback:</strong> Immediate if SLA violated</li>
</ul>
<h3>Phase 4: Full Rollout (50% -> 100%)</h3>
<ul>
<li><strong>Duration:</strong> Ongoing</li>
<li><strong>Audience:</strong> All users</li>
<li><strong>Success Criteria:</strong> Stable for 1 week</li>
<li><strong>Monitoring:</strong> Standard monitoring</li>
<li><strong>Rollback:</strong> Standard incident process</li>
</ul>
<h2>Rollback Procedure</h2>
<ol>
<li>Set feature flag percentage to 0%</li>
<li>Verify rollback in monitoring</li>
<li>Notify stakeholders</li>
<li>Investigate issue</li>
<li>Document incident
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ol>
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
<td>Flag Evaluation Latency</td>
<td>&lt;50ms</td>
<td>Time to evaluate flag</td>
</tr>
<tr>
<td>Rollout Success Rate</td>
<td>&gt;95%</td>
<td>Successful rollouts/total</td>
</tr>
<tr>
<td>Rollback Time</td>
<td>&lt;5 min</td>
<td>Time to disable feature</td>
</tr>
<tr>
<td>Flag Cleanup Time</td>
<td>&lt;30 days</td>
<td>Remove flags after full rollout</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Entry Criteria:</strong>
- Smoke tests passed in staging
- All features identified and documented
- Success criteria defined
- Rollback procedures documented</p>
<p><strong>Exit Criteria:</strong>
- All feature flags configured
- Dark by default confirmed
- Progressive rollout planned
- User segments defined
- Activation plan documented
- Team trained on flag management</p>
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
<td>Production Readiness</td>
<td>Step 54</td>
<td>Go decision from smoke tests</td>
</tr>
<tr>
<td>Feature Flag Config</td>
<td>Step 52</td>
<td>Initial flag configuration</td>
</tr>
<tr>
<td>Release Plan</td>
<td>Product Owner</td>
<td>Feature rollout plan</td>
</tr>
<tr>
<td>User Segments</td>
<td>Product Owner</td>
<td>Target user groups</td>
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
<td>Feature Flag Configuration</td>
<td>Unleash</td>
<td>Production flag settings</td>
</tr>
<tr>
<td>Rollout Plan</td>
<td>Release Management</td>
<td>Progressive rollout schedule</td>
</tr>
<tr>
<td>Activation Checklist</td>
<td>Product Owner</td>
<td>Flag activation steps</td>
</tr>
<tr>
<td>Dark Launch Confirmation</td>
<td>Step 56</td>
<td>Flags configured dark by default</td>
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
<td>Unleash Feature Flag Release</td>
<td>Unleash</td>
<td>Feature flag management (Dark by Default)</td>
</tr>
<tr>
<td>Automated Rollback</td>
<td>Custom Scripts</td>
<td>Auto-rollback on threshold breach</td>
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
<td>O15</td>
<td>Observability</td>
<td>Feature Toggle integration</td>
</tr>
<tr>
<td>O7</td>
<td>Observability</td>
<td>Metrics collection</td>
</tr>
<tr>
<td>O9</td>
<td>Observability</td>
<td>Alerting &amp; Notifications</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>Feature Flag Configuration Template</li>
<li>Progressive Rollout Plan</li>
<li>User Segment Definitions</li>
<li>Activation Runbooks</li>
<li>Rollback Procedures</li>
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
<td>Release Management</td>
</tr>
<tr>
<td><strong>Accountable</strong></td>
<td>Product Owner</td>
</tr>
<tr>
<td><strong>Consulted</strong></td>
<td>Development Lead, SRE</td>
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
<li><strong>Upstream:</strong> <a href="Step-54-Smoke-Test.md">Step 54: Smoke Test</a></li>
<li><strong>Downstream:</strong> <a href="Step-56-Deploy-To-Prod.md">Step 56: Deploy to Prod</a></li>
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
<td>Enhanced with feature flag workflows</td>
</tr>
</tbody>
</table>