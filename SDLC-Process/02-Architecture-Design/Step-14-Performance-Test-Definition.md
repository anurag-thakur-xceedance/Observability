# Step 14: Performance Test Definition

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 14 |
| **Phase** | Architecture & Design |
| **Previous Step** | Step 13: Test Approach Definition |
| **Next Step** | Step 15: Automation Test Definition |
| **Responsible Role(s)** | Performance Engineer, QA Team |
| **Tools** | JMeter, Azure Load Testing |

---

## Purpose

Define performance testing requirements, scenarios, and acceptance criteria. This ensures that performance testing is planned and integrated into the development lifecycle from the design phase. Performance issues caught early are significantly cheaper to fix than those found in production.

---

## Process Flow

```mermaid graph TD A[NFRs + SLAs] --> B[14.1 Requirements Analysis] B --> C[14.2 Scenario Definition] C --> D[14.3 Workload Modelling] D --> E[14.4 Acceptance Criteria] E --> F[14.5 Tool Selection] F --> G[Performance Test Plan] G --> H[Performance Testing Phase] ```

---

## Inputs

| Input | Source | Description |
| --- | --- | --- |
| Test Strategy | Step 13 | Overall testing approach |
| NFRs | Requirements | Performance-related NFRs |
| Architecture Design | Step 10 | System architecture |
| SLAs/SLOs | Operations | Service level agreements |

---

## Activities

### 14.1 Performance Requirements Analysis

**Owner:** Performance Engineer with Architecture
**Duration:** 1-2 business days

#### Process Steps:

1. **Review Non-Functional Requirements**

- Extract performance-related NFRs: - **Response Time:** API latency targets (p50, p95, p99) - **Throughput:** Requests per second (RPS) - **Concurrency:** Concurrent users supported - **Resource Utilization:** CPU, memory, disk, network limits - **Scalability:** Growth capacity requirements - Example NFRs: - Login API: <2s response time (p95) - Dashboard load: <3s page load time (p95) - Support 100 concurrent users - Support 10,000 daily active users

1. **Analyze SLA/SLO Requirements**

- Service Level Agreements (SLAs): - Contractual commitments to customers - Uptime guarantees (99.9%, 99.95%, 99.99%) - Performance guarantees (response times) - Penalties for non-compliance - Service Level Objectives (SLOs): - Internal targets (stricter than SLAs) - Error budget calculations - Latency objectives (p50, p95, p99) - Availability objectives - Example SLO: - 99.9% availability (43 minutes downtime/month) - 95% of requests <200ms response time - Error rate <0.1%

1. **Identify Critical User Journeys**

- Determine high-traffic scenarios: - User authentication (login/logout) - Search and browse operations - Data entry and form submissions - Report generation - API integrations (if high volume) - Prioritize by: - Business criticality - Usage frequency - Revenue impact - User experience impact

1. **Review System Architecture**

- Understand performance-sensitive components: - Database queries and transactions - API endpoints and services - Caching layers - External service integrations - File/blob storage operations - Identify potential bottlenecks: - Single points of failure - Unscalable components - Resource-intensive operations - Synchronous blocking calls - N+1 query problems

1. **Analyze Historical Performance Data**

- Review past performance metrics (if available): - Current system performance baseline - Historical trends - Known performance issues - Seasonal patterns - Benchmark similar systems: - Industry standards - Competitor performance - Best practices

1. **Document Performance Requirements**

- Create requirements document: - Response time requirements per endpoint - Throughput requirements - Concurrency requirements - Resource utilization limits - Scalability targets - SLA/SLO commitments

**Performance Requirements Document Template:**

```markdown # Performance Requirements: Auth Service

## Response Time Requirements

| Endpoint | p50 | p95 | p99 | Max |
| --- | --- | --- | --- | --- |
| POST /auth/login | <500ms | <2s | <3s | 5s |
| POST /auth/logout | <200ms | <500ms | <1s | 2s |
| GET /users/{id} | <100ms | <200ms | <500ms | 1s |
| POST /auth/register | <1s | <3s | <5s | 10s |

## Throughput Requirements

- **Peak Load:** 50 requests/second
- **Average Load:** 20 requests/second
- **Burst Capacity:** 100 requests/second (short duration)

## Concurrency Requirements

- **Concurrent Users:** 100 simultaneous users
- **Daily Active Users:** 10,000 users
- **Monthly Active Users:** 50,000 users

## Resource Utilization Limits

- **CPU:** <70% average, <90% peak
- **Memory:** <80% average, <95% peak
- **Database Connections:** <80 of 100 pool size
- **Disk I/O:** <70% capacity

## Scalability Requirements

- Support 2x growth without architecture changes
- Horizontal scaling for 5x growth
- Handle 1000 concurrent users within 12 months

## SLA/SLO Commitments

- **Availability:** 99.9% uptime (43 min downtime/month)
- **Error Rate:** <0.1% (99.9% success rate)
- **Response Time:** 95% of requests meet p95 targets

```

---

### 14.2 Scenario Definition

**Owner:** Performance Engineer
**Duration:** 1 business day

#### Process Steps:

1. **Define Load Testing Scenarios**

- **Purpose:** Validate performance under expected load - **Scenario:** Normal business operations - **User Load:** Expected concurrent users - **Duration:** 30-60 minutes sustained load - **Success Criteria:** All performance targets met - Example: ``` Scenario: Normal Business Hours - 100 concurrent users - 70% read operations (browse, view) - 30% write operations (create, update) - Duration: 1 hour - Ramp-up: 5 minutes to reach 100 users ```

1. **Define Stress Testing Scenarios**

- **Purpose:** Identify breaking point - **Scenario:** Push system beyond capacity - **User Load:** Gradually increase until failure - **Duration:** Increase load every 5-10 minutes - **Success Criteria:** Graceful degradation, no crashes - Example: ``` Scenario: Stress Test - Find Breaking Point - Start: 100 users - Increase: +50 users every 10 minutes - Stop: System error rate >5% or crashes - Observe: At what load does system fail? - Expected breaking point: 400-500 users ```

1. **Define Spike Testing Scenarios**

- **Purpose:** Validate handling of sudden load increase - **Scenario:** Flash sale, viral content, marketing campaign - **User Load:** Sudden jump from baseline to peak - **Duration:** 15-30 minutes spike duration - **Success Criteria:** System remains stable, recovers - Example: ``` Scenario: Flash Sale Spike - Baseline: 20 users (normal load) - Spike: Jump to 200 users instantly - Hold: 15 minutes at peak - Drop: Return to 20 users - Success: System handles spike without errors ```

1. **Define Soak/Endurance Testing Scenarios**

- **Purpose:** Identify memory leaks and long-term issues - **Scenario:** Sustained load over extended period - **User Load:** Normal expected load - **Duration:** 4-24 hours continuous operation - **Success Criteria:** No resource leaks, stable performance - Example: ``` Scenario: 24-Hour Soak Test - Load: 100 concurrent users (constant) - Duration: 24 hours - Monitor: Memory, connections, response times - Success: No degradation over time ```

1. **Define Scalability Testing Scenarios**

- **Purpose:** Validate horizontal/vertical scaling - **Scenario:** Increase resources and test capacity - **Scaling Approach:** - Horizontal: Add more instances - Vertical: Increase instance size - **Success Criteria:** Linear or near-linear scaling - Example: ``` Scenario: Horizontal Scaling Test - Test 1: 100 users on 1 instance - Test 2: 200 users on 2 instances - Test 3: 300 users on 3 instances - Validate: Linear throughput increase ```

1. **Document Test Scenarios**

- For each scenario, document: - Scenario name and purpose - User load profile - Test duration and ramp-up - Transaction mix (% of each operation) - Success criteria - Expected results - Risk areas to monitor

**Performance Test Scenarios Template:**

| Scenario | Type | Users | Duration | Transaction Mix | Success Criteria |
| --- | --- | --- | --- | --- | --- |
| Normal Business | Load | 100 | 1 hour | 70% read, 30% write | All p95 targets met |
| Peak Hours | Load | 150 | 30 min | 60% read, 40% write | All p95 targets met |
| Find Breaking Point | Stress | 100→500 | 1 hour | 70% read, 30% write | Graceful degradation at 400+ |
| Flash Sale Spike | Spike | 20→200→20 | 30 min | 90% read, 10% write | No errors during spike |
| 24-Hour Endurance | Soak | 100 | 24 hours | 70% read, 30% write | No performance degradation |
| Horizontal Scaling | Scalability | 100/200/300 | 3x 30 min | 70% read, 30% write | Linear throughput scaling |

---

### 14.3 Workload Modelling

**Owner:** Performance Engineer
**Duration:** 1-2 business days

#### Process Steps:

1. **Define User Journey Workflows**

- Map typical user interactions: ``` User Journey: Login and Browse 1. GET /login (view login page) 2. POST /auth/login (authenticate) 3. GET /dashboard (view dashboard) 4. GET /users/profile (view profile) 5. GET /users/{id} (view user details) 6. POST /auth/logout (logout) ``` - Assign probability/weight to each journey: - 40% - Login → Browse → Logout - 30% - Login → Create Content → Logout - 20% - Login → Update Profile → Logout - 10% - Login → Admin Tasks → Logout

1. **Define Transaction Mix**

- Percentage of each operation type: - Read operations: 70% - GET /dashboard: 25% - GET /users/{id}: 20% - GET /reports: 15% - GET /search: 10% - Write operations: 30% - POST /users: 10% - PUT /users/{id}: 10% - DELETE /users/{id}: 5% - POST /auth/\*: 5% - Reflect realistic usage patterns

1. **Model Think Time**

- Define delays between requests: - Simulate real user behavior (reading, thinking) - Typical think times: - Between page views: 5-10 seconds - Reading content: 10-30 seconds - Form filling: 20-60 seconds - Use random variation (±20%) - Example: ``` GET /dashboard Think time: 8 seconds (random 5-10s) GET /users/profile Think time: 15 seconds (random 10-20s) POST /users/update ```

1. **Define Data Variation**

- Parameterize test data: - User IDs (1-10000) - Search terms (from list of 100 terms) - Date ranges (last 7/30/90 days) - Page sizes (10, 25, 50, 100 items) - Use realistic data: - Real email formats - Valid date formats - Appropriate string lengths - Avoid cache hits (vary requests)

1. **Model Load Distribution**

- Ramp-up profile: ``` Minute 0-5: Ramp from 0 to 100 users (linear) Minute 5-60: Hold at 100 users (steady state) Minute 60-65: Ramp down to 0 (linear) ``` - Peak hour modeling: ``` 09:00-10:00: Ramp to 150 users (morning peak) 10:00-12:00: 100 users (normal) 12:00-13:00: 80 users (lunch dip) 13:00-17:00: 100 users (afternoon) 17:00-18:00: Ramp down to 20 (evening) ``` - Geographical distribution (if applicable): - 50% US East - 30% Europe - 20% Asia Pacific

1. **Create Workload Model Document**

- Document workload characteristics: - User journey definitions - Transaction mix percentages - Think time specifications - Data parameterization approach - Load ramp-up/down profiles - Create test scripts that implement model

**Workload Model Template:**

```markdown # Workload Model: Auth Service

## User Journeys

### Journey 1: Login and Browse (40% of users)

1. POST /auth/login (5s response)
2. Think time: 8s
3. GET /dashboard (2s response)
4. Think time: 15s
5. GET /users/profile (0.5s response)
6. Think time: 20s
7. POST /auth/logout (0.3s response)

**Total duration:** ~50 seconds per iteration

### Journey 2: Login and Create (30% of users)

1. POST /auth/login
2. GET /dashboard
3. POST /users (create user)
4. GET /users/{id} (view created user)
5. POST /auth/logout

## Transaction Mix

- **Read (70%):**

- GET /dashboard: 25% - GET /users/{id}: 20% - GET /reports: 15% - GET /search: 10%

- **Write (30%):**

- POST /users: 10% - PUT /users/{id}: 10% - POST /auth/\*: 10%

## Think Time

- Between pages: 5-10 seconds (avg 7.5s)
- Reading content: 10-30 seconds (avg 20s)
- Form filling: 20-60 seconds (avg 40s)

## Data Parameterization

- User IDs: 1-10,000 (uniform distribution)
- Search queries: List of 100 common terms
- Emails: random@example-{1-10000}.com

## Load Profile

``` Time (min) | Users | Description 0-5 | 0→100 | Ramp-up 5-60 | 100 | Steady state 60-65 | 100→0 | Ramp-down ``` ```

---

### 14.4 Acceptance Criteria Definition

**Owner:** Performance Engineer with QA Lead
**Duration:** 0.5-1 business day

#### Process Steps:

1. **Define Response Time Criteria**

- Set thresholds per endpoint: - Must meet: p95 targets - Should meet: p99 targets - Monitor: p50 and max values - Example criteria: ``` POST /auth/login: - PASS: p95 <2s AND p99 <3s - FAIL: p95 ≥2s OR p99 ≥3s - WARNING: p95 >1.5s (close to threshold) ```

1. **Define Throughput Criteria**

- Set minimum throughput requirements: - Requests per second (RPS) - Transactions per second (TPS) - Example: ``` System Throughput: - PASS: ≥50 RPS sustained - FAIL: <50 RPS sustained - WARNING: 50-55 RPS (borderline) ```

1. **Define Error Rate Criteria**

- Acceptable error rates: - HTTP 4xx errors (client errors) - HTTP 5xx errors (server errors) - Timeout errors - Example: ``` Error Rate: - PASS: <0.1% total errors AND 0% 5xx errors - FAIL: ≥0.1% total errors OR any 5xx errors - WARNING: 0.05-0.1% errors ```

1. **Define Resource Utilization Criteria**

- CPU, memory, disk, network limits: - Average utilization - Peak utilization - Sustained high utilization - Example: ``` Resource Utilization: - PASS: CPU avg <70%, peak <90% - PASS: Memory avg <80%, peak <95% - FAIL: Sustained >90% CPU or >95% memory ```

1. **Define Scalability Criteria**

- Linear scaling expectations: - 2x resources → ~2x throughput - Acceptable efficiency: 80%+ - Example: ``` Scalability (Horizontal): - 1 instance: 100 RPS baseline - 2 instances: PASS if ≥180 RPS (90% efficiency) - 3 instances: PASS if ≥270 RPS (90% efficiency) ```

1. **Document Pass/Fail Criteria**

- Create clear decision rules: - PASS: All criteria met - FAIL: Any critical criterion failed - WARNING: Performance degraded but acceptable - Include remediation triggers: - What to do if test fails - Who to notify - Escalation path

**Performance Acceptance Criteria Template:**

```markdown # Performance Acceptance Criteria

## Overall Test Pass Criteria

Test PASSES if ALL of the following are true:

- Response time criteria met for all endpoints
- Throughput requirements met
- Error rate within acceptable limits
- Resource utilization within limits
- No system crashes or restarts

## Response Time Criteria

| Endpoint | p50 | p95 | p99 | Status |
| --- | --- | --- | --- | --- |
| POST /auth/login | <500ms | <2s | <3s | REQUIRED |
| GET /users/{id} | <100ms | <200ms | <500ms | REQUIRED |
| GET /dashboard | <1s | <3s | <5s | REQUIRED |

**Pass Condition:** All p95 targets met
**Fail Condition:** Any p95 target exceeded

## Throughput Criteria

- **Minimum:** 50 RPS sustained for 1 hour
- **Target:** 75 RPS average
- **Pass:** ≥50 RPS sustained
- **Fail:** <50 RPS sustained

## Error Rate Criteria

- **HTTP 5xx Errors:** 0% (zero tolerance)
- **HTTP 4xx Errors:** <1% (expected for invalid requests)
- **Timeout Errors:** <0.1%
- **Total Error Rate:** <0.1%

**Pass:** All error criteria met
**Fail:** Any error threshold exceeded

## Resource Utilization Criteria

| Resource | Average | Peak | Pass Condition |
| --- | --- | --- | --- |
| CPU | <70% | <90% | Both met |
| Memory | <80% | <95% | Both met |
| DB Connections | <80 of 100 | <95 of 100 | Both met |

**Pass:** All resource criteria met
**Fail:** Any sustained overutilization

## Stability Criteria

- **No system crashes** during test
- **No memory leaks** (soak test)
- **No connection leaks**
- **Graceful degradation** under stress

## Remediation Actions

**If Test Fails:**

1. Capture diagnostics (logs, metrics, traces)
2. Notify development lead and architect
3. Create performance bug tickets (P0/P1)
4. Schedule optimization sprint
5. Re-test after fixes

```

---

### 14.5 Tool Selection

**Owner:** Performance Engineer
**Duration:** 0.5-1 business day

#### Process Steps:

1. **Evaluate Load Testing Tools**

- Open-source options: - **JMeter:** Java-based, GUI + CLI, extensive plugins - **k6:** Modern, JS scripting, CLI, cloud integration - **Gatling:** Scala-based, great reports, dev-friendly - **Locust:** Python-based, code-based scenarios - Cloud-based options: - **Azure Load Testing:** Azure-native, k6-based - **BlazeMeter:** JMeter-compatible, scalable - **Loader.io:** Simple, SaaS-based - Selection criteria: - Protocol support (HTTP, WebSocket, gRPC) - Scripting language (Java, JS, Python) - Reporting capabilities - CI/CD integration - Cost and licensing

1. **Select Monitoring Tools**

- APM (Application Performance Monitoring): - **Application Insights:** Azure-native - **New Relic:** Full-featured APM - **Datadog:** Comprehensive monitoring - Infrastructure monitoring: - **Azure Monitor:** Azure resources - **Prometheus + Grafana:** Open-source - Log aggregation: - **Azure Log Analytics:** Centralized logs - **ELK Stack:** Elasticsearch, Logstash, Kibana

1. **Configure Load Testing Tool**

- Install and setup: - Local installation for script development - Cloud deployment for large-scale tests - Create test scripts: - Implement user journeys - Parameterize test data - Add assertions for validation - Configure test execution: - Thread/VU (Virtual User) configuration - Ramp-up and duration settings - Think time and pacing - Data feeders

1. **Configure Monitoring and Observability**

- Enable instrumentation: - Application Insights SDK - Custom metrics and events - Distributed tracing (correlation IDs) - Configure dashboards: - Real-time metrics during test - Key performance indicators - Resource utilization charts - Set up alerts: - Error rate spikes - Response time degradation - Resource exhaustion

1. **Integrate with CI/CD**

- Automate test execution: - Triggered by deployment to staging - Scheduled nightly performance tests - On-demand via Azure DevOps or Jira pipeline - Publish results: - Test reports to Azure DevOps or Jira - Metrics to dashboards - Pass/fail gates in pipeline - Trend analysis: - Compare results over time - Detect performance regressions - Track improvement initiatives

1. **Document Tool Configuration**

- Create setup documentation: - Tool installation instructions - Test script repository location - Execution commands - Dashboard URLs - Alert configuration - Provide training: - How to run tests locally - How to interpret results - How to debug performance issues

**Tool Selection Matrix:**

| Tool | Purpose | Pros | Cons | Selected |
| --- | --- | --- | --- | --- |
| k6 | Load testing | Modern, JS scripting, great CLI | Fewer plugins than JMeter | ✅ Yes |
| Azure Load Testing | Cloud load gen | Azure-native, k6-based, scalable | Cost per test minute | ✅ Yes |
| Application Insights | APM | Azure-native, auto-instrumentation | Azure-specific | ✅ Yes |
| JMeter | Load testing (backup) | Mature, extensive plugins | GUI-heavy, Java-based | ⚠️ Backup |
| Grafana | Visualization | Flexible dashboards, open-source | Requires Prometheus | ❌ No |

**Selected Stack:**

- **Load Generation:** k6 (local dev) + Azure Load Testing (cloud scale)
- **APM:** Application Insights
- **Infrastructure:** Azure Monitor
- **Logs:** Azure Log Analytics
- **CI/CD:** Azure DevOps or Jira Pipelines

**k6 Test Script Example:**

```javascript import http from 'k6/http'; import { check, sleep } from 'k6'; import { Rate } from 'k6/metrics';

const errorRate = new Rate('errors'); const BASE\_URL = \_\_ENV.BASE\_URL || 'https://staging-auth.example.com';

export const options = { stages: [ { duration: '5m', target: 100 }, // Ramp-up to 100 users { duration: '60m', target: 100 }, // Stay at 100 users { duration: '5m', target: 0 }, // Ramp-down to 0 ], thresholds: { http\_req\_duration: ['p(95)<2000'], // 95% of requests < 2s errors: ['rate<0.01'], // Error rate < 1% }, };

export default function () { // User Journey: Login and Browse

// 1. Login const loginRes = http.post(`${BASE\_URL}/api/v1/auth/login`, { username: 'testuser', password: 'P@ssw0rd123', });

check(loginRes, { 'login status is 200': (r) => r.status === 200, 'login response time < 2s': (r) => r.timings.duration < 2000, }) || errorRate.add(1);

const token = loginRes.json('token'); sleep(8); // Think time

// 2. Get Dashboard const dashboardRes = http.get(`${BASE\_URL}/api/v1/dashboard`, { headers: { Authorization: `Bearer ${token}` }, });

check(dashboardRes, { 'dashboard status is 200': (r) => r.status === 200, 'dashboard response time < 3s': (r) => r.timings.duration < 3000, }) || errorRate.add(1);

sleep(15);

// 3. Get User Profile const profileRes = http.get(`${BASE\_URL}/api/v1/users/profile`, { headers: { Authorization: `Bearer ${token}` }, });

check(profileRes, { 'profile status is 200': (r) => r.status === 200, 'profile response time < 500ms': (r) => r.timings.duration < 500, }) || errorRate.add(1);

sleep(20);

// 4. Logout http.post(`${BASE\_URL}/api/v1/auth/logout`, null, { headers: { Authorization: `Bearer ${token}` }, }); } ```

---



---

## Best Practices

### ✅ DO

- **Test early in the cycle** - Performance testing is not just a pre-production activity
- **Define clear acceptance criteria** - Know what "good performance" means before testing
- **Model realistic workloads** - Use actual usage patterns, not synthetic load
- **Include think time** - Real users don't click continuously
- **Test at scale** - Load test with expected production volumes
- **Monitor everything** - Application, infrastructure, database, external services
- **Test various scenarios** - Load, stress, spike, soak, scalability
- **Automate performance tests** - Run regularly to catch regressions
- **Analyze bottlenecks** - Identify root causes, not just symptoms
- **Test with production-like data** - Data volume and complexity matter
- **Document baselines** - Track performance trends over time
- **Involve stakeholders** - Align on performance expectations

### ❌ DON'T

- **Wait until production** - Performance issues are expensive to fix late
- **Test only happy paths** - Error scenarios affect performance too
- **Ignore resource utilization** - CPU/memory limits cause issues
- **Use unrealistic scenarios** - "All users login at once" rarely happens
- **Test once and forget** - Performance can regress with code changes
- **Skip soak testing** - Memory leaks only show over time
- **Ignore think time** - Creates unrealistic load patterns
- **Test in isolation** - Include dependent services and databases
- **Assume linear scaling** - Verify scalability, don't assume it
- **Neglect mobile/geographic diversity** - Network latency matters

---

## Outputs

| Output | Destination | Description |
| --- | --- | --- |
| Performance Test Plan | Step 46 | Detailed performance test plan |
| Test Scenarios | Performance Team | Defined test scenarios |
| Workload Models | Performance Team | Expected workload patterns |
| Acceptance Criteria | QA Team | Performance pass/fail criteria |

---

## Quality Gates / Exit Criteria

- [ ] Performance requirements analysed
- [ ] Test scenarios defined
- [ ] Workload models created
- [ ] Acceptance criteria established
- [ ] Tools selected and configured

---

## AI/Automation Augmentation

| Capability | Tool/Service | Description |
| --- | --- | --- |

---

## Observability & Metrics

| Reference | Type | Description | Target |
| --- | --- | --- | --- |
| Apdex Score | Performance | Application Performance Index | >0.85 (satisfied users) |
| PERF-1 | Performance | Response Time (p95) | All endpoints meet targets |
| PERF-2 | Performance | Response Time (p99) | <2x p95 target |
| PERF-3 | Performance | Throughput | ≥50 RPS sustained |
| PERF-4 | Performance | Error Rate | <0.1% under load |
| PERF-5 | Performance | Resource Utilization | CPU <70% avg, Memory <80% avg |
| PERF-6 | Quality | Test Coverage | 100% critical endpoints tested |
| PERF-7 | Quality | Performance Test Pass Rate | 100% (all scenarios pass) |
| PERF-8 | Efficiency | Test Execution Time | <2 hours (full performance suite) |
| PERF-9 | Outcome | Performance Regressions Detected | 0 (catch before production) |
| PERF-10 | Outcome | Production Performance Issues | <1 per quarter (issues found in prod) |

---

## Related Artefacts

- Performance Test Plan Template
- Workload Model Template
- Performance Acceptance Criteria Template

---

## RACI Matrix

| Role | Responsibility |
| --- | --- |
| **Responsible** | Performance Engineer |
| **Accountable** | QA Lead |
| **Consulted** | Architecture, SRE |
| **Informed** | Development Team, Product Owner |

---

## Related Steps

- **Upstream:** Step 13: Test Approach Definition
- **Downstream:** Step 15: Automation Test Definition

---

## Revision History

| Version | Date | Author | Changes |
| --- | --- | --- | --- |
| 1 | 2026-03-25 | Simon Armstrong | Initial draft |

---

## Navigation

|
 |