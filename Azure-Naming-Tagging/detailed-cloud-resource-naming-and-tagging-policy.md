# Detailed Cloud Resource Naming and Tagging Policy

| Metadata Field | Document Specification |
|---|---|
| Document Title | Detailed Multi-Cloud Resource Naming, Tagging, Labeling, and Governance Policy |
| Document Version | Version 1.0 |
| Effective Date | June 12, 2026 |
| Applies To | Microsoft Azure, Amazon Web Services, Google Cloud Platform, local container environments |
| Target Audience | Cloud Engineers, DevOps Teams, Platform Teams, Security Teams, FinOps Teams, Solution Architects, Application Owners |
| Security Classification | Internal Corporate - Confidential / Restricted |
| Source Inputs | `Azure Resource Naming & Tagging Policy Standard.md`, `azure-resource-naming-and-tagging-policy.md`, `spec-process-cloud-governance-rollout.md` |

---

## 1. Executive Summary

This policy defines the mandatory enterprise standard for naming and tagging cloud resources across Azure, AWS, and GCP. The standard is Azure-aligned because Azure Policy and management groups are often used as the enterprise governance anchor, but the underlying rules are intentionally multi-cloud and use the strictest common constraints where practical.

The policy has four goals:

1. Make each cloud resource understandable from its name.
2. Make each cloud resource attributable through metadata such as owner, project, environment, cost center, and compliance scope.
3. Enable automated enforcement through Infrastructure as Code, CI/CD, native cloud policy engines, and monitoring integrations.
4. Remediate legacy resources safely without downtime by separating low-risk auto-tagging from high-risk manual review.

This policy is mandatory for all new cloud resources. Existing resources must be brought into compliance through the rollout process defined in this document.

---

## 2. Purpose, Scope, and Governance Outcomes

### 2.1 Purpose

The purpose of this policy is to establish consistent naming and metadata practices for cloud resources so that cloud infrastructure can be governed, secured, operated, and charged back consistently across providers.

### 2.2 Scope

This policy applies to:

| Scope Area | Included |
|---|---|
| Cloud providers | Azure subscriptions, AWS accounts, GCP projects |
| Environments | Production, non-production, development, shared services, sandbox |
| Deployment methods | Terraform, OpenTofu, Bicep, ARM, CloudFormation, Pulumi, CLI, portal, scripts, CI/CD pipelines |
| Resource types | Compute, storage, networking, databases, security, IAM, containers, monitoring, integration, backup, data, AI services |
| Local development | Docker Compose resources where labels are supported |

### 2.3 Operational Benefits

| Benefit | Why It Matters |
|---|---|
| Cost allocation | Enables accurate FinOps reporting, showback, and chargeback. |
| Security ownership | Identifies accountable teams during incidents and vulnerability response. |
| Regulatory auditability | Supports SOC 2, HIPAA, PCI-DSS, data classification, and evidence collection. |
| Automation | Enables policy-driven remediation, lifecycle automation, and dashboards. |
| Incident response | Reduces mean time to identify workload, environment, and owner. |
| Drift detection | Makes unmanaged or non-compliant resources visible quickly. |

### 2.4 Regulatory Alignment

| Regulation / Framework | Policy Mapping |
|---|---|
| SOC 2 Type II CC6.1, CC6.2, CC7.1 | Owner, environment, business-criticality, and compliance-scope tags support access boundaries and monitoring evidence. |
| HIPAA Security Rule 45 CFR 164.310 | Data-classification and compliance-scope tags identify PHI workloads and restrict infrastructure handling health records. |
| PCI-DSS v4.0 Requirements 1.2 and 3.1 | Compliance-scope tags identify cardholder data environments and support network isolation mapping. |

---

## 3. Definitions

| Term | Definition |
|---|---|
| Tag | Metadata key-value pair used by Azure and AWS. |
| Label | Metadata key-value pair used by GCP. GCP labels have stricter key and value constraints than Azure and AWS tags. |
| Canonical tag | Enterprise metadata name used in documentation and architecture standards. |
| Provider tag key | Cloud-specific implementation of a canonical tag key. |
| Brownfield | Existing resources deployed before this policy is enforced. |
| Greenfield | New resources deployed after this policy is adopted. |
| Audit mode | A report-only policy state where violations are logged but not blocked. |
| Deny mode | A policy state where non-compliant deployments are blocked. |
| Modify mode | A policy state where missing metadata is added or inherited automatically. |
| ABAC | Attribute-Based Access Control. Authorization decisions based on metadata attributes. |
| FinOps | Cloud financial management discipline for cost visibility, accountability, and optimization. |

---

## 4. Naming Convention Framework

### 4.1 Standard Naming Formula

All resources that support hyphens must use the following kebab-case formula:

```text
[company]-[project]-[environment]-[region]-[resource-type]-[instance]
```

Example:

```text
acme-custportal-prod-use1-vm-001
```

### 4.2 Token Definitions

| Token | Required | Description | Example Values |
|---|---:|---|---|
| `company` | Yes | Approved company or business-unit code. | `acme`, `xci` |
| `project` | Yes | Application, product, workload, or platform capability. | `custportal`, `claims`, `billing`, `underwrite` |
| `environment` | Yes | Deployment lifecycle tier. | `prod`, `nonprod`, `dev`, `shrd`, `sbx` |
| `region` | Yes | Standardized enterprise region short code. | `use1`, `usw2`, `euw1`, `inc1` |
| `resource-type` | Yes | Standard resource abbreviation. | `vm`, `rg`, `vnet`, `sql`, `kv`, `st` |
| `instance` | Yes | Three-digit sequential uniqueness value. | `001`, `002`, `003` |

### 4.3 Environment Codes

| Code | Name | Description |
|---|---|---|
| `prod` | Production | Customer-facing or business-critical production systems. |
| `nonprod` | Non-production | Test, staging, system integration testing, and UAT. |
| `dev` | Development | Developer, build, and continuous integration environments. |
| `shrd` | Shared services | Hub networks, shared vaults, shared monitoring, central DNS, landing zone services. |
| `sbx` | Sandbox | Temporary experimentation environments with expiry controls. |

### 4.4 Core Naming Rules

| Rule ID | Rule | Requirement |
|---|---|---|
| NAM-001 | Lowercase only | Names must use lowercase letters and numbers. |
| NAM-002 | Kebab-case | Tokens must be separated by one hyphen where the provider allows hyphens. |
| NAM-003 | No consecutive hyphens | Names must not contain `--`. |
| NAM-004 | No leading or trailing hyphens | Names must start and end with an alphanumeric character. |
| NAM-005 | Stable token order | Token order must not be changed by project teams. |
| NAM-006 | Three-digit instance | Instance must be numeric and exactly three digits. |
| NAM-007 | No personal names | Do not include individual names, initials, or employee IDs in resource names. Use owner tags instead. |
| NAM-008 | No secrets | Do not include secrets, ticket numbers with sensitive context, customer identifiers, PHI, or PCI data in names. |

Baseline validation regex for hyphenated names:

```regex
^[a-z0-9]+(-[a-z0-9]+)*-[0-9]{3}$
```

### 4.5 No-Hyphen Exception Rule

Some services prohibit hyphens or require global uniqueness. For those resources, remove hyphens but preserve token order.

| Standard Name | Flattened Exception Name |
|---|---|
| `acme-claims-prod-use1-st-001` | `acmeclaimsproduse1st001` |
| `acme-billing-nonprod-euw1-kv-001` | `acmebillingnonprodeuw1kv001` |

The flattened name must still use lowercase letters and numbers only.

### 4.6 Provider-Specific Naming Constraints

| Provider | Key Constraints | Policy Adaptation |
|---|---|---|
| Azure | Constraints vary by service. Windows VM computer names have 15-character limits. Storage accounts require lowercase letters and numbers only. Key Vault names are globally unique and allow hyphens. | Use lowercase kebab-case by default. Use flattened names for storage accounts. Keep VM host names short enough for Windows workloads. |
| AWS | Constraints vary by service. S3 bucket names are globally unique and DNS-style. Tag keys are case-sensitive. Some services support names separately from ARN identifiers. | Use lowercase kebab-case. For S3, use globally unique names and avoid dots unless explicitly required. Use tags for metadata beyond service name limits. |
| GCP | Resource names and labels are generally lowercase, numeric, and hyphen constrained. Labels do not support colon in keys. | Use lowercase kebab-case for names. Translate canonical `acme:` tag keys into GCP-compatible label keys. |

### 4.7 Multi-Cloud Region Mapping

| Geographic Region | Azure Region | AWS Region | GCP Region | Standard Short Code |
|---|---|---|---|---|
| US East | `eastus` | `us-east-1` | `us-east4` | `use1` |
| US East 2 | `eastus2` | `us-east-2` | `us-east1` | `use2` |
| US West | `westus2` | `us-west-2` | `us-west1` | `usw2` |
| US Central | `centralus` | `us-east-1` or approved central equivalent | `us-central1` | `usc1` |
| Europe West | `westeurope` | `eu-west-1` | `europe-west1` | `euw1` |
| Europe North | `northeurope` | `eu-north-1` | `europe-north1` | `eun1` |
| India Central / South Asia | `centralindia` or `indiacentral` where used internally | `ap-south-1` | `asia-south1` | `inc1` |
| Southeast Asia | `southeastasia` | `ap-southeast-1` | `asia-southeast1` | `sea1` |

### 4.8 Resource Type Prefix Matrix

| Category | Resource Component Type | Standard Prefix | Azure Example | AWS Example | GCP Example | Constraint Notes |
|---|---|---|---|---|---|---|
| Management | Resource group / account grouping | `rg` | Resource Group | Account/OU naming context | Project/folder naming context | Supports hyphens in Azure resource groups. |
| Compute | Virtual machine / instance | `vm` | Virtual Machine | EC2 Instance | Compute Engine VM | Windows host names may require shortened values. |
| Compute | Web app / app runtime | `app` | App Service | Elastic Beanstalk / App Runner | Cloud Run | Global names may require uniqueness. |
| Compute | Function / serverless | `func` | Function App | Lambda | Cloud Functions | Keep names short and workload specific. |
| Containers | Managed Kubernetes | `k8s` | AKS | EKS | GKE | Cluster names support hyphenated patterns. |
| Containers | Container registry | `cr` | Azure Container Registry | ECR | Artifact Registry | Some registry names are alphanumeric only. |
| Storage | General object/blob storage | `st` | Storage Account | S3 Bucket | Cloud Storage Bucket | Use flattened names where required. |
| Storage | Managed disk / block volume | `disk` | Managed Disk | EBS Volume | Persistent Disk | Supports hyphens. |
| Storage | File share | `file` | Azure Files | EFS | Filestore | Use lowercase where supported. |
| Database | Relational database | `sql` | Azure SQL | RDS / Aurora | Cloud SQL | Production databases require manual remediation review. |
| Database | NoSQL database | `nosql` | Cosmos DB | DynamoDB | Firestore / Bigtable | Some account names may be globally unique. |
| Networking | Virtual network | `vnet` | VNet | VPC | VPC Network | Root networks are high-risk remediation targets. |
| Networking | Network security rules | `nsg` | Network Security Group | Security Group / NACL | Firewall Policy | Supports security audit mapping. |
| Networking | Load balancer | `lb` | Load Balancer | ELB / NLB | Cloud Load Balancing | Include app context in project token. |
| Networking | Application gateway / L7 ingress | `agw` | Application Gateway | ALB | External HTTP(S) LB | Supports hyphens. |
| Networking | Private endpoint/link | `pe` | Private Endpoint | PrivateLink Endpoint | Private Service Connect | Use workload-specific naming. |
| Security | Key vault / KMS / secrets | `kv` | Key Vault | KMS / Secrets Manager | Secret Manager / Cloud KMS | Global or regional constraints apply. |
| Security | Firewall appliance | `fw` | Azure Firewall | Network Firewall | Cloud Firewall | High-risk for automated remediation. |
| Security | Palo Alto NVA | `pan` | VM-Series NVA | VM-Series NVA | VM-Series NVA | Appliance node limits may apply. |
| Security | Fortinet NVA | `fnt` | FortiGate NVA | FortiGate NVA | FortiGate NVA | Appliance node limits may apply. |
| Identity | Managed identity / IAM role | `iam` | Managed Identity | IAM Role | Service Account | High-risk for automated remediation. |
| Monitoring | Log workspace / logging sink | `log` | Log Analytics Workspace | CloudWatch Log Group | Cloud Logging Sink | Required for compliance reporting. |
| Backup | Backup vault / policy | `bkp` | Recovery Services Vault | AWS Backup Vault | Backup and DR | Used for recovery controls. |

---

## 5. Tagging and Labeling Strategy

### 5.1 Tagging Principles

| Principle | Requirement |
|---|---|
| Mandatory metadata | Every resource must carry the mandatory metadata set unless the provider does not support tags or labels. |
| Inheritance first | Resource groups, AWS accounts, GCP folders/projects, and IaC modules must define baseline metadata that child resources inherit where supported. |
| Lowercase and structured values | Tag values must use approved lowercase values, except email addresses and dates. |
| Provider-safe keys | Canonical tags may use `acme:` notation, but GCP label keys must use a translated key without colon. |
| No sensitive data | Tags and labels must not include secrets, PHI, PCI data, or customer-identifying values. |
| Automation compatible | Keys and values must be suitable for policy engines, billing tools, dashboards, and scripts. |

### 5.2 Canonical Tags and Provider Key Mapping

| Canonical Metadata | Azure Tag Key | AWS Tag Key | GCP Label Key | Required | Description |
|---|---|---|---|---:|---|
| Cost center | `acme:cost-center` | `acme:cost-center` | `acme-cost-center` | Yes | Approved financial cost allocation code. |
| Environment | `acme:environment` | `acme:environment` | `acme-environment` | Yes | Lifecycle tier. |
| Owner | `acme:owner` | `acme:owner` | `acme-owner` | Yes | Responsible team mailbox or service owner. |
| Project / workload | `acme:project` | `acme:project` | `acme-project` | Yes | Business application, platform capability, or service boundary. |
| Business criticality | `acme:business-criticality` | `acme:business-criticality` | `acme-business-criticality` | Yes | Recovery and incident priority tier. |
| Data classification | `acme:data-classification` | `acme:data-classification` | `acme-data-classification` | Conditional | Required for systems handling regulated or sensitive data. |
| Compliance scope | `acme:compliance-scope` | `acme:compliance-scope` | `acme-compliance-scope` | Conditional | Required for SOC 2, HIPAA, PCI, or other audited workloads. |
| Backup schedule | `acme:backup-schedule` | `acme:backup-schedule` | `acme-backup-schedule` | Conditional | Required where backup policy applies. |
| End date | `acme:end-date` | `acme:end-date` | `acme-end-date` | Conditional | Required for sandbox and temporary resources. |
| Documentation group | `acme:documentation-group` | `acme:documentation-group` | `acme-documentation-group` | Optional | Groups resources for diagrams and discovery tools. |
| Governance exception | `acme:governance-exception` | `acme:governance-exception` | `acme-governance-exception` | Conditional | Required only for approved exceptions. |

### 5.3 Mandatory Tag Values

| Tag | Approved Values / Format |
|---|---|
| `cost-center` | Approved corporate ledger code, such as `fin-401`, `eng-102`, `ops-210`. |
| `environment` | `production`, `non-production`, `development`, `shared`, `sandbox`. |
| `owner` | Team distribution list or approved service ownership email, such as `cloud-ops@company.com`. |
| `project` | Lowercase kebab-case workload name, such as `customer-portal`, `claims-engine`. |
| `business-criticality` | `mission-critical`, `high`, `medium`, `low`. |
| `data-classification` | `public`, `internal`, `confidential`, `restricted-phi`, `restricted-pci`. |
| `compliance-scope` | `soc2`, `hipaa`, `pci-cde`, `soc2-hipaa`, `soc2-pci`, `none`. |
| `backup-schedule` | `daily-30dayret`, `weekly`, `monthly`, `none`. |
| `end-date` | ISO 8601 date in `yyyy-mm-dd` format. |

### 5.4 Tagging Rules

| Rule ID | Rule | Requirement |
|---|---|---|
| TAG-001 | Mandatory tags | Mandatory tags must exist on all taggable resources. |
| TAG-002 | Canonical mapping | Use provider-specific key mapping from section 5.2. |
| TAG-003 | Values | Values must come from approved enumerations where enumerations exist. |
| TAG-004 | GCP labels | GCP labels must not use colon characters. Use translated `acme-*` keys. |
| TAG-005 | Emails | Owner values may include `@` and `.` where provider rules allow them. If not allowed, use an approved owner alias. |
| TAG-006 | Case | Keys and values must be lowercase where supported. |
| TAG-007 | Inheritance | Child resources should inherit tags from parent containers where the cloud provider supports it. |
| TAG-008 | No sensitive values | Do not store secrets, PHI, PCI data, personal data, or customer identifiers in tags or labels. |

---

## 6. Implementation and Enforcement Model

### 6.1 Defense-in-Depth Enforcement Layers

| Layer | Enforcement Point | Purpose |
|---|---|---|
| 1 | Naming and tagging design standard | Defines the rules humans and automation must follow. |
| 2 | IaC modules and variable validation | Prevents bad names and missing tags before plan/apply. |
| 3 | CI/CD validation | Blocks non-compliant pull requests before merge. |
| 4 | Native cloud policy | Audits, denies, or modifies resources at cloud API boundary. |
| 5 | Runtime inventory scanning | Finds drift, manual changes, and legacy gaps. |
| 6 | Dashboards and alerts | Routes compliance debt to owners and leadership. |

### 6.2 Rollout Modes

| Mode | Effect | When To Use |
|---|---|---|
| Audit | Logs non-compliance but does not block deployment. | Brownfield discovery, pilot rollout, false-positive testing. |
| Modify | Adds or inherits missing metadata automatically. | Low-risk resources where tag inheritance is safe. |
| Deny | Blocks non-compliant deployment. | Greenfield resources after audit rules are validated. |
| Manual review | Creates ticket or alert for owner review. | High-risk resources, identity, networking, databases, DNS. |

---

## 7. Azure Enforcement

### 7.1 Azure Policy - Audit Missing Mandatory Tags

Use this during the soft-launch phase to find non-compliant resources without blocking deployments.

```json
{
  "properties": {
    "displayName": "Audit resources missing mandatory governance tags",
    "policyType": "Custom",
    "mode": "Indexed",
    "description": "Audits resources that are missing required enterprise governance tags.",
    "parameters": {},
    "policyRule": {
      "if": {
        "anyOf": [
          { "field": "tags['acme:cost-center']", "exists": false },
          { "field": "tags['acme:environment']", "exists": false },
          { "field": "tags['acme:owner']", "exists": false },
          { "field": "tags['acme:project']", "exists": false },
          { "field": "tags['acme:business-criticality']", "exists": false }
        ]
      },
      "then": {
        "effect": "audit"
      }
    }
  }
}
```

### 7.2 Azure Policy - Deny Missing Mandatory Tags

Use this for greenfield enforcement after audit results have been validated.

```json
{
  "properties": {
    "displayName": "Deny resources missing mandatory governance tags",
    "policyType": "Custom",
    "mode": "Indexed",
    "description": "Denies resources that are missing required enterprise governance tags.",
    "parameters": {},
    "policyRule": {
      "if": {
        "anyOf": [
          { "field": "tags['acme:cost-center']", "exists": false },
          { "field": "tags['acme:environment']", "exists": false },
          { "field": "tags['acme:owner']", "exists": false },
          { "field": "tags['acme:project']", "exists": false },
          { "field": "tags['acme:business-criticality']", "exists": false }
        ]
      },
      "then": {
        "effect": "deny"
      }
    }
  }
}
```

### 7.3 Azure Policy - Inherit Tag From Resource Group

Use modify policies for low-risk tag inheritance. Assign a managed identity to the policy assignment with permissions to update tags.

```json
{
  "properties": {
    "displayName": "Inherit acme cost center tag from resource group",
    "policyType": "Custom",
    "mode": "Indexed",
    "description": "Adds acme:cost-center from the parent resource group when missing on a child resource.",
    "policyRule": {
      "if": {
        "allOf": [
          { "field": "tags['acme:cost-center']", "exists": false },
          { "value": "[resourceGroup().tags['acme:cost-center']]", "notEquals": "" }
        ]
      },
      "then": {
        "effect": "modify",
        "details": {
          "roleDefinitionIds": [
            "/providers/Microsoft.Authorization/roleDefinitions/4a9ae827-6dc8-4573-8ac7-8239d42aa03f"
          ],
          "operations": [
            {
              "operation": "add",
              "field": "tags['acme:cost-center']",
              "value": "[resourceGroup().tags['acme:cost-center']]"
            }
          ]
        }
      }
    }
  }
}
```

### 7.4 Azure Assignment Strategy

| Scope | Mode | Purpose |
|---|---|---|
| Management group | Audit | Baseline discovery across all subscriptions. |
| Landing zone subscriptions | Deny | Prevent new non-compliant resources. |
| Legacy subscriptions | Audit then Modify | Detect and safely remediate brownfield resources. |
| Sandbox subscriptions | Deny plus end-date tag | Prevent unmanaged temporary resources. |

---

## 8. AWS Enforcement

### 8.1 AWS Audit Mode

Use AWS Config managed rules or conformance packs first. The `required-tags` rule can report resources missing mandatory tags without denying deployments.

Audit outputs should be sent to Security Hub and the central dashboard.

### 8.2 AWS Deny Enforcement Example

Use Service Control Policies or IAM policies after audit results are validated. The following example denies EC2 instance creation when mandatory request tags are missing.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyRunInstancesWithoutMandatoryTags",
      "Effect": "Deny",
      "Action": "ec2:RunInstances",
      "Resource": "*",
      "Condition": {
        "Null": {
          "aws:RequestTag/acme:cost-center": "true",
          "aws:RequestTag/acme:environment": "true",
          "aws:RequestTag/acme:owner": "true",
          "aws:RequestTag/acme:project": "true"
        }
      }
    }
  ]
}
```

### 8.3 AWS Tag Policy Example

AWS Organizations tag policies should standardize allowed values and casing.

```json
{
  "tags": {
    "acme:environment": {
      "tag_key": {
        "@@assign": "acme:environment"
      },
      "tag_value": {
        "@@assign": [
          "production",
          "non-production",
          "development",
          "shared",
          "sandbox"
        ]
      },
      "enforced_for": {
        "@@assign": [
          "ec2:instance",
          "s3:bucket"
        ]
      }
    }
  }
}
```

---

## 9. GCP Enforcement

### 9.1 GCP Label Key Translation

Because GCP labels do not support colon notation, the enterprise canonical tag `acme:cost-center` must be implemented as `acme-cost-center` in GCP.

### 9.2 GCP Audit Mode

Use Cloud Asset Inventory exports, Config Validator, Policy Controller, or scheduled queries to detect missing labels.

Example inventory logic:

```bash
gcloud asset search-all-resources \
  --scope="organizations/ORG_ID" \
  --query="NOT labels.acme-environment:*" \
  --format="csv(name,assetType,project,location)"
```

### 9.3 GCP IaC Enforcement

Where GCP Organization Policy does not provide a direct mandatory-label control for a specific service, enforce labels through Terraform modules, CI/CD checks, and Config Validator policies.

---

## 10. Infrastructure as Code Implementation

### 10.1 Terraform / OpenTofu Naming and Tag Validation

```hcl
variable "company" {
  type = string
  validation {
    condition     = can(regex("^[a-z0-9]+$", var.company))
    error_message = "company must contain lowercase letters and numbers only."
  }
}

variable "project" {
  type = string
  validation {
    condition     = can(regex("^[a-z0-9]+(-[a-z0-9]+)*$", var.project))
    error_message = "project must be lowercase kebab-case."
  }
}

variable "environment" {
  type = string
  validation {
    condition     = contains(["prod", "nonprod", "dev", "shrd", "sbx"], var.environment)
    error_message = "environment must be one of prod, nonprod, dev, shrd, sbx."
  }
}

variable "region_code" {
  type = string
  validation {
    condition     = can(regex("^[a-z]{2,3}[0-9]$", var.region_code))
    error_message = "region_code must use the approved short-code format, such as use1 or euw1."
  }
}

variable "resource_type" {
  type = string
  validation {
    condition     = can(regex("^[a-z0-9]+$", var.resource_type))
    error_message = "resource_type must be lowercase alphanumeric."
  }
}

variable "instance" {
  type = string
  validation {
    condition     = can(regex("^[0-9]{3}$", var.instance))
    error_message = "instance must be a three-digit number, such as 001."
  }
}

locals {
  resource_name = "${var.company}-${var.project}-${var.environment}-${var.region_code}-${var.resource_type}-${var.instance}"
  flattened_name = replace(local.resource_name, "-", "")

  mandatory_tags = {
    "acme:cost-center"          = var.cost_center
    "acme:environment"          = var.environment_name
    "acme:owner"                = var.owner
    "acme:project"              = var.project
    "acme:business-criticality" = var.business_criticality
  }
}
```

### 10.2 Terraform AWS Default Tags

```hcl
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = local.mandatory_tags
  }
}
```

### 10.3 Terraform GCP Label Translation

```hcl
locals {
  gcp_labels = {
    "acme-cost-center"          = var.cost_center
    "acme-environment"          = var.environment_name
    "acme-owner"                = replace(var.owner, "@", "-at-")
    "acme-project"              = var.project
    "acme-business-criticality" = var.business_criticality
  }
}
```

### 10.4 Bicep Baseline

```bicep
param company string = 'acme'
param project string = 'custportal'
param environment string = 'prod'
param regionCode string = 'use1'
param resourceType string = 'kv'
param instance string = '001'

var namePrefix = '${company}-${project}-${environment}-${regionCode}-${resourceType}-${instance}'

var mandatoryTags = {
  'acme:cost-center': 'fin-990'
  'acme:environment': 'production'
  'acme:owner': 'cloud-ops@company.com'
  'acme:project': project
  'acme:business-criticality': 'high'
  'acme:compliance-scope': 'soc2-hipaa'
}

resource kv 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: namePrefix
  location: resourceGroup().location
  tags: mandatoryTags
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: []
  }
}
```

### 10.5 Pulumi CrossGuard - Python

```python
from pulumi_policy import PolicyPack, ResourceValidationArgs, ResourceValidationPolicy

MANDATORY_TAGS = [
    "acme:cost-center",
    "acme:environment",
    "acme:owner",
    "acme:project",
    "acme:business-criticality",
]

def validate_mandatory_tags(args: ResourceValidationArgs, report_violation):
    tags = args.props.get("tags") or args.props.get("labels") or {}
    missing = [tag for tag in MANDATORY_TAGS if tag not in tags]
    if missing:
        report_violation(f"Missing mandatory governance metadata: {', '.join(missing)}")

PolicyPack(
    name="enterprise-cloud-governance",
    policies=[
        ResourceValidationPolicy(
            name="mandatory-tags",
            description="Validates that cloud resources include mandatory governance tags.",
            validate=validate_mandatory_tags,
        )
    ],
)
```

### 10.6 Pulumi CrossGuard - C#

```csharp
using Pulumi.Policy;

class GovernancePolicy
{
    static readonly string[] MandatoryTags =
    {
        "acme:cost-center",
        "acme:environment",
        "acme:owner",
        "acme:project",
        "acme:business-criticality"
    };

    static void Main()
    {
        new PolicyPack("enterprise-cloud-governance", new PolicyPackArgs
        {
            Policies =
            {
                new ResourceValidationPolicy(
                    "mandatory-tags",
                    "Validates mandatory governance tags.",
                    args =>
                    {
                        if (!args.Properties.TryGetValue("tags", out var tagsValue))
                        {
                            args.ReportViolation("Missing tags object with mandatory governance tags.");
                            return;
                        }

                        var tagsText = tagsValue?.ToString() ?? string.Empty;
                        foreach (var tag in MandatoryTags)
                        {
                            if (!tagsText.Contains(tag))
                            {
                                args.ReportViolation($"Missing mandatory governance tag: {tag}");
                            }
                        }
                    })
            }
        });
    }
}
```

### 10.7 Docker Compose Labels

```yaml
services:
  customer-portal-api:
    image: acme/customer-portal-api:latest
    container_name: acme-custportal-dev-local-app-001
    labels:
      acme.project: customer-portal
      acme.environment: development
      acme.owner: platform-team
      acme.cost-center: eng-102
      acme.business-criticality: low
```

---

## 11. CI/CD Shift-Left Validation

### 11.1 GitHub Actions Naming and Tag Linter

```yaml
name: IaC Governance Validation

on:
  pull_request:
    branches:
      - main

jobs:
  validate-governance:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Check for uppercase resource names in Terraform files
        run: |
          if grep -rE 'name\s*=\s*"[^"]*[A-Z]+[^"]*"' --include='*.tf' .; then
            echo "ERROR: Resource names must be lowercase."
            exit 1
          fi

      - name: Check mandatory tag keys in Terraform files
        run: |
          for tag in "acme:cost-center" "acme:environment" "acme:owner" "acme:project" "acme:business-criticality"; do
            if ! grep -r "$tag" --include='*.tf' .; then
              echo "ERROR: Missing mandatory tag key in Terraform code: $tag"
              exit 1
            fi
          done
```

---

## 12. Brownfield Discovery and Audit

### 12.1 Azure Audit Script

```powershell
$ReportOutput = @()
$MandatoryTags = @(
    "acme:cost-center",
    "acme:environment",
    "acme:owner",
    "acme:project",
    "acme:business-criticality"
)

$Subscriptions = Get-AzSubscription

foreach ($Sub in $Subscriptions) {
    Set-AzContext -SubscriptionId $Sub.Id | Out-Null
    $Resources = Get-AzResource

    foreach ($Resource in $Resources) {
        $TagIssues = @()
        $NamingIssue = $false

        foreach ($TagKey in $MandatoryTags) {
            if (-not $Resource.Tags -or -not $Resource.Tags.ContainsKey($TagKey)) {
                $TagIssues += $TagKey
            }
        }

        if ($Resource.Name -notmatch '^[a-z0-9]+(-[a-z0-9]+)*$') {
            if ($Resource.ResourceType -notmatch "Microsoft.Storage") {
                $NamingIssue = $true
            }
        }

        if ($TagIssues.Count -gt 0 -or $NamingIssue) {
            $ReportOutput += [PSCustomObject]@{
                SubscriptionName = $Sub.Name
                ResourceName     = $Resource.Name
                ResourceType     = $Resource.ResourceType
                ResourceGroup    = $Resource.ResourceGroupName
                MissingTags      = ($TagIssues -join ", ")
                NamingViolation  = $NamingIssue
            }
        }
    }
}

$ReportOutput | Export-Csv -Path "./CloudGovernanceAuditIssues.csv" -NoTypeInformation
```

### 12.2 Compliance Report Severity

| Severity | Condition | Action |
|---|---|---|
| Severity 1 | Missing owner, environment, or cost center on production resource | Immediate owner assignment and remediation ticket. |
| Severity 2 | Missing compliance-scope or data-classification on regulated workload | Security review within 10 business days. |
| Severity 3 | Naming violation with tags present | Correct on next change window or document exception. |
| Severity 4 | Optional tag missing | Backlog cleanup or module improvement. |

---

## 13. Remediation Strategy

### 13.1 Low-Risk Auto-Tagging

Low-risk resources may be remediated automatically when the source of truth is clear.

| Resource Type | Auto-Tagging Allowed | Source of Truth |
|---|---:|---|
| Azure child resources under tagged resource group | Yes | Parent resource group tags. |
| AWS EC2 instances with tagged Auto Scaling Group | Yes | Auto Scaling Group or account baseline. |
| Network interfaces attached to tagged compute | Yes | Parent compute resource. |
| Managed disks attached to tagged VM | Yes | Parent VM or resource group. |
| Storage accounts / S3 buckets | Conditional | Application owner confirmation or account baseline. |

### 13.2 High-Risk Flag-and-Report

High-risk resources must not be auto-remediated without manual review.

| Resource Type | Reason For Manual Review |
|---|---|
| Production SQL / NoSQL databases | Metadata may drive backup, retention, access, or compliance automation. |
| IAM roles, policies, service accounts, managed identities | Metadata may affect ABAC, permissions, or security automation. |
| Root VNets, VPCs, subnets, firewalls, DNS zones | Incorrect metadata may affect network isolation and incident routing. |
| Key vaults, KMS keys, secrets services | Incorrect classification may affect access control and audit scope. |
| PCI or PHI workloads | Regulatory classification must be validated by security and compliance teams. |

### 13.3 Exception Process

When a resource cannot comply due to provider limitations, vendor constraints, or legacy application dependencies, the owner must follow this process:

1. Submit a governance exception request in the enterprise tracking system.
2. Provide resource ID, business owner, technical owner, reason, risk, expiry date, and compensating controls.
3. Cloud Architecture reviews the technical constraint.
4. Security reviews the risk.
5. FinOps reviews cost allocation impact.
6. Approved exceptions must receive the governance-exception metadata key and an expiry date.
7. Expired exceptions are treated as non-compliant.

---

## 14. Monitoring, Reporting, and Alerting

### 14.1 Required Integrations

| Platform | Signal Source | Destination |
|---|---|---|
| Azure | Azure Policy compliance, Activity Log, Resource Graph | Azure Monitor, Log Analytics, Datadog |
| AWS | AWS Config, Security Hub, CloudTrail, Resource Groups Tagging API | Security Hub, EventBridge, Datadog |
| GCP | Cloud Asset Inventory, Cloud Logging, Config Validator outputs | Cloud Monitoring, Pub/Sub, Datadog |

### 14.2 Required Dashboards

| Dashboard | Required Metrics |
|---|---|
| Executive compliance | Overall compliance percentage, production compliance, high-risk open items. |
| FinOps | Untagged spend, spend by project, spend by cost center, spend by owner. |
| Security | Missing compliance-scope, missing data-classification, regulated workload drift. |
| Platform engineering | Violations by IaC module, pull request failures, policy deny counts. |

### 14.3 Alert Routing

| Condition | Routing |
|---|---|
| Production resource missing owner or cost center | Page or high-priority ticket to workload owner and platform team. |
| PCI or PHI resource missing compliance metadata | Security incident queue and compliance owner. |
| Repeated CI/CD naming failures | DevOps team and repository owner. |
| Exception expiring within 14 days | Resource owner and governance review board. |

---

## 15. Implementation Roadmap

| Phase | Duration | Activity | Exit Criteria |
|---|---|---|---|
| 1. Prepare | Weeks 1-2 | Approve taxonomy, owners, cost centers, region map, resource prefix matrix. | Policy approved and source-of-truth lists published. |
| 2. Discover | Weeks 2-4 | Run inventory scans and native audit policies. | Compliance gap report created for all providers. |
| 3. Socialize | Weeks 4-6 | Distribute findings to owners and create remediation backlog. | Owners assigned for all Severity 1 and 2 items. |
| 4. Soft launch | Weeks 6-8 | Enable audit mode and CI/CD warnings. | False positives reviewed and policy logic corrected. |
| 5. Remediate | Weeks 8-12 | Auto-tag low-risk resources and manually review high-risk resources. | Production compliance reaches at least 95 percent. |
| 6. Enforce | Week 12 onward | Enable deny mode for greenfield deployments. | Non-compliant deployments are blocked. |
| 7. Maintain | Ongoing | Weekly drift detection, monthly reporting, quarterly review. | Compliance remains above target threshold. |

---

## 16. Roles and Responsibilities

| Role | Responsibilities |
|---|---|
| Cloud Governance Team | Owns this policy, policy definitions, compliance scorecards, and exception process. |
| Platform Engineering | Implements IaC modules, CI/CD checks, and remediation automation. |
| Security Team | Reviews regulated workloads, ABAC implications, and high-risk exceptions. |
| FinOps Team | Owns cost-center taxonomy and validates chargeback reporting. |
| Application Owner | Ensures workload resources have correct project, owner, and environment metadata. |
| DevOps Team | Applies naming and tagging standards in deployment pipelines. |

---

## 17. Acceptance Criteria

| ID | Acceptance Criteria |
|---|---|
| AC-001 | A new Azure resource without mandatory tags is denied in greenfield subscriptions. |
| AC-002 | A new AWS EC2 instance without mandatory request tags is denied after enforcement mode is enabled. |
| AC-003 | GCP resources are reported as non-compliant when mandatory labels are missing. |
| AC-004 | Terraform modules generate compliant names and mandatory tags by default. |
| AC-005 | CI/CD validation fails pull requests that introduce uppercase resource names or omit mandatory tags. |
| AC-006 | Brownfield audit reports identify missing tags and naming violations without downtime. |
| AC-007 | Low-risk auto-tagging does not restart, delete, recreate, or interrupt resources. |
| AC-008 | High-risk resources create manual review tickets instead of automated changes. |
| AC-009 | Monthly billing reports show less than 1 percent unallocated cloud spend. |
| AC-010 | Compliance dashboards show production compliance at or above 95 percent. |

---

## 18. Review Cadence

This policy must be reviewed quarterly by Cloud Governance, Security, FinOps, and Platform Engineering. Updates are required when cloud provider naming constraints change, new resource types are adopted, regulatory scope changes, or enforcement creates material false positives.
