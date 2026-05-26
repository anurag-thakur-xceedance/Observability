# SDLC & DevSecOps Master Process

## Overview

This wiki documents the end-to-end Software Development Lifecycle (SDLC) and DevSecOps process. The process encompasses the complete journey from initial concept intake through to live operation, incorporating security, governance, and continuous improvement practices throughout.

---

## Process Phases

| Phase | Steps | Description |
|-------|-------|-------------|
| **Project & Opportunity Preliminary** | A-D | Initial intake, concept approval, and project initiation |
| **Product Feedback & Discovery** | 1-4 | Stakeholder engagement and work item integration |
| **Planning (Azure DevOps)** | 5-9 | Sprint creation and planning activities |
| **Architecture & Design** | 10-18 | Design, architecture review, and artefact creation |
| **Develop** | 19-31 | Development, testing, code review, and CI activities |
| **Secure, Govern & Validate** | 32-40 | Security scanning, governance, and validation |
| **Test** | 41-51 | Comprehensive testing including performance and security |
| **Deploy** | 52-56 | Deployment pipeline and release management |
| **Operate** | 57 | Live operation and monitoring |

---

## Quick Navigation

### Entry Points (Project & Opportunity Preliminary)
- [Step A: Intake Process](00-Entry-Points/Step-A-Intake-Process.md)
- [Step B: Concept to Project](00-Entry-Points/Step-B-Concept-To-Project.md)
- [Step C: Project Initiation](00-Entry-Points/Step-C-Project-Initiation.md)
- [Step D: Project Team Initialise Planning](00-Entry-Points/Step-D-Project-Team-Initialise-Planning.md)

### Product Feedback & Discovery (1-4)
- [Step 1: Design Stakeholders](01-Product-Feedback-Discovery-Planning/Step-01-Design-Stakeholders.md)
- [Step 2: Copilot Review](01-Product-Feedback-Discovery-Planning/Step-02-Copilot-Review.md)
- [Step 3: Architecture Artefact Store](01-Product-Feedback-Discovery-Planning/Step-03-Architecture-Artefact-Store.md)
- [Step 4: Work Item Integration](01-Product-Feedback-Discovery-Planning/Step-04-Work-Item-Integration.md)

### Planning - Azure DevOps (5-9)
- [Step 5: Team Creates Sprint](01-Product-Feedback-Discovery-Planning/Step-05-Team-Creates-Sprint.md)
- [Step 6: Sprint Definition](01-Product-Feedback-Discovery-Planning/Step-06-Sprint-Definition.md)
- [Step 7: Design Feedback](01-Product-Feedback-Discovery-Planning/Step-07-Design-Feedback.md)
- [Step 8: Resource Timeline Suggester](01-Product-Feedback-Discovery-Planning/Step-08-Resource-Timeline-Suggester.md)
- [Step 9: PR META Design Feedback](01-Product-Feedback-Discovery-Planning/Step-09-PR-META-Design-Feedback.md)

### Architecture & Design (10-18)
- [Step 10: Architecture Design](02-Architecture-Design/Step-10-Architecture-Design.md)
- [Step 11: IAC Suggester Reviewer](02-Architecture-Design/Step-11-IAC-Suggester-Reviewer.md)
- [Step 12: Design and Implementation](02-Architecture-Design/Step-12-Design-And-Implementation.md)
- [Step 13: Test Approach Definition](02-Architecture-Design/Step-13-Test-Approach-Definition.md)
- [Step 14: Performance Test Definition](02-Architecture-Design/Step-14-Performance-Test-Definition.md)
- [Step 15: Automation Test Definition](02-Architecture-Design/Step-15-Automation-Test-Definition.md)
- [Step 16: Artefacts Updates](02-Architecture-Design/Step-16-Artefacts-Updates.md)
- [Step 17: Flow Continues](02-Architecture-Design/Step-17-Flow-Continues.md)
- [Step 18: Threat Modeling Architecture Review](02-Architecture-Design/Step-18-Threat-Modeling-Architecture-Review.md)

### Develop (19-31)
- [Step 19: IAC Jobs Runner](03-Develop/Step-19-IAC-Jobs-Runner.md)
- [Step 20: Unit Testing](03-Develop/Step-20-Unit-Testing.md)
- [Step 21: Test Reviewer Additions](03-Develop/Step-21-Test-Reviewer-Additions.md)
- [Step 22: Comment Aware Reasoning](03-Develop/Step-22-Comment-Aware-Reasoning.md)
- [Step 23: Merge PR](03-Develop/Step-23-Merge-PR.md)
- [Step 24: Linting](03-Develop/Step-24-Linting.md)
- [Step 25: Code Review](03-Develop/Step-25-Code-Review.md)
- [Step 26: Code Review Continued](03-Develop/Step-26-Code-Review-Continued.md)
- [Step 27: IAC Testing](03-Develop/Step-27-IAC-Testing.md)
- [Step 28: Secrets Scan](03-Develop/Step-28-Secrets-Scan.md)
- [Step 29: Development Flow](03-Develop/Step-29-Development-Flow.md)
- [Step 30: Development Flow Continued](03-Develop/Step-30-Development-Flow-Continued.md)
- [Step 31: Development Complete](03-Develop/Step-31-Development-Complete.md)

### Secure, Govern & Validate (32-40)
- [Step 32: Code Test Creator](04-Secure-Govern-Validate/Step-32-Code-Test-Creator.md)
- [Step 33: SAST](04-Secure-Govern-Validate/Step-33-SAST.md)
- [Step 34: DAST](04-Secure-Govern-Validate/Step-34-DAST.md)
- [Step 35: Dependency Check](04-Secure-Govern-Validate/Step-35-Dependency-Check.md)
- [Step 36: Repo Secret Scanning](04-Secure-Govern-Validate/Step-36-Repo-Secret-Scanning.md)
- [Step 37: Container Image Scan](04-Secure-Govern-Validate/Step-37-Container-Image-Scan.md)
- [Step 38: Software Bill of Materials](04-Secure-Govern-Validate/Step-38-SBOM.md)
- [Step 39: Security Phase Complete](04-Secure-Govern-Validate/Step-39-Security-Phase-Complete.md)
- [Step 40: Consistency PR VS WI DOD](04-Secure-Govern-Validate/Step-40-Consistency-PR-VS-WI-DOD.md)

### Test (41-51)
- [Step 41: Design Suggester](05-Test/Step-41-Design-Suggester.md)
- [Step 42: Functional Regression Testing](05-Test/Step-42-Functional-Regression-Testing.md)
- [Step 43: Integration Testing](05-Test/Step-43-Integration-Testing.md)
- [Step 44: Contract API Testing](05-Test/Step-44-Contract-API-Testing.md)
- [Step 45: Automation Testing](05-Test/Step-45-Automation-Testing.md)
- [Step 46: Performance Testing](05-Test/Step-46-Performance-Testing.md)
- [Step 47: Chaos Negative Testing](05-Test/Step-47-Chaos-Negative-Testing.md)
- [Step 48: Compatibility Testing](05-Test/Step-48-Compatibility-Testing.md)
- [Step 49: Smoke Testing](05-Test/Step-49-Smoke-Testing.md)
- [Step 50: Surface Area Testing Pen Test](05-Test/Step-50-Surface-Area-Testing-Pen-Test.md)
- [Step 51: SBOM Pen Test Evaluator](05-Test/Step-51-SBOM-Pen-Test-Evaluator.md)

### Deploy (52-56)
- [Step 52: Pulumi Provisioning](06-Deploy-Operate/Step-52-Pulumi-Provisioning.md)
- [Step 53: Staging Pre-Prod Deploy](06-Deploy-Operate/Step-53-Staging-Pre-Prod-Deploy.md)
- [Step 54: Smoke Test](06-Deploy-Operate/Step-54-Smoke-Test.md)
- [Step 55: Feature Flag Release](06-Deploy-Operate/Step-55-Feature-Flag-Release.md)
- [Step 56: Deploy to Prod](06-Deploy-Operate/Step-56-Deploy-To-Prod.md)

### Operate (57)
- [Step 57: Application Asset Operation](06-Deploy-Operate/Step-57-Application-Asset-Operation.md)

---

## Supporting Documentation

- [DORA Metrics Reference](07-References/Reference-DORA-Metrics.md)
- [Observability Reference](07-References/Reference-Observability.md)
- [Reporting Reference](07-References/Reference-Document-Outputs.md)
- [Document Outputs Reference](07-References/Reference-Document-Outputs.md)

---

## Flow Types

| Symbol | Flow Type | Description |
|--------|-----------|-------------|
| — | Human In Loop Flow | Manual intervention required |
| — | Non Augmented Flow | Standard automated flow |
| — | Augmented Flow | AI-assisted flow |
| — | CI/CD Flow | Continuous Integration/Deployment |
| — | Observability Flow | Monitoring and metrics collection |

---

## Key Components

### AI/Automation Layer
- **Streamline ACT MCP Layer** - N8N Orchestrated
- **MCP API Manager & Service Bus Layer**
- **Azure Infrastructure (Az1)**

### Intelligence Capabilities
- WorkItem Intelligence
- DevSecOps Intelligence
- SecOps Intelligence
- General Intelligence (Streamline Think)

---

## Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-01-19 | | Initial draft |
