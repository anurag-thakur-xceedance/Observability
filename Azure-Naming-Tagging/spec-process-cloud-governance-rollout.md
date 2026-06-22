---
title: Multi-Cloud Governance Rollout Process
version: 1.0
date_created: 2026-06-10
last_updated: 2026-06-10
owner: Cloud Governance Team
tags: [process, infrastructure, governance, multi-cloud]
---

# Introduction

This specification defines the end-to-end procedural workflow for implementing the "Enterprise Cloud Resource Naming and Tagging Policy" across Azure, AWS, and GCP. It provides a structured roadmap to transition from unmanaged resource states to a strictly governed, policy-enforced environment without disrupting active business operations.

## 1. Purpose & Scope

The goal is to eliminate "orphan" resources, fix cost-allocation gaps, and satisfy regulatory mandates (SOC2, HIPAA, PCI-DSS) by standardizing 100% of the cloud estate. This process applies to all existing (brownfield) and future (greenfield) infrastructure.

## 2. Definitions

- **Audit Mode**: A policy state where non-compliance is logged but not blocked.
- **Deny Mode**: A policy state where non-compliant deployments are physically rejected by the Cloud API.
- **Brownfield**: Existing infrastructure deployed prior to the enforcement of this policy.
- **Greenfield**: New infrastructure deployed after the "Go-Live" date.
- **Remediation Task**: An automated script or policy action that applies missing metadata to a resource.

## 3. Requirements, Constraints & Guidelines

- **REQ-001**: All new deployments (Greenfield) must be blocked if they do not meet the naming/tagging standard.
- **REQ-002**: Existing resources (Brownfield) must not be deleted or restarted during remediation.
- **SEC-001**: Remediation identities must follow the Principle of Least Privilege (PoLP).
- **CON-001**: Auto-tagging is strictly limited to "Low-Risk" stateless resources.
- **GUD-001**: A 30-day "Grace Period" must be provided to application owners before Hard Enforcement.

## 4. The Implementation Workflow

| Phase | Activity | Tools | Deliverable |
| :--- | :--- | :--- | :--- |
| **1. Discovery** | Full tenant scan for naming/tagging violations. | PowerShell, AWS Config, GCP Inventory | Compliance Gap Report (CSV) |
| **2. Socialization** | Distribute Gap Reports to Workload Owners. | Email/Teams/Jira | Signed-off Mapping Matrix |
| **3. Soft Launch** | Enable policies in `Audit` / `Report` mode. | Azure Policy, AWS Guardrails | Real-time Drift Dashboard |
| **4. Remediation** | Execute auto-tagging for stateless assets. | Azure Remediation, SSM Automation | 80% Compliance Baseline |
| **5. Hard Launch** | Flip policies to `Deny` mode for Greenfield. | IaC, Cloud Policy Engines | 100% Greenfield Compliance |
| **6. Continuous** | Scheduled weekly drift audits and alerts. | Datadog, Security Hub | Quarterly Governance Review |

## 5. Acceptance Criteria

- **AC-001**: Given a new Azure VM without an `acme:cost-center` tag, When a deployment is attempted, Then the Azure Resource Manager shall return a `Deny` error.
- **AC-002**: Given an existing AWS S3 bucket missing tags, When the SSM Remediation runs, Then the tags shall be applied without affecting data availability.
- **AC-003**: The central Datadog dashboard must show a >95% compliance score for all "Mission-Critical" workloads.

## 6. Exception Management Process

If a resource cannot comply with the naming standard due to vendor software hard-coding or legacy API limitations:
1. **Submit Request**: Owner files a Jira ticket with the "Governance Exception" template.
2. **Technical Review**: Cloud Architect verifies the constraint.
3. **Approval**: Security Lead approves a temporary or permanent waiver.
4. **Tagging**: The tag `acme:governance-exception: true` must be applied to the resource.

## 7. Rationale & Context

Standardizing naming is the highest-impact activity for reducing MTTR (Mean Time To Repair) during incidents. By knowing exactly what a resource is from its name, engineers can act faster without looking up CMDB records.

## 8. Dependencies & External Integrations

- **INF-001**: Azure Policy / AWS Service Control Policies (SCPs) - Required for enforcement.
- **DAT-001**: Corporate Financial Ledger - Required for valid `cost-center` values.
- **SVC-001**: Central Logging (Datadog/Splunk) - Required for compliance visibility.

## 9. Examples: Remediation Logic

```powershell
# Logic for Phase 4: Auto-Remediation
# If child resource is missing a tag, inherit from Resource Group
$rg = Get-AzResourceGroup -Name "rg-custportal-prod-use1-001"
$resources = Get-AzResource -ResourceGroupName $rg.ResourceGroupName

foreach ($res in $resources) {
    if (-not $res.Tags.ContainsKey("acme:cost-center")) {
        $UpdateTags = $res.Tags
        $UpdateTags.Add("acme:cost-center", $rg.Tags["acme:cost-center"])
        Update-AzTag -ResourceId $res.ResourceId -Tag $UpdateTags -Operation Merge
    }
}
```

## 10. Validation Criteria

Compliance is validated when:
1. The PowerShell Audit script returns zero "Severity 1" (Missing Mandatory Tag) errors.
2. The CI/CD pipeline successfully blocks a "Dummy" non-compliant PR.
3. Monthly billing reports show 0% "Uncategorized" spend.
