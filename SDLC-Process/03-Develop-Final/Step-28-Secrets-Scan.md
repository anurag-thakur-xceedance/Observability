[Previous: Step 27 - IaC Testing](Step-27-IAC-Testing.md) | [Next: Step 29 - Development Flow](Step-29-Development-Flow.md)

# Step 28: Secrets Scan

| **Attribute** | **Value** |
|---|---|
| Document Owner | Simon Armstrong, VP Chief Architect |
| Approved By | Simon Armstrong (pending wider review) |
| Classification | Internal |
| Review Frequency | Half-Yearly |
| Next Review Due | 2026-12-01 |

## 28.1 Overview
| **Attribute** | **Value** |
|---|---|
| Responsible Roles | Development Team, Security Engineer, CI/CD Pipeline |
| Accountable | Security Lead |
| Supporting Roles | DevOps Engineer, QA Lead |
| Tools | Secret scanning tools, CI/CD pipeline, source control platform |


## 28.2 Purpose
Step 28 ensures that no secrets, credentials, tokens, private keys, or other sensitive configuration data are exposed in source code, configuration files, or infrastructure definitions. It acts as a critical development-phase security gate before build and deployment readiness progress further.


## 28.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| Current change set | Steps 20-27 | Code, configuration, scripts, and infrastructure definitions under review. |
| Secret detection rules | Security standards and tooling | Approved patterns, signatures, and scanning policies for sensitive-data detection. |
| Repository history and PR context | Source control platform | Relevant source and change context for identifying secret exposure risk. |


## 28.4 Activities
### 28.4.1 Execute Secret Scanning
Run the approved secret scanning tooling against the pull request change set and relevant repository context.

### 28.4.2 Review Findings
Assess findings to determine whether they represent real exposure, acceptable test artefacts, or false positives requiring controlled handling.

### 28.4.3 Remediate Confirmed Exposure
Remove secrets from code or configuration, rotate credentials where necessary, and replace direct values with secure secret references.

### 28.4.4 Re-scan After Remediation
Re-run the scan to confirm that unresolved exposures no longer remain.


## 28.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| Secrets scan report | CI/CD platform and security records | Evidence of detected findings and resolution status. |
| Remediated change set | Source control repository | Updated code or configuration with confirmed exposures removed. |
| Residual risk decision | Security and engineering records | Explicit record where an exception or false-positive handling decision was required. |


## 28.6 Quality Gates / Exit Criteria
- [ ] Secret scanning completed successfully.
- [ ] Confirmed sensitive-data exposures have been remediated.
- [ ] Required credential rotation actions have been initiated where applicable.
- [ ] Any false positives or exceptions are explicitly documented.
- [ ] The change is ready to proceed to Step 29.


## 28.7 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| Pattern-based secret detection | Secret scanning tooling | Detects likely secrets, tokens, and credentials in code and configuration. |
| Automated pipeline enforcement | CI/CD pipeline | Blocks progression when unresolved critical secret findings exist. |
| Finding interpretation support | Approved AI assistant | Helps explain likely finding types, but final disposition remains human-controlled. |


## 28.8 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| Secrets Detected | 0 | Secret scanning reports and pull request security checks | Number of confirmed secret findings detected per change set. |
| False Positive Rate | Less than 10% | Security review records comparing confirmed and dismissed findings | Percentage of findings classified as non-exposure after review. |
| Scan Time | Less than 5 minutes | CI/CD pipeline timing records | Time to complete the secrets scan. |
| Block Rate | Less than 5% of pull requests | Pull request security gate statistics | Percentage of pull requests blocked due to secret findings. |
| Rotation Time | Less than 2 hours for confirmed exposure | Security incident handling records and credential rotation logs | Time taken to rotate exposed secrets after confirmation. |


## 28.9 Best Practices
**DO:**
- Use approved secret stores and runtime retrieval patterns.
- Treat confirmed secret exposure as an incident requiring immediate action.
- Re-scan after any remediation before allowing progression.

**DON'T:**
- Store live secrets in source control.


## 28.10 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| Responsible | Development Team, Security Engineer, CI/CD Pipeline |
| Accountable | Security Lead |
| Consulted | DevOps Engineer, QA Lead |
| Informed | Engineering Manager, Product Owner |


## 28.11 Related Artefacts
- Secret scan reports
- Remediation record
- Credential rotation record where applicable
- Secure configuration handling guidance


## 28.12 Related Steps
- **Upstream:** [Step 27: IaC Testing](Step-27-IAC-Testing.md)
- **Downstream:** [Step 29: Development Flow](Step-29-Development-Flow.md)


## 28.13 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| 0.1 | 5 May 2026 | Anurag Thakur | Initial draft for Review |

[Previous: Step 27 - IaC Testing](Step-27-IAC-Testing.md) | [Next: Step 29 - Development Flow](Step-29-Development-Flow.md)
