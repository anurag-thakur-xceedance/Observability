# Enterprise Cloud Resource Naming and Tagging Policy

| Metadata Field | Document Specification |
|---|---|
| Document Title | Multi-Cloud Resource Naming, Tagging, and Governance Policy |
| Document Version | Version 3.0 (Consolidated Multi-Cloud Baseline) |
| Effective Date | June 10, 2026 |
| Target Audience | Cloud Engineers, DevOps Teams, IT Administrators, Solution Architects |
| Security Classification | Internal Corporate - Confidential / Restricted |

---

## 1. Introduction & Scope

### 1.1 Purpose
This document establishes the official governance framework for naming and tagging cloud infrastructure resources across all corporate public cloud environments (Microsoft Azure, AWS, and GCP). Consistent resource identification is required to maintain structural clarity, precise cost-allocation modeling, operational efficiency, and rapid incident remediation.

### 1.2 Regulatory Compliance Mapping
As an insurance-technology entity handling Sensitive Personal Information (SPI), Protected Health Information (PHI), and financial transactions, this policy maps directly to specific regulatory requirements:
*   **SOC 2 Type II (CC6.1, CC6.2, CC7.1):** Enforces access boundaries via Attribute-Based Access Control (ABAC) tags.
*   **HIPAA Security Rule (45 CFR § 164.310):** Restricts and monitors infrastructure storing or processing health data records.
*   **PCI-DSS v4.0 (Req 1.2, 3.1):** Mandates cardholder data environment (CDE) isolation maps.

---

## 2. Universal Naming Framework

### 2.1 Standardized Syntax Structure
Every resource must follow the **kebab-case** construction sequence:

`[company]-[project]-[environment]-[region]-[resource-type]-[instance]`

*   **Standard Formula:** `acme-custportal-prod-use1-vm-001`
*   **No-Hyphen Exception:** For resources prohibiting symbols (e.g., Azure Storage, AWS S3), remove hyphens but maintain the token sequence: `acmecustportalproduse1vm001`.

### 2.2 Provider-Specific Constraints Mapping

| Platform | Constraints | Adaptation Strategy |
| :--- | :--- | :--- |
| **Azure** | Case-insensitive; 1-15 char limit for Windows VMs. | Use lowercase. Truncate workload names for Windows VM compliance. |
| **AWS** | Case-sensitive; character limits vary by service. | Enforce lowercase to prevent cross-cloud configuration drift. |
| **GCP** | Strict lowercase and hyphens only; 63 character limit. | Align core policy to GCP's strictness as the "lowest common denominator." |

### 2.3 Multi-Cloud Region Mapping Table

| Geographic Region | Azure Region | AWS Region | GCP Region | Standard Short-Code |
| :--- | :--- | :--- | :--- | :--- |
| **US East** | `eastus` | `us-east-1` | `us-east4` | **use1** |
| **US West** | `westus2` | `us-west-2` | `us-west1` | **usw2** |
| **Europe West** | `westeurope` | `eu-west-1` | `europe-west1` | **euw1** |
| **Asia Pacific** | `indiacentral` | `ap-south-1` | `asia-south1` | **inc1** |

### 2.4 Technical Prefix Matrix (Cross-Cloud)

| Resource Category | Component Type | Prefix | Naming Rule & Constraints |
| :--- | :--- | :--- | :--- |
| **Management** | Resource Group | `rg` | Supports hyphens (Azure) |
| **Compute** | Virtual Machine / EC2 | `vm` | Max 15 chars for Windows OS |
| **Containers** | Kubernetes (AKS/EKS/GKE) | `k8s` | Supports hyphens |
| **Storage** | Storage Account / S3 | `st` | No hyphens / No symbols allowed |
| **Databases** | Relational SQL | `sql` | Supports hyphens |
| **Networking** | Virtual Network / VPC | `net` | Supports hyphens |
| **Security** | Key Vault / KMS | `kv` | Global name validation applies |

---

## 3. Tagging & Labeling Strategy

### 3.1 Construction Rules
*   **Namespacing:** Prefix custom corporate tags with `acme:` (e.g., `acme:cost-center`).
*   **Casing:** Always apply lowercase alphanumeric strings. No spaces or special symbols.
*   **Mappings:** Azure Tags = AWS Tags = GCP Labels.

### 3.2 Mandatory Tags
| Key | Description | Values |
| :--- | :--- | :--- |
| `acme:cost-center` | Financial ledger identifier | `fin-401`, `eng-102` |
| `acme:environment` | Lifecycle tier | `production`, `non-production`, `development`, `shared` |
| `acme:owner` | Point of contact email | `devops-admin@acme.com` |
| `acme:project` | Functional workload name | `sap-erp`, `customer-portal` |
| `acme:business-criticality` | Disaster recovery tier | `mission-critical`, `high`, `medium`, `low` |

### 3.3 Regulatory Scope Extensions
*   **`acme:data-classification`:** `public`, `internal`, `confidential`, `restricted-phi` (Triggers HIPAA controls).
*   **`acme:compliance-scope`:** `soc2-hipaa`, `pci-cde`, `none`.

---

## 4. Programmatic Enforcement & Implementation

To ensure compliance across all cloud environments, enforcement is handled via the following mechanisms:

### 4.1 Azure: Native Azure Policy
*   **Mode:** `Deny` (for new resources), `Modify` (for inheriting tags), `Audit` (for monitoring legacy drift).
*   **Enforcement Scope:** All Management Groups and Subscriptions.
*   **Policy Definition (Sample):**
```json
{
  "if": {
    "allof": [
      { "field": "tags['acme:cost-center']", "exists": "false" }
    ]
  },
  "then": { "action": "deny" }
}
```

### 4.2 AWS: Service Control Policies (SCPs) & Tag Policies
*   **Tag Policies:** Enforce case-sensitivity and allowed values across all AWS accounts in the Organization.
*   **IAM Policies:** Explicitly deny `ec2:RunInstances` or `s3:CreateBucket` if specific tag keys are not provided in the request context using `aws:RequestTag` conditions.

### 4.3 GCP: Organization Policy Service
*   **Resource Labels:** Use `Constraint: resourceUsageRestriction` to limit deployments to specific labeled resource types.
*   **Labels Enforcement:** Required via Deployment Manager or Terraform provider-level label blocks.

### 4.4 Terraform / OpenTofu (Shift-Left)
Apply this baseline to the provider configuration to enforce tags globally:
```hcl
provider "aws" {
  default_tags {
    tags = {
      "acme:environment" = var.environment
      "acme:owner"       = var.owner
      "acme:cost-center" = var.cost_center
    }
  }
}

# Variable validation for naming compliance
variable "resource_name" {
  type = string
  validation {
    condition     = can(regex("^[a-z0-9]+(-[a-z0-9]+)*$", var.resource_name))
    error_message = "Resource name must be lowercase kebab-case."
  }
}
```

### 4.5 Pulumi Policy-as-Code (Crossguard)
**Python:**
```python
def validate_tags(args, report_violation):
    if "acme:environment" not in args.props.get("tags", {}):
        report_violation("Resources must have an 'acme:environment' tag.")
```

**C#:**
```csharp
if (!args.Properties.ContainsKey("tags") || !args.Properties["tags"].Contains("acme:environment"))
    args.ReportViolation("Missing mandatory tag: acme:environment");
```

### 4.3 Azure Policy (Deny Action)
```json
{
  "if": {
    "allof": [
      { "field": "tags['acme:cost-center']", "exists": "false" }
    ]
  },
  "then": { "action": "deny" }
}
```

---

## 5. Remediation & Operational Governance

### 5.1 Remediation Strategy

| Risk Level | Resource Category | Method |
| :--- | :--- | :--- |
| **Low-Risk** | Stateless (VMs, S3 Buckets, NICs) | **Automated Auto-Tagging:** Trigger Azure Policy Remediation or AWS SSM Automation to copy tags from parent containers. |
| **High-Risk** | Stateful (SQL DBs, IAM Roles, VPCs) | **Flag-and-Report:** Route alerts to Azure Monitor/Security Hub for manual review to avoid service disruption. |

### 5.2 Implementation Roadmap
*   **Phase 1 (Month 1):** Publish guidelines to internal wiki.
*   **Phase 2 (Month 2):** Deploy Audit Mode policies to detect non-compliant legacy resources.
*   **Phase 3 (Month 3):** Enable Deny Action for new deployments; execute remediation on legacy low-risk assets.
