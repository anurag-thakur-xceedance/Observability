[Previous: Step 26 - Code Review Continued](Step-26-Code-Review-Continued.md) | [Next: Step 28 - Secrets Scan](Step-28-Secrets-Scan.md)

# Step 27: IaC Testing

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |

## 27.1 Overview
| **Attribute** | **Value** |
|---|---|
| **Responsible Roles** | DevOps Engineer, Platform Engineer |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Supporting Roles** | Security Engineer, Technical Architect |
| **Tools** | Open-source Pulumi or Terraform CLI, policy tooling, CI/CD pipeline, cost estimation tools |


## 27.2 Purpose
Step 27 validates Infrastructure as Code changes before they proceed further in the development workflow. It ensures that infrastructure definitions are syntactically valid, policy-compliant, operationally sound, and appropriately understood before any subsequent controlled rollout activity depends on them.


## 27.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| **Approved IaC change set** | Steps 19 and 26 | Infrastructure definitions and updates ready for validation. |
| **Policy and security rules** | Platform governance and security standards | Approved guardrails and infrastructure compliance expectations. |
| **Target environment context** | Environment specifications and platform standards | Environment-specific parameters and deployment context. |


## 27.4 Activities
### 27.4.1 Generate Plan or Preview
Run the approved preview or planning command to understand the infrastructure impact before application.

Generate an infrastructure change preview by:
- **Approved Preview Command:** Run `pulumi preview`, `terraform plan`, or an approved equivalent.
- **Resource Visibility:** Show resources to be created, updated, or deleted.
- **Configuration Visibility:** Display configuration changes.
- **Early Risk Identification:** Identify potential issues before any controlled rollout.

Example plan output:

```text
Previewing update (dev):
+ 4 to create
~ 2 to update
- 1 to delete

Resources:
+ azure-native:storage:StorageAccount orderprocessingdevsa
+ azure-native:sql:Server order-db-dev
+ azure-native:sql:Database order-db-dev-main
+ azure-native:network:NetworkSecurityGroup order-sg-dev
~ azure-native:web:WebApp order-processor (app version update)
~ azure-native:documentdb:SqlResourceSqlContainer session-store (throughput change)
- azure-native:compute:VirtualMachine legacy-server (no longer needed)
```

### 27.4.2 Validate Syntax and Dependencies
Confirm that modules, variables, references, and dependencies resolve correctly.

Validation should confirm:
- **Syntax Validity:** No syntax errors exist in the IaC code.
- **Required Parameters:** All required parameters are provided.
- **Dependency Resolution:** Resource dependencies are correct.
- **Naming Conventions:** Naming conventions are followed.
- **Tag Consistency:** Tags are applied consistently.

Validation should also confirm that the plan is being produced against the correct stack, workspace, state, subscription, account, project, and environment context. A technically valid plan generated against the wrong target is still a control failure.

Validation checklist:
- [ ] IaC syntax valid
- [ ] Required parameters present
- [ ] Resource names follow convention
- [ ] Tags include environment, owner, and cost-center where required
- [ ] Dependencies properly declared

### 27.4.3 Apply Policy and Compliance Checks
Validate against security, tagging, region, identity, and other required guardrails.

Policy checks typically cover:
- **Security:** No public storage exposure, encryption enabled
- **Cost:** Resources within budget limits
- **Compliance:** Required tags are present and approved regions are used
- **Best Practices:** HA configuration or backup enabled where required

Typical policy examples include:
- **Public Access Restriction:** Deny public access on Azure Storage Accounts.
- **Encryption Enforcement:** Require encryption at rest for Azure SQL databases.
- **Tagging Enforcement:** Enforce tagging such as environment, owner, and cost-center.
- **Region Restriction:** Restrict deployment to approved Azure regions.
- **Resilience Baseline:** Require zone redundancy or equivalent resilience controls for production data services.

Where policy tooling supports severity levels, any critical or high-severity policy failure must block progression until remediated or formally approved through the defined exception process.

Example policy violation:

```text
Policy Violation: Security Policy

- Resource: azure-native:storage:StorageAccount orderprocessingdevsa
- Issue: Public blob access enabled
- Severity: High
- Recommendation: Disable public blob access and restrict network access
```

### 27.4.4 Detect Drift and Unintended Change
Review the plan output for unexpected deletions, configuration drift, or other unsafe outcomes.

Drift detection should:
- **State Comparison:** Compare IaC state with actual infrastructure.
- **Manual Change Detection:** Identify manual changes not represented in code.
- **Drift Visibility:** Highlight configuration drift.
- **Unsafe Change Alerting:** Alert on unexpected or destructive changes.

Special attention should be given to resource deletion, replacement, access-control changes, data-store configuration changes, networking changes, and any modification that could affect resilience, recoverability, or environment security posture.

Example drift finding:

```text
Drift Detected:

- Resource: azure-native:sql:Database order-db-dev-main
- Expected: GP_Gen5_2
- Actual: GP_Gen5_4 (manually resized)
- Action: Update IaC or revert infrastructure
```

### 27.4.5 Review Cost and Operational Impact
Where relevant, review cost implications and operational changes introduced by the infrastructure update.

Cost estimation should:
- **Monthly Cost Estimate:** Calculate monthly costs for the proposed change.
- **Baseline Comparison:** Compare costs to the current baseline.
- **Cost Hotspots:** Highlight expensive resources or unusually large deltas.
- **Budget Alerting:** Alert if projected costs exceed budget expectations.

Operational review should also consider whether the change affects backup behaviour, logging volume, monitoring coverage, scaling characteristics, support ownership, or runbook expectations for the target environment.

Example cost report:

```text
Estimated Monthly Cost:
Current: $850/month
Proposed: $1,245/month
Delta: +$395/month (+46%)

Top Changes:
+ Azure SQL Database (GP_Gen5_4): +$180/month
+ Azure Storage Account (estimated 500GB): +$12/month
~ Azure App Service Plan (scaled up): +$8/month
```


## 27.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Plan or preview evidence** | CI/CD platform and engineering records | Visibility into the expected infrastructure change set. |
| **Policy validation result** | Security and platform governance records | Pass or fail evidence for required controls. |
| **Drift and impact assessment** | DevOps and engineering records | Evidence of whether the change contains unexpected or unsafe behaviour. |
| **Cost and operational impact view** | Platform engineering, DevOps, and delivery records | Cost deltas and operational implications are visible before downstream rollout steps. |


## 27.6 Key Artifacts
**Inputs:**
- IaC code changes such as Pulumi or Terraform definitions
- IaC policies and governance guardrails
- Current infrastructure state and environment context

**Outputs:**
- IaC plan or preview of changes
- Policy compliance report
- Drift detection evidence
- Cost estimation output
- Validation evidence showing the intended target environment and deployment context


## 27.7 Quality Gates / Exit Criteria
- [ ] Plan or preview completed successfully.
- [ ] IaC syntax and dependencies are valid.
- [ ] Policy and compliance checks have passed.
- [ ] No unresolved unsafe or unintended change is present.
- [ ] Any destructive, replacement, or high-impact change has been explicitly reviewed and accepted.
- [ ] Cost impact has been reviewed and any material increase has been accepted or remediated.
- [ ] The change is ready to proceed to Step 28.


## 27.8 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Plan generation** | Open-source IaC CLI tooling | Produces a machine-verifiable preview of the infrastructure change. |
| **Policy validation** | Policy tooling | Confirms infrastructure compliance against approved rules. |
| **Impact interpretation support** | Approved AI assistant | Helps explain plan output and likely risk areas for human review. |


## 27.9 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| **IaC Test Pass Rate** | >=95% first-pass success | CI/CD validation results and IaC test trend reports | Percentage of IaC changes passing preview and policy checks on the first run. |
| **Policy Compliance Rate** | 100% mandatory-policy pass rate | Policy tool results and governance compliance records | Percentage of pull requests compliant with approved IaC policies without unresolved mandatory failures. |
| **Unresolved Drift Findings** | 0 before progression | Drift detection output and platform engineering review logs | Number of drift or unexpected-change findings still open when the step completes. |
| **Cost Variance** | <10% variance between estimate and observed cost where measurable | Cost estimation reports compared with observed spend | Difference between estimated and actual infrastructure cost where the resulting spend can be measured. |
| **IaC Test Time** | <10 minutes per validation run | CI/CD pipeline timing records | Time required to complete infrastructure validation. |
| **Destructive Change Review Coverage** | 100% of delete/replace actions explicitly reviewed | Plan output review records and pull request evidence | Percentage of destructive or replacement actions with explicit human review evidence. |
| **Material Cost Increase Review Coverage** | 100% of changes above agreed budget threshold reviewed | Cost estimation output, approval records, and work item notes | Percentage of significant cost increases that were explicitly reviewed and dispositioned. |


## 27.10 Best Practices
**DO:**
- **Review First:** Review plan or preview output before advancing an IaC change.
- **Block on Policy Failure:** Treat policy failures as blockers unless formally approved as exceptions.
- **Resolve Drift in Code:** Resolve drift in code, not manually in the target platform.
- **Scrutinise Destructive Changes:** Review destructive changes with heightened scrutiny.
- **Test Every IaC PR:** Run IaC testing on every pull request containing infrastructure changes.
- **Document Intentional Exceptions:** Document reasons for intentional drift or exceptions.
- **Set Budget Alerts:** Set budget alerts for significant cost increases where supported.

**DON'T:**
- **Proceed Blindly:** Do not progress infrastructure changes without understanding their full impact.
- **Skip Preview Evidence:** Do not apply IaC changes without preview or plan evidence.
- **Ignore Policy Violations:** Do not ignore policy violations.
- **Merge with Uninvestigated Drift:** Do not merge with detected drift without investigation.


## 27.11 Summary and Key Outcomes
Step 27 validates infrastructure changes through automated and reviewer-led IaC testing so that correctness, policy compliance, drift visibility, and cost impact are understood before downstream release activity depends on the change.

Key Outcomes:
- **Infrastructure Validation:** Infrastructure changes are previewed and validated before controlled rollout.
- **Policy Compliance:** Security, tagging, region, and resilience guardrails are checked before progression.
- **Drift Visibility:** Manual changes, unsafe replacements, and unintended deletions are identified early.
- **Cost Awareness:** Cost deltas and material operational impacts are reviewed before the next step.
- **Deployment Readiness:** The IaC change is in a governed, reviewable, and progression-ready state.


## 27.12 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | DevOps Engineer, Platform Engineer |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Consulted** | Security Engineer, Technical Architect |
| **Informed** | Development Team, Engineering Manager |


## 27.13 Related Steps
- **Upstream:** [Step 26: Code Review Continued](Step-26-Code-Review-Continued.md)
- **Downstream:** [Step 28: Secrets Scan](Step-28-Secrets-Scan.md)


## 27.14 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |

[Previous: Step 26 - Code Review Continued](Step-26-Code-Review-Continued.md) | [Next: Step 28 - Secrets Scan](Step-28-Secrets-Scan.md)
