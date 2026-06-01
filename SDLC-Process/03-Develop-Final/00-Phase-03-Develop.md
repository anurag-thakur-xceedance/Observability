[Previous: Step 18 - Threat Modeling Architecture Review](../02-Architecture-Design/Step-18-Threat-Modeling-Architecture-Review.md) | [Next: Step 19 - IaC Jobs Runner](Step-19-IAC-Jobs-Runner.md)

# Phase 03 - Develop

## Confluence Mapping
| **Attribute** | **Value** |
|---|---|
| **Confluence Page Title** | Phase 03 - Develop |
| **Confluence Page ID** | 5925863425 |
| **Confluence URL** | https://chainthat.atlassian.net/wiki/spaces/METH/pages/5925863425/Phase+03+-+Develop |
| **Local Markdown Path** | `03-Develop-Final/00-Phase-03-Develop.md` |
| **Purpose of This File** | Confluence-ready landing page for the Develop phase and the parent page for all Step 19-31 child pages. |

---

## Purpose
This page is the landing page for Phase 03 of the SDLC and serves as the governing entry point for all development-phase activities. It defines the scope, objectives, controls, quality expectations, and navigational structure for the Develop phase so that engineering, architecture, security, QA, and platform teams work from a single authoritative reference.

Phase 03 covers the execution of approved design decisions through implementation, infrastructure enablement, code quality enforcement, peer review, build automation, and development completion readiness. The outcome of this phase is a fully developed, reviewed, validated, and build-ready change set that can proceed into the Secure, Govern, and Validate phase.

This phase covers Steps 19-31 of the SDLC process, where infrastructure changes are executed, code is written, tested, reviewed, secured, packaged, and prepared for the next governance and validation stage in alignment with DevSecOps practices.

---

## Phase Overview
The Develop phase ensures that:
- infrastructure required for implementation is provisioned and documented through approved automation
- code is developed against approved architectural and security expectations
- unit tests and automated quality controls are executed as part of normal delivery
- peer review and review resolution are completed with clear accountability
- secrets and sensitive configuration are prevented from entering the codebase
- build and packaging activities are completed in a controlled and traceable manner
- development outputs are verified against Definition of Done expectations before handoff to the next phase

---

## Phase Flow Summary
The Develop phase begins once the approved architecture, threat model outputs, and implementation direction from Step 18 are available for execution. It progresses through environment enablement, coding, unit-level quality verification, review, secure engineering checks, build preparation, and formal development completion.

The intended high-level flow is:

1. Infrastructure and environment capability are prepared.
2. Code is written and validated through developer-level tests and quality controls.
3. Review, rework, and secure development checks are completed.
4. Build artefacts are generated and validated.
5. Development completion is confirmed.
6. The change is handed over to Phase 04 for Secure, Govern, and Validate activities.

### Flow Interpretation Guide
- **Process steps** represent execution activities performed by engineering, platform, and QA stakeholders.
- **Quality gates** represent go or no-go decision points before the next activity may proceed.
- **AI and automation points** represent approved accelerators that support quality, consistency, and speed but do not replace accountable human review.
- **Revision loops** represent mandatory correction paths when a control, review, or quality expectation is not met.
- **Metric checkpoints** represent the points where delivery and engineering quality measures are captured.

---

## Phase Scope
| **Scope Area** | **Description** |
|---|---|
| **Infrastructure enablement** | Provisioning, configuring, and validating environment capabilities needed for development and downstream validation. |
| **Application development** | Writing, refining, and structuring code in accordance with approved design, engineering standards, and delivery scope. |
| **Developer quality controls** | Unit testing, linting, secure configuration handling, and engineering review practices executed within the development lifecycle. |
| **Review and approval flow** | Pull request creation, code review, rework, re-review, and approval closure. |
| **Build and packaging** | Generation, versioning, validation, and storage of build artefacts for subsequent deployment and validation stages. |
| **Readiness handoff** | Confirming that development outputs are complete, traceable, and ready for the Secure, Govern, and Validate phase. |

---

## Step Index
| **Step** | **Title** | **Primary Outcome** | **Target Markdown File** |
|---|---|---|---|
| **19** | **IaC Jobs Runner** | Infrastructure required for the approved delivery scope is provisioned, configured, validated, and documented. | [Step-19-IAC-Jobs-Runner.md](Step-19-IAC-Jobs-Runner.md) |
| **20** | **Unit Testing** | Code is developed with unit-level quality verification and adequate test coverage. | `Step-20-Unit-Testing.md` |
| **21** | **Test Reviewer Additions** | Test suites are strengthened through review-driven additions and quality improvements. | `Step-21-Test-Reviewer-Additions.md` |
| **22** | **Comment Aware Reasoning** | Code understanding, maintainability, and intent alignment are improved through structured review of comments and implementation context. | `Step-22-Comment-Aware-Reasoning.md` |
| **23** | **Merge PR** | A controlled pull request is prepared, submitted, and linked to the relevant engineering work for downstream review and automation. | `Step-23-Merge-PR.md` |
| **24** | **Linting** | Static code quality and coding-standard compliance checks are executed automatically. | `Step-24-Linting.md` |
| **25** | **Code Review** | Human review validates code quality, security, maintainability, and standards conformance. | `Step-25-Code-Review.md` |
| **26** | **Code Review Continued** | Review feedback is addressed, discussions are resolved, and approval readiness is completed. | `Step-26-Code-Review-Continued.md` |
| **27** | **IaC Testing** | Infrastructure changes are validated for correctness, policy alignment, and deployment readiness. | `Step-27-IAC-Testing.md` |
| **28** | **Secrets Scan** | The codebase and configuration set are verified to be free from exposed secrets and sensitive credentials. | `Step-28-Secrets-Scan.md` |
| **29** | **Development Flow** | Build artefacts are generated, versioned, validated, and stored in an approved repository. | `Step-29-Development-Flow.md` |
| **30** | **Development Flow Continued** | Artefacts are deployed to the target validation environment and basic deployment confidence is established. | `Step-30-Development-Flow-Continued.md` |
| **31** | **Development Complete** | Definition of Done and development-phase completion criteria are confirmed before handoff to the next phase. | `Step-31-Development-Complete.md` |

---

## Critical Quality Gates
| **Gate** | **Related Step(s)** | **Expectation** |
|---|---|---|
| **Infrastructure readiness** | **19, 27** | Required infrastructure is available, compliant, and validated for the approved delivery scope. |
| **Unit quality gate** | **20, 21** | Code changes are supported by meaningful unit tests and review-driven test improvements. |
| **Code quality gate** | **22, 24, 25, 26** | Code quality, maintainability, review closure, and standards compliance are achieved before build progression. |
| **Secrets and configuration gate** | **28** | No unresolved secret exposure or sensitive configuration leakage exists in source or configuration files. |
| **Build readiness gate** | **29, 30** | Build artefacts are successfully produced, validated, and deployed to the designated validation environment. |
| **Phase completion gate** | **31** | Definition of Done, traceability, and handoff readiness are confirmed in full. |

The critical control intent of this phase is that code must not progress into the next phase unless infrastructure readiness, unit quality, review quality, secure configuration handling, build validity, and development completion expectations have all been satisfied.

---

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

---

## Key Inputs to the Phase
| **Input** | **Source** | **Description** |
|---|---|---|
| **Approved architecture and design** | Phase 02 | Baseline design, implementation approach, environment expectations, and technical constraints. |
| **Threat model and risk outcomes** | Step 18 | Required security considerations that must be reflected during implementation. |
| **Backlog and work items** | Planning phases | Approved implementation scope for the sprint, release, or controlled change. |
| **Engineering standards** | Organisational standards and references | Coding standards, branching rules, review policy, test strategy, and DevSecOps controls. |

---

## Key Outputs from the Phase
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Developed and reviewed codebase** | Source control platform | Code changes completed, reviewed, and traceable to the approved work scope. |
| **Infrastructure and environment updates** | Approved target environments | Environment changes required to support implementation and validation. |
| **Test and quality evidence** | CI/CD platform and engineering records | Unit test results, linting results, review evidence, and secure development checks. |
| **Build artefacts** | Approved artefact repository | Versioned build outputs ready for subsequent validation and deployment stages. |
| **Development completion evidence** | Delivery governance records | Confirmation that the phase has met Definition of Done and is ready for Phase 04. |

---

## Observability and Delivery Metrics
| **Metric** | **Purpose** |
|---|---|
| **Lead time for changes** | Measures the elapsed time from development start through review and build readiness. |
| **Build success rate** | Indicates the stability and repeatability of development outputs. |
| **Review turnaround time** | Tracks how efficiently code review and review closure are completed. |
| **Unit test pass rate and coverage** | Confirms code quality and test effectiveness at the developer stage. |
| **Secrets detection rate** | Tracks secure development hygiene and prevention of sensitive-data exposure. |
| **Change failure indicators** | Highlights rework, failed builds, environment failures, or delivery instability during development. |

---

## Governance Expectations
- Every step in this phase must be traceable to an approved engineering work item, feature, defect, platform change, or release scope.
- Development automation must use approved tooling, controlled identities, and auditable pipeline execution.
- Exceptions to standards, controls, or approval requirements must be explicitly documented and approved.
- Manual changes to infrastructure, configuration, or deployment state must be avoided unless covered by an approved emergency process and subsequently reconciled into source-controlled automation.
- Outputs from this phase must be complete enough to support security validation, testing, deployment planning, and audit review without requiring undocumented tribal knowledge.

---

## Related References
- `../07-References/Reference-AI-Automation.md`
- `../07-References/Reference-DORA-Metrics.md`
- `../07-References/Reference-Observability.md`
- `../07-References/Reference-Roles-RACI.md`
- `../07-References/Reference-Document-Outputs.md`

---

## Related Steps
- **Upstream:** [Step 18: Threat Modeling Architecture Review](../02-Architecture-Design/Step-18-Threat-Modeling-Architecture-Review.md)
- **Downstream:** `Step 19` through `Step 31` within this phase, followed by Phase 04 beginning at `Step 32`

---

## Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **1.0** | **2026-05-28** | **OpenCode** | **Created Confluence-ready landing page for Phase 03 and mapped it to Confluence page ID 5925863425.** |

[Previous: Step 18 - Threat Modeling Architecture Review](../02-Architecture-Design/Step-18-Threat-Modeling-Architecture-Review.md) | [Next: Step 19 - IaC Jobs Runner](Step-19-IAC-Jobs-Runner.md)
