[Previous: Step 27 - IaC Testing](Step-27-IAC-Testing.md) | [Next: Step 29 - Development Flow](Step-29-Development-Flow.md)

# Step 28: Secrets Scan

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |
| **Last Review Carried Out** | 9 June 2026 by Simon Armstrong |

## 28.1 Overview
| **Attribute** | **Value** |
|---|---|
| **Responsible Roles** | Development Team, Security Engineer, CI/CD Pipeline |
| **Accountable** | Security Lead |
| **Supporting Roles** | DevOps Engineer, QA Lead |
| **Tools** | Secret scanning tools, CI/CD pipeline, source control platform |


## 28.2 Purpose
Step 28 ensures that no secrets, credentials, tokens, private keys, or other sensitive configuration data are exposed in source code, configuration files, or infrastructure definitions. It acts as a critical development-phase security gate before build and deployment readiness progresses further.


## 28.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| **Current change set** | Steps 20-27 | Code, configuration, scripts, and infrastructure definitions under review. |
| **Secret detection rules** | Security standards and tooling | Approved patterns, signatures, and scanning policies for sensitive-data detection. |
| **Repository history and PR context** | Source control platform | Relevant source and change context for identifying secret exposure risk. |


## 28.4 Activities
### 28.4.1 Execute Secret Scanning
Run the approved secret scanning tooling against the pull request change set and relevant repository context.

Secret pattern scanning should detect:
- **Azure Credentials:** Azure access keys, connection strings, SAS tokens, and similar platform credentials.
- **Hardcoded Passwords:** Passwords embedded directly in code or configuration.
- **Access Tokens:** OAuth tokens, JWT secrets, and CI/CD access tokens.
- **Private Key Material:** Certificates or application signing keys.
- **Embedded Connection Strings:** Connection strings containing embedded credentials.

Scanning should cover not only application code, but also configuration files, IaC definitions, CI/CD pipeline files, test data, deployment manifests, and any generated artefacts or scripts included in the pull request scope.

Example detections:

```python
# Azure Storage Connection String Detected
storage_connection_string = "DefaultEndpointsProtocol=https;AccountName=ordersdev;AccountKey=ExampleKey;EndpointSuffix=core.windows.net"

# Azure SQL Connection String with Password
sql_connection_string = "Server=tcp:order-db-dev.database.windows.net,1433;Initial Catalog=OrdersDb;User ID=appuser;Password=PassowrdInClear;Encrypt=True;"

# Key Vault Secret Reference Copied as Plain Value
app_settings = {"KeyVaultSecret": "PlainTextSecretValue"}
```

### 28.4.2 Review Findings
Assess findings to determine whether they represent real exposure, acceptable test artefacts, or false positives requiring controlled handling.

Review should cover:
- **Credential Combinations:** Username and password combinations.
- **API Credentials:** API authentication credentials.
- **Platform Secrets:** Service principal secrets, storage keys, and certificate private keys.
- **Configuration Files:** `.env`, `appsettings.json`, YAML, INI, Azure Pipelines files, and ARM/Bicep parameter files.

Credential types commonly encountered in this step include:
- **Basic Authentication:** Username and password credentials.
- **Bearer Tokens:** Bearer tokens and API access tokens.
- **OAuth Secrets:** OAuth client secrets and application registration secrets.
- **Database Credentials:** Database passwords and administrative connection strings.
- **Encryption and Platform Keys:** Encryption keys, certificate material, and storage-account access keys.

Configuration analysis examples include:

```yaml
# Azure Pipelines Variable with Embedded Secret
variables:
  sqlAdminPassword: "MySecretPassword123"

# App Settings File Committed with Secret
ConnectionStrings__OrdersDb: "Server=tcp:order-db-dev.database.windows.net,1433;Password=MySecretPassword123;"
```

False-positive reviews should consider:
- **Test Credentials:** Test or dummy credentials.
- **Documentation Examples:** Example code in documentation.
- **Inactive Credentials:** Already-rotated or invalid credentials.
- **Sample Pattern Matches:** Sample values that match Azure patterns but are intentionally non-live.

Any whitelist or suppression decision must be reviewable, time-bounded where appropriate, and supported by rationale. Findings should not be dismissed informally without evidence that the detected value is non-sensitive or no longer active.

Whitelist examples:

```text
storage_account_key = "ExampleOnlyNotARealKey"  # whitelisted: documented sample value
key_vault_secret_name = "sample-secret-name"    # whitelisted: secret reference, not secret value
```

### 28.4.3 Remediate Confirmed Exposure
Remove secrets from code or configuration, rotate credentials where necessary, and replace direct values with secure secret references.

Remediation should include:
- **Immediate Removal:** Remove secrets from code immediately.
- **Credential Rotation:** Rotate exposed credentials.
- **Approved Secret Management:** Use secret management such as Azure Key Vault.
- **Repository Protection:** Add secret-containing files to `.gitignore`.
- **Documentation Update:** Update documentation on secure secret handling.

Typical remediation steps:
1. Remove the secret from code and replace it with a reference.
2. Store the secret in an approved secret manager.
3. Rotate the credential and invalidate the old value.
4. Update `.gitignore` or equivalent repository protections.
5. Rewrite history if the secret was already pushed and policy requires cleanup.

Where the secret may have been consumed by external systems, logs, pipeline runs, caches, or deployment history, remediation should also consider the broader exposure path rather than treating the code change alone as the full fix.

Secure alternative example:

```python
import os
from azure.keyvault.secrets import SecretClient

sql_connection_string = os.environ.get("ORDERS_DB_CONNECTION")

secret_client = SecretClient(vault_url="https://...", credential=credential)
storage_key = secret_client.get_secret("orders-storage-key").value
```

### 28.4.4 Re-scan After Remediation
Re-run the scan to confirm that unresolved exposures no longer remain.

Any confirmed secret detection should trigger immediate notification to the security team and the pull request author.

If repository history scanning or push-protection controls identify broader exposure beyond the current diff, the incident response path should follow the defined security handling procedure before the change is allowed to proceed.


## 28.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Secrets scan report** | CI/CD platform and security records | Evidence of detected findings and resolution status. |
| **Remediated change set** | Source control repository | Updated code or configuration with confirmed exposures removed. |
| **Residual risk decision** | Security and engineering records | Explicit record where an exception or false-positive handling decision was required. |
| **Credential handling evidence** | Security records and work item notes | Rotation, replacement, and secure-secret-reference actions are recorded where exposure was confirmed. |


## 28.6 Key Artifacts
**Inputs:**
- Code changes in the pull request
- Configuration files and infrastructure definitions
- Secret patterns, signatures, and scanning rules

**Outputs:**
- Secrets scan report
- Detected secrets list and classification
- False-positive whitelist or disposition record
- Remediation guidance and credential-rotation evidence where applicable
- Secure secret-reference updates in code, configuration, or pipeline definitions where applicable


## 28.7 Quality Gates / Exit Criteria
- [ ] Secret scanning completed successfully.
- [ ] Confirmed sensitive-data exposures have been remediated.
- [ ] Required credential rotation actions have been initiated where applicable.
- [ ] Any false positives or exceptions are explicitly documented.
- [ ] No unresolved live secret, credential, token, private key, or sensitive connection string remains in scope.
- [ ] Secret handling now uses approved retrieval or reference patterns where remediation was required.
- [ ] The change is ready to proceed to Step 29.


## 28.8 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Pattern-based secret detection** | Secret scanning tooling | Detects likely secrets, tokens, and credentials in code and configuration. |
| **Automated pipeline enforcement** | CI/CD pipeline | Blocks progression when unresolved critical secret findings exist. |
| **Finding interpretation support** | Approved AI assistant | Helps explain likely finding types, but final disposition remains human-controlled. |


## 28.9 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| **Confirmed Secrets Detected** | 0 confirmed secrets before progression | Secret scanning reports and pull request security checks | Number of confirmed secret findings detected in the scoped change set at step completion. |
| **False Positive Rate** | <10% of total findings reviewed | Security review records comparing confirmed and dismissed findings | Percentage of findings classified as non-exposure after structured review. |
| **Scan Time** | <5 minutes per scan run | CI/CD pipeline timing records | Time to complete the secrets scan. |
| **PR Block Rate Due to Secret Findings** | <5% of pull requests per reporting period | Pull request security gate statistics | Percentage of pull requests blocked due to detected secret findings within the agreed reporting window. |
| **Rotation Time** | <2 hours from confirmed exposure to rotation initiation | Security incident handling records and credential rotation logs | Time taken to initiate rotation of exposed secrets after confirmation. |
| **Remediation Re-scan Pass Rate** | 100% of remediated findings pass re-scan before progression | Re-scan results in CI/CD and security review evidence | Percentage of remediated secret findings that pass the required re-scan before the pull request advances. |
| **Documented Disposition Coverage** | 100% of false positives and exceptions documented | Security review notes, whitelist records, and pull request evidence | Percentage of dismissed or exceptioned findings with explicit documented rationale. |

Any confirmed secret finding should trigger immediate notification to the security team and the pull request author, with the event recorded in the relevant security or delivery tracking record.


## 28.10 Best Practices
**DO:**
- **Use Approved Secret Stores:** Use approved secret stores and runtime retrieval patterns.
- **Treat Exposure as an Incident:** Treat confirmed secret exposure as an incident requiring immediate action.
- **Re-scan After Remediation:** Re-scan after any remediation before allowing progression.
- **Scan Every Pull Request:** Scan every pull request before merging.
- **Store Secrets Securely:** Store secrets in environment variables or approved secret stores.
- **Protect Sensitive Files:** Add sensitive files to `.gitignore` or equivalent protections.

**DON'T:**
- **Store Live Secrets in Source Control:** Do not store live secrets in source control.
- **Hardcode Secrets:** Do not hardcode secrets in code or configuration.
- **Treat Base64 as Encryption:** Do not use base64 encoding as if it were encryption.
- **Ignore Findings:** Do not ignore scan results without verification.


## 28.11 Summary and Key Outcomes
Step 28 prevents accidental exposure of secrets through automated scanning and controlled human review so that credentials, tokens, keys, and sensitive configurations do not pass further into the development flow unresolved.

Key Outcomes:
- **Secret Exposure Prevention:** Live secrets and sensitive credentials are detected before downstream progression.
- **Secure Secret Handling:** Approved secret-store and runtime-reference patterns are reinforced.
- **Controlled Disposition:** False positives and exceptions are reviewed and documented instead of being ignored informally.
- **Credential Response:** Confirmed exposures trigger remediation and credential-rotation activity.
- **Security Gate Readiness:** The change set is in a defensible state to proceed into build and packaging activities.


## 28.12 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, Security Engineer, CI/CD Pipeline |
| **Accountable** | Security Lead |
| **Consulted** | DevOps Engineer, QA Lead |
| **Informed** | Engineering Manager, Product Owner |


## 28.13 Related Steps
- **Upstream:** [Step 27: IaC Testing](Step-27-IAC-Testing.md)
- **Downstream:** [Step 29: Development Flow](Step-29-Development-Flow.md)


## 28.14 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |
| **0.1** | 9 June 2026 | Simon Armstrong | Reviewed document and provided comments for improvement |
