## Cloud Resource Naming and Tagging Policy

| Metadata Field | Document Specification |
|---|---|
| Document Title | Enterprise Cloud Resource Naming, Tagging, and Governance Policy |
| Document Version | Version 2.0 (Consolidated Multi-Cloud Baseline) |
| Effective Date | June 9, 2026 (p. 1) |
| Target Audience | Cloud Engineers, DevOps Teams, IT Administrators, Solution Architects (p. 1) |
| Security Classification | Internal Corporate - Confidential / Restricted |


## 1. Executive Summary & Regulatory Alignment## 1.1 Purpose
This document establishes the official governance framework for naming and tagging cloud infrastructure resources across all corporate public cloud environments (Microsoft Azure, AWS, and GCP) (p. 1). Consistent resource identification is required to maintain structural clarity, precise cost-allocation modeling, operational efficiency, and rapid incident remediation (p. 1). Adherence to this policy is mandatory for all existing and newly deployed infrastructure (p. 1).
## 1.2 Regulatory Compliance Mapping
As an insurance-technology entity handling Sensitive Personal Information (SPI), Protected Health Information (PHI), and financial transactions, this policy maps directly to specific regulatory requirements:

* SOC 2 Type II (CC6.1, CC6.2, CC7.1): Enforces access boundaries via Attribute-Based Access Control (ABAC) tags and tracks asset patching windows.
* HIPAA Security Rule (45 CFR § 164.310): Restricts and monitors infrastructure storing or processing health data records.
* PCI-DSS v4.0 (Req 1.2, 3.1): Mandates cardholder data environment (CDE) isolation maps and automated network layout visualizations.


## 2. Universal Naming Framework
## 2.1 The Multi-Cloud Naming Formula
Every resource deployed within corporate subscription boundaries must explicitly conform to the following tokenized construction sequence (p. 1):

```{\{resource-type\}-\{workload/app\}-\{environment\}-\{region\}-\{instance\}}```

Example: vnet-custportal-prod-eastus-001 (pp. 1, 7)
## Core Architectural Syntax Rules:

   1. Case Standard: Use lowercase alphanumeric characters only (p. 1). Do not mix casing (p. 1). This prevents deployment failures caused by GCP’s lowercase enforcement and AWS/Azure case-sensitivity variations.
   2. Standard Delimiter: Separate components strictly with a single hyphen (-) (p. 1).
   3. No Hyphen Exception Rule: For specialized cloud resources that strictly prohibit hyphens or symbols in their API naming schemas (e.g., Azure Storage Accounts, Azure Key Vaults, AWS S3 Buckets, GCP Storage Buckets), eliminate the hyphens entirely but keep the sequence exact (p. 1):
   * Standard Format: vm-claims-prod-eastus-001
      * Flattened Exception Format: stclaimsprodeastus001 (p. 1)
   
## 2.2 Token Enum and Value Definitions

* {resource-type}: Standardized lower-case abbreviation for the cloud resource category (p. 1). See Section 2.3 for the complete matrix.
* {workload/app}: The short name of the specific application, project, or microservice boundary (e.g., custportal, claims, billing, underwrite) (pp. 1, 7).
* {environment}: The development lifecycle tier, strictly mapped to these lowercase codes (pp. 1-2):
* prod : Customer-facing, high-availability production environments (p. 2).
   * nonprod : Testing, staging, and user-acceptance (UAT) environments (p. 2).
   * dev : Sandbox, development testing, and continuous integration environments (p. 2).
   * shrd : Centralized infrastructure shared services (e.g., Hub VNets, Shared Vaults) (p. 2).
* {region}: The exact cloud deployment geographic region code (p. 1). Mapped regional codes include (p. 4):
* Americas: eastus, westus, centralus (p. 4)
   * Europe: westeurope, northeurope (p. 4)
   * Asia Pacific: indiacentral, seasia (p. 4)
* {instance}: A sequential, three-digit integer ensuring uniqueness (e.g., 001, 002, 003) (p. 1).

## 2.3 Cross-Cloud Technical Prefix Matrix
Use these official prefixes across all multi-cloud deployments (p. 2):

| Resource Category | Resource Component Type | Approved Prefix | Naming Rule & Exception Constraints |
|---|---|---|---|
| Management | Resource Group | rg | Supports hyphens (p. 3) |
| Compute | Virtual Machine / EC2 | vm | Max 15 characters for Windows operating systems (p. 3) |
| Compute | App Service / Cloud Run | app | Global name validation constraints apply (p. 3) |
| Compute | Function App / Lambda | func | Global name validation constraints apply (p. 3) |
| Containers | Kubernetes Service (AKS/EKS/GKE) | aks | Supports hyphens (p. 3) |
| Containers | Container Registry | cr | Lowercase and numbers only |
| Storage | Managed OS / Data Disk | disk | Supports hyphens (p. 3) |
| Storage | Storage Account / S3 Bucket | stor | No hyphens / No symbols allowed (p. 3) |
| Storage | File Share / Managed SMB | file | Lowercase and hyphens only (p. 3) |
| Databases | Relational SQL (Azure SQL/RDS) | sql | Supports hyphens (p. 3) |
| Databases | NoSQL Data Store (Cosmos/Dynamo) | cosmos | No hyphens / No symbols allowed (p. 3) |
| Networking | Virtual Network / VPC Backbone | vnet | Supports hyphens (p. 3) |
| Networking | Network Security Group / Firewall | nsg | Supports hyphens (p. 3) |
| Networking | Application Gateway / Layer 7 LB | agw | Supports hyphens (p. 3) |
| Networking | Standard Load Balancer (L4 Engine) | lb | Supports hyphens (p. 3) |
| Networking | Private Link / Sync Endpoint | sync | Supports hyphens (p. 3) |
| Security Appliances | Azure Network Firewall | afw | Supports hyphens (p. 3) |
| Security Appliances | Palo Alto NVA Appliance | pan | Appliance cluster node naming limits apply (p. 3) |
| Security Appliances | Fortinet NVA Appliance | fnt | Appliance cluster node naming limits apply (p. 3) |
| Security Appliances | Key Vault / Secrets KMS Engine | kv | Global name validation constraints apply (p. 3) |


## 3. Resource Tagging Policy

## 3.1 Multi-Cloud Tag Construction Rules
Tags consist of case-blind or case-sensitive metadata key-value pairs assigned directly to resources, resource groups, and cloud environments (p. 4). To guarantee compliance across Azure, AWS, and GCP without API ingestion failures, the following baseline limits must be enforced:

* Casing: Always apply lowercase alphanumeric strings for both Tag Keys and Tag Values (overriding legacy PascalCase formats to ensure strict compatibility with GCP Labels and AWS case filters).
* Characters: No spaces, slashes, or special symbols are permitted in Key or Value strings (p. 4).
* Namespacing: Prefix all custom corporate tags with acme: (e.g., acme:cost-center) to separate corporate metadata from cloud-provider system tags.
* Limits: Keep key lengths under 63 characters and values under 63 characters (aligning with the lowest common platform denominator).

## 3.2 Metadata Classification Schema## Mandatory Tags
Every resource deployed must contain these five core keys (p. 4):

   1. acme:cost-center: The company internal ledger or financial cost tracking identifier (p. 4). Values must match approved corporate financial cost centers (e.g., fin-401, eng-102) (p. 4).
   2. acme:environment: The system state category matching the naming rule (p. 4). Values: production, non-production, development, shared (p. 4).
   3. acme:owner: The designated point of contact email (p. 4). Values: Team distribution lists or single technical lead emails (e.g., devops-admin@company.com) (p. 4).
   4. acme:workload-name: The functional application name or system architecture boundary (p. 4). Values: Unified alphanumeric string names (e.g., sap-erp, customer-portal) (p. 4).
   5. acme:business-criticality: The disaster recovery tier of the host infrastructure (p. 5). Values: mission-critical, high, medium, low (p. 5).

## Compliance Scope Extensions (Insurance Regulatory Mandate)

   1. acme:data-classification: Identifies security protection boundaries. Values: public, internal, confidential, restricted-phi (Triggers HIPAA vault controls).
   2. acme:compliance-scope: Categorizes audit horizons. Values: soc2-hipaa, pci-cde (Flags Cardholder Data Environments), none.

## Optional / Operational Tags

* acme:backup-schedule: System protection interval tracking (p. 5). Values: daily-30dayret, weekly, none (p. 5).
* acme:end-date: Expiration deadline for temporary or sandbox infrastructure (p. 5). Values: ISO date format (yyyy-mm-dd) (p. 5).
* acme:documentation-group: Visual token used by automated discovery and diagramming systems (e.g., Hava) to dynamically map cross-cloud service dependencies.


## 4. Policy Enforcement, Governance, and Remediation
To prevent human error and stop non-compliant setups before they happen, governance is actively enforced through programmatic policy engines (p. 5).
## 4.1 Native Cloud Policy Action Mechanics (Azure Example)

   1. Deny Action: Deployments that fail to match the proper resource group prefix string (rg-) or are missing any Mandatory Tag Keys will be rejected automatically with an API validation error message (p. 5).
   2. Modify / Inherit Action: If a resource group has the proper tags but an underlying child resource is missing them, native policy automatically copies the tags down from the resource group via inheritance (p. 5).

## Definition 1: Enforce Tag Key Presence (Deny Mode)
This custom JSON engine definition blocks deployments if the mandatory acme:cost-center key is missing (p. 5):

```
{
  "properties": {
    "displayName": "Denies deployment if the resource is missing the mandatory acme:cost-center tag key.",
    "policyType": "Custom",
    "mode": "Indexed",
    "description": "Denies deployment if the resource is missing the mandatory 'acme:cost-center' tag key.",
    "policyRule": {
      "if": {
        "field": "tags['acme:cost-center']",
        "exists": false
      },
      "then": {
        "action": "deny"
      }
    }
  }
} 
```


## 5. Automation via Infrastructure as Code (IaC)

## 5.1 Terraform Implementation Module
Use this standard baseline block to auto-apply prefixes, format restrictions, and enforce object tags across modules (p. 6):
```
# Local Variables for Naming Strategy Standardization
locals {
  workload    = "custportal"
  environment = "prod"
  region      = "eastus"
  instance    = "001"

  # Standard Base Structure for Hyphenated Resources
  name_prefix = "${local.workload}-${local.environment}-${local.region}-${local.instance}"

  # Standard Base Structure for Non-Hyphenated Resources (Storage, Cosmos)
  name_prefix_alphanumeric = "${local.workload}${local.environment}${local.region}${local.instance}"

  # Core Organizational Global Tags Mandatory Schema
  mandatory_tags = {
    "acme:cost-center"          = "fin-990"
    "acme:environment"          = "production"
    "acme:owner"                = "cloud-ops@organization.com"
    "acme:workload-name"        = "customerportal"
    "acme:business-criticality" = "high"
    "acme:compliance-scope"     = "soc2-hipaa"
  }
}
# Example Resource: Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${local.name_prefix}"
  location            = "East US"
  resource_group_name = "rg-${local.name_prefix}"
  address_space       = ["10.0.0.0/16"]
  tags                = local.mandatory_tags
}

# Example Resource: Storage Account (Strict Alphanumeric Validation Rules)
resource "azurerm_storage_account" "stor" {
  name                     = "stor${local.name_prefix_alphanumeric}"
  resource_group_name      = "rg-${local.name_prefix}"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.mandatory_tags
}
```

## 5.2 Bicep Implementation Template
Deploy consistent resources with automated tag injection using this native Bicep layout (p. 7):

```
// Parameter Configurations for Context Inputs
param workload string = 'custportal'
param environment string = 'prod'
param region string = 'eastus'
param instance string = '001'

// Standard Base Configurations
var namePrefix = '${workload}-${environment}-${region}-${instance}'

// Mandatory Tags Structure Map
var mandatoryTags = {
  'acme:cost-center': 'fin-990'
  'acme:environment': 'production'
  'acme:owner': 'cloud-ops@organization.com'
  'acme:workload-name': 'customerportal'
  'acme:business-criticality': 'high'
  'acme:compliance-scope': 'soc2-hipaa'
}

// Example Resource Deployment: Azure Key Vault
resource kv 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: 'kv-${namePrefix}'
  location: resourceGroup().location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: []
  }
  tags: mandatoryTags
}
```

## 6. Shift-Left CI/CD Pull Request Validation
To prevent invalid resource names or non-compliant configurations from getting merged into main deployment branches, add this verification check to your pipeline (p. 8).

## GitHub Actions Workflow (Pull Request Linter Check)
Save this configuration inside your repository path as .github/workflows/tf-lint.yml (p. 8):
```
name: "IaC Resource Naming Linter"on:
  pull_request:
    branches: [ main ]
jobs:
  lint-names:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code Baseline
        uses: actions/checkout@v4

      - name: Run Regex Pattern Match over Infrastructure Definitions
        run: |
          echo "Scanning configuration files for non-compliant names..."
          # Scan for resource blocks to verify lowercase compliance parameters
          if grep -rE 'name\s*=\s*"[^"]*[A-Z]+[^"]*"' *.tf; then
            echo "ERROR: Discovered uppercase string inputs for resource names. Lowercase schema is mandatory."
            exit 1
          else
            echo "Success! Naming patterns match standardization parameters."
          fi
```

## 7. Operational Discovery Audit Script
Run this unified Azure PowerShell script locally or inside Cloud Shell to parse your entire live active Azure Tenant (p. 9). It looks for naming pattern breaches and missing tags, then outputs a CSV gap-analysis matrix breakdown list (p. 9).
```
# Tenant-Wide Governance Audit Verification Script
$ReportOutput = @()
$MandatoryTags = @("acme:cost-center", "acme:environment", "acme:owner", "acme:workload-name", "acme:business-criticality")
Write-Host "Authenticating and querying structural Azure Subscription Matrix..." -ForegroundColor Cyan
$AzSubscriptions = Get-AzSubscription
foreach ($Sub in $AzSubscriptions) {
    Set-AzContext -SubscriptionId $Sub.Id | Out-Null
    Write-Host "Processing Inventory for Target Subscription: $($Sub.Name)" -ForegroundColor Yellow
    
    # Retrieve all deployed inventory entities
    $AzResources = Get-AzResource
    foreach ($Resource in $AzResources) {
        $TagIssues = @()
        $NamingIssue = $false
        
        # 1. Audit Evaluation Check for Tag Compliance Parameters
        foreach ($TagKey in $MandatoryTags) {
            if (-not $Resource.Tags.ContainsKey($TagKey)) {
                $TagIssues += $TagKey
            }
        }
        
        # 2. Audit Check for Core Naming Hyphenation Prefix Syntax
        if ($Resource.Name -notmatch '^[a-z0-9]+(-[a-z0-9]+)*$') {
            # Catch items flagged by strict alphanumeric exclusions safely (like Storage Accounts)
            if ($Resource.ResourceType -notmatch "Microsoft.Storage" -and $Resource.ResourceType -notmatch "Microsoft.DocumentDB") {
                $NamingIssue = $true
            }
        }
        
        # Logging compliance breaches to final tracking array
        if ($TagIssues.Count -gt 0 -or $NamingIssue -eq $true) {
            $TrackingObject = [PSCustomObject]@{
                SubscriptionName = $Sub.Name
                ResourceName     = $Resource.Name
                ResourceType     = $Resource.ResourceType
                ResourceGroup    = $Resource.ResourceGroupName
                MissingTags      = ($TagIssues -join ", ")
                NamingViolation  = $NamingIssue
            }
            $ReportOutput += $TrackingObject
        }
    }
}
# Export local disk file data object index logs
$OutputFilePath = "./CloudGovernanceAuditIssues.csv"
$ReportOutput | Export-Csv -Path $OutputFilePath -NoTypeInformation
Write-Host "Audit Complete! Breakdown report matrix file saved to disk path location at: $OutputFilePath" -ForegroundColor Green
```

## 8. Implementation Roadmap

* Phase 1 (Month 1): Formally publish this guidelines draft on the internal company wiki (p. 11).
* Phase 2 (Month 2): Configure native cloud policies in Audit Mode to locate un-tagged or poorly-named legacy resources without breaking active apps (p. 11).
* Phase 3 (Month 3): Enable the Deny Action permanently across all non-production and production landing zones (p. 11). Run active remediation scripts on legacy anomalies (p. 11).


To complete the rollout preparation for your leadership review, let me know if you would like to proceed with any of these next steps:

* Updating the PowerShell audit script to auto-remediate legacy instances by copying missing tags from their parent resource groups?
* Expanding the CI/CD pipeline step into a formal Open Policy Agent (OPA) Rego configuration to validate policy across both Terraform and Pulumi?
* Bundling these policy parameters into an Azure Blueprint or AWS Control Tower Guardrail configuration?


