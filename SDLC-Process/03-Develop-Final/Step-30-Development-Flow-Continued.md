[Previous: Step 29 - Development Flow](Step-29-Development-Flow.md) | [Next: Step 31 - Development Complete](Step-31-Development-Complete.md)

# Step 30: Development Flow Continued

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |

## 30.1 Overview
| **Attribute** | **Value** |
|---|---|
| **Responsible Roles** | DevOps Engineer, Development Team, CI/CD Pipeline |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Supporting Roles** | QA Lead, Release Engineer, Operations Representative |
| **Tools** | Deployment automation, CI/CD pipeline, environment validation tooling, monitoring platform |


## 30.2 Purpose
Step 30 deploys the generated build outputs into the designated validation environment and confirms that the resulting deployment is sufficiently healthy and functional to support formal development completion. It provides the confidence checkpoint between successful build creation and final phase closure.


## 30.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| **Versioned build artefacts** | Step 29 | Approved build outputs ready for controlled deployment. |
| **Deployment configuration** | Source control repository and platform standards | Environment-specific configuration required for deployment. |
| **Target validation environment** | Platform and environment management | The integration or equivalent validation environment used for deployment confirmation. |


## 30.4 Activities
### 30.4.1 Prepare the Target Environment
Confirm that the validation environment is available, reachable, and ready to receive the deployment.

Preparation should include:
 - Ensuring the environment is available and healthy
 - Verifying dependencies such as databases and services are running
- Clearing previous deployment artefacts where required
- Loading test data if needed

Pre-deployment checks:
- [ ] Integration environment accessible
- [ ] Database migrations ready
- [ ] Dependent services healthy
- [ ] Previous version backed up where required

### 30.4.2 Deploy Build Artefacts
Use the approved deployment automation to deploy the built outputs into the target validation environment.

Deployment should typically include:
- Pulling artefacts from the repository
- Deploying the application to the environment
- Running database migrations
- Configuring environment-specific settings
- Starting or restarting services

Typical deployment methods include:
- **Kubernetes:** Apply manifests or rolling update.
- **Docker:** Pull and run container image.
- **VM or Serverless:** Deploy package and update configuration.

Example deployment steps:

```bash
# Pull artifact
docker pull registry.example.com/app:2.5.3

# Deploy to Kubernetes
kubectl set image deployment/app app=registry.example.com/app:2.5.3

# Wait for rollout
kubectl rollout status deployment/app

# Verify deployment
kubectl get pods -l app=app
```

### 30.4.3 Execute Post-Deployment Validation
Run smoke or health checks to confirm the deployment is functional and the environment remains stable.

Smoke validation should confirm:
- Health-check endpoints respond successfully
 - Application startup completes successfully
 - Database connectivity is verified
 - Critical user paths are functional
- No critical errors appear in logs

Example smoke tests:

```bash
# Health check
curl https://integration.example.com/health

# Basic API test
curl https://integration.example.com/api/ping

# Database connectivity
curl https://integration.example.com/api/db-status
```

Smoke test checklist:
- [ ] Application health check returns 200 OK
- [ ] Login endpoint accessible
- [ ] Database queries succeed
- [ ] External service integrations responsive
- [ ] No critical errors in logs

### 30.4.4 Review Logs and Runtime Signals
Check for critical errors, startup issues, dependency failures, or validation anomalies following deployment.

Status reporting should include:
- Updating work items with deployment information
- Posting status to approved team communication channels
- Updating deployment dashboards
- Logging the deployment event for traceability

Example status report:

```text
Deployment to Integration: SUCCESS

Version: 2.5.3+build.1234
Environment: integration
Deployment Time: 2026-03-10 14:30:00 UTC
Duration: 3m 45s
Smoke Tests: PASSED (5/5)

Changes:
- Added payment gateway integration
- Fixed login error handling
- Updated user profile UI

Related Work Items: AB#456, AB#457
```

### 30.4.5 Confirm Readiness for Development Completion
Establish that the deployed output is stable enough for the final development-phase closure step.

Handoff preparation should include:
- Tagging the deployment for downstream security scanning where required
- Preparing environment details for validation teams
- Updating pipeline status
- Notifying security and QA teams of readiness


## 30.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Deployed validation build** | Target validation environment | Versioned artefact deployed into the designated environment. |
| **Deployment evidence** | CI/CD platform and engineering records | Logs, timestamps, and outcomes confirming deployment execution. |
| **Post-deployment validation results** | QA and engineering records | Health-check and smoke-test evidence supporting readiness. |


## 30.6 Key Artifacts
**Inputs:**
- Build artefacts from Step 29
- Deployment configuration
- Target integration or validation environment

**Outputs:**
- Deployed application in the validation environment
- Smoke test results
- Deployment status report
- Environment details and handoff evidence for the next step


## 30.7 Quality Gates / Exit Criteria
- [ ] Deployment to the designated validation environment succeeded.
- [ ] Required smoke or health checks passed.
- [ ] No unresolved critical deployment errors remain.
- [ ] The change is ready to proceed to Step 31.


## 30.8 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Automated deployment execution** | CI/CD pipeline | Deploys artefacts to the validation environment consistently. |
| **Post-deployment validation** | Health-check tooling and scripts | Confirms the deployment is functional after release into the environment. |
| **Operational signal interpretation** | Approved AI assistant | Helps interpret logs and likely failure causes, subject to human validation. |


## 30.9 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| **Deployment Success Rate** | >=95% | Deployment pipeline reports and environment release dashboards | Percentage of successful validation-environment deployments. |
| **Deployment Time** | <10 minutes | CI/CD deployment timing records | Time from deployment start to smoke-test completion. |
| **Smoke Test Pass Rate** | 100% | Smoke test execution records and deployment validation logs | Percentage of deployments passing required post-deployment checks. |
| **Rollback Frequency** | <5% | Deployment incident records and release reporting | Percentage of deployments that require rollback. |
| **Environment Availability** | >=99% | Environment monitoring dashboards and uptime reporting | Availability of the integration or validation environment during active delivery. |


## 30.10 Best Practices
**DO:**
- Deploy only approved, versioned artefacts.
- Validate immediately after deployment.
 - Maintain clear evidence of what was deployed, where, and when.

- Run smoke tests immediately after deployment.
- Have automated rollback where supported for smoke test failure.
- Monitor logs during and after deployment.

**DON'T:**
- Allow critical runtime errors to persist into phase completion.

- Deploy without smoke tests.
- Ignore smoke test failures.
- Skip rollback capability for change types that require it.


## 30.11 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | DevOps Engineer, Development Team, CI/CD Pipeline |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Consulted** | QA Lead, Release Engineer, Operations Representative |
| **Informed** | Engineering Manager, Product Owner |


## 30.12 Related Steps
- **Upstream:** [Step 29: Development Flow](Step-29-Development-Flow.md)
- **Downstream:** [Step 31: Development Complete](Step-31-Development-Complete.md)


## 30.13 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |

[Previous: Step 29 - Development Flow](Step-29-Development-Flow.md) | [Next: Step 31 - Development Complete](Step-31-Development-Complete.md)
