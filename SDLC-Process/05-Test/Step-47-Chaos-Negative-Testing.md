# Step 47: Chaos Negative Testing

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 47 |
| **Phase** | Test |
| **Previous Step** | [Step 46: Performance Testing](Step-46-Performance-Testing.md) |
| **Next Step** | [Step 48: Compatibility Testing](Step-48-Compatibility-Testing.md) |
| **Responsible Role(s)** | SRE Team, QA Team |
| **Tools** | Chaos Monkey, Gremlin, Litmus Chaos, Azure Chaos Studio |

---

## Purpose

Conduct chaos engineering experiments and negative testing to validate system resilience, fault tolerance, and graceful degradation under failure conditions. Ensure the system can withstand and recover from unexpected failures.

---

## Process Flow

---

## Activities

### 47.1 Controlled Failure Injection

**Inject various failure types:**
- Service instance termination
- Network latency and packet loss
- Database connection failures
- Disk I/O errors
- Memory pressure
- CPU starvation
- Dependency service failures

### 47.2 Recovery Mechanism Validation

**Verify automatic recovery:**
- Auto-scaling triggers correctly
- Health checks detect failures
- Load balancers reroute traffic
- Circuit breakers activate
- Retry logic functions properly
- Failover mechanisms work

### 47.3 Graceful Degradation Testing

**Test reduced functionality scenarios:**
- System continues with degraded features
- User experience remains acceptable
- Critical paths remain functional
- Appropriate error messages displayed
- Fallback mechanisms activate

### 47.4 Negative Testing

**Test invalid inputs and edge cases:**
- Malformed requests
- Invalid authentication
- Boundary value testing
- SQL injection attempts
- XSS attack scenarios
- Rate limit violations

### 47.5 Resilience Analysis

**Analyze system behavior:**
- Mean time to recovery (MTTR)
- Blast radius of failures
- Cascading failure patterns
- Recovery completeness
- Data consistency after recovery

---

## Best Practices

[PASS] **DO:**
- Start with non-production environments
- Have rollback plans ready
- Monitor all system metrics during experiments
- Document all findings
- Gradually increase failure severity

[FAIL] **DON'T:**
- Run chaos tests in production without preparation
- Inject multiple failures simultaneously initially
- Skip monitoring during experiments
- Ignore "small" issues found
- Forget to validate data integrity after recovery

---

## Key Metrics

| Metric | Target | Description |
| --- | --- | --- |
| Mean Time To Recovery | <5 min | Time to recover from failures |
| Service Availability | >99.9% | Uptime during chaos tests |
| Blast Radius | Contained | Impact scope of failures |
| Recovery Success Rate | 100% | Successful automatic recovery |
| Data Loss | 0 | No data loss after recovery |

---

## Quality Gates

**Exit Criteria:**
- Chaos scenarios executed successfully
- All recovery mechanisms validated
- Graceful degradation confirmed
- MTTR meets targets
- Critical resilience issues documented
- Improvement recommendations created

---

## Chaos Testing Example

yamlapiVersion: litmuschaos.io/v1alpha1
kind: ChaosEngine
metadata:
name: service-chaos
spec:
appinfo:
appns: production
applabel: 'app=payment-service'
chaosServiceAccount: chaos-sa
experiments:
- name: pod-delete
spec:
components:
env:
- name: TOTAL<em>CHAOS</em>DURATION
value: '60'
- name: CHAOS\_INTERVAL
value: '10'
- name: FORCE
value: 'false'
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
<td>Chaos Engineering</td>
<td>Chaos Monkey</td>
<td>Random failure injection</td>
</tr>
<tr>
<td>Orchestration</td>
<td>Gremlin</td>
<td>Controlled chaos experiments</td>
</tr>
<tr>
<td>K8s Chaos</td>
<td>Litmus Chaos</td>
<td>Kubernetes-native chaos</td>
</tr>
<tr>
<td>Cloud Chaos</td>
<td>Azure Chaos Studio</td>
<td>Cloud platform chaos testing</td>
</tr>
<tr>
<td>Analysis</td>
<td>AI/ML</td>
<td>Pattern detection in failures</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>Chaos Test Scenarios</li>
<li>Resilience Requirements</li>
<li>Recovery Runbooks</li>
<li>Incident Response Procedures</li>
<li>Chaos Test Reports</li>
<li>Resilience Improvements Backlog</li>
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
<td>SRE Team, QA Team</td>
</tr>
<tr>
<td><strong>Accountable</strong></td>
<td>SRE Lead</td>
</tr>
<tr>
<td><strong>Consulted</strong></td>
<td>Architecture Team, Development Team</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>Operations, Product Owner, Security</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="Step-46-Performance-Testing.md">Step 46: Performance Testing</a></li>
<li><strong>Downstream:</strong> <a href="Step-48-Compatibility-Testing.md">Step 48: Compatibility Testing</a></li>
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
<td>Enhanced with chaos engineering workflows</td>
</tr>
</tbody>
</table>