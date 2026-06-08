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
| **Versioned build artefacts** | Step 29 | Approved build outputs are ready for controlled deployment. |
| **Deployment configuration** | Source control repository and platform standards | Environment-specific configuration required for deployment. |
| **Target validation environment** | Platform and environment management | The integration or equivalent validation environment is used for deployment confirmation. |


## 30.4 Activities
### 30.4.1 Prepare the Target Environment
Confirm that the validation environment is available, reachable, and ready to receive the deployment.

Preparation should include:
- **Environment Availability:** Ensure the environment is available and healthy.
- **Dependency Readiness:** Verify dependencies such as databases and services are running.
- **Previous Artefact Cleanup:** Clear previous deployment artefacts where required.
- **Test Data Preparation:** Load test data if needed.

Preparation should also confirm that deployment credentials, application settings, secret references, network access, and environment-specific dependencies are aligned to the intended validation target before release begins.

Pre-deployment checks:
- [ ] Integration environment accessible
- [ ] Database migrations ready
- [ ] Dependent services healthy
- [ ] Previous version backed up where required

### 30.4.2 Deploy Build Artefacts
Use the approved deployment automation to deploy the built outputs into the target validation environment.

Deployment should typically include:
- **Artefact Retrieval:** Pull artefacts from the repository.
- **Application Deployment:** Deploy the application to the environment.
- **Database Migration:** Run database migrations.
- **Environment Configuration:** Configure environment-specific settings.
- **Service Start or Restart:** Start or restart services.

Typical deployment methods include:
- **App Service:** Deploy a package or container image and apply app settings.
- **Azure Functions:** Deploy the function package and update application settings.
- **Virtual Machine or VM Scale Set:** Deploy package and update configuration.

Deployment must remain automated, repeatable, and traceable to the approved artefact version, deployment run, target environment, and delivery record. Manual environment changes should not be used as a substitute for governed deployment automation.

The deployment activity should remain consistent across repeated executions so that validation outcomes reflect the released artefact and environment state rather than operator variation.

Example deployment steps:

```bash
# Deploy package to Azure Web App
az webapp deployment source config-zip --resource-group rg-orders-dev --name order-processor-dev --src app.zip

# Update Azure Web App settings
az webapp config appsettings set --resource-group rg-orders-dev --name order-processor-dev --settings "APP_VERSION=2.5.3"

# Restart the app
az webapp restart --resource-group rg-orders-dev --name order-processor-dev

# Verify deployment state
az webapp show --resource-group rg-orders-dev --name order-processor-dev --query state
```

### 30.4.3 Execute Post-Deployment Validation
Run smoke or health checks to confirm the deployment is functional and the environment remains stable.

Smoke validation should confirm:
- **Health Endpoint Response:** Health-check endpoints respond successfully.
- **Application Startup:** Application startup completes successfully.
- **Database Connectivity:** Database connectivity is verified.
- **Critical User Paths:** Critical user paths are functional.
- **Log Health:** No critical errors appear in logs.

Validation should focus on fast, high-signal checks that confirm the deployment is usable without attempting to replace broader QA or security validation that follows in later steps.

Example smoke tests:

```bash
# Health check
curl https://order-processor-dev.azurewebsites.net/health

# Basic API test
curl https://order-processor-dev.azurewebsites.net/api/ping

# Database connectivity
curl https://order-processor-dev.azurewebsites.net/api/db-status
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
- **Work Item Update:** Update work items with deployment information.
- **Team Communication:** Post status to approved team communication channels.
- **Dashboard Update:** Update deployment dashboards.
- **Traceability Logging:** Log the deployment event for traceability.

Runtime review should consider startup failures, configuration resolution errors, dependency connection failures, degraded response patterns, and any platform alert or log signal that suggests the deployment is not yet stable.

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
- **Deployment Tagging:** Tag the deployment for downstream security scanning where required.
- **Environment Handoff Detail:** Prepare environment details for validation teams.
- **Pipeline Status Update:** Update pipeline status.
- **Stakeholder Notification:** Notify security and QA teams of readiness.

The step is not complete merely because deployment succeeded. It is complete when the deployed output, the validation evidence, and the recorded deployment context together show that the change is stable enough to move into final development completion and the next phase controls.


## 30.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Deployed validation build** | Target validation environment | Versioned artefact deployed into the designated environment. |
| **Deployment evidence** | CI/CD platform and engineering records | Logs, timestamps, and outcomes confirming deployment execution. |
| **Post-deployment validation results** | QA and engineering records | Health-check and smoke-test evidence supporting readiness. |
| **Readiness handoff package** | Development completion and downstream validation stakeholders | Environment details, deployment status, and supporting evidence were prepared for final phase closure. |


## 30.6 Key Artifacts
**Inputs:**
- Build artefacts from Step 29
- Deployment configuration
- Target integration or validation environment

**Outputs:**
- Deployed the application in the validation environment
- Smoke test results
- Deployment status report
- Environment details and handoff evidence for the next step
- Runtime validation evidence showing the deployment is stable enough for progression


## 30.7 Quality Gates / Exit Criteria
- [ ] Deployment to the designated validation environment succeeded.
- [ ] Required smoke or health checks passed.
- [ ] No unresolved critical deployment errors remain.
- [ ] Runtime signals and logs do not show unresolved deployment instability.
- [ ] Deployment evidence and handoff details are recorded for the next step.
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
| **Deployment Success Rate** | >=95% successful deployments per reporting period | Deployment pipeline reports and environment release dashboards | Percentage of deployments to the validation environment that complete successfully. |
| **Deployment Time** | <10 minutes from deployment start to smoke-test completion | CI/CD deployment timing records | Time from deployment start to smoke-test completion. |
| **Smoke Test Pass Rate** | 100% of required smoke tests pass per deployment | Smoke test execution records and deployment validation logs | Percentage of deployments passing required post-deployment checks. |
| **Rollback Frequency** | <5% of deployments per reporting period | Deployment incident records and release reporting | Percentage of deployments that require rollback. |
| **Environment Availability** | >=99% uptime during active delivery windows | Environment monitoring dashboards and uptime reporting | Availability of the integration or validation environment during active delivery. |
| **Critical Log Error Count** | 0 unresolved critical errors after deployment validation | Monitoring platform alerts, application logs, and deployment review notes | Number of unresolved critical runtime or start-up errors remaining after deployment checks complete. |
| **Deployment Evidence Coverage** | 100% of deployments have recorded status, timestamp, version, and validation evidence | CI/CD release records, work item updates, and deployment dashboards | Percentage of deployments with complete recorded evidence for downstream review. |


## 30.10 Best Practices
**DO:**
- **Deploy Approved Versions Only:** Deploy only approved, versioned artefacts.
- **Validate Immediately:** Validate immediately after deployment.
- **Preserve Deployment Evidence:** Maintain clear evidence of what was deployed, where, and when.
- **Run Smoke Tests Promptly:** Run smoke tests immediately after deployment.
- **Support Automated Rollback:** Have automated rollback where supported for smoke test failure.
- **Monitor Runtime Signals:** Monitor logs during and after deployment.

**DON'T:**
- **Carry Forward Critical Errors:** Do not allow critical runtime errors to persist into phase completion.
- **Skip Smoke Tests:** Do not deploy without smoke tests.
- **Ignore Validation Failures:** Do not ignore smoke test failures.
- **Omit Required Rollback Capability:** Do not skip rollback capability for change types that require it.


## 30.11 Summary and Key Outcomes
Step 30 deploys the approved artefact set into the validation environment, confirms baseline runtime health through smoke testing and signal review, and prepares the evidence needed for final development completion.

Key Outcomes:
- **Validated Deployment:** The approved build is deployed successfully into the target validation environment.
- **Smoke-Test Confirmation:** Fast functional checks confirm that core deployment paths are working.
- **Runtime Stability Visibility:** Logs and runtime signals are reviewed for unresolved startup or dependency issues.
- **Recorded Deployment Evidence:** Deployment status, version, timing, and validation evidence are captured.
- **Completion Readiness:** The change is stable enough to move into the final development completion step.


## 30.12 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | DevOps Engineer, Development Team, CI/CD Pipeline |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Consulted** | QA Lead, Release Engineer, Operations Representative |
| **Informed** | Engineering Manager, Product Owner |


## 30.13 Related Steps
- **Upstream:** [Step 29: Development Flow](Step-29-Development-Flow.md)
- **Downstream:** [Step 31: Development Complete](Step-31-Development-Complete.md)


## 30.14 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |
