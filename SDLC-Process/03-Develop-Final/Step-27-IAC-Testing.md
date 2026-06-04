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
- Running `pulumi preview`, `terraform plan`, or an approved equivalent
- Showing resources to be created, updated, or deleted
- Displaying configuration changes
- Identifying potential issues before any controlled rollout

Example plan output:

```text
Previewing update (dev):
+ 3 to create
~ 2 to update
- 1 to delete

Resources:
+ aws:s3/bucket:Bucket order-processing-bucket-dev
+ aws:rds/instance:Instance order-db-dev
+ aws:ec2/securityGroup:SecurityGroup order-sg-dev
~ aws:lambda/function:Function order-processor (version update)
~ aws:dynamodb/table:Table session-store (throughput change)
- aws:ec2/instance:Instance legacy-server (no longer needed)
```

### 27.4.2 Validate Syntax and Dependencies
Confirm that modules, variables, references, and dependencies resolve correctly.

Validation should confirm:
- No syntax errors in the IaC code
 - All required parameters are provided
 - Resource dependencies are correct
 - Naming conventions are followed
 - Tags are applied consistently

Validation checklist:
- [ ] IaC syntax valid
- [ ] Required parameters present
- [ ] Resource names follow convention
- [ ] Tags include environment, owner, and cost-center where required
- [ ] Dependencies properly declared

### 27.4.3 Apply Policy and Compliance Checks
Validate against security, tagging, region, identity, and other required guardrails.

Policy checks typically cover:
- **Security:** No public S3 buckets, encryption enabled
- **Cost:** Resources within budget limits
- **Compliance:** Required tags are present and approved regions are used
- **Best practices:** HA configuration or backup enabled where required

Typical policy examples include:
- Deny public S3 buckets
- Require encryption at rest for databases
- Enforce tagging such as environment, owner, and cost-center
- Restrict deployment to approved regions
- Require multi-AZ for production databases

Example policy violation:

```text
Policy Violation: Security Policy

- Resource: aws:s3/bucket:Bucket order-processing-bucket
- Issue: Public access enabled
- Severity: High
- Recommendation: Set publicAccessBlock to true
```

### 27.4.4 Detect Drift and Unintended Change
Review the plan output for unexpected deletions, configuration drift, or other unsafe outcomes.

Drift detection should:
- Compare IaC state with actual infrastructure
- Identify manual changes not represented in code
- Highlight configuration drift
- Alert on unexpected or destructive changes

Example drift finding:

```text
Drift Detected:

- Resource: aws:rds/instance:Instance order-db-dev
- Expected: db.t3.medium
- Actual: db.t3.large (manually resized)
- Action: Update IaC or revert infrastructure
```

### 27.4.5 Review Cost and Operational Impact
Where relevant, review cost implications and operational changes introduced by the infrastructure update.

Cost estimation should:
- Calculate monthly costs for the proposed change
- Compare costs to the current baseline
- Highlight expensive resources or unusually large deltas
- Alert if projected costs exceed budget expectations

Example cost report:

```text
Estimated Monthly Cost:
Current: $850/month
Proposed: $1,245/month
Delta: +$395/month (+46%)

Top Changes:
+ RDS Instance (db.t3.large): +$180/month
+ S3 Bucket (estimated 500GB): +$12/month
~ Lambda (increased memory): +$8/month
```


## 27.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Plan or preview evidence** | CI/CD platform and engineering records | Visibility into the expected infrastructure change set. |
| **Policy validation result** | Security and platform governance records | Pass or fail evidence for required controls. |
| **Drift and impact assessment** | DevOps and engineering records | Evidence of whether the change contains unexpected or unsafe behaviour. |


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


## 27.7 Quality Gates / Exit Criteria
- [ ] Plan or preview completed successfully.
- [ ] IaC syntax and dependencies are valid.
- [ ] Policy and compliance checks have passed.
- [ ] No unresolved unsafe or unintended change is present.
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
| **IaC Test Pass Rate** | >=95% | CI/CD validation results and IaC test trend reports | Percentage of IaC changes passing preview and policy checks on first run. |
| **Policy Compliance Rate** | 100% | Policy tool results and governance compliance records | Percentage of pull requests compliant with approved IaC policies. |
| **Drift Incidents** | 0 | Drift detection output and platform engineering review logs | Number of drift or unexpected-change findings detected. |
| **Cost Variance** | <10% | Cost estimation reports compared with observed spend | Difference between estimated and actual infrastructure cost where measurable. |
| **IaC Test Time** | <10 minutes | CI/CD pipeline timing records | Time required to complete infrastructure validation. |


## 27.10 Best Practices
**DO:**
- Review plan or preview output before advancing an IaC change.
- Treat policy failures as blockers unless formally approved as exceptions.
- Resolve drift in code, not manually in the target platform.
- Review destructive changes with heightened scrutiny.

- Run IaC testing on every pull request containing infrastructure changes.
- Document reasons for intentional drift or exceptions.
 - Set budget alerts for significant cost increases where supported.

**DON'T:**
- Progress infrastructure changes without understanding their full impact.

- Apply IaC changes without preview or plan evidence.
- Ignore policy violations.
- Merge with detected drift without investigation.


## 27.11 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | DevOps Engineer, Platform Engineer |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Consulted** | Security Engineer, Technical Architect |
| **Informed** | Development Team, Engineering Manager |


## 27.12 Related Steps
- **Upstream:** [Step 26: Code Review Continued](Step-26-Code-Review-Continued.md)
- **Downstream:** [Step 28: Secrets Scan](Step-28-Secrets-Scan.md)


## 27.13 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |

[Previous: Step 26 - Code Review Continued](Step-26-Code-Review-Continued.md) | [Next: Step 28 - Secrets Scan](Step-28-Secrets-Scan.md)
