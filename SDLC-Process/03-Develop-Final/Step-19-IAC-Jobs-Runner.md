# Step 19: IaC Jobs Runner

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |
| **Last Review Carried Out** | 8 June 2026 by Simon Armstrong |

> **📌 Quick Links:** [Common Failures and Prevention](#1911-common-failure-modes-and-prevention)

## 19.1 Overview
| **Attribute** | **Value** |
|---|---|
| **Responsible Roles** | DevOps Engineer, Platform Engineer, Development Team |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Supporting Roles** | Security Engineer, Solution Architect, Technical Architect, QA Lead |
| **Tools** | Open-source Pulumi or Terraform CLI, CI/CD Pipeline, Cloud Policy Engine, Azure Key Vault, Monitoring Platform |


## 19.2 Purpose
This step is executed as a delivery work item within the sprint or approved change scope. It covers the hands-on implementation task of running Infrastructure as Code (IaC) jobs to create or update the environments required by the approved delivery scope. Depending on the change type, this can include development, test, staging, pre-production, and production environments.

Although it is sequenced as a step in the SDLC, it should be managed operationally as an engineering work item with clear ownership, acceptance criteria, execution evidence, and traceability to the relevant backlog item, change record, or release scope. Its purpose is to ensure that infrastructure changes are delivered in a repeatable, traceable, policy-compliant, and secure manner before or alongside downstream engineering and release activities.


## 19.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| **Architecture (ARB) approval** | Step 18 | Approved architecture, threat model outcomes, and identified infrastructure constraints. |
| **IaC configurations & source code** | Step 11 and architecture artefacts | Approved open-source Pulumi or Terraform modules, Azure deployment definitions, PowerShell automation scripts, reusable platform components, standardised infrastructure templates, and stack definitions. |
| **Environment specification** | Architecture and platform standards | Required environment topology, sizing, regions, networking, access model, data stores, and dependencies. |
| **Security baseline** | Security standards and threat model outputs | Mandatory controls such as encryption, secrets handling, logging, network segmentation, RBAC, and policy enforcement. |
| **Pipeline configuration** | DevOps platform | CI/CD definitions, deployment gates, approval rules, service connections, and workload identity configuration. |
| **Secrets and configuration references** | Enterprise secrets platform | Azure Key Vault, certificates, managed identity references, and environment-specific configuration references. |
| **Change scope** | Sprint backlog and work items | The specific application or platform changes that require environment provisioning or updates. |


## 19.4 Activities
### 19.4.1 Validate Deployment Readiness
Before any IaC execution begins, the assigned delivery owner validates that the work item is authorised, correctly scoped, and ready for execution.

This validation includes:
- **Target Environment Scope:** Confirm the target environment and deployment scope.
- **Architecture and Security Approval:** Confirm that the architecture and security approvals are current.
- **IaC Context Accuracy:** Confirm that the IaC branch, stack, workspace, and state backend are correct.
- **Connection and Identity Readiness:** Verify that required service connections, identities, and secrets references are available.
- **Landing Zone Alignment:** Verify that the change fits the approved landing zone, naming standards, and tagging model.

The pipeline must fail fast if approvals, credentials, stack selection, or required inputs are missing. The work item must not proceed until these prerequisites are met.

### 19.4.2 Execute Static and Policy Validation
The IaC code is validated before provisioning is attempted.

The validation stage must include:
- **Syntax and Formatting Validation:** Run syntax validation and formatting checks.
- **Dependency Resolution:** Resolve modules and dependencies.
- **Security Pattern Analysis:** Run static analysis for insecure patterns.
- **Policy-as-Code Enforcement:** Validate against enterprise standards.
- **Approved Module Verification:** Validate that only approved modules and providers are used.
- **Secure Secret Referencing:** Validate that secrets are referenced securely and are not embedded in code or pipeline variables.

Typical controls include:
- **Preview or Plan Execution:** `pulumi preview` or `terraform plan` using the approved open-source CLI tooling.
- **Policy Packs:** Policy packs or policy sets.
- **Schema Validation:** Schema and variable validation.
- **Linting Checks:** Linter checks for IaC quality and consistency.

Any high-severity policy or security violation blocks progression.

### 19.4.3 Provision or Update Infrastructure
The pipeline executes the approved IaC job to create or update the target development or test environment.

Execution must be:
- **Fully Automated:** Non-interactive and fully automated through the pipeline.
- **Traceable:** Traceable to the triggering commit, work item, and build number.
- **Correctly Scoped:** Scoped to the intended stack, workspace, subscription, project, resource group, and target environment.
- **Idempotent:** Repeated runs converge safely on the desired state.

Provisioning typically includes:
- **Network and Connectivity:** Network and connectivity components.
- **Compute and Platform Services:** Compute, containers, serverless, or platform services.
- **Data Services:** Data stores and storage accounts.
- **Identity and Access:** Identity assignments and role bindings.
- **Ingress and Certificates:** DNS, certificates, and ingress configuration.
- **Observability Enablement:** Observability agents, diagnostics, and alert routing.

Where the implementation spans multiple environments, each environment deployment should be tracked as a distinct execution item or sub-task under the same parent work item so approvals, evidence, and outcomes remain clear.

### 19.4.4 Apply Secure Configuration Baseline
After resources are provisioned, the pipeline enforces the platform security and operability baseline.

This baseline includes, where applicable:
- **Private Networking:** Private networking or controlled ingress.
- **Encryption Controls:** Encryption at rest and in transit.
- **Least-Privilege Access:** RBAC using least privilege.
- **Managed Identity Usage:** Managed identities instead of static credentials.
- **Centralized Secret Retrieval:** Secret retrieval from the approved secret store.
- **Diagnostics by Default:** Diagnostic logs, metrics, traces, and audit events are enabled by default.
- **Backup and Retention Controls:** Backup, retention, and recovery settings aligned to environment policy.
- **Mandatory Tagging:** Tags such as application, owner, environment, cost centre, data classification, and support group.

Configuration drift introduced by manual post-deployment changes is not permitted. All changes must be re-captured in IaC.

### 19.4.5 Validate Environment Health and Connectivity
Provisioning success alone is insufficient. The environment must be functionally validated before handoff.

Validation must confirm:
- **Pipeline Success:** All pipeline jobs completed successfully.
- **Resource Health:** Target resources are healthy and reachable through approved paths.
- **Dependency Availability:** Application dependencies are available.
- **Identity Access Boundaries:** Service identities can access only the required dependencies.
- **Configuration Load Validation:** Configuration values are loaded correctly from approved secret and config stores.
- **Monitoring Signal Emission:** Logging and metrics are emitted to the enterprise monitoring platform.
- **Policy and Security Closure:** No critical security or policy violations remain unresolved.

Where relevant, validation should include smoke connectivity checks for databases, queues, storage, APIs, and platform endpoints.

### 19.4.6 Record State, Evidence, and Traceability
The pipeline records the deployment evidence needed for auditability and support.

This evidence includes:
- **Pipeline Run Reference:** Pipeline run identifier and execution timestamp.
- **Source Traceability:** Commit SHA and source branch.
- **Change Linkage:** Work item or change record linkage.
- **IaC Context Reference:** Stack or workspace name.
- **Plan or Preview Summary:** Plan or preview output summary.
- **Resource Inventory:** Resource inventory and key outputs.
- **Policy Validation Evidence:** Policy validation results.
- **Approval Evidence:** Approver details where approvals were required.

The resulting environment becomes the approved baseline for downstream development and testing steps. The work item is only considered complete when execution evidence and acceptance criteria have been recorded.

### 19.4.7 Infrastructure Documentation
The delivery team updates the infrastructure documentation required to support engineering continuity, operational readiness, and auditability.

Infrastructure documentation must include, where applicable:
- **Environment Purpose and Scope:** The environment purpose and scope.
- **Environment Identity:** The target environment name and hosting location.
- **Resource Inventory:** The deployed resource inventory and key dependencies.
- **Network and Access Design:** Network, identity, and access considerations.
- **Configuration Baseline:** Configuration baselines and environment-specific variations.
- **Secret and Certificate References:** Secret and certificate reference locations without exposing secret values.
- **Operational Expectations:** Monitoring, logging, backup, and recovery expectations.
- **Named Ownership:** Ownership for engineering, platform, security, and support teams.
- **Source and Execution Links:** Links to the source repository, pipeline definition, and latest successful execution evidence.

Documentation must be updated as part of the same delivery work item so the deployed environment and the recorded design remain aligned.


## 19.5 Outputs
| **Output** | **Target Environment** | **Destination** | **Description** |
|---|---|---|---|
| **Environment is ready for downstream engineering use** | Azure subscription, GitHub repository | Development, QA, Operations, and release stakeholders | A provisioned or updated environment aligned to the approved architecture, delivery scope, and target deployment needs. |
| **Controlled and traceable infrastructure delivery baseline** | Azure DevOps Pipelines, GitHub Actions, Pulumi/Terraform state backend | CI/CD platform, audit trail, and state backend | Execution evidence, state data, and traceability records are captured for future runs, support, and auditability. |
| **Operationally governed infrastructure baseline** | Confluence, SharePoint, Azure Monitor, Application Insights | Platform documentation, observability platform, and governance teams | Documentation, monitoring, diagnostics, and policy validation are in place to support secure downstream use. |


## 19.6 Key Artifacts
**Inputs:**
- Work item or backlog record for the infrastructure change
- Approved architecture and threat model outputs
- IaC module repository and stack definitions
- Policy-as-code rules and validation requirements
 - Environment specification and support expectations

**Outputs:**
- Pipeline definition and deployment logs
- Infrastructure state and resource outputs
- Updated infrastructure documentation
- Policy and security validation evidence
- Monitoring and diagnostics enablement evidence


## 19.7 Quality Gates / Exit Criteria
- [ ] The work item scope, target environment, and ownership were confirmed before execution.
- [ ] IaC source passed syntax, linting, and policy validation checks.
- [ ] The correct stack, workspace, subscription, and target environment were used.
- [ ] All required resources were provisioned or updated successfully.
- [ ] Mandatory security controls were applied, including secrets handling, encryption, logging, and least-privilege access.
- [ ] No unresolved critical or high-severity policy violations remain.
- [ ] Environment health and dependency connectivity checks passed.
- [ ] Deployment evidence, state, and resource outputs were captured and stored.
- [ ] The delivery team confirmed the environment is ready for Step 20 without manual corrective action.

The step is complete only when the work item acceptance criteria have been met, and the environment is reproducible through IaC, operationally observable, security-compliant, and ready for application development and test execution.


## 19.8 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** | **Agent/MCP Discovery** |
|---|---|---|---|
| **Pipeline orchestration** | CI/CD platform | Executes stack validation, preview, provisioning, post-deployment checks, and evidence capture. | Azure DevOps MCP, GitHub Actions MCP |
| **IaC authoring and review assistance** | Approved AI coding assistant (GitHub Copilot, Azure AI) | Accelerates template creation, review explanations, and remediation suggestions while remaining subject to human approval. | GitHub Copilot Agent for IaC, Terraform/Pulumi language agents |
| **Policy-as-code enforcement** | Policy engine (Azure Policy, OPA, Sentinel) | Validates security, compliance, tagging, region, and network guardrails before deployment. | Policy-as-Code MCP, Compliance scanning agents |
| **Automated drift awareness** | IaC platform and cloud control plane | Detects deviations between declared and actual infrastructure state. | Drift detection agents, Infrastructure state monitors |
| **Post-deployment validation** | Automation scripts and health checks | Confirms environment readiness, connectivity, and baseline configuration after provisioning. | Health check agents, Environment validation MCP |

AI-assisted outputs must always be reviewed by the responsible engineer before execution in the target environment.


## 19.9 Observability and Metrics
| **Metric** | **Target** | **Formula** | **How It Is Tracked** | **Description** |
|---|---|---|---|---|
| **Provisioning Success Rate** | >=95% successful IaC runs per reporting period | `(Successful runs / Total runs) × 100` | CI/CD pipeline run status and deployment records | Percentage of IaC runs that complete successfully without rollback or rerun. |
| **Provisioning Lead Time** | <1 business day from approved handoff to development-environment readiness | `Environment ready timestamp - Architecture approval timestamp` | Work item timestamps, pipeline timestamps, and release records | Time from approved architecture handoff to environment readiness for development. |
| **Change Failure Rate for IaC Runs** | <10% of IaC runs require rollback, hotfix, or urgent correction | `(Failed runs requiring correction / Total runs) × 100` | Rollback records, hotfix records, and incident-linked deployment history | Percentage of infrastructure changes requiring rollback, hotfix, or urgent correction. |
| **Mean Time to Recover Environment Issues** | <4 hours for development-impacting failures | `Sum(Recovery time per incident) / Total incidents` | Incident logs, support records, and environment recovery timestamps | Time required to restore a failed or misconfigured development environment. |
| **Policy Compliance Rate** | 100% mandatory-policy pass rate | `(Runs passing all policies / Total runs) × 100` | Policy engine results, pipeline checks, and governance reports | Percentage of runs that pass all mandatory policy checks without exception. |
| **Unresolved Drift Incidents** | 0 unresolved drift incidents before progression | `Count(Drift incidents) - Count(Resolved drift incidents)` | Drift detection reports and platform governance records | Count of manual or out-of-band infrastructure changes detected in managed environments. |
| **Monitoring Coverage** | 100% of provisioned resources onboarded to required monitoring | `(Resources with monitoring / Total provisioned resources) × 100` | Observability platform onboarding evidence and platform health dashboards | Infrastructure and platform monitoring coverage for resources provisioned during this step. |

Expected telemetry for this step includes pipeline logs, cloud activity logs, policy evaluation results, resource health signals, and deployment correlation identifiers.


## 19.10 Best Practices
**DO:**
- **Track as a Delivery Work Item:** Define Step 19 in the backlog as an infrastructure delivery work item with explicit acceptance criteria.
- **Maintain Parent Traceability:** Link the execution to the parent feature, defect, platform change, or release item.
- **Use Approved IaC Pipelines Only:** Provision development and test environments exclusively through approved IaC pipelines.
- **Prefer Reusable Platform Modules:** Use reusable modules and platform standards instead of project-specific snowflake infrastructure.
- **Prefer Secret References and Managed Identity:** Prefer managed identity and secret references over embedded credentials.
- **Keep Definitions Composable:** Keep environment definitions small, composable, and peer-reviewable.
- **Fail Early on Control Violations:** Fail early on policy, naming, tagging, and configuration violations.
- **Capture Audit Evidence:** Capture every deployment as an auditable change linked to a work item and commit.

**DON'T:**
- **Correct Infrastructure Manually:** Do not make manual corrections in the cloud console; instead, fix the code and rerun the pipeline.
- **Assume Deployment Success Is Enough:** Do not treat deployment success alone as sufficient without validating operability and readiness for the development team.


## 19.11 Common Failure Modes and Prevention
| **Failure Mode** | **Typical Cause** | **Preventive Control** |
|---|---|---|
| **Wrong environment updated** | Incorrect stack, workspace, or subscription selection | Enforce environment-specific pipeline variables, approval checks, and protected deployment targets. |
| **Provisioning drift** | Manual cloud-side changes | Run drift checks regularly and require all changes to be codified in IaC. |
| **Secrets exposure** | Hardcoded values or insecure pipeline variables | Use enterprise secret stores, masked pipeline variables, and pre-merge secret scanning. |
| **Partial deployment success** | Weak dependency modeling or missing post-checks | Use explicit dependencies, health validation, and automatic job failure on incomplete resource readiness. |
| **Policy non-compliance** | Missing guardrails in templates | Enforce policy-as-code in preview and apply stages. |
| **Unobservable environment** | Diagnostics not enabled by default | Make logging, metrics, and alert hooks part of the baseline module set. |


## 19.12 Summary and Key Outcomes
Step 19 provisions and configures the infrastructure baseline required for downstream engineering work through controlled IaC execution, policy enforcement, secure configuration, and environment validation.

Key Outcomes:
- **Provisioned Environment Baseline:** Required infrastructure is created or updated in the approved target environment.
- **Policy-Compliant Infrastructure Delivery:** Provisioning passes mandatory policy, security, and configuration controls.
- **Operational Readiness Validation:** Connectivity, dependencies, monitoring, and configuration baselines are validated before handoff.
- **Traceable Deployment Evidence:** Execution, approval, state, and output records are captured for auditability and support.
- **Documented Environment Readiness:** Infrastructure documentation is updated so downstream teams can use and support the environment confidently.


## 19.13 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | DevOps Engineer, Platform Engineer |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Consulted** | Solution Architect, Technical Architect, Security Engineer, QA Lead |
| **Informed** | Development Team, Product Owner, Support or Operations Team |


## 19.14 Related Steps
- **Upstream:** [Step 18: Threat Modeling Architecture Review](../02-Architecture-Design/Step-18-Threat-Modeling-Architecture-Review.md)
- **Downstream:** [Step 20: Unit Testing](Step-20-Unit-Testing.md)


## 19.15 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |
| **0.1** | 8 June 2026 | Simon Armstrong | Reviewed document and provided comments for improvement |
