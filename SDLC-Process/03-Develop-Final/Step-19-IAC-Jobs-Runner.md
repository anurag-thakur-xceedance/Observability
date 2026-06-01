# Step 19: IaC Jobs Runner

## Overview
| **Attribute** | **Value** |
|---|---|
| **Step Number** | 19 |
| **Phase** | Develop |
| **Previous** | [Step 18: Threat Modeling Architecture Review](../02-Architecture-Design/Step-18-Threat-Modeling-Architecture-Review.md) |
| **Next** | [Step 20: Unit Testing](Step-20-Unit-Testing.md) |
| **Responsible Roles** | DevOps Engineer, Platform Engineer, Development Team |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Supporting Roles** | Security Engineer, Solution Architect, Technical Architect, QA Lead |
| **Tools** | Open-source Pulumi or Terraform CLI, CI/CD Pipeline, Cloud Policy Engine, Secrets Manager, Monitoring Platform |

---

## Purpose
This step is executed as a delivery work item within the sprint or approved change scope. It covers the hands-on implementation task of running Infrastructure as Code (IaC) jobs to create or update the environments required by the approved delivery scope. Depending on the change type, this can include development, test, staging, pre-production, and production environments.

Although it is sequenced as a step in the SDLC, it should be managed operationally as an engineering work item with clear ownership, acceptance criteria, execution evidence, and traceability to the relevant backlog item, change record, or release scope. Its purpose is to ensure that infrastructure changes are delivered in a repeatable, traceable, policy-compliant, and secure manner before or alongside downstream engineering and release activities.

---

## Inputs
| **Input** | **Source** | **Description** |
|---|---|---|
| **Architecture (ARB) approval** | Step 18 | Approved architecture, threat model outcomes, and identified infrastructure constraints. |
| **IaC configurations & source code** | Step 11 and architecture artefacts | Approved open-source Pulumi or Terraform modules, Docker Compose definitions, PowerShell automation scripts, reusable platform components, standardized infrastructure templates, and stack definitions. |
| **Environment specification** | Architecture and platform standards | Required environment topology, sizing, regions, networking, access model, data stores, and dependencies. |
| **Security baseline** | Security standards and threat model outputs | Mandatory controls such as encryption, secrets handling, logging, network segmentation, RBAC, and policy enforcement. |
| **Pipeline configuration** | DevOps platform | CI/CD definitions, deployment gates, approval rules, service connections, and workload identity configuration. |
| **Secrets and configuration references** | Enterprise secrets platform | Key Vault, Secrets Manager, parameter store, certificates, and environment-specific configuration references. |
| **Change scope** | Sprint backlog and work items | The specific application or platform changes that require environment provisioning or updates. |

---

## Activities
### 19.1 Validate Deployment Readiness
Before any IaC execution begins, the assigned delivery owner validates that the work item is authorized, scoped correctly, and ready for execution.

This validation includes:
- confirming the target environment and deployment scope
- confirming that the architecture and security approvals are current
- confirming that the IaC branch, stack, workspace, and state backend are correct
- verifying that required service connections, identities, and secrets references are available
- verifying that the change fits the approved landing zone, naming standards, and tagging model

The pipeline must fail fast if approvals, credentials, stack selection, or required inputs are missing. The work item must not move forward until these prerequisites are satisfied.

### 19.2 Execute Static and Policy Validation
The IaC code is validated before provisioning is attempted.

The validation stage must include:
- syntax validation and formatting checks
- module and dependency resolution
- static analysis for insecure patterns
- policy-as-code validation against enterprise standards
- validation that only approved modules and providers are used
- validation that secrets are referenced securely and are not embedded in code or pipeline variables

Typical controls include:
- `pulumi preview` or `terraform plan` using the approved open-source CLI tooling
- policy packs or policy sets
- schema and variable validation
- linter checks for IaC quality and consistency

Any high-severity policy or security violation blocks progression.

### 19.3 Provision or Update Infrastructure
The pipeline executes the approved IaC job to create or update the target development or test environment.

Execution must be:
- non-interactive and fully automated through the pipeline
- traceable to the triggering commit, work item, and build number
- scoped to the intended stack, workspace, subscription, project, resource group, and target environment
- idempotent so repeated runs converge safely on the desired state

Provisioning typically includes:
- network and connectivity components
- compute, containers, serverless, or platform services
- data stores and storage accounts
- identity assignments and role bindings
- DNS, certificates, and ingress configuration
- observability agents, diagnostics, and alert routing

Where the implementation spans multiple environments, each environment deployment should be tracked as a distinct execution item or sub-task under the same parent work item so approvals, evidence, and outcomes remain clear.

### 19.4 Apply Secure Configuration Baseline
After resources are provisioned, the pipeline enforces the platform security and operability baseline.

This baseline includes, where applicable:
- private networking or controlled ingress
- encryption at rest and in transit
- RBAC using least privilege
- managed identities instead of static credentials
- centralized secret retrieval from the approved secret store
- diagnostic logs, metrics, traces, and audit events enabled by default
- backup, retention, and recovery settings aligned to environment policy
- mandatory tags such as application, owner, environment, cost centre, data classification, and support group

Configuration drift introduced by manual post-deployment changes is not permitted. All changes must be re-captured in IaC.

### 19.5 Validate Environment Health and Connectivity
Provisioning success alone is insufficient. The environment must be functionally validated before handoff.

Validation must confirm:
- all pipeline jobs completed successfully
- target resources are healthy and reachable through approved paths
- application dependencies are available
- service identities can access only the required dependencies
- configuration values are loaded correctly from approved secret and config stores
- logging and metrics are emitted to the enterprise monitoring platform
- no critical security or policy violations remain unresolved

Where relevant, validation should include smoke connectivity checks for databases, queues, storage, APIs, and platform endpoints.

### 19.6 Record State, Evidence, and Traceability
The pipeline records the deployment evidence needed for auditability and support.

This evidence includes:
- pipeline run identifier and execution timestamp
- commit SHA and source branch
- work item or change record linkage
- stack or workspace name
- plan or preview output summary
- resource inventory and key outputs
- policy validation results
- approver details where approvals were required

The resulting environment becomes the approved baseline for downstream development and testing steps. The work item is only considered complete when execution evidence and acceptance criteria have been recorded.

### 19.7 Infrastructure Documentation
The delivery team updates the infrastructure documentation required to support engineering continuity, operational readiness, and auditability.

Infrastructure documentation must include, where applicable:
- the environment purpose and scope
- the target environment name and hosting location
- the deployed resource inventory and key dependencies
- network, identity, and access considerations
- configuration baselines and environment-specific variations
- secret and certificate reference locations without exposing secret values
- monitoring, logging, backup, and recovery expectations
- named ownership for engineering, platform, security, and support teams
- links to the source repository, pipeline definition, and latest successful execution evidence

Documentation must be updated as part of the same delivery work item so the deployed environment and the recorded design remain aligned.

---

## Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Provisioned environment** | Development, QA, Operations, and release stakeholders | Ready-to-use environment aligned to approved architecture, delivery scope, and deployment target. |
| **IaC execution evidence** | CI/CD platform and audit trail | Pipeline logs, plan summary, execution result, commit linkage, and approval trace. |
| **Infrastructure state** | Approved state backend | Current state file, stack metadata, and resource outputs required for subsequent runs. |
| **Infrastructure documentation** | Platform documentation and operations repository | Updated environment details including topology, dependencies, ownership, operational controls, and support references. |
| **Environment configuration baseline** | Platform documentation and operations repository | Final environment details including endpoints, dependencies, tags, and operational controls. |
| **Policy and security validation results** | Security and platform governance teams | Evidence that the environment conforms to mandatory controls and platform guardrails. |
| **Monitoring and diagnostics enabled** | Observability platform | Metrics, logs, traces, and alerts required for downstream validation and troubleshooting. |

---

## Quality Gates / Exit Criteria
- [ ] The work item scope, target environment, and ownership were confirmed before execution.
- [ ] IaC source passed syntax, linting, and policy validation checks.
- [ ] The correct stack, workspace, subscription, and target environment were used.
- [ ] All required resources were provisioned or updated successfully.
- [ ] Mandatory security controls were applied, including secrets handling, encryption, logging, and least-privilege access.
- [ ] No unresolved critical or high-severity policy violations remain.
- [ ] Environment health and dependency connectivity checks passed.
- [ ] Deployment evidence, state, and resource outputs were captured and stored.
- [ ] The delivery team confirmed the environment is ready for Step 20 without manual corrective action.

The step is complete only when the work item acceptance criteria have been met and the environment is reproducible through IaC, operationally observable, security-compliant, and ready for application development and test execution.

---

## AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Pipeline orchestration** | CI/CD platform | Executes stack validation, preview, provisioning, post-deployment checks, and evidence capture. |
| **IaC authoring and review assistance** | Approved AI coding assistant | Accelerates template creation, review explanations, and remediation suggestions while remaining subject to human approval. |
| **Policy-as-code enforcement** | Policy engine | Validates security, compliance, tagging, region, and network guardrails before deployment. |
| **Automated drift awareness** | IaC platform and cloud control plane | Detects deviations between declared and actual infrastructure state. |
| **Post-deployment validation** | Automation scripts and health checks | Confirms environment readiness, connectivity, and baseline configuration after provisioning. |

AI-assisted outputs must always be reviewed by the responsible engineer before execution in the target environment.

---

## Observability and Metrics
| **Metric / Reference** | **Type** | **Description** |
|---|---|---|
| **Provisioning success rate** | Delivery metric | Percentage of IaC runs that complete successfully without rollback or rerun. |
| **Provisioning lead time** | Flow metric | Time from approved architecture handoff to environment readiness for development. |
| **Change failure rate for IaC runs** | DORA-aligned quality metric | Percentage of infrastructure changes requiring rollback, hotfix, or urgent correction. |
| **Mean time to recover environment issues** | Reliability metric | Time required to restore a failed or misconfigured development environment. |
| **Policy compliance rate** | Governance metric | Percentage of runs that pass all mandatory policy checks without exception. |
| **Drift incidents** | Operational control metric | Count of manual or out-of-band infrastructure changes detected in managed environments. |
| **O4** | Observability reference | Infrastructure and platform monitoring coverage for resources provisioned during this step. |

Expected telemetry for this step includes pipeline logs, cloud activity logs, policy evaluation results, resource health signals, and deployment correlation identifiers.

---

## Best Practices
- Define Step 19 in the backlog as an infrastructure delivery work item with explicit acceptance criteria.
- Link the execution to the parent feature, defect, platform change, or release item.
- Provision development and test environments exclusively through approved IaC pipelines.
- Use reusable modules and platform standards instead of project-specific snowflake infrastructure.
- Prefer managed identity and secret references over embedded credentials.
- Keep environment definitions small, composable, and peer-reviewable.
- Fail early on policy, naming, tagging, and configuration violations.
- Capture every deployment as an auditable change linked to a work item and commit.
- Avoid manual corrections in the cloud console; fix the code and rerun the pipeline.
- Validate operability, not just deployment success, before handing the environment to the development team.

---

## Common Failure Modes and Prevention
| **Failure Mode** | **Typical Cause** | **Preventive Control** |
|---|---|---|
| **Wrong environment updated** | Incorrect stack, workspace, or subscription selection | Enforce environment-specific pipeline variables, approval checks, and protected deployment targets. |
| **Provisioning drift** | Manual cloud-side changes | Run drift checks regularly and require all changes to be codified in IaC. |
| **Secrets exposure** | Hardcoded values or insecure pipeline variables | Use enterprise secret stores, masked pipeline variables, and pre-merge secret scanning. |
| **Partial deployment success** | Weak dependency modeling or missing post-checks | Use explicit dependencies, health validation, and automatic job failure on incomplete resource readiness. |
| **Policy non-compliance** | Missing guardrails in templates | Enforce policy-as-code in preview and apply stages. |
| **Unobservable environment** | Diagnostics not enabled by default | Make logging, metrics, and alert hooks part of the baseline module set. |

---

## RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | DevOps Engineer, Platform Engineer |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Consulted** | Solution Architect, Technical Architect, Security Engineer, QA Lead |
| **Informed** | Development Team, Product Owner, Support or Operations Team |

---

## Related Artefacts
- Work item or backlog record for the infrastructure change
- Approved architecture and threat model outputs
- IaC module repository and stack definitions
- Pipeline definition and deployment logs
- Policy-as-code rules and validation evidence
- Environment specification and support runbook
- Resource inventory and deployment outputs

---

## Related Steps
- **Upstream:** [Step 18: Threat Modeling Architecture Review](../02-Architecture-Design/Step-18-Threat-Modeling-Architecture-Review.md)
- **Downstream:** [Step 20: Unit Testing](Step-20-Unit-Testing.md)

---

## Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **1.0** | **2026-01-19** |  | **Initial draft** |
| **1.1** | **2026-05-28** | **OpenCode** | **Refined as a Confluence-ready enterprise version with work-item framing, expanded infrastructure documentation, open-source tooling references, updated role model, and complete operational workflow, controls, metrics, and best practices.** |
