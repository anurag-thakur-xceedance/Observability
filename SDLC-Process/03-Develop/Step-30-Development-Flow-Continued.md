# Step 30: Development Flow Continued

**Phase:** Develop
**Owner:** CI/CD Pipeline, DevOps
**Duration:** 5-10 minutes (automated)
**Prerequisites:** Build artifacts ready (Step 29)

---

## Purpose

Deploy artifacts to integration environment and run smoke tests to validate basic functionality before transitioning to security and governance phase.

---

## Process Flow

---

## Activities

### 30.1 Integration Preparation

**Prepare integration environment:**

- Ensure environment is available and healthy
- Verify dependencies (databases, services) are running
- Clear previous deployment artifacts
- Load test data if needed

**Pre-deployment Checks:**

- [ ] Integration environment accessible
- [ ] Database migrations ready
- [ ] Dependent services healthy
- [ ] Previous version backed up

### 30.2 Environment Deployment

**Deploy artifacts to integration environment:**

- Pull artifacts from artifact repository
- Deploy application to environment
- Run database migrations
- Configure environment-specific settings
- Start services

**Deployment Methods:**

- **Kubernetes:** Apply manifests, rolling update
- **Docker:** Pull and run container
- **VM/Serverless:** Deploy package, update configuration

**Deployment Steps:**

```bash # Pull artifact docker pull registry.example.com/app:2.5.3

# Deploy to Kubernetes kubectl set image deployment/app app=registry.example.com/app:2.5.3

# Wait for rollout kubectl rollout status deployment/app

# Verify deployment kubectl get pods -l app=app 
```

### 30.3 Smoke Validation

**Run quick smoke tests:**

- Health check endpoints responding
- Application starts successfully
- Database connectivity verified
- Critical user paths functional
- No critical errors in logs

**Smoke Test Examples:**

```bash # Health check curl https://integration.example.com/health # Expected: {"status": "healthy"}

# Basic API test curl https://integration.example.com/api/ping # Expected: {"message": "pong"}

# Database connectivity curl https://integration.example.com/api/db-status # Expected: {"database": "connected"} 
```

**Smoke Test Checklist:**

- [ ] Application health check returns 200 OK
- [ ] Login endpoint accessible
- [ ] Database queries succeed
- [ ] External service integrations responsive
- [ ] No critical errors in logs

### 30.4 Status Reporting

**Report deployment status:**

- Update work items with deployment info
- Post to team chat (Slack/Teams)
- Update deployment dashboard
- Log deployment event

**Status Report Example:**

``` ✅ Deployment to Integration: SUCCESS

Version: 2.5.3+build.1234 Environment: integration Deployment Time: 2026-03-10 14:30:00 UTC Duration: 3m 45s Smoke Tests: PASSED (5/5)

Changes:

- Added payment gateway integration
- Fixed login error handling
- Updated user profile UI

Related Work Items: AB#456, AB#457 
```

### 30.5 Handoff Preparation

**Prepare for security and governance phase:**

- Tag deployment for security scanning
- Prepare environment details for validation
- Update pipeline status
- Notify security and QA teams

---

## Key Artifacts

**Inputs:**

- Build artifacts (from Step 29)
- Deployment configuration
- Integration environment

**Outputs:**

- Deployed application (integration environment)
- Smoke test results
- Deployment status report
- Environment details for next phase

---

## Best Practices

✅ **DO:**

- Run smoke tests immediately after deployment
- Have automated rollback on smoke test failure
- Monitor logs during and after deployment
- Keep deployment time under 10 minutes
- Notify team of deployment status

❌ **DON'T:**

- Deploy without smoke tests
- Ignore smoke test failures
- Deploy to production-like environments without testing
- Skip rollback capability
- Deploy without backup of previous version

---

## Metrics & Observability

| Metric | Target | Description |
| --- | --- | --- |
| **Deployment Success Rate** | ≥95% | Successful deployments / Total attempts |
| **Deployment Time** | <10 minutes | Time from start to smoke tests passing |
| **Smoke Test Pass Rate** | 100% | Smoke tests passing / Total runs |
| **Rollback Frequency** | <5% | Deployments rolled back / Total deployments |
| **Environment Availability** | ≥99% | Integration environment uptime |

---

## Quality Gates

- [ ] Integration environment ready
- [ ] Deployment successful (no errors)
- [ ] Smoke tests passed (100%)
- [ ] No critical errors in logs
- [ ] Status reported to team
- [ ] Ready for security phase handoff

**Exit Criteria:** Application deployed and validated, ready for security and governance phase (Step 31).

---

## Related Steps

- **Step 29:** Development Flow (build artifacts)
- **Step 31:** Development Complete (phase gate)
- **Step 32:** Code Test Creator (security phase begins)

---

## Summary

Step 30 deploys artifacts to integration environment and validates basic functionality through smoke tests, ensuring readiness for comprehensive security and governance validation.

**Key Outcomes:**

- Application deployed to integration
- Smoke tests passed
- Basic functionality validated
- Team notified
- Ready for security phase

---

## Navigation

|
|