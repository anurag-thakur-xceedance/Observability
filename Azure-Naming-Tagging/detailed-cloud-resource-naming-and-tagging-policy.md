# Detailed Cloud Resource Naming and Tagging Policy

| Metadata Field | Document Specification |
|---|---|
| Document Title | Detailed Multi-Cloud Resource Naming, Tagging, Labeling, and Governance Policy |
| Document Version | Version 1.0 |
| Effective Date | 1 August 2026 |
| Applies To | Microsoft Azure, Amazon Web Services, Google Cloud Platform, local container environments |
| Target Audience | Cloud Engineers, DevOps Teams, Platform Teams, Security Teams, FinOps Teams, Solution Architects, Application Owners |
| Security Classification | Internal Corporate - Confidential / Restricted |

---

## Review Schedule & Log

This policy must be reviewed quarterly by Cloud Governance, Security, FinOps, and Platform Engineering. Each review must produce documented decisions, required policy updates, open risks, exception status, and owners for follow-up actions.

| Version | Review Date | Participants | Findings / Observations | Actions | Owner | Status |
|---|---|---|---|---|---|---|
| 1.0 | 1 August 2026 | Cloud Governance, Platform Engineering, Security, FinOps | Initial enterprise policy baseline for multi-cloud naming, tagging, enforcement, remediation, roadmap, and review cadence. Validate taxonomy, mandatory metadata, provider mappings, rollout plan, and enforcement readiness before enterprise publication. | Publish policy baseline, confirm taxonomy registries, approve initial audit-mode rollout, and prepare team communication. | Cloud Governance Team | Planned |
| TBD | 1 November 2026 | Cloud Governance, Platform Engineering, Security, FinOps, Application Owner representatives | Review first-quarter audit findings, brownfield remediation progress, exception trends, false positives, and readiness for broader deny-mode enforcement. | Update policy and implementation backlog based on audit findings and approved exceptions. | Cloud Governance Team | Scheduled |
| TBD | 1 February 2027 | Cloud Governance, Platform Engineering, Security, FinOps | Review enforcement effectiveness, compliance dashboards, production compliance score, unallocated spend, and operational incident feedback. | Refine enforcement scope, dashboard metrics, and remediation automation. | Cloud Governance Team | Scheduled |
| TBD | 1 May 2027 | Cloud Governance, Platform Engineering, Security, FinOps | Review policy maturity, new cloud resource types, provider constraint changes, automation opportunities, and exception expiry performance. | Approve policy updates for new provider capabilities, resource prefixes, and governance automation improvements. | Cloud Governance Team | Scheduled |
---

## 1. Executive Summary

This policy defines the mandatory enterprise standard for naming and tagging cloud resources across Azure, AWS, and GCP. The standard is provider-neutral: it uses a common enterprise taxonomy, cloud-agnostic naming logic, and provider-specific implementation mappings so that governance can be applied consistently across subscriptions, accounts, and projects.

The policy has four goals:

1. Make each cloud resource understandable from its name.
2. Make each cloud resource attributable through metadata such as owner, project, environment, cost center, and compliance scope.
3. Enable automated enforcement through Infrastructure as Code, CI/CD, native cloud policy engines, and monitoring integrations.
4. Remediate legacy resources safely without downtime by separating low-risk auto-tagging from high-risk manual review.

This policy is mandatory for all new cloud resources. Existing resources must be brought into compliance through the rollout process defined in this document.

### 1.1 Enterprise Architecture Position

This document is not only a naming convention. It is an enterprise governance strategy that must be converted into reusable platform capabilities, standard deployment modules, CI/CD controls, and operational reporting. Individual teams should not reinterpret the policy independently. Platform Engineering must provide approved implementation patterns that make the compliant path the easiest path.

The enterprise architecture position is:

| Architecture Decision | Standard |
|---|---|
| Naming model | Centralized enterprise taxonomy with workload-level ownership. |
| Tagging model | Mandatory metadata at every taggable resource boundary. |
| Enforcement model | Progressive enforcement: audit, remediate, deny. |
| Implementation model | IaC-first, with portal and CLI deployments restricted or monitored. |
| Exception model | Time-bound exceptions with ownership, risk acceptance, and expiry. |
| Operating model | Cloud Governance owns the standard; Platform Engineering owns enablement; workload teams own correctness. |

---

## 2. Purpose, Scope, and Governance Outcomes

### 2.1 Purpose

The purpose of this policy is to establish consistent naming and metadata practices for cloud resources so that cloud infrastructure can be governed, secured, operated, and charged back consistently across providers.

### 2.2 Scope

This policy applies to:

| Scope Area | Included |
|---|---|
| Cloud providers | Azure subscriptions, AWS accounts, GCP projects |
| Environments | Production, development, test, QA, UAT, shared services, sandbox |
| Deployment methods | Terraform, OpenTofu, Bicep, ARM, CloudFormation, CDK, Pulumi, Deployment Manager, CLI, portal/console, scripts, CI/CD pipelines |
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
| Tag | Metadata key-value pair used by providers such as Azure and AWS. |
| Label | Metadata key-value pair used by providers such as GCP. Labels may have stricter key and value constraints than tags. |
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
xceed-custportal-prod-use1-vm-001
```

### 4.2 Token Definitions

| Token | Required | Description | Example Values |
|---|---:|---|---|
| `company` | Yes | Approved company or business-unit code. | `xceed` |
| `project` | Yes | Application, product, workload, or platform capability. | `custportal`, `claims`, `billing`, `underwrite` |
| `environment` | Yes | Deployment lifecycle tier. | `prod`, `dev`, `test`, `qa`, `uat`, `shrd`, `sbx` |
| `region` | Yes | Standardized enterprise region short code. | `use1`, `usw2`, `euw1`, `inc1` |
| `resource-type` | Yes | Standard resource abbreviation. | `vm`, `rg`, `vnet`, `sql`, `kv`, `st` |
| `instance` | Yes | Three-digit sequential uniqueness value. | `001`, `002`, `003` |

### 4.3 Environment Codes

| Code | Name | Description |
|---|---|---|
| `prod` | Production | Customer-facing or business-critical production systems. |
| `dev` | Development | Developer, build, and continuous integration environments. |
| `test` | Test | Functional, integration, smoke, or regression testing environments. |
| `qa` | Quality assurance | QA validation environments owned by quality engineering or release validation teams. |
| `uat` | User acceptance testing | Business-user validation environment prior to production release. |
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

Strict validation regex for standard hyphenated resource names:

```regex
^xceed-[a-z0-9]+(-[a-z0-9]+)*-(prod|dev|test|qa|uat|shrd|sbx)-(use1|use2|usw1|usw2|usw3|usc1|cac1|brs1|euw1|eun1|uks1|frc1|dew1|chn1|noe1|sec1|itn1|esc1|uae1|qac1|ilc1|zan1|inc1|ins1|sea1|eas1|jpe1|jpw1|krc1|aue1|aus1)-(rg|vm|app|func|k8s|cr|st|disk|file|sql|nosql|vnet|nsg|lb|agw|pe|kv|fw|pan|fnt|iam|log|bkp|dl|dw|etl|stream|queue|topic|event|api|wf|sched|waf|cert|bas|sp|id|mon|apm|alert|dns|cdn|nat|vpn|conn|ai|ml|srch|pol|lz|agent|capp|cfg)-[0-9]{3}$
```

This strict regex validates the exact enterprise token order, approved environment codes, approved region aliases, approved resource prefixes, and a three-digit instance suffix. If a new region or resource prefix is added to this policy, the validation regex and IaC validation lists must be updated in the same change.

Baseline fallback regex for exploratory audits where the approved region or resource prefix list is not yet loaded:

```regex
^[a-z0-9]+(-[a-z0-9]+){5}$
```

The fallback regex is for discovery only. It must not be used as the final enforcement rule for production deployments.

### 4.5 No-Hyphen Exception Rule

Some services prohibit hyphens or require global uniqueness. For those resources, remove hyphens but preserve token order.

| Standard Name | Flattened Exception Name |
|---|---|
| `xceed-claims-prod-use1-st-001` | `xceedclaimsproduse1st001` |
| `xceed-billing-qa-euw1-kv-001` | `xceedbillingqaeuw1kv001` |

The flattened name must still use lowercase letters and numbers only.

### 4.6 Provider-Specific Naming Constraints

| Provider | Key Constraints | Policy Adaptation |
|---|---|---|
| Azure | Constraints vary by service. Windows VM computer names have 15-character limits. Storage accounts require lowercase letters and numbers only. Key Vault names are globally unique and allow hyphens. | Use lowercase kebab-case by default. Use flattened names for storage accounts. Keep VM host names short enough for Windows workloads. |
| AWS | Constraints vary by service. S3 bucket names are globally unique and DNS-style. Tag keys are case-sensitive. Some services support names separately from ARN identifiers. | Use lowercase kebab-case. For S3, use globally unique names and avoid dots unless explicitly required. Use tags for metadata beyond service name limits. |
| GCP | Resource names and labels are generally lowercase, numeric, and hyphen constrained. Labels do not support colon in keys. | Use lowercase kebab-case for names. Translate canonical `xceed:` tag keys into GCP-compatible label keys. |

No provider-specific implementation should redefine the enterprise taxonomy. Provider differences must be handled through translation layers, module logic, or documented exceptions.

### 4.7 Multi-Cloud Region Mapping

| Geographic Region | Azure Region | AWS Region | GCP Region | Standard Short Code | Mapping Status |
|---|---|---|---|---|---|
| US East | `eastus` | `us-east-1` | `us-east4` | `use1` | Nearest Approved |
| US East 2 | `eastus2` | `us-east-2` | `us-east1` | `use2` | Nearest Approved |
| US West | `westus` | `us-west-1` | `us-west2` | `usw1` | Nearest Approved |
| US West | `westus2` | `us-west-2` | `us-west1` | `usw2` | Nearest Approved |
| US West 3 | `westus3` | `us-west-2` | `us-west3` | `usw3` | Provider-Specific |
| US Central | `centralus` | `us-east-2` or approved central equivalent | `us-central1` | `usc1` | Nearest Approved |
| Canada Central | `canadacentral` | `ca-central-1` | `northamerica-northeast1` | `cac1` | Exact |
| Brazil South | `brazilsouth` | `sa-east-1` | `southamerica-east1` | `brs1` | Exact |
| Europe West | `westeurope` | `eu-west-1` | `europe-west1` | `euw1` | Nearest Approved |
| Europe North | `northeurope` | `eu-north-1` | `europe-north1` | `eun1` | Nearest Approved |
| UK South | `uksouth` | `eu-west-2` | `europe-west2` | `uks1` | Exact |
| France Central | `francecentral` | `eu-west-3` | `europe-west9` | `frc1` | Exact |
| Germany West Central | `germanywestcentral` | `eu-central-1` | `europe-west3` | `dew1` | Exact |
| Switzerland North | `switzerlandnorth` | `eu-central-2` | `europe-west6` | `chn1` | Exact |
| Norway East | `norwayeast` | `eu-north-1` | `europe-north1` | `noe1` | Nearest Approved |
| Sweden Central | `swedencentral` | `eu-north-1` | `europe-north1` | `sec1` | Nearest Approved |
| Italy North | `italynorth` | `eu-south-1` | `europe-west8` | `itn1` | Exact |
| Spain Central | `spaincentral` | `eu-south-2` | `europe-southwest1` | `esc1` | Exact |
| UAE North | `uaenorth` | `me-central-1` | `me-central2` | `uae1` | Nearest Approved |
| Qatar Central | `qatarcentral` | `me-south-1` | `me-central1` | `qac1` | Nearest Approved |
| Israel Central | `israelcentral` | `il-central-1` | `me-west1` | `ilc1` | Nearest Approved |
| South Africa North | `southafricanorth` | `af-south-1` | `africa-south1` | `zan1` | Exact |
| India Central / South Asia | `centralindia` | `ap-south-1` | `asia-south1` | `inc1` | Exact |
| India South | `southindia` | `ap-south-2` | `asia-south2` | `ins1` | Exact |
| Southeast Asia | `southeastasia` | `ap-southeast-1` | `asia-southeast1` | `sea1` | Exact |
| East Asia | `eastasia` | `ap-east-1` | `asia-east2` | `eas1` | Nearest Approved |
| Japan East | `japaneast` | `ap-northeast-1` | `asia-northeast1` | `jpe1` | Exact |
| Japan West | `japanwest` | `ap-northeast-3` | `asia-northeast2` | `jpw1` | Exact |
| Korea Central | `koreacentral` | `ap-northeast-2` | `asia-northeast3` | `krc1` | Exact |
| Australia East | `australiaeast` | `ap-southeast-2` | `australia-southeast1` | `aue1` | Exact |
| Australia Southeast | `australiasoutheast` | `ap-southeast-4` | `australia-southeast2` | `aus1` | Nearest Approved |

Region codes are enterprise aliases, not cloud-provider region names. `Exact` means the providers have an aligned regional presence for the business intent. `Nearest Approved` means the providers do not map perfectly but Cloud Governance has approved the closest compliant region. `Provider-Specific` means one or more providers require a special mapping decision before workload deployment. If a provider does not offer an exact geographic equivalent, Cloud Governance must approve the nearest compliant region and record the mapping in the taxonomy registry before workloads are deployed.

### 4.8 Resource Type Prefix Matrix

| Category | Resource Component Type | Standard Prefix | Azure Example | AWS Example | GCP Example | Constraint Notes |
|---|---|---|---|---|---|---|
| Management | Resource grouping boundary | `rg` | Resource Group | Account / OU / resource group tag context | Project / folder | Use `rg` as the enterprise grouping prefix. Naming support varies; apply mandatory metadata at the grouping boundary. |
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
| Analytics | Data lake / object data zone | `dl` | Data Lake Storage Gen2 | S3 data lake bucket | Cloud Storage data lake bucket | Use flattened names where bucket/account constraints apply. |
| Analytics | Data warehouse | `dw` | Synapse Dedicated SQL Pool | Redshift | BigQuery | Production datasets require cost-center and data-classification metadata. |
| Analytics | Data integration / ETL | `etl` | Data Factory | Glue | Dataflow / Data Fusion | Include workload context because shared integration platforms are common. |
| Analytics | Stream analytics | `stream` | Stream Analytics | Kinesis Data Analytics | Dataflow streaming | Streaming services require owner and criticality metadata. |
| Messaging | Queue | `queue` | Storage Queue / Service Bus Queue | SQS | Pub/Sub subscription | Names should identify producer or consumer workload. |
| Messaging | Topic / pub-sub | `topic` | Service Bus Topic / Event Grid Topic | SNS / EventBridge Bus | Pub/Sub Topic | Required for event-driven architectures. |
| Messaging | Event streaming | `event` | Event Hubs | Kinesis Data Streams / MSK | Pub/Sub / Managed Service for Kafka | Use explicit project token for shared event platforms. |
| Integration | API gateway / API management | `api` | API Management | API Gateway | Apigee / API Gateway | Public API gateways require compliance-scope tags. |
| Integration | Workflow / orchestration | `wf` | Logic Apps | Step Functions | Workflows | Workflow ownership must be explicit. |
| Integration | Scheduler | `sched` | Automation / Logic App recurrence | EventBridge Scheduler | Cloud Scheduler | Useful for operational jobs and lifecycle automation. |
| Security | Web application firewall | `waf` | Application Gateway WAF / Front Door WAF | AWS WAF | Cloud Armor | Security policy resources must be reviewed manually before remediation. |
| Security | Certificate | `cert` | Key Vault Certificate | ACM Certificate | Certificate Manager | Do not include domain secrets or sensitive identifiers. |
| Security | Bastion / jump host | `bas` | Azure Bastion | EC2 Bastion | IAP / Bastion host pattern | High-risk access path; owner and criticality are mandatory. |
| Identity | Service principal / app registration | `sp` | App Registration / Service Principal | IAM Role / Identity Center app | Service Account | High-risk identity resource. |
| Identity | User-assigned managed identity / workload identity | `id` | Managed Identity | IAM Role | Service Account / Workload Identity | Use for workload-to-service authentication. |
| Observability | Metrics workspace / monitor | `mon` | Azure Monitor Workspace | CloudWatch | Cloud Monitoring | Required for platform monitoring boundaries. |
| Observability | Application monitoring | `apm` | Application Insights | X-Ray / CloudWatch Application Signals | Cloud Trace / Error Reporting | Use workload project token. |
| Observability | Alert rule / notification | `alert` | Monitor Alert | CloudWatch Alarm | Alerting Policy | Alerts must route to owner metadata. |
| Network | DNS zone | `dns` | DNS Zone / Private DNS Zone | Route 53 Hosted Zone | Cloud DNS Zone | High-risk; manual review for remediation. |
| Network | CDN / edge delivery | `cdn` | Front Door / CDN | CloudFront | Cloud CDN | Global services require careful region token handling. |
| Network | NAT gateway | `nat` | NAT Gateway | NAT Gateway | Cloud NAT | Shared network dependency. |
| Network | VPN gateway | `vpn` | VPN Gateway | Site-to-Site VPN | Cloud VPN | High-risk connectivity resource. |
| Network | Express/private connectivity | `conn` | ExpressRoute | Direct Connect | Cloud Interconnect | Enterprise connectivity resource. |
| AI / ML | AI service endpoint | `ai` | Azure AI Services | Bedrock / SageMaker endpoint | Vertex AI endpoint | Requires data-classification metadata. |
| AI / ML | Machine learning workspace | `ml` | Machine Learning Workspace | SageMaker Domain | Vertex AI Workbench | Model governance metadata may be required. |
| AI / ML | Search / vector search | `srch` | AI Search | OpenSearch / Kendra | Vertex AI Search / AlloyDB AI | Used by RAG and search workloads. |
| Governance | Policy assignment / guardrail | `pol` | Azure Policy Assignment | SCP / AWS Config Rule | Organization Policy / Policy Controller constraint | Owned by Cloud Governance. |
| Governance | Blueprint / landing zone artifact | `lz` | Landing Zone / Deployment Stack | Control Tower / Account Factory | Folder / project factory | Used for platform provisioning. |
| DevOps | Build agent / runner | `agent` | VM Scale Set Agent / DevOps Agent | CodeBuild / EC2 Runner | Cloud Build Worker Pool | CI/CD infrastructure must be tagged to platform owner. |
| DevOps | Container app / serverless container | `capp` | Container Apps | App Runner / ECS Service | Cloud Run Service | Useful for lightweight services. |
| DevOps | Secrets/config store | `cfg` | App Configuration | Systems Manager Parameter Store | Runtime Config / Secret Manager config pattern | Do not store secret values in resource names or tags. |

---

## 5. Tagging and Labeling Strategy

### 5.1 Tagging Principles

| Principle | Requirement |
|---|---|
| Mandatory metadata | Every resource must carry the mandatory metadata set unless the provider does not support tags or labels. |
| Inheritance first | Resource groups, AWS accounts, GCP folders/projects, and IaC modules must define baseline metadata that child resources inherit where supported. |
| Lowercase and structured values | Tag values must use approved lowercase values, except email addresses and dates. |
| Provider-safe keys | Canonical tags may use `xceed:` notation, but GCP label keys must use a translated key without colon. |
| No sensitive data | Tags and labels must not include secrets, PHI, PCI data, or customer-identifying values. |
| Automation compatible | Keys and values must be suitable for policy engines, billing tools, dashboards, and scripts. |

### 5.2 Canonical Tags and Provider Key Mapping

| Canonical Metadata | Azure Tag Key | AWS Tag Key | GCP Label Key | Required | Description |
|---|---|---|---|---:|---|
| Cost center | `xceed:cost-center` | `xceed:cost-center` | `xceed-cost-center` | Yes | Approved financial cost allocation code. |
| Environment | `xceed:environment` | `xceed:environment` | `xceed-environment` | Yes | Lifecycle tier. |
| Owner | `xceed:owner` | `xceed:owner` | `xceed-owner` | Yes | Responsible team mailbox or service owner. |
| Project / workload | `xceed:project` | `xceed:project` | `xceed-project` | Yes | Business application, platform capability, or service boundary. |
| Business criticality | `xceed:business-criticality` | `xceed:business-criticality` | `xceed-business-criticality` | Yes | Recovery and incident priority tier. |
| Data classification | `xceed:data-classification` | `xceed:data-classification` | `xceed-data-classification` | Conditional | Required for systems handling regulated or sensitive data. |
| Compliance scope | `xceed:compliance-scope` | `xceed:compliance-scope` | `xceed-compliance-scope` | Conditional | Required for SOC 2, HIPAA, PCI, or other audited workloads. |
| Backup schedule | `xceed:backup-schedule` | `xceed:backup-schedule` | `xceed-backup-schedule` | Conditional | Required where backup policy applies. |
| End date | `xceed:end-date` | `xceed:end-date` | `xceed-end-date` | Conditional | Required for sandbox and temporary resources. |
| Documentation group | `xceed:documentation-group` | `xceed:documentation-group` | `xceed-documentation-group` | Optional | Groups resources for diagrams and discovery tools. |
| Governance exception | `xceed:governance-exception` | `xceed:governance-exception` | `xceed-governance-exception` | Conditional | Required only for approved exceptions. |

### 5.3 Mandatory Tag Values

| Tag | Approved Values / Format |
|---|---|
| `cost-center` | Approved corporate ledger code, such as `fin-401`, `eng-102`, `ops-210`. |
| `environment` | `production`, `development`, `test`, `qa`, `uat`, `shared`, `sandbox`. |
| `owner` | Team distribution list or approved service ownership email, such as `cloud-ops@xceedance.com`. |
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
| TAG-004 | GCP labels | GCP labels must not use colon characters. Use translated `xceed-*` keys. |
| TAG-005 | Emails | Owner values may include `@` and `.` where provider rules allow them. If not allowed, use an approved owner alias. |
| TAG-006 | Case | Keys and values must be lowercase where supported. |
| TAG-007 | Inheritance | Child resources should inherit tags from parent containers where the cloud provider supports it. |
| TAG-008 | No sensitive values | Do not store secrets, PHI, PCI data, personal data, or customer identifiers in tags or labels. |

---

## 6. Implementation and Enforcement Model

### 6.0 Strategy for Enterprise Adoption

The policy must be implemented through a centrally managed governance program, not as a static document. The strategy is to convert the policy into four enforceable assets:

| Asset | Owner | Purpose |
|---|---|---|
| Taxonomy registry | Cloud Governance and FinOps | Approved company codes, environments, region codes, resource prefixes, cost centers, and criticality values. |
| Golden IaC modules | Platform Engineering | Reusable modules that generate compliant names and apply mandatory tags by default. |
| Policy-as-code controls | Platform Engineering and Security | Azure Policy, AWS SCPs, AWS Config, GCP Organization Policy, Config Validator / Policy Controller, Pulumi policies, and CI/CD checks. |
| Compliance dashboards | Cloud Governance and FinOps | Enterprise visibility into violations, exceptions, unallocated spend, and remediation progress. |

Teams adopt the policy through approved modules and pipelines. Manual naming or ad hoc tag creation is not an accepted long-term operating model.

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

### 6.3 Portal, Console, and Direct CLI Deployment Controls

Manual deployments through cloud portals, provider consoles, or unrestricted CLI credentials create bypass risk because they may avoid approved IaC modules and CI/CD validation. These deployment paths must be controlled, monitored, and treated as exceptions rather than the default delivery model.

| Control Area | Requirement |
|---|---|
| Access model | Direct contributor, administrator, owner, or project editor permissions must be limited to platform break-glass, operations, and approved support scenarios. |
| Preferred deployment path | Standard changes must be deployed through approved CI/CD pipelines using golden IaC modules. |
| Break-glass access | Emergency portal/console access must be time-bound, logged, approved, and reviewed after use. |
| CLI usage | CLI deployments must use approved wrappers, service principals, roles, or identities that apply mandatory tags and naming validation. |
| Detection | Activity logs, CloudTrail, and Cloud Audit Logs must generate alerts for direct create/update/delete actions outside approved pipelines. |
| Remediation | Resources created manually must be audited within 24 hours and either brought into compliance, linked to an approved exception, or removed. |
| Accountability | Manual deployment alerts must route to the resource owner, platform team, and Cloud Governance queue. |

Provider-specific monitoring sources:

| Provider | Monitoring Source | Example Signal |
|---|---|---|
| Azure | Azure Activity Log, Azure Policy compliance, Resource Graph | Resource write operation not initiated by approved deployment identity. |
| AWS | CloudTrail, EventBridge, AWS Config | Create or tag operation not initiated by approved CI/CD role. |
| GCP | Cloud Audit Logs, Cloud Asset Inventory, Policy Controller | Resource create/update operation by user identity instead of approved deployment service account. |

---

## 7. Provider-Native Enforcement

Provider-native enforcement must be configured for each cloud using the most appropriate control plane. The purpose is the same across providers: detect violations during audit mode, block non-compliant greenfield deployments during enforcement mode, and remediate low-risk metadata gaps where safe.

| Provider | Audit Controls | Deny / Preventive Controls | Remediation Controls |
|---|---|---|---|
| Azure | Azure Policy compliance, Azure Resource Graph | Azure Policy `deny` assignments | Azure Policy `modify`, remediation tasks, Resource Graph driven scripts |
| AWS | AWS Config, Conformance Packs, Resource Groups Tagging API | SCPs, IAM condition keys, tag policies where supported | Systems Manager Automation, Lambda remediation, EventBridge workflows |
| GCP | Cloud Asset Inventory, Config Validator, Policy Controller | Organization Policy constraints, CI/CD validation, Policy Controller | Cloud Functions / Cloud Run remediation jobs, asset inventory workflows |

### 7.1 Azure Enforcement

#### 7.1.1 Azure Policy - Audit Missing Mandatory Tags

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
          { "field": "tags['xceed:cost-center']", "exists": false },
          { "field": "tags['xceed:environment']", "exists": false },
          { "field": "tags['xceed:owner']", "exists": false },
          { "field": "tags['xceed:project']", "exists": false },
          { "field": "tags['xceed:business-criticality']", "exists": false }
        ]
      },
      "then": {
        "effect": "audit"
      }
    }
  }
}
```

#### 7.1.2 Azure Policy - Deny Missing Mandatory Tags

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
          { "field": "tags['xceed:cost-center']", "exists": false },
          { "field": "tags['xceed:environment']", "exists": false },
          { "field": "tags['xceed:owner']", "exists": false },
          { "field": "tags['xceed:project']", "exists": false },
          { "field": "tags['xceed:business-criticality']", "exists": false }
        ]
      },
      "then": {
        "effect": "deny"
      }
    }
  }
}
```

#### 7.1.3 Azure Policy - Inherit Tag From Resource Group

Use modify policies for low-risk tag inheritance. Assign a managed identity to the policy assignment with permissions to update tags.

```json
{
  "properties": {
    "displayName": "Inherit Xceedance cost center tag from resource group",
    "policyType": "Custom",
    "mode": "Indexed",
    "description": "Adds xceed:cost-center from the parent resource group when missing on a child resource.",
    "policyRule": {
      "if": {
        "allOf": [
          { "field": "tags['xceed:cost-center']", "exists": false },
          { "value": "[resourceGroup().tags['xceed:cost-center']]", "notEquals": "" }
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
              "field": "tags['xceed:cost-center']",
              "value": "[resourceGroup().tags['xceed:cost-center']]"
            }
          ]
        }
      }
    }
  }
}
```

#### 7.1.4 Azure Assignment Strategy

| Scope | Mode | Purpose |
|---|---|---|
| Management group | Audit | Baseline discovery across all subscriptions. |
| Landing zone subscriptions | Deny | Prevent new non-compliant resources. |
| Legacy subscriptions | Audit then Modify | Detect and safely remediate brownfield resources. |
| Sandbox subscriptions | Deny plus end-date tag | Prevent unmanaged temporary resources. |

### 7.2 AWS Enforcement

#### 7.2.1 AWS Audit Mode

Use AWS Config managed rules or conformance packs first. The `required-tags` rule can report resources missing mandatory tags without denying deployments.

Audit outputs should be sent to Security Hub and the central dashboard.

#### 7.2.2 AWS Deny Enforcement Example

Use Service Control Policies or IAM policies after audit results are validated. The following example denies EC2 instance creation when mandatory request tags are missing.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyRunInstancesWithoutCostCenter",
      "Effect": "Deny",
      "Action": "ec2:RunInstances",
      "Resource": "*",
      "Condition": {
        "Null": {
          "aws:RequestTag/xceed:cost-center": "true"
        }
      }
    },
    {
      "Sid": "DenyRunInstancesWithoutEnvironment",
      "Effect": "Deny",
      "Action": "ec2:RunInstances",
      "Resource": "*",
      "Condition": {
        "Null": {
          "aws:RequestTag/xceed:environment": "true"
        }
      }
    },
    {
      "Sid": "DenyRunInstancesWithoutOwner",
      "Effect": "Deny",
      "Action": "ec2:RunInstances",
      "Resource": "*",
      "Condition": {
        "Null": {
          "aws:RequestTag/xceed:owner": "true"
        }
      }
    },
    {
      "Sid": "DenyRunInstancesWithoutProject",
      "Effect": "Deny",
      "Action": "ec2:RunInstances",
      "Resource": "*",
      "Condition": {
        "Null": {
          "aws:RequestTag/xceed:project": "true"
        }
      }
    }
  ]
}
```

Each mandatory request tag is checked in a separate statement so a missing single tag is denied independently. Additional services such as S3, RDS, EKS, and Lambda require service-specific create actions and request-tag condition support validation before enforcement.

#### 7.2.3 AWS Tag Policy Example

AWS Organizations tag policies should standardize allowed values and casing.

```json
{
  "tags": {
    "xceed:environment": {
      "tag_key": {
        "@@assign": "xceed:environment"
      },
      "tag_value": {
        "@@assign": [
          "production",
          "development",
          "test",
          "qa",
          "uat",
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

### 7.3 GCP Enforcement

#### 7.3.1 GCP Label Key Translation

Because GCP labels do not support colon notation, the enterprise canonical tag `xceed:cost-center` must be implemented as `xceed-cost-center` in GCP.

#### 7.3.2 GCP Audit Mode

Use Cloud Asset Inventory exports, Config Validator, Policy Controller, or scheduled queries to detect missing labels.

Example inventory logic:

```bash
gcloud asset search-all-resources \
  --scope="organizations/ORG_ID" \
  --query="NOT labels.xceed-environment:*" \
  --format="csv(name,assetType,project,location)"
```

#### 7.3.3 GCP IaC Enforcement

Where GCP Organization Policy does not provide a direct mandatory-label control for a specific service, enforce labels through Terraform modules, CI/CD checks, and Config Validator policies.

#### 7.3.4 GCP Policy Controller / Gatekeeper Required Labels Example

Use Policy Controller or Gatekeeper-style constraints to validate required labels on Kubernetes-managed cloud resources where Config Connector or similar resource controllers are used.

```yaml
apiVersion: templates.gatekeeper.sh/v1
kind: ConstraintTemplate
metadata:
  name: xceedrequiredlabels
spec:
  crd:
    spec:
      names:
        kind: XceedRequiredLabels
      validation:
        openAPIV3Schema:
          type: object
          properties:
            labels:
              type: array
              items:
                type: string
  targets:
    - target: admission.k8s.gatekeeper.sh
      rego: |
        package xceedrequiredlabels

        violation[{"msg": msg}] {
          required := input.parameters.labels[_]
          not input.review.object.metadata.labels[required]
          msg := sprintf("Missing required Xceedance label: %v", [required])
        }
```

```yaml
apiVersion: constraints.gatekeeper.sh/v1beta1
kind: XceedRequiredLabels
metadata:
  name: require-xceedance-governance-labels
spec:
  match:
    kinds:
      - apiGroups: ["*"]
        kinds: ["*"]
  parameters:
    labels:
      - xceed-cost-center
      - xceed-environment
      - xceed-owner
      - xceed-project
      - xceed-business-criticality
```

This example is suitable for Kubernetes admission control and Config Connector resources. For non-Kubernetes GCP resources, use Cloud Asset Inventory scans, Terraform validation, and CI/CD policy checks.

#### 7.3.5 GCP Terraform Required Labels Validation

Terraform modules for GCP must require translated Xceedance label keys and validate allowed values.

```hcl
variable "labels" {
  type = map(string)

  validation {
    condition = alltrue([
      contains(keys(var.labels), "xceed-cost-center"),
      contains(keys(var.labels), "xceed-environment"),
      contains(keys(var.labels), "xceed-owner"),
      contains(keys(var.labels), "xceed-project"),
      contains(keys(var.labels), "xceed-business-criticality")
    ])
    error_message = "GCP resources must include all required Xceedance labels."
  }

  validation {
    condition = contains([
      "production",
      "development",
      "test",
      "qa",
      "uat",
      "shared",
      "sandbox"
    ], var.labels["xceed-environment"])
    error_message = "xceed-environment must use an approved environment value."
  }
}

resource "google_storage_bucket" "example" {
  name     = "xceedcustportaldevuse1st001"
  location = "US"
  labels   = var.labels
}
```

---

## 8. Infrastructure as Code Implementation

### 8.1 Terraform / OpenTofu Naming and Metadata Validation

```hcl
variable "company" {
  type = string
  validation {
    condition     = var.company == "xceed"
    error_message = "company must be xceed."
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
    condition     = contains(["prod", "dev", "test", "qa", "uat", "shrd", "sbx"], var.environment)
    error_message = "environment must be one of prod, dev, test, qa, uat, shrd, sbx."
  }
}

variable "region_code" {
  type = string
  validation {
    condition     = contains(["use1", "use2", "usw1", "usw2", "usw3", "usc1", "cac1", "brs1", "euw1", "eun1", "uks1", "frc1", "dew1", "chn1", "noe1", "sec1", "itn1", "esc1", "uae1", "qac1", "ilc1", "zan1", "inc1", "ins1", "sea1", "eas1", "jpe1", "jpw1", "krc1", "aue1", "aus1"], var.region_code)
    error_message = "region_code must be an approved enterprise region short code."
  }
}

variable "resource_type" {
  type = string
  validation {
    condition     = contains(["rg", "vm", "app", "func", "k8s", "cr", "st", "disk", "file", "sql", "nosql", "vnet", "nsg", "lb", "agw", "pe", "kv", "fw", "pan", "fnt", "iam", "log", "bkp", "dl", "dw", "etl", "stream", "queue", "topic", "event", "api", "wf", "sched", "waf", "cert", "bas", "sp", "id", "mon", "apm", "alert", "dns", "cdn", "nat", "vpn", "conn", "ai", "ml", "srch", "pol", "lz", "agent", "capp", "cfg"], var.resource_type)
    error_message = "resource_type must be an approved enterprise resource prefix."
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
  resource_name_pattern = "^xceed-[a-z0-9]+(-[a-z0-9]+)*-(prod|dev|test|qa|uat|shrd|sbx)-(use1|use2|usw1|usw2|usw3|usc1|cac1|brs1|euw1|eun1|uks1|frc1|dew1|chn1|noe1|sec1|itn1|esc1|uae1|qac1|ilc1|zan1|inc1|ins1|sea1|eas1|jpe1|jpw1|krc1|aue1|aus1)-(rg|vm|app|func|k8s|cr|st|disk|file|sql|nosql|vnet|nsg|lb|agw|pe|kv|fw|pan|fnt|iam|log|bkp|dl|dw|etl|stream|queue|topic|event|api|wf|sched|waf|cert|bas|sp|id|mon|apm|alert|dns|cdn|nat|vpn|conn|ai|ml|srch|pol|lz|agent|capp|cfg)-[0-9]{3}$"

  resource_name_valid = can(regex(local.resource_name_pattern, local.resource_name))

  mandatory_tags = {
    "xceed:cost-center"          = var.cost_center
    "xceed:environment"          = var.environment_name
    "xceed:owner"                = var.owner
    "xceed:project"              = var.project
    "xceed:business-criticality" = var.business_criticality
  }
}

check "resource_name_compliance" {
  assert {
    condition     = local.resource_name_valid
    error_message = "Generated resource name does not comply with the Xceedance enterprise naming standard."
  }
}
```

### 8.2 Terraform Provider-Level Metadata Patterns

Use provider-level metadata where the provider supports it. This reduces repeated code and prevents teams from forgetting mandatory metadata.

#### AWS Default Tags

```hcl
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = local.mandatory_tags
  }
}
```

#### GCP Label Translation

```hcl
locals {
  gcp_labels = {
    "xceed-cost-center"          = var.cost_center
    "xceed-environment"          = var.environment_name
    "xceed-owner"                = replace(var.owner, "@", "-at-")
    "xceed-project"              = var.project
    "xceed-business-criticality" = var.business_criticality
  }
}
```

#### Azure Tag Baseline

AzureRM does not support universal provider-level default tags in the same way as AWS. Use common modules and locals to apply mandatory tags consistently.

```hcl
locals {
  azure_tags = {
    "xceed:cost-center"          = var.cost_center
    "xceed:environment"          = var.environment_name
    "xceed:owner"                = var.owner
    "xceed:project"              = var.project
    "xceed:business-criticality" = var.business_criticality
  }
}
```

### 8.3 Bicep Baseline

```bicep
param company string = 'xceed'
param project string = 'custportal'
param environment string = 'prod'
param regionCode string = 'use1'
param resourceType string = 'kv'
param instance string = '001'

var namePrefix = '${company}-${project}-${environment}-${regionCode}-${resourceType}-${instance}'

var mandatoryTags = {
  'xceed:cost-center': 'fin-990'
  'xceed:environment': 'production'
  'xceed:owner': 'cloud-ops@xceedance.com'
  'xceed:project': project
  'xceed:business-criticality': 'high'
  'xceed:compliance-scope': 'soc2-hipaa'
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

### 8.4 AWS CloudFormation Baseline

CloudFormation templates must define mandatory Xceedance tags on every taggable resource. Stack-level tags should also be applied during deployment, but resource-level tags remain required because support for inherited stack tags varies by service.

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Description: Xceedance compliant EC2 instance example with mandatory governance tags.

Parameters:
  Project:
    Type: String
    Default: custportal
  Environment:
    Type: String
    AllowedValues:
      - prod
      - dev
      - test
      - qa
      - uat
      - shrd
      - sbx
  CostCenter:
    Type: String
    Default: eng-102
  Owner:
    Type: String
    Default: cloud-ops@xceedance.com
  BusinessCriticality:
    Type: String
    AllowedValues:
      - mission-critical
      - high
      - medium
      - low
    Default: high

Resources:
  AppInstance:
    Type: AWS::EC2::Instance
    Properties:
      ImageId: ami-0123456789abcdef0
      InstanceType: t3.micro
      Tags:
        - Key: Name
          Value: !Sub xceed-${Project}-${Environment}-use1-vm-001
        - Key: xceed:cost-center
          Value: !Ref CostCenter
        - Key: xceed:environment
          Value: !Ref Environment
        - Key: xceed:owner
          Value: !Ref Owner
        - Key: xceed:project
          Value: !Ref Project
        - Key: xceed:business-criticality
          Value: !Ref BusinessCriticality
```

### 8.5 AWS CDK Baseline - TypeScript

CDK stacks must apply mandatory tags at the stack or construct scope and ensure resource names are generated from the approved enterprise token model.

```typescript
import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as ec2 from 'aws-cdk-lib/aws-ec2';

export class XceedanceGovernedStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const project = 'custportal';
    const environment = 'dev';
    const regionCode = 'use1';
    const instance = '001';
    const name = `xceed-${project}-${environment}-${regionCode}-vm-${instance}`;

    cdk.Tags.of(this).add('xceed:cost-center', 'eng-102');
    cdk.Tags.of(this).add('xceed:environment', environment);
    cdk.Tags.of(this).add('xceed:owner', 'cloud-ops@xceedance.com');
    cdk.Tags.of(this).add('xceed:project', project);
    cdk.Tags.of(this).add('xceed:business-criticality', 'high');

    new ec2.Instance(this, 'AppInstance', {
      instanceName: name,
      instanceType: ec2.InstanceType.of(ec2.InstanceClass.T3, ec2.InstanceSize.MICRO),
      machineImage: ec2.MachineImage.latestAmazonLinux2023(),
      vpc: ec2.Vpc.fromLookup(this, 'Vpc', { isDefault: true }),
    });
  }
}
```

### 8.6 Pulumi CrossGuard - Python

```python
from pulumi_policy import PolicyPack, ResourceValidationArgs, ResourceValidationPolicy

MANDATORY_TAGS = [
    "xceed:cost-center",
    "xceed:environment",
    "xceed:owner",
    "xceed:project",
    "xceed:business-criticality",
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

### 8.7 Pulumi CrossGuard - C#

```csharp
using Pulumi.Policy;

class GovernancePolicy
{
    static readonly string[] MandatoryTags =
    {
        "xceed:cost-center",
        "xceed:environment",
        "xceed:owner",
        "xceed:project",
        "xceed:business-criticality"
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

### 8.8 Docker Compose Labels

```yaml
services:
  customer-portal-api:
    image: xceed/customer-portal-api:latest
    container_name: xceed-custportal-dev-local-app-001
    labels:
      xceed.project: customer-portal
      xceed.environment: development
      xceed.owner: platform-team
      xceed.cost-center: eng-102
      xceed.business-criticality: low
```

---

## 9. CI/CD Shift-Left Validation

### 9.1 GitHub Actions Naming and Tag Linter

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
          for tag in "xceed:cost-center" "xceed:environment" "xceed:owner" "xceed:project" "xceed:business-criticality"; do
            if ! grep -r "$tag" --include='*.tf' .; then
              echo "ERROR: Missing mandatory tag key in Terraform code: $tag"
              exit 1
            fi
          done
```

---

## 10. Brownfield Discovery and Audit

### 10.1 Multi-Cloud Discovery Approach

Brownfield discovery must be run across all providers before enforcement. The output should be normalized into one compliance report with common fields: provider, account/subscription/project, resource ID, resource type, resource name, region, owner, missing metadata, naming violation, severity, and recommended action.

| Provider | Discovery Method | Output |
|---|---|---|
| Azure | Azure Resource Graph, Azure Policy compliance, PowerShell | Subscription-level CSV or Log Analytics table. |
| AWS | AWS Config, Resource Groups Tagging API, Security Hub | Account-level findings and normalized CSV. |
| GCP | Cloud Asset Inventory, Config Validator, Cloud Logging | Project-level findings and normalized CSV. |

### 10.2 Azure Audit Script

```powershell
$ReportOutput = @()
$MandatoryTags = @(
    "xceed:cost-center",
    "xceed:environment",
    "xceed:owner",
    "xceed:project",
    "xceed:business-criticality"
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

### 10.3 AWS Discovery Command Examples

```bash
aws resourcegroupstaggingapi get-resources \
  --tag-filters Key=xceed:environment \
  --resources-per-page 50
```

Use AWS Config advanced queries to identify resources missing required tags and export findings to Security Hub or the central reporting pipeline.

### 10.4 GCP Discovery Command Examples

```bash
gcloud asset search-all-resources \
  --scope="organizations/ORG_ID" \
  --query="NOT labels.xceed-environment:*" \
  --format="csv(name,assetType,project,location)"
```

### 10.5 Compliance Report Severity

| Severity | Condition | Action |
|---|---|---|
| Severity 1 | Missing owner, environment, or cost center on production resource | Immediate owner assignment and remediation ticket. |
| Severity 2 | Missing compliance-scope or data-classification on regulated workload | Security review within 10 business days. |
| Severity 3 | Naming violation with tags present | Correct on next change window or document exception. |
| Severity 4 | Optional tag missing | Backlog cleanup or module improvement. |

---

## 11. Remediation Strategy

### 11.1 Low-Risk Auto-Tagging

Low-risk resources may be remediated automatically when the source of truth is clear.

| Resource Type | Auto-Tagging Allowed | Source of Truth |
|---|---:|---|
| Child resources under tagged grouping boundary | Yes | Resource group, account, project, folder, deployment stack, or parent compute resource. |
| AWS EC2 instances with tagged Auto Scaling Group | Yes | Auto Scaling Group or account baseline. |
| Network interfaces attached to tagged compute | Yes | Parent compute resource. |
| Managed disks attached to tagged VM | Yes | Parent VM or resource group. |
| Storage accounts / S3 buckets | Conditional | Application owner confirmation or account baseline. |

### 11.2 Mutable vs Immutable Remediation Rule

Tag and label violations are usually mutable and may often be remediated in place. Resource name violations are usually immutable or operationally risky because many cloud services do not support renaming after creation, and renaming may require recreation, DNS changes, endpoint changes, identity changes, data migration, or application reconfiguration.

Brownfield naming violations must follow this rule:

| Violation Type | Default Remediation | Notes |
|---|---|---|
| Missing or incorrect mandatory tags / labels | Remediate in place where safe. | Use policy modify, automation, IaC update, or approved scripts. |
| Incorrect owner, environment, cost-center, or project metadata | Remediate in place after owner validation. | Production and regulated workloads require owner confirmation. |
| Non-compliant resource name on existing brownfield resource | Document, alias, or fix during planned replacement. | Do not recreate solely for naming compliance without approved migration plan. |
| Non-compliant name on disposable sandbox resource | Recreate with compliant name or delete by expiry date. | Sandbox resources should not receive long-lived naming exceptions. |
| Non-compliant name on high-risk stateful resource | Create exception and remediate during lifecycle event. | Examples: database migration, platform upgrade, disaster recovery rebuild, major release. |

For existing brownfield resources, naming violations must be tracked as compliance debt. They may be accepted temporarily if the resource has correct mandatory metadata, a documented owner, and an approved exception or planned retirement path.

### 11.3 High-Risk Flag-and-Report

High-risk resources must not be auto-remediated without manual review.

| Resource Type | Reason For Manual Review |
|---|---|
| Production SQL / NoSQL databases | Metadata may drive backup, retention, access, or compliance automation. |
| IAM roles, policies, service accounts, managed identities | Metadata may affect ABAC, permissions, or security automation. |
| Root VNets, VPCs, subnets, firewalls, DNS zones | Incorrect metadata may affect network isolation and incident routing. |
| Key vaults, KMS keys, secrets services | Incorrect classification may affect access control and audit scope. |
| PCI or PHI workloads | Regulatory classification must be validated by security and compliance teams. |

### 11.4 Exception Process

When a resource cannot comply due to provider limitations, vendor constraints, or legacy application dependencies, the owner must follow this process:

1. Submit a governance exception request in the enterprise tracking system.
2. Provide all required exception fields listed below.
3. Cloud Architecture reviews the technical constraint.
4. Security reviews the risk.
5. FinOps reviews cost allocation impact.
6. Approved exceptions must receive the governance-exception metadata key and an expiry date.
7. Expired exceptions are treated as non-compliant.

Required exception fields:

| Field | Required | Description |
|---|---:|---|
| `exception-id` | Yes | Unique exception tracking ID from the enterprise tracking system. |
| `resource-id` | Yes | Full cloud resource ID, ARN, GCP resource name, or IaC resource address. |
| `owner` | Yes | Accountable workload owner or team distribution list. |
| `reason` | Yes | Clear explanation of why the resource cannot comply. |
| `risk` | Yes | Risk rating and impact statement for approving the exception. |
| `expiry-date` | Yes | Date when the exception expires and must be remediated or renewed. |
| `approver` | Yes | Named approver from Cloud Governance, Security, or delegated authority. |
| `compensating-control` | Yes | Control that reduces risk while the exception remains active. |
| `status` | Yes | Current exception lifecycle state. |

Approved exception statuses:

| Status | Meaning |
|---|---|
| `requested` | Exception has been submitted but not reviewed. |
| `under-review` | Cloud Architecture, Security, or FinOps review is in progress. |
| `approved` | Exception is approved until the defined expiry date. |
| `rejected` | Exception is not approved and the resource must be remediated. |
| `expired` | Exception has passed its expiry date and is non-compliant. |
| `remediated` | Exception is closed because the resource now complies. |

Exception SLA requirements:

| Severity / Context | Review SLA | Renewal Rule |
|---|---|---|
| Production, PCI, PHI, or identity resource | Review within 5 business days. | Renewal requires Security approval. |
| Non-production high-risk resource | Review within 10 business days. | Renewal requires Cloud Governance approval. |
| Low-risk sandbox or temporary resource | Review within 15 business days. | Renewal allowed once, then remediation is required. |

Exception records must be included in monthly governance reporting and reviewed during each quarterly policy review.

---

## 12. Monitoring, Reporting, and Alerting

### 12.1 Required Integrations

| Platform | Signal Source | Destination |
|---|---|---|
| Azure | Azure Policy compliance, Activity Log, Resource Graph | Azure Monitor, Log Analytics, Datadog |
| AWS | AWS Config, Security Hub, CloudTrail, Resource Groups Tagging API | Security Hub, EventBridge, Datadog |
| GCP | Cloud Asset Inventory, Cloud Logging, Config Validator outputs | Cloud Monitoring, Pub/Sub, Datadog |

### 12.2 Required Dashboards

| Dashboard | Required Metrics |
|---|---|
| Executive compliance | Overall compliance percentage, production compliance, high-risk open items. |
| FinOps | Untagged spend, spend by project, spend by cost center, spend by owner. |
| Security | Missing compliance-scope, missing data-classification, regulated workload drift. |
| Platform engineering | Violations by IaC module, pull request failures, policy deny counts. |

### 12.3 Alert Routing

| Condition | Routing |
|---|---|
| Production resource missing owner or cost center | Page or high-priority ticket to workload owner and platform team. |
| PCI or PHI resource missing compliance metadata | Security incident queue and compliance owner. |
| Repeated CI/CD naming failures | DevOps team and repository owner. |
| Exception expiring within 14 days | Resource owner and governance review board. |

---

## 13. Implementation Roadmap

| Phase | Duration | Activity | Exit Criteria |
|---|---|---|---|
| 1. Prepare | Weeks 1-2 | Approve taxonomy, owners, cost centers, region map, resource prefix matrix. | Policy approved and source-of-truth lists published. |
| 2. Discover | Weeks 2-4 | Run inventory scans and native audit policies. | Compliance gap report created for all providers. |
| 3. Socialize | Weeks 4-6 | Distribute findings to owners and create remediation backlog. | Owners assigned for all Severity 1 and 2 items. |
| 4. Soft launch | Weeks 6-8 | Enable audit mode and CI/CD warnings. | False positives reviewed and policy logic corrected. |
| 5. Remediate | Weeks 8-12 | Auto-tag low-risk resources and manually review high-risk resources. | Production compliance reaches at least 95 percent. |
| 6. Enforce | Week 12 onward | Enable deny mode for greenfield deployments. | Non-compliant deployments are blocked. |
| 7. Maintain | Ongoing | Weekly drift detection, monthly reporting, quarterly review. | Compliance remains above target threshold. |

### 13.1 Detailed Rollout Plan

| Step | Owner | Action | Output |
|---|---|---|---|
| 1 | Cloud Governance | Confirm the enterprise naming formula, tag dictionary, allowed values, and provider-specific translations. | Approved policy baseline. |
| 2 | FinOps | Publish the authoritative cost-center list and cost-center owner mapping. | Cost-center registry. |
| 3 | Security | Publish regulated workload classifications and allowed compliance-scope values. | Classification registry. |
| 4 | Platform Engineering | Build naming and tagging helpers into Terraform/OpenTofu, Bicep, CloudFormation/CDK, Deployment Manager equivalents, and Pulumi templates. | Golden IaC modules. |
| 5 | Platform Engineering | Add validation to CI/CD pipelines and make violations visible before blocking. | Warning-only pipeline checks. |
| 6 | Cloud Governance | Run Azure Policy, AWS Config, GCP Cloud Asset Inventory, and policy validation checks across brownfield environments. | Multi-cloud compliance baseline. |
| 7 | Application Owners | Confirm owner, project, environment, and cost-center mapping for each workload. | Signed-off workload inventory. |
| 8 | Platform Engineering | Auto-remediate low-risk resources using approved inheritance logic. | Reduced compliance debt. |
| 9 | Security and Cloud Governance | Review high-risk resources and approve manual updates or exceptions. | Risk-accepted remediation backlog. |
| 10 | Cloud Governance | Switch greenfield scopes from audit/warn to deny/block. | Enforced policy boundary. |
| 11 | Platform Engineering | Restrict manual portal and CLI deployments or require policy-compliant wrappers. | Reduced bypass risk. |
| 12 | Cloud Governance | Publish monthly scorecards and exception expiry reports. | Sustained governance operating rhythm. |

### 13.2 Enforcement Maturity Model

| Maturity Level | Description | Expected State |
|---|---|---|
| Level 1 - Documented | Policy exists, but compliance depends on manual team behavior. | Acceptable only during initial rollout. |
| Level 2 - Visible | Audit reports and dashboards identify non-compliance. | Minimum brownfield target. |
| Level 3 - Guided | IaC modules and CI/CD warnings guide teams toward compliance. | Minimum development target. |
| Level 4 - Enforced | Native cloud policies and CI/CD gates block non-compliant greenfield deployments. | Minimum production target. |
| Level 5 - Optimized | Exceptions expire automatically, remediation is automated where safe, and policy metrics feed FinOps and security reviews. | Enterprise steady state. |

### 13.3 Communication Plan

| Audience | Message | Timing |
|---|---|---|
| Executive sponsors | Policy reduces unallocated spend, ownership gaps, audit friction, and incident response time. | Before Phase 1 approval. |
| Application owners | Existing resources will be audited first; new deployments will later be blocked if non-compliant. | Before Phase 2 discovery. |
| DevOps teams | Use approved IaC modules and pipeline templates to avoid policy failures. | Before Phase 4 soft launch. |
| Security and compliance | Regulated workload metadata will drive audit and monitoring workflows. | Before Phase 5 remediation. |
| Service desk / operations | Incident routing will use owner and business-criticality metadata. | Before Phase 6 enforcement. |

### 13.4 Training and Enablement

Platform Engineering must provide:

1. A one-page quick reference for naming tokens and mandatory tags.
2. Approved Terraform/OpenTofu, Bicep, CloudFormation/CDK, GCP, and Pulumi examples.
3. A migration guide for legacy resources.
4. A troubleshooting guide for policy-denied deployments.
5. An exception request template.

---

## 14. Roles and Responsibilities

| Role | Responsibilities |
|---|---|
| Cloud Governance Team | Owns this policy, policy definitions, compliance scorecards, and exception process. |
| Platform Engineering | Implements IaC modules, CI/CD checks, and remediation automation. |
| Security Team | Reviews regulated workloads, ABAC implications, and high-risk exceptions. |
| FinOps Team | Owns cost-center taxonomy and validates chargeback reporting. |
| Application Owner | Ensures workload resources have correct project, owner, and environment metadata. |
| DevOps Team | Applies naming and tagging standards in deployment pipelines. |

---

## 15. Acceptance Criteria

| ID | Acceptance Criteria |
|---|---|
| AC-001 | New Azure, AWS, and GCP resources without mandatory metadata are blocked or flagged according to the enforcement maturity of the target environment. |
| AC-002 | Provider-native audit controls identify missing metadata across Azure subscriptions, AWS accounts, and GCP projects. |
| AC-003 | Provider-specific key translation works correctly, including GCP label-safe keys. |
| AC-004 | Terraform modules generate compliant names and mandatory tags by default. |
| AC-005 | CI/CD validation fails pull requests that introduce uppercase resource names or omit mandatory tags. |
| AC-006 | Brownfield audit reports identify missing tags and naming violations without downtime. |
| AC-007 | Low-risk auto-tagging does not restart, delete, recreate, or interrupt resources. |
| AC-008 | High-risk resources create manual review tickets instead of automated changes. |
| AC-009 | Monthly billing reports show less than 1 percent unallocated cloud spend. |
| AC-010 | Compliance dashboards show production compliance at or above 95 percent. |
| AC-011 | The enterprise taxonomy registry is approved and published before deny-mode enforcement begins. |
| AC-012 | Golden IaC modules are published for the approved deployment stacks before application teams are required to comply. |
| AC-013 | Executive, FinOps, Security, and Platform Engineering dashboards are live before enforcement metrics are reported to leadership. |
| AC-014 | The governance exception process is operational with required fields, statuses, SLAs, and expiry reporting. |
| AC-015 | All deny-mode policies are tested in audit mode and reviewed for false positives before being enabled in production or shared-service scopes. |
| AC-016 | Direct portal, console, and unrestricted CLI create/update/delete actions are monitored and generate alerts when they bypass approved deployment pipelines. |

---

## 16. Known Pitfalls and Mitigation Strategies

| Pitfall | Impact | Mitigation |
|---|---|---|
| Treating the policy as documentation only | Teams continue to deploy inconsistent resources. | Convert standards into IaC modules, CI/CD gates, and cloud-native policy assignments. |
| Enforcing deny mode too early | Production deployments may fail unexpectedly and teams may bypass governance. | Start with audit mode, review false positives, communicate enforcement dates, and enforce greenfield before brownfield. |
| Over-standardizing names across services | Some provider services have incompatible length or character constraints. | Maintain an exception matrix and flattened-name rule for constrained services. |
| Using colon-based tag keys in GCP labels | GCP label validation fails. | Use provider-specific key mapping: `xceed:cost-center` becomes `xceed-cost-center` in GCP. |
| Assuming tags inherit automatically everywhere | Child resources may remain untagged, causing billing and ownership gaps. | Use IaC defaults, provider-specific remediation automation, and runtime scans to verify inheritance. |
| Auto-tagging high-risk resources | Incorrect metadata may trigger wrong security, backup, retention, or compliance behavior. | Restrict auto-tagging to low-risk resources and route high-risk resources to manual review. |
| Inconsistent cost-center source data | Chargeback reports become unreliable. | Make FinOps the owner of an authoritative cost-center registry. |
| Owner tags referencing individuals | Ownership breaks when people change roles. | Require team distribution lists or service ownership groups. |
| Manual portal or CLI deployments bypass IaC | Resources appear outside the standard. | Restrict manual deployment permissions, monitor activity logs, and enforce native cloud policies. |
| Tag value drift across providers | Reports fragment across `prod`, `production`, `prd`, and similar variants. | Use allowed-value lists and provider policy engines. |
| Naming formula exceeds service limits | Deployments fail for constrained services such as Windows VMs or globally named services. | Use project abbreviations, provider-specific overrides, and tags for extra metadata. |
| Sensitive information in names or tags | Data leakage into logs, billing exports, and dashboards. | Explicitly prohibit secrets, PHI, PCI, customer identifiers, and personal data in names and tags. |
| Dashboards without accountability | Compliance reports exist but no one fixes issues. | Route violations to workload owners with SLA, severity, and escalation rules. |
| Exceptions never expire | Policy weakens over time. | Require expiry dates, quarterly review, and automatic alerts before expiry. |
| Service-specific AWS request-tag behavior differs | SCP or IAM conditions may not work uniformly across all services. | Validate enforcement per service action before broad rollout. |

---

## 17. Review Cadence

This policy must be reviewed quarterly by Cloud Governance, Security, FinOps, and Platform Engineering. Updates are required when cloud provider naming constraints change, new resource types are adopted, regulatory scope changes, or enforcement creates material false positives.
