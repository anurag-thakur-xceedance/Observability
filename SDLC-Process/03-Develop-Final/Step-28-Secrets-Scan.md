[Previous: Step 27 - IaC Testing](Step-27-IAC-Testing.md) | [Next: Step 29 - Development Flow](Step-29-Development-Flow.md)

# Step 28: Secrets Scan

## Overview
| **Attribute** | **Value** |
|---|---|
| **Step Number** | 28 |
| **Phase** | Develop |
| **Previous** | [Step 27: IaC Testing](Step-27-IAC-Testing.md) |
| **Next** | [Step 29: Development Flow](Step-29-Development-Flow.md) |
| **Responsible Roles** | Development Team, Security Engineer, CI/CD Pipeline |
| **Accountable** | Security Lead |
| **Supporting Roles** | DevOps Engineer, QA Lead |
| **Tools** | Secret scanning tools, CI/CD pipeline, source control platform |

---

## Purpose
Step 28 ensures that no secrets, credentials, tokens, private keys, or other sensitive configuration data are exposed in source code, configuration files, or infrastructure definitions. It acts as a critical development-phase security gate before build and deployment readiness progress further.

---

## Inputs
| **Input** | **Source** | **Description** |
|---|---|---|
| **Current change set** | Steps 20-27 | Code, configuration, scripts, and infrastructure definitions under review. |
| **Secret detection rules** | Security standards and tooling | Approved patterns, signatures, and scanning policies for sensitive-data detection. |
| **Repository history and PR context** | Source control platform | Relevant source and change context for identifying secret exposure risk. |

---

## Activities
### 28.1 Execute Secret Scanning
Run the approved secret scanning tooling against the pull request change set and relevant repository context.

### 28.2 Review Findings
Assess findings to determine whether they represent real exposure, acceptable test artefacts, or false positives requiring controlled handling.

### 28.3 Remediate Confirmed Exposure
Remove secrets from code or configuration, rotate credentials where necessary, and replace direct values with secure secret references.

### 28.4 Re-scan After Remediation
Re-run the scan to confirm that unresolved exposures no longer remain.

---

## Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Secrets scan report** | CI/CD platform and security records | Evidence of detected findings and resolution status. |
| **Remediated change set** | Source control repository | Updated code or configuration with confirmed exposures removed. |
| **Residual risk decision** | Security and engineering records | Explicit record where an exception or false-positive handling decision was required. |

---

## Quality Gates / Exit Criteria
- [ ] Secret scanning completed successfully.
- [ ] Confirmed sensitive-data exposures have been remediated.
- [ ] Required credential rotation actions have been initiated where applicable.
- [ ] Any false positives or exceptions are explicitly documented.
- [ ] The change is ready to proceed to Step 29.

---

## AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Pattern-based secret detection** | Secret scanning tooling | Detects likely secrets, tokens, and credentials in code and configuration. |
| **Automated pipeline enforcement** | CI/CD pipeline | Blocks progression when unresolved critical secret findings exist. |
| **Finding interpretation support** | Approved AI assistant | Helps explain likely finding types, but final disposition remains human-controlled. |

---

## Observability and Metrics
| **Metric / Reference** | **Type** | **Description** |
|---|---|---|
| **Secrets found per change** | Security metric | Number of secret findings detected per change set. |
| **False-positive rate** | Security quality metric | Percentage of findings classified as non-exposure after review. |
| **Time to secret remediation** | Response metric | Time taken to remove or mitigate confirmed secret exposure. |

---

## Best Practices
- Never store live secrets in source control.
- Use approved secret stores and runtime retrieval patterns.
- Treat confirmed secret exposure as an incident requiring immediate action.
- Re-scan after any remediation before allowing progression.

---

## RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | Development Team, Security Engineer, CI/CD Pipeline |
| **Accountable** | Security Lead |
| **Consulted** | DevOps Engineer, QA Lead |
| **Informed** | Engineering Manager, Product Owner |

---

## Related Artefacts
- Secret scan reports
- Remediation record
- Credential rotation record where applicable
- Secure configuration handling guidance

---

## Related Steps
- **Upstream:** [Step 27: IaC Testing](Step-27-IAC-Testing.md)
- **Downstream:** [Step 29: Development Flow](Step-29-Development-Flow.md)

---

## Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **1.0** | **2026-03-27** |  | **Initial draft aligned to Confluence baseline.** |
| **1.1** | **2026-05-28** | **OpenCode** | **Refined as a Confluence-ready enterprise version with clearer remediation, exception handling, and security gate language.** |

[Previous: Step 27 - IaC Testing](Step-27-IAC-Testing.md) | [Next: Step 29 - Development Flow](Step-29-Development-Flow.md)
