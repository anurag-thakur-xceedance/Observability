[Previous: Step 18 - Threat Modeling Architecture Review](../02-Architecture-Design/Step-18-Threat-Modeling-Architecture-Review.md) | [Next: Step 19 - IaC Jobs Runner](Step-19-IAC-Jobs-Runner.md)

# **Phase 03 - Develop**

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |
| **Last Review Carried Out** | 8 June 2026 by Simon Armstrong |

## Purpose
This page is the landing page for **Phase 03 - Develop** of the SDLC and serves as the governing entry point for all development-phase activities. It defines the scope, objectives, controls, quality expectations, and navigational structure for the Develop phase so that engineering, architecture, security, QA, and platform teams work from a single authoritative reference.

**Phase 03 - Develop** covers the execution of approved design decisions through implementation, infrastructure enablement, code quality enforcement, peer review, build automation, and development completion readiness. The outcome of this phase is a fully developed, reviewed, validated, and build-ready change set that can proceed into the Secure, Govern, and Validate phase.

This phase covers **Steps 19-31** of the SDLC process, where infrastructure changes are executed, code is written, tested, reviewed, secured, packaged, and prepared for the next governance and validation stage in alignment with DevSecOps practices.


## Overview
The Develop phase begins once the approved architecture, threat model outputs, and implementation direction from Step 18 are available for execution. It progresses through environment enablement, coding, unit-level quality verification, review, secure engineering checks, build preparation, and formal development completion. The outcome is a fully developed, reviewed, validated, and build-ready change set ready for Phase 04.

The Develop phase ensures that:
- **Infrastructure Readiness:** Infrastructure required for implementation is provisioned and documented through approved automation.
- **Secure Implementation:** Code is developed against approved architectural and security expectations.
- **AI-Assisted Quality:** AI-assisted code review and testing tools enhance quality and accelerate feedback cycles.
- **Standards Enforcement:** Code linting and standards are enforced automatically through development pipelines.
- **Automated Verification:** Unit tests and automated quality controls are executed as part of normal delivery.
- **Peer Review Governance:** Peer review and review resolution are completed with clear accountability.
- **Secret Protection:** Secrets and sensitive configuration are prevented from entering the codebase.
- **Development Security Validation:** Development-time security validation is applied before the change enters the next phase.
- **Controlled Build and Packaging:** Build and packaging activities are completed in a controlled and traceable manner.
- **Definition of Done Verification:** Development outputs are verified against Definition of Done expectations before handoff to the next phase.

The intended high-level flow is:

1. Infrastructure and environment capability are prepared.
2. Code is written and validated through developer-level tests and quality controls.
3. Review, rework, and secure development checks are completed.
4. Build artefacts are generated and validated.
5. Development completion is confirmed.
6. The change is handed over to Phase 04 for Secure, Govern, and Validate activities.


## Process Steps

> **Execution Context Legend:**  
> 🖥️ **Local** - Executed on engineer's machine  
> ☁️ **Server/Service** - Executed on CI/CD pipeline or remote service  
> 👤 **Human** - Human review and approval

| **Step** | **Context** | **Title** | **Primary Outcome** |
|---|---|---|---|
| **19** | ☁️ | [IaC Jobs Runner](Step-19-IAC-Jobs-Runner.md) | Infrastructure required for the approved delivery scope is provisioned, configured, validated, and documented. |
| **20** | 🖥️ | [Unit Testing](Step-20-Unit-Testing.md) | Code is developed with unit-level quality verification and adequate test coverage. |
| **21** | 🖥️ 👤 | [Test Reviewer Additions](Step-21-Test-Reviewer-Additions.md) | Test suites are strengthened through review-driven additions and quality improvements. |
| **22** | 🖥️ | [Comment Aware Reasoning](Step-22-Comment-Aware-Reasoning.md) | Code understanding, maintainability, and intent alignment are improved through structured review of comments and implementation context. |
| **23** | 🖥️ | [Merge PR](Step-23-Merge-PR.md) | A controlled pull request is prepared, submitted, and linked to the relevant engineering work for downstream review and automation. |
| **24** | ☁️ | [Linting](Step-24-Linting.md) | Static code quality and coding-standard compliance checks are executed automatically. |
| **25** | 👤 | [Code Review](Step-25-Code-Review.md) | Human review validates code quality, security, maintainability, and standards conformance. |
| **26** | 👤 🖥️ | [Code Review Continued](Step-26-Code-Review-Continued.md) | Review feedback is addressed, discussions are resolved, and approval readiness is completed. |
| **27** | ☁️ | [IaC Testing](Step-27-IAC-Testing.md) | Infrastructure changes are validated for correctness, policy alignment, and deployment readiness. |
| **28** | ☁️ | [Secrets Scan](Step-28-Secrets-Scan.md) | The codebase and configuration set are verified to be free from exposed secrets and sensitive credentials. |
| **29** | ☁️ | [Development Flow](Step-29-Development-Flow.md) | Build artefacts are generated, versioned, validated, and stored in an approved repository. |
| **30** | ☁️ | [Development Flow Continued](Step-30-Development-Flow-Continued.md) | Artefacts are deployed to the target validation environment and basic deployment confidence is established. |
| **31** | 👤 | [Development Complete](Step-31-Development-Complete.md) | Definition of Done and development-phase completion criteria are confirmed before handoff to the next phase. |


## Critical Quality Gates
The diagram and step sequence enforce the following critical quality gates:

- **Unit Tests Pass (Step 20)** - Minimum 80% coverage required
- **Linting Clean (Step 24)** - Zero errors, code style enforced
- **Code Review Approved (Steps 25-26):** Peer review completed
- **No Secrets Detected (Step 28)** - Security scan passes
- **All Checks Pass (Step 31):** Final validation before next phase

| **Gate** | **Related Step(s)** | **Expectation** |
|---|---|---|
| **Infrastructure readiness** | 19, 27 | Required infrastructure is available, compliant, and validated for the approved delivery scope. |
| **Unit quality gate** | 20, 21 | Code changes are supported by meaningful unit tests and review-driven test improvements. |
| **Code quality gate** | 22, 24, 25, 26 | Code quality, maintainability, review closure, and standards compliance are achieved before build progression. |
| **Secrets and configuration gate** | 28 | No unresolved secret exposure or sensitive configuration leakage exists in source or configuration files. |
| **Build readiness gate** | 29, 30 | Build artefacts are successfully produced, validated, and deployed to the designated validation environment. |
| **Phase completion gate** | 31 | Definition of Done, traceability, and handoff readiness are confirmed in full. |

The critical control intent of this phase is that code must not progress into the next phase unless infrastructure readiness, unit quality, review quality, secure configuration handling, build validity, and development completion expectations have all been satisfied.


## Phase Scope
| **Scope Area** | **Description** |
|---|---|
| **Infrastructure enablement** | Provisioning, configuring, and validating environment capabilities needed for development and downstream validation. |
| **Application development** | Writing, refining, and structuring code in accordance with approved design, engineering standards, and delivery scope. |
| **Developer quality controls** | Unit testing, linting, secure configuration handling, and engineering review practices executed within the development lifecycle. |
| **Review and approval flow** | Pull request creation, code review, rework, re-review, and approval closure. |
| **Build and packaging** | Generation, versioning, validation, and storage of build artefacts for subsequent deployment and validation stages. |
| **Readiness handoff** | Confirming that development outputs are complete, traceable, and ready for the Secure, Govern, and Validate phase. |


## Roles Across the Develop Phase
| **Role** | **Phase Responsibility** |
|---|---|
| **Development Team** | Implements approved changes, writes tests, resolves defects, and addresses review feedback. |
| **Development Lead** | Guides implementation quality, review discipline, and completion readiness across the phase. |
| **DevOps Engineer / Platform Engineer** | Enables environment provisioning, automation, build, and deployment support required during development. |
| **DevOps Lead / DevOps Manager** | Provides accountable oversight for platform execution standards, environment governance, and delivery controls. |
| **Solution Architect** | Confirms that implementation remains aligned to the approved solution architecture and delivery intent. |
| **Technical Architect** | Provides detailed technical guidance on implementation patterns, platform structure, and engineering alignment. |
| **Security Engineer** | Reviews controls related to secure coding, secrets, infrastructure policy, and delivery risk. |
| **QA Lead / QA Team** | Supports test strategy alignment, review-driven test enhancement, and readiness for downstream validation. |


## Key Prerequisites to the Phase
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| **Approved architecture and design** | Phase 02 | Baseline design, implementation approach, environment expectations, and technical constraints. |
| **Threat model and risk outcomes** | Step 18 | Required security considerations that must be reflected during implementation. |
| **Backlog and work items** | Planning phases | Approved implementation scope for the sprint, release, or controlled change. |
| **Engineering standards** | Organisational standards and references | Coding standards, branching rules, review policy, test strategy, and DevSecOps controls. |


## Key Outputs and Artifacts
| **Output / Artifact** | **Destination** | **Description** |
|---|---|---|
| **Source Code** | Source control platform | Application code maintained in approved version control repositories, completed, reviewed, and traceable to the approved work scope. |
| **Unit Tests** | Source control platform and CI/CD platform | Developer-authored automated tests that validate expected behaviour, regression safety, and developer-level quality expectations. |
| **IaC Templates** | Source control platform and approved target environments | Deployed infrastructure code and configuration definitions maintained using approved Pulumi or Terraform patterns. |
| **Pull Requests** | Source control platform | Proposed code changes together with linked work items, approvals, and review history. |
| **Linting Reports** | CI/CD platform and engineering records | Automated code quality, formatting, and standards-compliance results generated during the delivery workflow. |
| **Code Review Comments** | Source control platform and engineering records | Peer review findings, discussion threads, and documented resolution history. |
| **Test Coverage Reports** | CI/CD platform and engineering records | Unit test coverage metrics showing exercised code paths and uncovered areas. |
| **Secrets Scan Reports** | CI/CD platform and engineering records | Security scan outputs confirming whether credentials, tokens, or sensitive configuration were detected. |
| **Build Artifacts** | Approved artefact repository | Compiled packages, binaries, containers, or other versioned outputs produced by the build pipeline. |
| **Build Logs and Pipeline Execution Records** | CI/CD platform and engineering records | Execution evidence showing build, validation, and automation outcomes for traceability and audit review. |
| **Deployment Evidence to Validation Environment** | Engineering records and approved target environments | Records showing successful promotion or deployment into the designated downstream validation environment. |
| **Development Completion Evidence** | Delivery governance records | Confirmation that the phase has met Definition of Done and is ready for Phase 04. |


## Observability and Delivery Metrics
| **Metric** | **Purpose** |
|---|---|
| **Lead time for changes** | Measures the elapsed time from development start through review and build readiness. |
| **Build success rate** | Indicates the stability and repeatability of development outputs. |
| **Review turnaround time** | Tracks how efficiently code review and review closure are completed. |
| **Unit test pass rate and coverage** | Confirms code quality and test effectiveness at the developer stage. |
| **Secrets detection rate** | Tracks secure development hygiene and prevention of sensitive-data exposure. |
| **Change failure indicators** | Highlights rework, failed builds, environment failures, or delivery instability during development. |


## DORA Metrics for Phase 03
The Develop phase tracks the following DORA (DevOps Research and Assessment) metrics to measure delivery performance:

| **DORA Metric** | **Definition** | **Measurement Point in Phase 03** | **Target** |
|---|---|---|---|
| **D1: Lead Time for Changes** | Time from code commit to code successfully running in production | Measured from first commit in feature branch to merge to main (Step 23) | < 1 day (elite); < 1 week (high) |
| **D2: Deployment Frequency** | How often code is deployed to production | Tracked via builds per day passing all quality gates (Step 31) | On-demand (elite); Weekly (high) |
| **D3: Change Failure Rate** | Percentage of deployments causing a failure in production | Tracked via failed builds, rollbacks, hotfixes during development | < 15% (elite); < 30% (high) |
| **D4: Time to Restore Service** | Time to recover from a production failure | Not directly measured in Phase 03 (measured in Phase 06 - Deploy/Operate) | < 1 hour (elite); < 1 day (high) |
| **D5: Time From Inception to PR** | Time from work item creation to pull request submission | Measured from backlog item start to PR creation (Entry Point A → Step 23) | < 2 days (elite); < 5 days (high) |

**Note:** DORA metrics D1, D2, D3, and D5 are actively tracked during the Develop phase. These metrics feed into continuous improvement initiatives and engineering effectiveness reviews.


## Modern AI-Assisted Development and Testing
The Develop phase should deliberately use modern AI-assisted practices to improve speed, consistency, and engineering quality while preserving human accountability.

Recommended AI-assisted practices include:
- **Test Candidate Generation:** Generating unit test candidates from requirements, technical designs, and changed code.
- **Edge Case Detection:** Identifying likely edge cases, error conditions, and missing branch coverage.
- **Review Support:** Supporting pull request descriptions, review summaries, and remediation suggestions.
- **IaC and Pipeline Assistance:** Assisting with infrastructure-as-code interpretation, validation analysis, and pipeline troubleshooting.
- **Maintainability Improvement:** Improving code maintainability by highlighting unclear comments, stale documentation, and mismatches between code intent and implementation.
- **Secure Coding Acceleration:** Accelerating secure coding by surfacing risky patterns, secrets exposure, and insecure defaults earlier in the workflow.

AI assistance must remain advisory. All generated or suggested outputs must be reviewed and approved by the responsible engineer or reviewer before they are accepted as delivery evidence.


## Tooling and Process Enablement
The following tooling categories help streamline and strengthen this phase:

| **Tooling Area** | **Purpose in the Develop Phase** |
|---|---|
| **Source control and pull request platforms** | Enable controlled branching, review workflows, traceability, and merge governance. |
| **CI/CD pipelines** | Automate linting, testing, security checks, packaging, and deployment progression. |
| **Unit testing frameworks** | Provide repeatable developer-level verification of logic and behaviour. |
| **Coverage tooling** | Quantify test completeness and highlight untested areas and risk hotspots. |
| **Linting and static analysis tools** | Enforce coding standards, detect common quality issues, and reduce review noise. |
| **Open-source IaC tooling** | Validate and manage infrastructure changes using approved automation patterns. |
| **Secret scanning and secure configuration tools** | Prevent exposure of credentials, tokens, certificates, and other sensitive data. |
| **Artefact repositories and registries** | Store build outputs in a controlled, versioned, and reusable form. |
| **Observability and log analysis tools** | Provide deployment, runtime, and pipeline evidence required for confident progression. |
| **Approved AI coding and review assistants** | Improve developer productivity, test quality, review preparation, and defect detection. |


## Phase Flow Diagram
**Key Flow Elements:**
- **Blue boxes:** Process steps (19-31)
- **Orange diamonds:** Quality gate decisions
- **Purple boxes:** AI/automation tools
- **Red boxes:** Revision/fix loops
- **Cyan boxes:** DORA metrics tracking points
- **Green rounded boxes:** Phase transitions

These visual elements show how engineering execution, quality control, automation support, remediation loops, delivery measurement, and phase handoff are connected across the Develop workflow.


## Governance Expectations
- **Traceability Requirement:** Every step in this phase must be traceable to an approved engineering work item, feature, defect, platform change, or release scope.
- **Approved Automation Requirement:** Development automation must use approved tooling, controlled identities, and auditable pipeline execution.
- **Exception Management:** Exceptions to standards, controls, or approval requirements must be explicitly documented and approved.
- **Manual Change Control:** Manual changes to infrastructure, configuration, or deployment state must be avoided unless covered by an approved emergency process and subsequently reconciled into source-controlled automation.
- **Audit-Ready Outputs:** Outputs from this phase must be complete enough to support security validation, testing, deployment planning, and audit review without requiring undocumented tribal knowledge.
- **📝 Documentation Updates Required:** Engineers must update Jira tickets and Confluence pages as work progresses through this phase. Work items must reflect current status, completion evidence, and links to artifacts (PRs, builds, test results) to maintain traceability and support handoff to downstream phases.


## Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |
| **0.1** | 8 June 2026 | Simon Armstrong | Reviewed document and provided comments for improvement |

[Previous: Step 18 - Threat Modeling Architecture Review](../02-Architecture-Design/Step-18-Threat-Modeling-Architecture-Review.md) | [Next: Step 19 - IaC Jobs Runner](Step-19-IAC-Jobs-Runner.md)
