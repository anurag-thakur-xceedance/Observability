# Step 11: IAC Suggester Reviewer

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 11 |
| **Phase** | Architecture & Design |
| **Previous Step** | Step 10: Architecture Design |
| **Next Step** | Step 12: Design and Implementation |
| **Responsible Role(s)** | AI/Automation, DevOps Engineer |
| **Tools** | IAC Suggester, Pulumi |

---

## Purpose

AI-powered Infrastructure as Code (IAC) suggestions and review. This augmented step analyses architecture designs and suggests appropriate infrastructure configurations using Pulumi and other IAC tools. The IAC Suggester accelerates infrastructure provisioning while ensuring best practices and security compliance.

---

## Process Flow

```mermaid graph TD A[Architecture Design] --> B[11.1 Architecture Analysis] B --> C[11.2 IAC Suggestion Generation] C --> D[11.3 Best Practice Validation] D --> E[11.4 Security Configuration Review] E --> F[11.5 Human Review] F --> G{Approved?} G -->|Yes| H[IAC Code Ready] G -->|Needs Changes| C H --> I[Implementation Phase] ```

---

## Inputs

| Input | Source | Description |
| --- | --- | --- |
| Solution Architecture | Step 10 | Detailed solution architecture |
| Component Designs | Step 10 | Component specifications |
| Existing IAC | Repository | Current infrastructure code |
| Best Practices | Knowledge Base | IAC best practices |

---

## Activities

### 11.1 Architecture Analysis

**Owner:** AI/Automation
**Duration:** 10-15 minutes (automated)

#### Process Steps:

1. **Parse Architecture Documentation**

- Extract infrastructure requirements from: - Solution Architecture Document (Step 10.1) - Component Designs (Step 10.2) - Integration Specifications (Step 10.3) - Data Architecture (Step 10.4) - Identify key infrastructure needs: - Compute resources (VMs, containers, serverless) - Storage requirements (databases, blob storage, file shares) - Networking components (VNets, load balancers, gateways) - Security resources (Key Vault, managed identities, firewalls) - Monitoring and observability (App Insights, Log Analytics)

1. **Identify Infrastructure Components**

- Catalog required Azure resources: - **Compute:** App Services, Container Instances, AKS, Functions - **Database:** Azure SQL, Cosmos DB, PostgreSQL, Redis Cache - **Storage:** Blob Storage, File Storage, Queue Storage - **Networking:** Virtual Network, Application Gateway, Load Balancer, Private Endpoints - **Security:** Key Vault, Managed Identity, Azure AD - **DevOps:** Container Registry, Azure DevOps or Jira - **Monitoring:** Application Insights, Log Analytics Workspace - Map components to architecture: - Link resources to architecture components - Identify resource dependencies - Determine resource grouping

1. **Analyze Non-Functional Requirements**

- Extract NFR implications for infrastructure: - **Performance:** SKU/tier selections, caching strategy, CDN needs - **Scalability:** Auto-scaling configuration, load balancing approach - **Availability:** Multi-region deployment, redundancy, backup strategy - **Security:** Network isolation, encryption requirements, access control - **Cost:** Resource sizing, reserved instances, optimization opportunities - Quantify requirements: - Expected traffic/load (requests per second, concurrent users) - Data volume (storage size, data transfer) - Uptime requirements (99.9%, 99.95%, 99.99%) - Performance targets (latency, throughput)

1. **Review Existing Infrastructure**

- Analyze current IAC codebase: - Existing Pulumi stacks and resources - Current naming conventions - Existing resource configurations - Shared infrastructure (networks, resource groups) - Identify reusable resources: - Shared VNets and subnets - Common Key Vaults - Centralized monitoring - Shared container registries - Detect infrastructure patterns: - Standard resource configurations - Common security settings - Established naming patterns

1. **Determine Environment Strategy**

- Define environment requirements: - **Development:** Lower SKUs, single region, relaxed security - **Staging:** Production-like, single region, production security - **Production:** High availability, multi-region, full security - Plan environment-specific configurations: - Resource sizing per environment - Scaling policies per environment - Backup and DR strategy per environment - Cost optimization per environment

1. **Generate Infrastructure Requirements Report**

- Compile comprehensive analysis: - Required resources by category - Resource dependencies and relationships - Environment strategy - NFR mappings to infrastructure - Reusability opportunities - Estimated costs

**Infrastructure Requirements Report Template:**

| Component | Azure Resource | SKU/Tier | Quantity | Rationale | Estimated Cost |
| --- | --- | --- | --- | --- | --- |
| Auth Service | App Service | S1 (Standard) | 1 per env | Supports auto-scaling, deployment slots | $73/month |
| Auth Database | Azure SQL | S2 (Standard) | 1 per env | 50 DTUs sufficient for 10K users | $149/month |
| Session Cache | Redis Cache | C1 (Basic) | 1 per env | 1GB cache for sessions | $39/month |
| API Gateway | API Management | Developer | 1 | Dev tier for non-prod | $50/month |
| Storage | Blob Storage | Standard LRS | 1 per env | General purpose v2 | $21/TB/month |

**Environment Strategy:**

| Resource | Development | Staging | Production |
| --- | --- | --- | --- |
| App Service | B1 (Basic) | S1 (Standard) | P2v3 (Premium) with 3 instances |
| Azure SQL | Basic (5 DTU) | S2 (50 DTU) | S4 (200 DTU) with geo-replication |
| Redis Cache | C0 (250MB) | C1 (1GB) | C3 (6GB) with clustering |
| Backup | 7 days | 14 days | 30 days with geo-redundancy |

---

### 11.2 IAC Suggestion Generation

**Owner:** AI/Automation
**Duration:** 15-20 minutes (automated)

#### Process Steps:

1. **Generate Pulumi Infrastructure Code**

- Create Pulumi program structure: - Choose language (TypeScript, Python, C#, Go) - Define stack configuration - Set up resource providers (Azure, AWS, GCP) - Generate resource definitions: - Resource groups and organization - Compute resources with configurations - Networking with security groups - Data storage with backup policies - Security resources (Key Vault, identities) - Apply naming conventions: - Use consistent naming patterns - Include environment in names - Follow organization standards

1. **Configure Resource Dependencies**

- Define implicit dependencies: - Pulumi automatically tracks resource references - Ensure correct provisioning order - Define explicit dependencies: - Use `dependsOn` when needed - Handle circular dependencies - Set up resource creation sequencing - Configure connection strings and endpoints: - Use output references between resources - Store secrets in Key Vault - Configure managed identities

1. **Generate Configuration Management**

- Create stack configuration files: - Dev stack config (Pulumi.dev.yaml) - Staging stack config (Pulumi.staging.yaml) - Production stack config (Pulumi.production.yaml) - Define configuration parameters: - Environment-specific values - Secret configurations (encrypted) - Feature flags - Scaling parameters - Implement configuration inheritance: - Base configuration - Environment overlays

1. **Apply IAC Best Practices**

- Implement modularity: - Create reusable component resources - Package common patterns - Use Pulumi component models - Apply DRY principle: - Avoid duplicated resource definitions - Use loops for similar resources - Create helper functions - Enable tagging: - Environment tags - Cost center tags - Owner/team tags - Purpose/application tags

1. **Generate Networking Configuration**

- Create network topology: - Virtual networks and address spaces - Subnets for different tiers (web, app, data) - Network security groups (NSGs) - Route tables - Configure connectivity: - Private endpoints for PaaS services - Service endpoints - VNet peering if needed - VPN or ExpressRoute for hybrid - Apply network security: - NSG rules (allow/deny traffic) - Application Security Groups (ASGs) - DDoS protection - Web Application Firewall (WAF)

1. **Include Observability Configuration**

- Configure monitoring resources: - Application Insights for APM - Log Analytics Workspace for logs - Storage account for diagnostics - Enable diagnostic settings: - Logs for all resources - Metrics collection - Retention policies - Set up alerting: - Action groups for notifications - Alert rules for critical metrics - Auto-scaling triggers

**Pulumi Code Example (TypeScript):**

```typescript import \* as pulumi from "@pulumi/pulumi"; import \* as azure from "@pulumi/azure-native";

// Configuration const config = new pulumi.Config(); const environment = pulumi.getStack(); const location = config.require("location");

// Resource Group const resourceGroup = new azure.resources.ResourceGroup("rg-auth-service", { resourceGroupName: `rg-auth-service-${environment}`, location: location, tags: { environment: environment, application: "auth-service", managedBy: "pulumi" } });

// App Service Plan const appServicePlan = new azure.web.AppServicePlan("plan-auth-service", { name: `plan-auth-service-${environment}`, resourceGroupName: resourceGroup.name, location: location, sku: { name: config.get("appServiceSku") || "S1", tier: "Standard", }, kind: "linux", reserved: true, });

// Application Insights const appInsights = new azure.insights.Component("ai-auth-service", { resourceName: `ai-auth-service-${environment}`, resourceGroupName: resourceGroup.name, location: location, kind: "web", applicationType: "web", });

// Azure SQL Server const sqlServer = new azure.sql.Server("sql-auth", { serverName: `sql-auth-${environment}-${pulumi.getStack()}`, resourceGroupName: resourceGroup.name, location: location, administratorLogin: config.requireSecret("sqlAdminUsername"), administratorLoginPassword: config.requireSecret("sqlAdminPassword"), version: "12.0", });

// Azure SQL Database const sqlDatabase = new azure.sql.Database("sqldb-auth", { databaseName: `sqldb-auth-${environment}`, resourceGroupName: resourceGroup.name, serverName: sqlServer.name, location: location, sku: { name: "S2", tier: "Standard", }, });

// Redis Cache const redisCache = new azure.cache.Redis("redis-auth", { name: `redis-auth-${environment}`, resourceGroupName: resourceGroup.name, location: location, sku: { name: "Basic", family: "C", capacity: 1, }, enableNonSslPort: false, minimumTlsVersion: "1.2", });

// App Service const appService = new azure.web.WebApp("app-auth-service", { name: `app-auth-service-${environment}`, resourceGroupName: resourceGroup.name, location: location, serverFarmId: appServicePlan.id, siteConfig: { linuxFxVersion: "DOTNET|8.0", alwaysOn: true, appSettings: [ { name: "APPINSIGHTS\_INSTRUMENTATIONKEY", value: appInsights.instrumentationKey, }, { name: "ConnectionStrings\_\_DefaultConnection", value: pulumi.interpolate`Server=${sqlServer.fullyQualifiedDomainName};Database=${sqlDatabase.name};User Id=${config.requireSecret("sqlAdminUsername")};Password=${config.requireSecret("sqlAdminPassword")};`, }, { name: "Redis\_\_ConnectionString", value: pulumi.interpolate`${redisCache.hostName}:6380,password=${redisCache.primaryKey},ssl=True,abortConnect=False`, }, ], }, httpsOnly: true, });

// Exports export const appServiceUrl = pulumi.interpolate`https://${appService.defaultHostName}`; export const sqlServerFqdn = sqlServer.fullyQualifiedDomainName; export const redisHostName = redisCache.hostName; ```

**Stack Configuration Example (Pulumi.production.yaml):**

```yaml config: azure-native:location: East US auth-service:appServiceSku: P2v3 auth-service:sqlAdminUsername: secure: AAABAxxxx... # encrypted auth-service:sqlAdminPassword: secure: AAABAyyyy... # encrypted auth-service:enableAutoScaling: true auth-service:minInstances: 3 auth-service:maxInstances: 10 ```

---

### 11.3 Best Practice Validation

**Owner:** AI/Automation
**Duration:** 10-15 minutes (automated)

#### Process Steps:

1. **Validate Naming Conventions**

- Check resource naming: - Follows organization standards - Includes environment identifier - Uses Azure naming conventions - Avoids name conflicts - Validate naming patterns: - Resource type prefix (rg-, app-, sql-, etc.) - Application/service name - Environment suffix - Region (if multi-region) - Example: `rg-auth-service-prod-eastus`

1. **Validate Resource Configuration**

- Check SKU/tier selections: - Appropriate for environment and load - Cost-optimized for non-production - Sufficient for production SLAs - Validate scaling configuration: - Auto-scaling enabled for production - Appropriate min/max instance counts - Correct scaling triggers - Check redundancy and availability: - Zone redundancy where applicable - Geo-replication for critical data - Multiple instances for high availability

1. **Validate Security Best Practices**

- Check encryption settings: - Encryption at rest enabled - TLS/SSL enforced (minimum TLS 1.2) - Transparent Data Encryption (TDE) for databases - Validate network security: - Public access disabled where possible - Private endpoints used for PaaS services - NSG rules follow least privilege - No overly permissive rules (0.0.0.0/0) - Check identity and access: - Managed identities used (not service principals) - Azure AD authentication enabled - Least privilege access - Key Vault for secret management

1. **Validate Compliance Requirements**

- Check regulatory compliance: - Data residency requirements met - Audit logging enabled - Data retention policies configured - Compliance tags applied - Validate backup and DR: - Backup policies configured - Point-in-time recovery enabled - Geo-redundancy for critical data - DR procedures documented

1. **Validate Cost Optimization**

- Check resource sizing: - Not over-provisioned - Right-sized for workload - Reserved instances considered for production - Validate cost controls: - Budget alerts configured - Cost tags applied - Auto-shutdown for non-prod (if applicable) - Orphaned resources cleaned up

1. **Generate Validation Report**

- Compile findings: - Passed validations - Warning items (should fix) - Critical issues (must fix) - Recommendations for improvement - Provide remediation guidance: - Specific actions to resolve issues - Code snippets or examples - Links to documentation

**Best Practice Validation Report Template:**

| Check Category | Rule | Status | Severity | Details | Recommendation |
| --- | --- | --- | --- | --- | --- |
| Naming | Resource names include environment | ✅ Pass | - | All resources properly named | - |
| Security | TLS 1.2 minimum | ✅ Pass | - | All services configured for TLS 1.2+ | - |
| Security | Public access disabled | ⚠️ Warning | Medium | Storage account allows public access | Enable firewall, use private endpoints |
| Security | Managed Identity used | ❌ Fail | High | App Service uses connection string for SQL | Use managed identity authentication |
| Cost | Right-sized for environment | ✅ Pass | - | Dev uses lower SKUs, prod appropriately sized | - |
| Availability | Multi-instance production | ⚠️ Warning | Medium | Only 2 instances configured | Increase to 3+ for HA |
| Compliance | Backup configured | ✅ Pass | - | 30-day backup retention | - |

**Summary:**

- ✅ **Passed:** 12 checks
- ⚠️ **Warnings:** 3 checks (should address)
- ❌ **Failed:** 1 check (must fix before deployment)

---

### 11.4 Security Configuration Review

**Owner:** AI/Automation with Security Team Consultation
**Duration:** 15-20 minutes (automated + manual review)

#### Process Steps:

1. **Analyze Authentication and Authorization**

- Review identity configuration: - Managed identities properly configured - Azure AD integration enabled - RBAC roles assigned (least privilege) - Service principals minimized - Check authorization models: - Role-Based Access Control (RBAC) implemented - Custom roles if needed - Separation of duties enforced - Admin access limited and audited

1. **Review Network Security Configuration**

- Validate network isolation: - VNet integration for App Services - Private endpoints for PaaS services - Subnet segmentation (web, app, data tiers) - Network peering properly configured - Review firewall rules: - NSG rules documented and justified - Application Security Groups used - No wildcard allow rules - Deny-by-default approach - Check traffic encryption: - HTTPS enforced (HTTP disabled) - TLS 1.2+ minimum - Certificate management automated

1. **Validate Data Protection**

- Check encryption at rest: - TDE enabled for databases - Storage encryption enabled - Disk encryption for VMs - Customer-managed keys if required - Validate encryption in transit: - TLS for all connections - Encrypted connection strings - No plaintext secrets - Review data classification: - PII data identified - Sensitive data encrypted - Data retention policies applied

1. **Review Secrets Management**

- Validate Key Vault usage: - All secrets stored in Key Vault - No hardcoded secrets in code - Key Vault access logged - Soft-delete enabled - Check secret rotation: - Rotation policies defined - Automated rotation where possible - Expiration dates set - Review access policies: - Least privilege access - Managed identities preferred - Access audited regularly

1. **Validate Logging and Monitoring**

- Check audit logging: - Diagnostic settings enabled for all resources - Logs sent to Log Analytics - Retention meets compliance requirements - Activity logs monitored - Review security monitoring: - Azure Security Center enabled - Threat detection configured - Alerts for security events - SIEM integration (if applicable) - Validate access logs: - Key Vault access logged - Database access logged - Failed authentication attempts logged

1. **Generate Security Findings Report**

- Document security issues: - Critical vulnerabilities (must fix immediately) - High-risk issues (fix before production) - Medium-risk issues (address soon) - Low-risk items (consider improvements) - Provide remediation steps: - Specific configuration changes - Code modifications needed - Architectural changes required - Include compliance notes: - Regulatory requirements met/not met - Industry standards compliance (CIS, NIST) - Audit preparation recommendations

**Security Configuration Review Template:**

### Critical Security Findings

| Finding | Risk Level | Description | Impact | Remediation |
| --- | --- | --- | --- | --- |
| Connection string in code | 🔴 Critical | SQL connection string stored in app config | Credential exposure risk | Use Managed Identity for authentication |
| Storage public access | 🟠 High | Blob storage allows anonymous access | Data exposure risk | Enable firewall, require authentication |
| No WAF configured | 🟡 Medium | Application Gateway without WAF | OWASP Top 10 vulnerabilities | Enable WAF with OWASP ruleset |

### Security Checklist

**Identity & Access:**

- [x] Managed identities configured for all app services
- [ ] Azure AD authentication enabled for SQL (use managed identity)
- [x] RBAC roles assigned with least privilege
- [x] Key Vault soft-delete enabled

**Network Security:**

- [x] Private endpoints configured for SQL and Redis
- [ ] App Service VNet integration (missing for dev environment)
- [x] NSG rules follow least privilege
- [x] HTTPS enforced, HTTP disabled

**Data Protection:**

- [x] TDE enabled for SQL databases
- [x] Storage encryption enabled
- [x] TLS 1.2 minimum enforced
- [ ] Customer-managed keys (required for production only)

**Secrets Management:**

- [ ] All secrets moved to Key Vault (2 connection strings still in app config)
- [x] Key Vault access policies configured
- [x] Secret expiration dates set
- [ ] Automated secret rotation (not configured)

**Monitoring & Compliance:**

- [x] Diagnostic settings enabled
- [x] Azure Security Center enabled
- [x] Alert rules for security events
- [x] 30-day log retention (meets compliance)

**Overall Security Score:** 82/100 (Good, but address critical findings)

---

### 11.5 Human Review

**Owner:** DevOps Engineer / Infrastructure Lead
**Duration:** 1-2 hours

#### Process Steps:

1. **Review AI-Generated IAC Code**

- Examine Pulumi code quality: - Code structure and organization - Naming conventions followed - Comments and documentation - Modularity and reusability - Validate resource configurations: - SKU/tier selections appropriate - Scaling parameters reasonable - Networking configuration correct - Dependencies properly defined - Check for errors or omissions: - Missing resources - Incorrect configurations - Syntax errors or typos

1. **Validate Against Architecture**

- Cross-reference with architecture design: - All architecture components covered - Infrastructure matches design intent - Integration points properly configured - Data flow requirements met - Verify NFR implementation: - Performance requirements addressed - Scalability approach correct - Availability/redundancy implemented - Security requirements met - Check for architecture drift: - Existing resources considered - Migration path planned - Backward compatibility maintained

1. **Review Best Practice and Security Findings**

- Assess validation report: - Agree/disagree with findings - Prioritize remediation items - Accept documented exceptions - Review security findings: - Validate severity ratings - Confirm remediation steps - Plan security improvements - Document accepted risks - Apply organizational policies: - Company-specific security requirements - Compliance mandates - Cost governance rules

1. **Estimate Implementation Effort**

- Calculate deployment time: - Initial provisioning time - Configuration complexity - Testing and validation effort - Identify risks and dependencies: - External dependencies (network team, security team) - Approval gates - Change management requirements - Potential issues or blockers - Plan rollout strategy: - Environment deployment order (dev → staging → prod) - Blue/green or canary approach - Rollback plan

1. **Modify and Refine IAC Code**

- Make necessary adjustments: - Fix critical issues identified - Address security findings - Optimize resource configurations - Add missing components - Apply team preferences: - Use preferred naming conventions - Apply team code standards - Add team-specific configurations - Document changes: - Reasons for deviations from AI suggestions - Custom configurations added - Accepted exceptions

1. **Approve and Document**

- Grant approval or request changes: - Approve if ready to proceed - Request AI regeneration if significant issues - Document manual changes made - Update work items: - Link IAC code to work items - Document infrastructure decisions - Note estimated costs - Prepare for implementation: - Create implementation checklist - Assign deployment tasks - Schedule deployment windows

**Human Review Checklist:**

| Review Area | Status | Approved? | Issues Found | Actions Taken |
| --- | --- | --- | --- | --- |
| Code Quality | ✅ Reviewed | ✅ Yes | Minor: inconsistent spacing | Fixed formatting |
| Resource Config | ✅ Reviewed | ⚠️ Partial | Dev env over-provisioned | Reduced dev SKUs |
| Architecture Alignment | ✅ Reviewed | ✅ Yes | None | - |
| Security Findings | ✅ Reviewed | ⚠️ Partial | Critical: connection string in code | Fixed: using managed identity |
| Best Practices | ✅ Reviewed | ✅ Yes | None | - |
| Cost Estimate | ✅ Reviewed | ✅ Yes | None | Estimated $850/month for prod |

**Approval Decision:**

- **Status:** ✅ Approved with modifications
- **Approved By:** Jane Smith (DevOps Lead)
- **Date:** March 10, 2026
- **Critical Issues Resolved:** 1 (managed identity implemented)
- **Modifications Made:** Dev environment resource sizing optimized
- **Next Steps:** Deploy to dev environment for validation

**Deployment Plan:**

1. Deploy to Dev (Week 1)
2. Validate and test (Week 1-2)
3. Deploy to Staging (Week 2)
4. Production deployment (Week 3)

---



---

## Best Practices

### ✅ DO

- **Review AI-generated IAC before deploying** - Always validate infrastructure code with human expertise
- **Use managed identities over secrets** - Eliminate credential management where possible
- **Implement least privilege access** - Grant minimum permissions required
- **Enable encryption by default** - Both at rest and in transit (TLS 1.2+)
- **Use private endpoints for PaaS** - Avoid public internet exposure
- **Tag all resources consistently** - Environment, cost center, owner, application
- **Implement infrastructure as code** - Never manually create production resources
- **Version control all IAC** - Track changes and enable rollback
- **Use environment-specific configs** - Separate dev, staging, production configurations
- **Enable diagnostic logging** - Monitor all infrastructure resources
- **Validate before deployment** - Test IAC in non-production first
- **Document infrastructure decisions** - Explain why resources configured this way

### ❌ DON'T

- **Hardcode secrets in IAC** - Use Key Vault and configuration management
- **Use admin credentials in code** - Prefer managed identities and RBAC
- **Allow public access by default** - Use private endpoints and network isolation
- **Skip security validation** - Address critical security findings before deployment
- **Over-provision resources** - Right-size for actual needs, especially non-prod
- **Ignore cost estimates** - Review and approve infrastructure costs
- **Deploy directly to production** - Always test in lower environments first
- **Use outdated TLS versions** - Enforce TLS 1.2 minimum, prefer 1.3
- **Forget about DR and backup** - Configure backup and disaster recovery from start
- **Skip tagging** - Tags are essential for cost management and organization

---

## Outputs

| Output | Destination | Description |
| --- | --- | --- |
| IAC Suggestions | DevOps Engineer | Suggested infrastructure code |
| Configuration Recommendations | Step 12 | Infrastructure configuration guidance |
| Security Findings | Security Team | Security configuration issues |

---

## Quality Gates / Exit Criteria

- [ ] Architecture analysed for infrastructure needs
- [ ] IAC suggestions generated
- [ ] Best practices validated
- [ ] Security configurations reviewed
- [ ] Suggestions reviewed by DevOps engineer

---

## AI/Automation Augmentation

| Capability | Tool/Service | Description |
| --- | --- | --- |
| IAC Suggester/Reviewer | WorkItem Intelligence | AI-powered IAC suggestions |
| IAC (Pulumi) | Pulumi | Infrastructure as Code platform |

---

## Observability & Metrics

| Reference | Type | Description | Target |
| --- | --- | --- | --- |
| IAC-1 | Quality | IAC Best Practice Compliance | >95% (validation checks passed) |
| IAC-2 | Quality | Security Findings Resolved | 100% critical, 90% high (before prod deployment) |
| IAC-3 | Quality | Code Review Approval Rate | >85% (AI suggestions accepted with minor mods) |
| IAC-4 | Efficiency | Time to Generate IAC | <30 minutes (from architecture to code) |
| IAC-5 | Efficiency | Infrastructure Provisioning Time | <2 hours (dev), <4 hours (prod with validation) |
| IAC-6 | Security | Managed Identity Usage | 100% (no hardcoded credentials) |
| IAC-7 | Security | Private Endpoint Usage | >90% (for PaaS services) |
| IAC-8 | Cost | Infrastructure Cost Accuracy | ±10% (estimated vs. actual costs) |
| IAC-9 | Outcome | Deployment Success Rate | >95% (first-time deployments without errors) |
| IAC-10 | Outcome | Infrastructure Drift Detection | 0 drift (IAC matches deployed resources) |

---

## Related Artefacts

- IAC Templates (Pulumi)
- Infrastructure Best Practices Guide
- Security Configuration Standards

---

## RACI Matrix

| Role | Responsibility |
| --- | --- |
| **Responsible** | AI/Automation, DevOps Engineer |
| **Accountable** | DevOps Lead |
| **Consulted** | Architecture, Security |
| **Informed** | Development Team |

---

## Related Steps

- **Upstream:** Step 10: Architecture Design
- **Downstream:** Step 12: Design and Implementation

---

## Revision History

| Version | Date | Author | Changes |
| --- | --- | --- | --- |
| 1 | 2026-03-25 | Simon Armstrong | Initial draft |

---

## Navigation

|
 |