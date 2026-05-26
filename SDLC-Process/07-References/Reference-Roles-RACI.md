# Roles and RACI Reference

This document defines the roles involved in the SDLC process and provides RACI guidance.

---

## Role Definitions

### Product Roles

| Role | Description | Key Responsibilities |
|------|-------------|---------------------|
| **Product Owner** | Represents business/customer needs | Backlog prioritisation, acceptance criteria, sprint goals |
| **Scrum Master** | Facilitates agile processes | Sprint ceremonies, impediment removal, team coaching |
| **Project Management** | Project coordination | Timeline, resources, stakeholder communication |

### Development Roles

| Role | Description | Key Responsibilities |
|------|-------------|---------------------|
| **Development Team** | Builds the product | Code, unit tests, technical design |
| **Development Lead** | Technical leadership | Code review, technical decisions, mentoring |
| **Architecture Team** | System design | Solution architecture, standards, technical direction |
| **Lead Architect** | Architecture leadership | Enterprise alignment, architecture governance |

### Quality Roles

| Role | Description | Key Responsibilities |
|------|-------------|---------------------|
| **QA Team** | Quality assurance | Test execution, defect management, quality gates |
| **QA Lead** | QA leadership | Test strategy, quality metrics, team management |
| **QA Automation Engineer** | Test automation | Automation framework, E2E tests, CI/CD integration |
| **Performance Engineer** | Performance testing | Load testing, performance analysis, optimisation |

### Operations Roles

| Role | Description | Key Responsibilities |
|------|-------------|---------------------|
| **DevOps Engineer** | DevOps implementation | CI/CD pipelines, IAC, automation |
| **DevOps Lead** | DevOps leadership | Infrastructure strategy, tooling decisions |
| **SRE** | Site Reliability Engineering | Production reliability, monitoring, incident response |
| **SRE Lead** | SRE leadership | SLO definition, reliability strategy |
| **Operations** | Production operations | Day-to-day operations, support |
| **Release Management** | Release coordination | Release planning, deployment coordination |

### Security Roles

| Role | Description | Key Responsibilities |
|------|-------------|---------------------|
| **Security Team** | Security implementation | Security scans, vulnerability management |
| **Security Lead** | Security leadership | Security strategy, policy, governance |
| **Penetration Testers** | Security testing | Pen testing, vulnerability assessment |

### AI/Automation

| Role | Description | Key Responsibilities |
|------|-------------|---------------------|
| **AI/Automation** | Automated intelligence | AI-powered analysis, automated tasks |

---

## RACI Matrix Legend

| Letter | Meaning | Description |
|--------|---------|-------------|
| **R** | Responsible | Does the work |
| **A** | Accountable | Owns the outcome |
| **C** | Consulted | Provides input |
| **I** | Informed | Kept updated |

---

## RACI by Phase

### Discovery & Planning (Steps 1-9)

| Activity | Product Owner | Scrum Master | Dev Lead | Architecture | QA Lead |
|----------|---------------|--------------|----------|--------------|---------|
| Stakeholder Design | A, R | I | C | C | C |
| Sprint Planning | A | R | C | C | C |
| Backlog Refinement | A | R | C | C | C |

### Architecture & Design (Steps 10-18)

| Activity | Lead Architect | Dev Lead | Security Lead | QA Lead | DevOps Lead |
|----------|---------------|----------|---------------|---------|-------------|
| Solution Design | A, R | C | C | I | C |
| Threat Modeling | C | C | A, R | I | C |
| Test Definition | C | C | I | A, R | I |

### Development (Steps 19-31)

| Activity | Dev Lead | Development Team | QA Team | DevOps | Security |
|----------|----------|------------------|---------|--------|----------|
| Coding | A | R | I | I | I |
| Unit Testing | A | R | C | I | I |
| Code Review | A | R | I | I | C |
| PR Management | A | R | I | I | I |

### Security & Validation (Steps 32-40)

| Activity | Security Lead | DevOps Lead | Dev Lead | QA Lead |
|----------|---------------|-------------|----------|---------|
| Security Scanning | A, R | C | I | I |
| SBOM Generation | A | R | I | I |
| DoD Validation | C | I | C | A, R |

### Testing (Steps 41-51)

| Activity | QA Lead | QA Team | SRE Lead | Security Lead |
|----------|---------|---------|----------|---------------|
| Functional Testing | A | R | I | I |
| Performance Testing | A | R | C | I |
| Security Testing | C | I | C | A, R |

### Deploy & Operate (Steps 52-57)

| Activity | Release Manager | DevOps Lead | SRE Lead | Product Owner |
|----------|-----------------|-------------|----------|---------------|
| Deployment | A | R | C | I |
| Feature Release | C | C | I | A, R |
| Production Ops | I | C | A, R | I |

---

## Escalation Paths

### Technical Issues
Development Team → Development Lead → Lead Architect

### Quality Issues
QA Team → QA Lead → Product Owner

### Security Issues
Security Team → Security Lead → Executive Sponsor

### Production Issues
SRE → SRE Lead → Incident Commander

### Process Issues
Scrum Master → Project Management → Program Management

---

## Revision History
| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-01-19 | | Initial draft |
