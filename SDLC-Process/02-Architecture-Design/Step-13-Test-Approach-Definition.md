# Step 13: Test Approach Definition

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 13 |
| **Phase** | Architecture & Design |
| **Previous Step** | Step 12: Design and Implementation |
| **Next Step** | Step 14: Performance Test Definition |
| **Responsible Role(s)** | QA Lead, Development Team |
| **Tools** | Azure DevOps or Jira, Test Management Tools |

---

## Purpose

Define the overall testing approach for the sprint/release. This includes test strategy, test types, coverage requirements, and quality gates that will govern the testing phases. A well-defined test approach ensures quality is built in from the start and testing is efficient and effective.

---

## Process Flow

```mermaid graph TD A[Technical Specs + NFRs] --> B[13.1 Test Strategy Definition] B --> C[13.2 Test Type Identification] C --> D[13.3 Coverage Requirements] D --> E[13.4 Test Environment Planning] E --> F[13.5 Quality Gate Definition] F --> G[Test Approach Approved] G --> H[Testing Phases] ```

---

## Inputs

| Input | Source | Description |
| --- | --- | --- |
| Technical Specifications | Step 12 | Implementation specifications |
| Sprint Backlog | Step 5 | Current sprint work items |
| NFRs | Requirements | Non-functional requirements |
| Definition of Done | Step D | Team's DoD criteria |

---

## Activities

### 13.1 Test Strategy Definition

**Owner:** QA Lead
**Duration:** 1-2 business days

#### Process Steps:

1. **Define Testing Objectives**

- Establish testing goals: - **Quality Assurance:** Verify requirements met - **Defect Prevention:** Find issues early - **Risk Mitigation:** Test high-risk areas thoroughly - **Confidence Building:** Ensure production readiness - Align with business objectives: - Critical user journeys must work flawlessly - Performance meets SLA requirements - Security vulnerabilities prevented - Compliance requirements validated

1. **Identify Testing Scope**

- In-scope items: - New features and functionality - Modified existing features - Regression of unchanged areas - Integration points - Non-functional requirements - Out-of-scope items: - Third-party services (assume working) - Legacy systems (unless integration point) - Future phase features - Risk-based prioritization: - High-risk areas get more testing - Critical paths tested thoroughly - Low-risk areas tested lightly

1. **Select Testing Approach**

- **Test Pyramid Approach** (Recommended): ``` E2E Tests (Few) ← High cost, slow, brittle Integration Tests (Some) ← Medium cost, moderate speed Unit Tests (Many) ← Low cost, fast, stable ``` - **Testing Philosophy:** - Shift-left: Test early in development - Test automation: Automate repetitive tests - Continuous testing: Test with every change - Risk-based: Focus on high-risk areas - **Test Levels:** - **Unit Tests:** Individual components - **Integration Tests:** Component interactions - **System Tests:** End-to-end flows - **Acceptance Tests:** Business requirements

1. **Define Test Automation Strategy**

- Automation priorities: - **High Priority:** Regression tests, smoke tests, API tests - **Medium Priority:** Integration tests, data validation - **Low Priority:** Exploratory tests, usability tests - Automation frameworks: - **Unit:** xUnit, NUnit, Jest, Pytest - **Integration:** TestContainers, Postman/Newman - **E2E:** Playwright, Selenium, Cypress - **Performance:** JMeter, k6, Azure Load Testing - Automation criteria: - Test is repeatable and deterministic - Test runs frequently (regression) - Test is stable (not flaky) - ROI justifies automation cost

1. **Plan Test Data Management**

- Test data strategy: - **Synthetic Data:** Generated test data (preferred) - **Anonymized Production Data:** Scrubbed real data - **Mock Data:** Hardcoded test values - Data requirements: - Positive test cases (valid data) - Negative test cases (invalid data) - Edge cases (boundary values) - Volume testing data - Data management: - Version control test data - Data setup/teardown automation - Isolated data per test - Data refresh strategy

1. **Document Test Strategy**

- Create test strategy document: - Testing objectives and scope - Testing approach and philosophy - Test levels and types - Automation strategy - Tools and frameworks - Roles and responsibilities - Schedule and milestones - Risks and mitigation

**Test Strategy Document Template:**

```markdown # Test Strategy: Auth Service Sprint 10

## Objectives

- Validate all user authentication flows work correctly
- Ensure security requirements met (OAuth, JWT)
- Verify performance targets (login <2s p95)
- Achieve 85% code coverage

## Scope

**In Scope:**

- User registration, login, logout flows
- JWT token generation and validation
- OAuth SSO integration
- Password reset functionality
- API endpoints and error handling

**Out of Scope:**

- Azure AD service (external dependency)
- Email service (mocked in tests)

## Testing Approach

- Test Pyramid: 70% unit, 25% integration, 5% E2E
- Shift-left: Unit tests written with code
- Automation: 90% test automation target
- Continuous: Tests run on every PR

## Test Levels

1. **Unit Tests:** Service layer, validation logic (xUnit)
2. **Integration Tests:** API endpoints, database (TestContainers)
3. **E2E Tests:** Critical user flows (Playwright)
4. **Performance Tests:** Login endpoint (k6)
5. **Security Tests:** OWASP vulnerabilities (ZAP)

## Automation Strategy

- **Automate:** Regression, smoke, API, integration tests
- **Manual:** Exploratory, usability, ad-hoc tests
- **Frameworks:** xUnit, Playwright, k6

## Test Data

- Synthetic test users (auto-generated)
- Mock email service responses
- Test data reset before each test run

## Quality Gates

- All tests passing
- Code coverage >85%
- No critical/high severity bugs
- Performance benchmarks met

```

---

### 13.2 Test Type Identification

**Owner:** QA Lead with Development Team
**Duration:** 1 business day

#### Process Steps:

1. **Identify Unit Testing Needs**

- Components requiring unit tests: - Business logic (service layer) - Validation logic - Utility functions - Data transformations - Complex algorithms - Unit test characteristics: - Fast execution (<100ms per test) - Isolated (no external dependencies) - Deterministic (same input → same output) - Independent (no test order dependency) - Unit test coverage: - Target >80% code coverage - 100% coverage for critical logic - Focus on edge cases and error paths

1. **Identify Integration Testing Needs**

- Integration points to test: - **API Endpoints:** All REST/GraphQL endpoints - **Database:** CRUD operations, transactions - **Message Queue:** Pub/sub, message handling - **External Services:** Third-party API calls - **Authentication:** Auth middleware, JWT validation - Integration test scope: - Request/response validation - Database state changes - Error handling and status codes - Authentication and authorization - Integration test approach: - Use TestContainers for dependencies - Real database, mocked external services - Test data isolation

1. **Identify End-to-End Testing Needs**

- Critical user journeys: - User registration → verification → login - Login → access protected resource → logout - Password reset flow - OAuth SSO login - E2E test scope: - Full stack (UI → API → Database) - Real browser interactions - Realistic user scenarios - E2E test strategy: - Limited number (high maintenance cost) - Focus on critical paths - Run in staging environment

1. **Identify Performance Testing Needs**

- Performance test types: - **Load Testing:** Expected load (100 concurrent users) - **Stress Testing:** Beyond capacity (500 users) - **Spike Testing:** Sudden load increase - **Soak Testing:** Sustained load (24 hours) - Performance metrics: - Response time (p50, p95, p99) - Throughput (requests per second) - Error rate - Resource utilization (CPU, memory) - Performance targets: - Login endpoint: <2s (p95) - API endpoints: <200ms (p95) - Concurrent users: 100 users - Error rate: <0.1%

1. **Identify Security Testing Needs**

- Security test types: - **Authentication Testing:** Credential validation - **Authorization Testing:** Access control - **Input Validation:** Injection attacks - **Session Management:** Token security - **Encryption:** Data protection - Security test scope: - OWASP Top 10 vulnerabilities - API security (rate limiting, validation) - Authentication flows (OAuth, JWT) - Sensitive data handling - Security test tools: - OWASP ZAP for vulnerability scanning - Burp Suite for penetration testing - Manual security review

1. **Create Test Type Matrix**

- Map features to test types: - Which features need which tests - Priority of each test type - Automation feasibility - Document test type requirements: - Test type descriptions - Tools and frameworks - Ownership and responsibilities - Success criteria

**Test Type Matrix Template:**

| Feature | Unit | Integration | E2E | Performance | Security | Priority |
| --- | --- | --- | --- | --- | --- | --- |
| User Registration | ✅ Service logic | ✅ API + DB | ✅ Full flow | ❌ Low priority | ✅ Input validation | P0 |
| User Login | ✅ Service logic | ✅ API + DB + Cache | ✅ Critical path | ✅ Load test | ✅ Auth security | P0 |
| Password Reset | ✅ Service logic | ✅ API + Email mock | ✅ Full flow | ❌ Low usage | ✅ Token security | P1 |
| OAuth SSO | ✅ Token validation | ✅ Azure AD mock | ✅ Critical path | ✅ Load test | ✅ OAuth security | P0 |
| User Profile | ✅ Service logic | ✅ API + DB | ❌ Not critical | ❌ Low priority | ✅ Data access | P2 |

**Test Type Descriptions:**

- **Unit Tests (xUnit):** 200+ tests, >85% coverage, <5 min execution
- **Integration Tests (TestContainers):** 50+ tests, all API endpoints, <15 min execution
- **E2E Tests (Playwright):** 10 critical flows, staging environment, <30 min execution
- **Performance Tests (k6):** 3 scenarios (load, stress, spike), staging environment
- **Security Tests (OWASP ZAP):** Weekly automated scan + manual review

---

### 13.3 Coverage Requirements

**Owner:** QA Lead with Development Team
**Duration:** 0.5-1 business day

#### Process Steps:

1. **Define Code Coverage Targets**

- Overall coverage targets: - **Minimum:** 80% code coverage - **Target:** 85% code coverage - **Stretch:** 90% code coverage - Coverage by component: - **Business Logic:** 90%+ (critical) - **Controllers/API:** 85%+ (important) - **Data Access:** 80%+ (standard) - **Utilities:** 85%+ (standard) - Coverage metrics: - Line coverage (primary metric) - Branch coverage (decision points) - Method coverage (all methods tested)

1. **Define Functional Coverage Requirements**

- Requirement traceability: - Every user story has test cases - Every acceptance criterion has tests - Critical requirements have multiple test cases - Test case coverage: - Positive scenarios (happy path) - Negative scenarios (error handling) - Edge cases (boundary conditions) - Integration scenarios - Risk-based coverage: - High-risk: 100% coverage, multiple scenarios - Medium-risk: Standard coverage - Low-risk: Basic coverage

1. **Define API Coverage Requirements**

- Endpoint coverage: - 100% of API endpoints tested - All HTTP methods (GET, POST, PUT, DELETE) - All status codes (200, 400, 401, 404, 500) - Request validation: - Valid requests (happy path) - Invalid requests (validation errors) - Missing required fields - Invalid data types - Boundary values - Response validation: - Response schema validation - Response data accuracy - Error response format

1. **Define User Flow Coverage**

- Critical user journeys: - All critical paths tested E2E - Alternative paths tested (if significant) - Error recovery paths tested - User scenarios: - New user flows (registration, onboarding) - Returning user flows (login, access features) - Admin user flows (if applicable) - Cross-browser/device: - Chrome, Firefox, Safari (desktop) - Mobile browsers (iOS, Android) if applicable

1. **Define Non-Functional Coverage**

- Performance coverage: - Load testing for critical endpoints - Response time benchmarks - Scalability testing - Security coverage: - OWASP Top 10 validated - Authentication flows tested - Authorization scenarios tested - Data encryption verified - Accessibility coverage (if applicable): - WCAG compliance tested - Screen reader compatibility - Keyboard navigation

1. **Document Coverage Requirements**

- Create coverage report: - Coverage targets by category - Measurement approach - Tools and reporting - Tracking and monitoring - Define coverage gates: - Minimum coverage for PR approval - Coverage trend monitoring - Coverage improvement plans

**Coverage Requirements Template:**

```markdown # Test Coverage Requirements

## Code Coverage Targets

- **Overall:** 85% line coverage (minimum 80%)
- **Business Logic:** 90%+
- **API Controllers:** 85%+
- **Data Access:** 80%+

## Functional Coverage

- **User Stories:** 100% have test cases
- **Acceptance Criteria:** 100% validated by tests
- **Critical Features:** Multiple test scenarios

## API Coverage

- **Endpoints:** 100% tested
- **Status Codes:** All expected codes validated
- **Request Scenarios:** Valid + invalid + edge cases
- **Response Validation:** Schema + data accuracy

## User Flow Coverage

- **Critical Paths:** All tested E2E (10 flows)
- **Alternative Paths:** Key alternatives tested
- **Error Recovery:** Error scenarios tested

## Non-Functional Coverage

- **Performance:** Load tests for 3 critical endpoints
- **Security:** OWASP Top 10 + auth flows
- **Browsers:** Chrome, Firefox, Safari

## Measurement

- **Tool:** Coverlet for code coverage
- **Reporting:** Coverage report in PR, SonarQube dashboard
- **Gate:** PR blocked if <80% coverage

```

---

### 13.4 Test Environment Planning

**Owner:** QA Lead with DevOps
**Duration:** 1 business day

#### Process Steps:

1. **Identify Required Test Environments**

- Environment types needed: - **Local Development:** Developer machines - **Development (Dev):** Shared dev environment - **Integration Testing:** Automated test environment - **Staging:** Production-like environment - **Performance Testing:** Dedicated perf environment - Environment purposes: - **Local:** Unit tests, integration tests - **Dev:** Manual testing, integration validation - **Integration:** CI/CD automated tests - **Staging:** E2E tests, UAT, performance tests - **Performance:** Load and stress testing

1. **Define Environment Configurations**

- Per environment specs: - **Local:** SQLite/Docker containers, mocked services - **Dev:** Azure SQL Basic, App Service B1, shared resources - **Integration:** Ephemeral containers, test databases - **Staging:** Same SKUs as production, isolated - **Performance:** Production-equivalent SKUs - Configuration differences: - Database sizes and SKUs - Service tiers - Networking (VNets, firewalls) - Monitoring and logging - Feature flags

1. **Plan Test Data Setup**

- Test data per environment: - **Local:** Minimal seed data (10 users) - **Dev:** Extended test data (100 users) - **Integration:** Fresh data per test run - **Staging:** Production-like volume (10K users) - **Performance:** Large dataset (100K+ users) - Data refresh strategy: - Local: On-demand refresh scripts - Dev: Weekly automated refresh - Integration: Reset before each test run - Staging: Daily automated refresh - Performance: Monthly refresh

1. **Define Environment Access and Permissions**

- Access control: - **Local:** Developer owns their environment - **Dev:** All developers have access - **Integration:** CI/CD service accounts - **Staging:** QA and developers (read), DevOps (admin) - **Performance:** Performance testers, DevOps - Security considerations: - No production data in non-prod environments - Secrets managed in Key Vault - Network isolation where appropriate - Audit logging enabled

1. **Plan Environment Provisioning**

- Provisioning approach: - **IaC (Pulumi/Terraform):** All environments as code - **CI/CD Automation:** Automated provisioning - **Self-Service:** Developers can spin up local - Provisioning timeline: - Local: Developers set up as needed - Dev: Always on, provisioned once - Integration: Ephemeral, created per test run - Staging: Always on, provisioned once - Performance: Provisioned on-demand

1. **Document Environment Plan**

- Environment documentation: - Purpose and usage - Configuration details - Access instructions - Data refresh schedule - Contact information - Environment diagram: - Visual representation of environments - Data flows between environments - External dependencies

**Test Environment Plan Template:**

| Environment | Purpose | Infrastructure | Test Data | Access | Availability |
| --- | --- | --- | --- | --- | --- |
| Local | Unit + integration tests | Docker containers, SQLite | 10 seed users | Developers | On-demand |
| Dev | Manual testing, integration validation | Azure SQL Basic, App Service B1 | 100 test users | All developers | Always on |
| Integration | CI/CD automated tests | TestContainers, ephemeral DB | Fresh per run | CI/CD only | Per test run |
| Staging | E2E, UAT, performance tests | Production-equivalent SKUs | 10K users (prod-like) | QA, Developers | Always on |
| Performance | Load and stress testing | Production SKUs, isolated | 100K+ users | Perf testers, DevOps | On-demand |

**Environment Access:**

- **Dev:** https://dev-auth.example.com (All devs)
- **Staging:** https://staging-auth.example.com (QA + Devs read-only)
- **Performance:** https://perf-auth.example.com (Perf team only)

---

### 13.5 Quality Gate Definition

**Owner:** QA Lead with Team
**Duration:** 0.5-1 business day

#### Process Steps:

1. **Define Quality Gate Criteria**

- Code quality gates: - All unit tests passing - Code coverage ≥80% - No critical code smells (SonarQube) - Code review approved by 2+ reviewers - Functional quality gates: - All test cases executed - No open critical/high severity bugs - Acceptance criteria validated - Regression tests passing - Non-functional quality gates: - Performance benchmarks met - Security scan passed (no critical vulnerabilities) - Accessibility standards met (if applicable) - Load testing passed

1. **Define Stage-Specific Gates**

- **PR Merge Gate:** - Unit tests passing (100%) - Code coverage ≥80% - Code review approved - No merge conflicts - **Deploy to Dev Gate:** - PR merged - Build successful - Basic smoke tests passing - **Deploy to Staging Gate:** - All integration tests passing - No critical/high bugs - Code coverage ≥85% - Security scan passed - **Deploy to Production Gate:** - All E2E tests passing - Performance tests passed - UAT sign-off received - No open critical bugs - Rollback plan documented

1. **Define Bug Severity Thresholds**

- Bug severity definitions: - **Critical:** System unusable, data loss, security breach - **High:** Major feature broken, significant impact - **Medium:** Feature partially broken, workaround exists - **Low:** Minor issue, cosmetic, low impact - Quality gate thresholds: - **Zero tolerance:** No critical bugs - **High bugs:** ≤2 high bugs (with mitigation plan) - **Medium bugs:** ≤10 medium bugs - **Low bugs:** No limit (tracked for future)

1. **Define Metrics and KPIs**

- Quality metrics tracked: - **Defect Density:** Bugs per 1000 lines of code - **Test Pass Rate:** % of tests passing - **Code Coverage:** % of code covered by tests - **Defect Escape Rate:** Bugs found in production - **Test Execution Time:** Time to run all tests - KPI targets: - Defect density <5 bugs per 1000 LOC - Test pass rate >95% - Code coverage >85% - Defect escape rate <2%

1. **Define Exception Process**

- Quality gate bypass criteria: - Business-critical hotfix (with approval) - Known issues with mitigation plan - Technical limitations (documented) - Exception approval process: - Requires VP Engineering approval - Risk assessment documented - Remediation plan required - Post-mortem scheduled

1. **Document Quality Gates**

- Create quality gate checklist: - Gate criteria per stage - Measurement approach - Tools and automation - Approval process - Publish and socialize: - Add to team wiki - Include in onboarding - Reference in PR templates - Review in retrospectives

**Quality Gate Checklist Template:**

### PR Merge Gate

- [ ] All unit tests passing (100%)
- [ ] Code coverage ≥80%
- [ ] No critical code smells (SonarQube)
- [ ] Code review approved by 2+ reviewers
- [ ] No merge conflicts with main branch

### Deploy to Staging Gate

- [ ] All integration tests passing
- [ ] Code coverage ≥85%
- [ ] Security scan passed (no critical vulnerabilities)
- [ ] No open critical bugs
- [ ] No more than 2 high severity bugs
- [ ] Performance benchmarks met (if applicable)

### Deploy to Production Gate

- [ ] All E2E tests passing
- [ ] UAT sign-off received from Product Owner
- [ ] Performance tests passed
- [ ] Security review completed
- [ ] No open critical/high severity bugs
- [ ] Rollback plan documented
- [ ] Monitoring and alerts configured
- [ ] Runbook updated

### Bug Severity Thresholds

- **Critical:** 0 allowed
- **High:** ≤2 allowed (with mitigation)
- **Medium:** ≤10 allowed
- **Low:** Tracked but no gate

### Quality Metrics (Sprint Target)

- Defect density: <5 bugs/1000 LOC
- Test pass rate: >95%
- Code coverage: >85%
- Defect escape rate: <2%

---



---

## Best Practices

### ✅ DO

- **Shift testing left** - Test early and often during development
- **Follow the test pyramid** - Many unit tests, some integration, few E2E
- **Automate repetitive tests** - Regression and smoke tests should be automated
- **Use risk-based testing** - Focus effort on high-risk areas
- **Define clear quality gates** - Make progression criteria explicit and measurable
- **Isolate test environments** - Prevent test interference and data contamination
- **Version test data** - Track test data changes like code
- **Measure test effectiveness** - Track defect escape rate and test coverage
- **Make tests fast** - Optimize test execution time for faster feedback
- **Write maintainable tests** - Tests are code too; follow good practices
- **Test non-functional requirements** - Performance, security, scalability matter
- **Review and update test strategy** - Adapt approach based on learnings

### ❌ DON'T

- **Skip unit tests** - Unit tests are the foundation of quality
- **Test only happy paths** - Error scenarios and edge cases matter
- **Create flaky tests** - Unreliable tests erode confidence
- **Over-rely on E2E tests** - They're slow, brittle, and expensive to maintain
- **Test in production only** - Catch issues before production
- **Use production data in test** - Privacy and security risks
- **Ignore test technical debt** - Broken or obsolete tests should be fixed or removed
- **Test without clear goals** - Know what you're testing and why
- **Bypass quality gates** - Gates exist for a reason; exceptions should be rare
- **Forget about test maintenance** - Tests need care and feeding like production code

---

## Outputs

| Output | Destination | Description |
| --- | --- | --- |
| Test Strategy | Step 14, Step 15 | Overall testing approach |
| Test Type Matrix | QA Team | Required test types per feature |
| Coverage Requirements | Development Team | Code coverage targets |
| Quality Gates | All Test Steps | Quality criteria for progression |

---

## Quality Gates / Exit Criteria

- [ ] Test strategy defined
- [ ] Test types identified
- [ ] Coverage requirements set
- [ ] Test environments planned
- [ ] Quality gates established

---

## AI/Automation Augmentation

| Capability | Tool/Service | Description |
| --- | --- | --- |
| Automation Eval | AI/ML | Evaluation of automation potential |

---

## Observability & Metrics

| Reference | Type | Description | Target |
| --- | --- | --- | --- |
| QA-1 | Quality | Code Coverage | >85% (line coverage) |
| QA-2 | Quality | Test Pass Rate | >95% (all tests) |
| QA-3 | Quality | Defect Density | <5 bugs per 1000 LOC |
| QA-4 | Quality | Defect Escape Rate | <2% (bugs found in production) |
| QA-5 | Efficiency | Test Execution Time | <30 minutes (full suite) |
| QA-6 | Efficiency | Test Automation Rate | >90% (repeatable tests automated) |
| QA-7 | Process | Quality Gate Compliance | 100% (no gate bypasses without approval) |
| QA-8 | Process | Test Environment Availability | >99% (staging environment uptime) |
| QA-9 | Outcome | Critical Bugs in Production | 0 (zero tolerance) |
| QA-10 | Outcome | Mean Time to Detect (MTTD) | <1 hour (for production issues) |

---

## Related Artefacts

- Test Strategy Template
- Test Type Matrix Template
- Quality Gate Checklist

---

## RACI Matrix

| Role | Responsibility |
| --- | --- |
| **Responsible** | QA Lead |
| **Accountable** | QA Lead |
| **Consulted** | Development Lead, Architecture |
| **Informed** | Product Owner, Development Team |

---

## Related Steps

- **Upstream:** Step 12: Design and Implementation
- **Downstream:** Step 14: Performance Test Definition

---

## Revision History

| Version | Date | Author | Changes |
| --- | --- | --- | --- |
| 1 | 2026-03-25 | Simon Armstrong | Initial draft |

---

## Navigation

|
 |