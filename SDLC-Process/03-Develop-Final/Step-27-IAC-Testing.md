[Previous: Step 26 - Code Review Continued](Step-26-Code-Review-Continued.md) | [Next: Step 28 - Secrets Scan](Step-28-Secrets-Scan.md)

# Step 27: IaC Testing

## Overview
| **Attribute** | **Value** |
|---|---|
| **Step Number** | 27 |
| **Phase** | Develop |
| **Previous** | [Step 26: Code Review Continued](Step-26-Code-Review-Continued.md) |
| **Next** | [Step 28: Secrets Scan](Step-28-Secrets-Scan.md) |
| **Responsible Roles** | DevOps Engineer, Platform Engineer |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Supporting Roles** | Security Engineer, Technical Architect |
| **Tools** | Open-source Pulumi or Terraform CLI, policy tooling, CI/CD pipeline, cost estimation tools |

---

## Purpose
Step 27 validates Infrastructure as Code changes before they proceed further in the development workflow. It ensures that infrastructure definitions are syntactically valid, policy-compliant, operationally sound, and appropriately understood before any subsequent controlled rollout activity depends on them.

---

## Inputs
| **Input** | **Source** | **Description** |
|---|---|---|
| **Approved IaC change set** | Steps 19 and 26 | Infrastructure definitions and updates ready for validation. |
| **Policy and security rules** | Platform governance and security standards | Approved guardrails and infrastructure compliance expectations. |
| **Target environment context** | Environment specifications and platform standards | Environment-specific parameters and deployment context. |

---

## Activities
### 27.1 Generate Plan or Preview
Run the approved preview or planning command to understand the infrastructure impact before application.

### 27.2 Validate Syntax and Dependencies
Confirm that modules, variables, references, and dependencies resolve correctly.

### 27.3 Apply Policy and Compliance Checks
Validate against security, tagging, region, identity, and other required guardrails.

### 27.4 Detect Drift and Unintended Change
Review the plan output for unexpected deletions, configuration drift, or other unsafe outcomes.

### 27.5 Review Cost and Operational Impact
Where relevant, review cost implications and operational changes introduced by the infrastructure update.

---

## Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Plan or preview evidence** | CI/CD platform and engineering records | Visibility into the expected infrastructure change set. |
| **Policy validation result** | Security and platform governance records | Pass or fail evidence for required controls. |
| **Drift and impact assessment** | DevOps and engineering records | Evidence of whether the change contains unexpected or unsafe behaviour. |

---

## Quality Gates / Exit Criteria
- [ ] Plan or preview completed successfully.
- [ ] IaC syntax and dependencies are valid.
- [ ] Policy and compliance checks have passed.
- [ ] No unresolved unsafe or unintended change is present.
- [ ] The change is ready to proceed to Step 28.

---

## AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Plan generation** | Open-source IaC CLI tooling | Produces a machine-verifiable preview of the infrastructure change. |
| **Policy validation** | Policy tooling | Confirms infrastructure compliance against approved rules. |
| **Impact interpretation support** | Approved AI assistant | Helps explain plan output and likely risk areas for human review. |

---

## Observability and Metrics
| **Metric / Reference** | **Type** | **Description** |
|---|---|---|
| **IaC validation pass rate** | Quality metric | Percentage of IaC changes passing preview and policy checks on first run. |
| **Drift detection count** | Operational metric | Number of drift or unexpected-change findings detected. |
| **IaC validation cycle time** | Flow metric | Time required to complete infrastructure validation. |

---

## Best Practices
- Never advance an IaC change without reviewing plan output.
- Treat policy failures as blockers unless formally approved as exceptions.
- Resolve drift in code, not manually in the target platform.
- Review destructive changes with heightened scrutiny.

---

## RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | DevOps Engineer, Platform Engineer |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Consulted** | Security Engineer, Technical Architect |
| **Informed** | Development Team, Engineering Manager |

---

## Related Artefacts
- IaC plan or preview output
- Policy validation reports
- Drift review evidence
- Cost assessment output

---

## Related Steps
- **Upstream:** [Step 26: Code Review Continued](Step-26-Code-Review-Continued.md)
- **Downstream:** [Step 28: Secrets Scan](Step-28-Secrets-Scan.md)

---

## Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **1.0** | **2026-03-27** |  | **Initial draft aligned to Confluence baseline.** |
| **1.1** | **2026-05-28** | **OpenCode** | **Refined as a Confluence-ready enterprise version with clearer validation, drift, and policy control expectations.** |

[Previous: Step 26 - Code Review Continued](Step-26-Code-Review-Continued.md) | [Next: Step 28 - Secrets Scan](Step-28-Secrets-Scan.md)
