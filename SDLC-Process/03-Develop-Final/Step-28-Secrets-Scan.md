[Previous: Step 27 - IaC Testing](Step-27-IAC-Testing.md) | [Next: Step 29 - Development Flow](Step-29-Development-Flow.md)

# Step 28: Secrets Scan

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |

## 28.1 Overview
| **Attribute** | **Value** |
|---|---|
| **Responsible Roles** | Development Team, Security Engineer, CI/CD Pipeline |
| **Accountable** | Security Lead |
| **Supporting Roles** | DevOps Engineer, QA Lead |
| **Tools** | Secret scanning tools, CI/CD pipeline, source control platform |


## 28.2 Purpose
Step 28 ensures that no secrets, credentials, tokens, private keys, or other sensitive configuration data are exposed in source code, configuration files, or infrastructure definitions. It acts as a critical development-phase security gate before build and deployment readiness progress further.


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
- API keys for AWS, Azure, GCP, Stripe, and similar services
- Hardcoded passwords in code or configuration
- OAuth tokens, JWT secrets, and GitHub tokens
- Private keys such as RSA or SSH keys
- Connection strings containing embedded credentials

Example detections:

```python
# AWS Access Key detected
aws_access_key = "AKIAIOSFODNN7EXAMPLE"

# Database connection string with password
db_url = "postgresql://user:password123@localhost/db"

# API key in configuration
stripe_api_key = "sk_live_4eC39HqLyjWDarjtT1zdp7dc"
```

### 28.4.2 Review Findings
Assess findings to determine whether they represent real exposure, acceptable test artefacts, or false positives requiring controlled handling.

Review should cover:
- Username and password combinations
- API authentication credentials
- Service-account keys and certificate private keys
- Configuration files such as `.env`, `config.json`, YAML, INI, Docker Compose, and Kubernetes secrets

Configuration analysis examples include:

```yaml
# Kubernetes secret in plain text
apiVersion: v1
kind: Secret
data:
  password: cGFzc3dvcmQxMjM=

# .env file committed
DB_PASSWORD=my_secret_password
API_KEY=sk_live_12345
```

False-positive review should consider:
- Test or dummy credentials
- Example code in documentation
- Already-rotated or invalid credentials
- Public test keys such as Stripe test keys

Whitelist examples:

```text
test_api_key = "test_sk_12345"  # whitelisted: test credential
stripe_test_key = "pk_test_..." # whitelisted: public test key
```

### 28.4.3 Remediate Confirmed Exposure
Remove secrets from code or configuration, rotate credentials where necessary, and replace direct values with secure secret references.

Remediation should include:
- Removing secrets from code immediately
- Rotating exposed credentials
- Using secret management such as Azure Key Vault or AWS Secrets Manager
- Adding secret-containing files to `.gitignore`
- Updating documentation on secure secret handling

Typical remediation steps:
1. Remove the secret from code and replace it with a reference.
2. Store the secret in an approved secret manager.
3. Rotate the credential and invalidate the old value.
4. Update `.gitignore` or equivalent repository protections.
5. Rewrite history if the secret was already pushed and policy requires cleanup.

Secure alternative example:

```python
import os
from azure.keyvault.secrets import SecretClient

api_key = os.environ.get("STRIPE_API_KEY")

secret_client = SecretClient(vault_url="https://...", credential=credential)
api_key = secret_client.get_secret("stripe-api-key").value
```

### 28.4.4 Re-scan After Remediation
Re-run the scan to confirm that unresolved exposures no longer remain.

Any confirmed secret detection should trigger immediate notification to the security team and the pull request author.


## 28.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Secrets scan report** | CI/CD platform and security records | Evidence of detected findings and resolution status. |
| **Remediated change set** | Source control repository | Updated code or configuration with confirmed exposures removed. |
| **Residual risk decision** | Security and engineering records | Explicit record where an exception or false-positive handling decision was required. |


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


## 28.7 Quality Gates / Exit Criteria
- [ ] Secret scanning completed successfully.
- [ ] Confirmed sensitive-data exposures have been remediated.
- [ ] Required credential rotation actions have been initiated where applicable.
- [ ] Any false positives or exceptions are explicitly documented.
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
| **Secrets Detected** | 0 | Secret scanning reports and pull request security checks | Number of confirmed secret findings detected per change set. |
| **False Positive Rate** | <10% | Security review records comparing confirmed and dismissed findings | Percentage of findings classified as non-exposure after review. |
| **Scan Time** | <5 minutes | CI/CD pipeline timing records | Time to complete the secrets scan. |
| **Block Rate** | <5% of pull requests | Pull request security gate statistics | Percentage of pull requests blocked due to secret findings. |
| **Rotation Time** | <2 hours for confirmed exposure | Security incident handling records and credential rotation logs | Time taken to rotate exposed secrets after confirmation. |


## 28.10 Best Practices
**DO:**
 - Use approved secret stores and runtime retrieval patterns.
- Treat confirmed secret exposure as an incident requiring immediate action.
- Re-scan after any remediation before allowing progression.

- Scan every pull request before merge.
- Store secrets in environment variables or approved secret stores.
- Add sensitive files to `.gitignore` or equivalent protections.

**DON'T:**
- Store live secrets in source control.

- Hardcode secrets in code or configuration.
 - Use base64 encoding as if it were encryption.
- Ignore scan results without verification.


## 28.11 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, Security Engineer, CI/CD Pipeline |
| **Accountable** | Security Lead |
| **Consulted** | DevOps Engineer, QA Lead |
| **Informed** | Engineering Manager, Product Owner |


## 28.12 Related Steps
- **Upstream:** [Step 27: IaC Testing](Step-27-IAC-Testing.md)
- **Downstream:** [Step 29: Development Flow](Step-29-Development-Flow.md)


## 28.13 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |

[Previous: Step 27 - IaC Testing](Step-27-IAC-Testing.md) | [Next: Step 29 - Development Flow](Step-29-Development-Flow.md)
