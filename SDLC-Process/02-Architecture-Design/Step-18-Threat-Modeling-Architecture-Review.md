# Step 18: Threat Modeling Architecture Review

**Phase:** Architecture & Design (Final Gate)
**Audience:** Security Team, Architecture Review Board, Lead Architect, Development Leads
**Prerequisites:** Complete design package from Step 17
**Outcomes:** Approved architecture, documented threats, security controls, risk assessment

---

## Overview

This step represents the final quality gate before development begins. Through formal threat modeling and architecture review, security vulnerabilities are identified proactively, security controls are defined, and the architecture is validated against enterprise standards and best practices. This gate prevents security issues from being discovered late in development or production, where remediation costs are exponentially higher.

---

## Process Flow

```mermaid graph TD A[Threat Modeling & Architecture Review] --> B[18.1 Threat Modeling] A --> C[18.2 Security Control Identification] A --> D[18.3 Architecture Review Board ARB] A --> E[18.4 Risk Assessment] A --> F[18.5 Approval/Remediation]

B --> B1[Identify Assets] B --> B2[Identify Threats STRIDE] B --> B3[Analyze Attack Vectors] B --> B4[Document Threat Model]

C --> C1[Map Threats to Controls] C --> C2[Identify Control Gaps] C --> C3[Prioritize Controls] C --> C4[Document Controls]

D --> D1[Present Architecture] D --> D2[ARB Q&A] D --> D3[Standards Compliance Check] D --> D4[ARB Feedback]

E --> E1[Assess Threat Likelihood] E --> E2[Assess Threat Impact] E --> E3[Calculate Risk Scores] E --> E4[Prioritize Risks]

F --> F1{ARB Decision}

F1 -->|Pass| G[Approve - Proceed to Development] F1 -->|Exception| H[Conditional Approval with Waivers] F1 -->|Rework| I[Return to Design Step 10]

B4 --> J[Threat Model Document] C4 --> K[Security Controls List] D4 --> L[ARB Review Notes] E4 --> M[Risk Register]

G --> N[Step 19: Development Begins] H --> O[Document Exceptions & Conditions] O --> N I --> P[Redesign & Re-submit]

style A fill:#e1f5ff style F1 fill:#fff3cd style G fill:#d4edda style H fill:#fff3cd style I fill:#f8d7da style N fill:#d4edda ```

---

## Activities

### 18.1 Threat Modeling

**Owner:** Security Architect, Security Team
**Duration:** 2-4 hours (workshop session)
**Trigger:** Architecture review package approved by Lead Architect

Systematically identify security threats using structured methodologies (STRIDE, PASTA, etc.) to uncover vulnerabilities before implementation.

#### Process Steps

1. **Identify Assets & Data Flows**

- Critical assets (data, services, infrastructure) - Sensitive data (PII, financial, credentials, etc.) - Data flows between components and external systems - Trust boundaries and security zones

1. **Identify Threats Using STRIDE**

- **Spoofing:** Can an attacker impersonate a user or system? - **Tampering:** Can data be modified in transit or at rest? - **Repudiation:** Can actions be performed without audit trail? - **Information Disclosure:** Can sensitive data be exposed? - **Denial of Service:** Can the system be made unavailable? - **Elevation of Privilege:** Can users gain unauthorized access?

1. **Analyze Attack Vectors & Scenarios**

- Map each threat to specific attack vectors - Document realistic attack scenarios - Assess exploitability and detectability - Identify vulnerable components and interfaces

1. **Document Threat Model**

- Comprehensive threat model document - Data Flow Diagrams (DFDs) with trust boundaries - Threat catalog with severity ratings - Recommended mitigations for each threat

#### STRIDE Threat Identification Template

| Component | Threat Type | Threat Description | Attack Vector | Severity | Existing Controls | Mitigation |
| --- | --- | --- | --- | --- | --- | --- |
| Order API | Spoofing | Attacker impersonates legitimate user | Stolen/weak credentials | High | JWT authentication | Implement MFA, short token expiry |
| Order API | Tampering | Modify order data in transit | Man-in-the-middle attack | High | TLS 1.3 | Certificate pinning, HSTS |
| Payment Service | Information Disclosure | Expose credit card data in logs | Log access, misconfig | Critical | Tokenization | Scrub logs, encrypt at rest |
| Event Bus | Denial of Service | Flood message queue | Malicious publisher | Medium | Rate limiting | Publisher authentication, queue quotas |
| Admin API | Elevation of Privilege | Gain admin access via IDOR | Missing authorization checks | High | RBAC | Implement resource-level authz |

#### Data Flow Diagram with Trust Boundaries

```mermaid graph LR subgraph "Untrusted Zone - Internet" A[User Browser] B[Mobile App] end

subgraph "DMZ - API Gateway" C[API Gateway] end

subgraph "Trusted Zone - Application Services" D[Order Service] E[Payment Service] F[Inventory Service] end

subgraph "Trusted Zone - Data Layer" G[(Order DB)] H[(Inventory DB)] I[Event Bus] end

subgraph "External - Third Party" J[Payment Gateway Stripe] K[Fraud Detection] end

A -->|HTTPS| C B -->|HTTPS| C C -->|JWT Auth| D C -->|JWT Auth| E D -->|Encrypted| G D -->|Events| I E -->|TLS 1.3| J E -->|TLS 1.3| K F -->|Encrypted| H

style A fill:#f8d7da style B fill:#f8d7da style C fill:#fff3cd style D fill:#d4edda style E fill:#d4edda style F fill:#d4edda style G fill:#d4edda style H fill:#d4edda style I fill:#d4edda style J fill:#e1f5ff style K fill:#e1f5ff ```

#### Threat Modeling Workshop Agenda

**Duration:** 2-4 hours
**Attendees:** Security Architect (facilitator), Lead Architect, Development Lead, QA Lead, 1-2 Senior Engineers

| Time | Activity | Duration | Deliverable |
| --- | --- | --- | --- |
| 0:00 | Introduction & Objectives | 10 mins | - |
| 0:10 | Architecture Walkthrough | 20 mins | Understanding of system |
| 0:30 | Asset & Data Flow Identification | 30 mins | DFD with trust boundaries |
| 1:00 | STRIDE Threat Identification | 60 mins | Threat catalog (25-50 threats) |
| 2:00 | Break | 10 mins | - |
| 2:10 | Attack Vector Analysis | 40 mins | Attack scenarios documented |
| 2:50 | Threat Prioritization | 20 mins | Threats ranked by risk |
| 3:10 | Mitigation Recommendations | 30 mins | Control recommendations |
| 3:40 | Wrap-up & Action Items | 20 mins | Threat model document, action items |

#### Best Practices

✅ **DO:**

- Involve diverse perspectives (security, architecture, development, QA)
- Focus on realistic, exploitable threats (not theoretical edge cases)
- Document threats even if existing controls address them
- Use visual tools (DFDs, attack trees) to communicate threats
- Prioritize threats by risk score (likelihood × impact)

❌ **DON'T:**

- Skip threat modeling to save time (cheapest way to find vulnerabilities)
- Rely solely on automated tools without human analysis
- Assume "we haven't been attacked before, so we're safe"
- Focus only on external threats (insider threats matter too)
- Conduct threat modeling in isolation (requires collaboration)

#### Observability & Metrics

| Metric | Target | Measurement Method |
| --- | --- | --- |
| Threat Modeling Completion | 100% | Session completed with full attendance |
| Threats Identified | 20-50 | Total threats documented |
| Critical/High Threats | ≤10 | Threats rated critical or high |
| Threat Model Documentation Time | ≤2 days | Time from workshop to published document |

---

### 18.2 Security Control Identification

**Owner:** Security Architect, Development Lead
**Duration:** 1-2 days
**Trigger:** Threat model completed

Map identified threats to specific security controls, identify gaps in existing controls, and define new controls required for implementation.

#### Process Steps

1. **Map Threats to Controls**

- Review each identified threat - Identify existing controls (authentication, encryption, etc.) - Assess control effectiveness against threat - Document control-to-threat mapping

1. **Identify Control Gaps**

- Threats without adequate controls (high priority) - Controls that require strengthening - Missing controls at architectural level - Gaps in detection and response capabilities

1. **Prioritize Controls**

- **P0 (Critical):** Address critical/high threats, required for launch - **P1 (High):** Address medium threats, required within 30 days post-launch - **P2 (Medium):** Address low threats, required within 90 days - **P3 (Low):** Address edge cases, nice-to-have improvements

1. **Document Security Controls**

- Control specifications (what, where, how) - Implementation requirements - Testing and validation approach - Responsible owners and timelines

#### Security Control Mapping Template

| Threat ID | Threat Description | Severity | Existing Control | Control Adequacy | Required Control | Priority | Owner | Target Date |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| T-001 | User credential theft | High | Password-based auth | Insufficient | Implement MFA (TOTP) | P0 | Auth Team | Sprint 13 |
| T-002 | SQL injection in Order API | Critical | Parameterized queries | Partial | ORM migration, input validation | P0 | Backend Team | Sprint 13 |
| T-003 | Sensitive data in logs | High | None | None | Log scrubbing, PII detection | P0 | Platform Team | Sprint 13 |
| T-004 | Payment data exposure | Critical | Tokenization | Adequate | N/A (existing control sufficient) | - | - | - |
| T-005 | API rate limit bypass | Medium | API Gateway rate limiting | Adequate | Enhanced monitoring | P1 | DevOps | Sprint 14 |
| T-006 | Admin privilege escalation | High | RBAC | Insufficient | Resource-level authorization | P0 | Backend Team | Sprint 13 |

#### Security Control Categories (NIST Framework)

**Preventive Controls (Stop threats before they occur):**

- Authentication & Authorization (OAuth 2.0, RBAC, ABAC)
- Input Validation & Sanitization
- Encryption (TLS 1.3, AES-256)
- Network Segmentation & Firewalls
- Secure Coding Practices

**Detective Controls (Identify threats when they occur):**

- Security Logging & Monitoring
- Intrusion Detection Systems (IDS)
- Anomaly Detection
- Audit Trails
- Vulnerability Scanning

**Corrective Controls (Respond to and recover from threats):**

- Incident Response Plans
- Backup & Recovery Procedures
- Patching & Remediation Processes
- Rollback Capabilities

#### Security Control Requirements Document Template

```markdown

## Security Control: Multi-Factor Authentication (MFA)

**Control ID:** SC-AUTH-001
**Priority:** P0 (Critical)
**Owner:** Authentication Team
**Target Date:** Sprint 13 (2026-03-25)

### Threat(s) Addressed

- T-001: User credential theft (High)
- T-007: Account takeover via phishing (High)

### Control Specification

Implement TOTP-based MFA for all user accounts, with SMS fallback for users without authenticator apps.

**Scope:**

- All user roles (customers, admins, support)
- Web and mobile applications
- API access (service accounts use API keys with rotation)

### Implementation Requirements

1. Integrate TOTP library (e.g., google-authenticator, speakeasy)
2. Add MFA enrollment flow during account creation
3. Add MFA challenge during login (after password validation)
4. Implement "Remember this device" for 30 days (encrypted cookie)
5. Provide recovery codes (10 single-use codes)
6. Implement SMS fallback (rate-limited to prevent abuse)

### Testing & Validation

- Unit tests for TOTP generation and validation
- Integration tests for login flow with MFA
- Security testing: Brute force, bypass attempts
- Usability testing: Enrollment and login UX

### Acceptance Criteria

- [ ] MFA enrollment available for all users
- [ ] MFA challenge enforced on login (no bypass possible)
- [ ] Recovery codes generated and securely stored
- [ ] SMS fallback functional and rate-limited
- [ ] "Remember device" cookie encrypted and expires after 30 days
- [ ] Security testing passed (no bypass vulnerabilities)

### Dependencies

- SMS gateway integration (Twilio) - DevOps Team
- User database schema update - Data Team

### Rollout Plan

- Sprint 13: Implementation and testing
- Sprint 14: Phased rollout (5% → 25% → 100% of users)
- Sprint 14: Monitor adoption rates and support requests

```

#### Best Practices

✅ **DO:**

- Prioritize controls addressing critical/high threats
- Implement defense-in-depth (multiple layers of controls)
- Consider both preventive and detective controls
- Document control specifications in detail
- Assign clear ownership and deadlines

❌ **DON'T:**

- Implement controls without understanding threats they address
- Rely solely on preventive controls (detective controls crucial)
- Specify controls without implementation details
- Leave control ownership ambiguous
- Defer critical controls to "post-launch" without justification

#### Observability & Metrics

| Metric | Target | Measurement Method |
| --- | --- | --- |
| Threat-to-Control Mapping | 100% | Threats with identified controls / Total threats |
| P0 Control Gap Resolution | 100% before launch | P0 controls implemented / Total P0 controls |
| Control Documentation | 100% | Controls with specifications / Total controls |
| Control Owner Assignment | 100% | Controls with owners / Total controls |

---

### 18.3 Architecture Review Board (ARB) Review

**Owner:** Lead Architect, Architecture Review Board
**Duration:** 90-120 minutes (meeting session)
**Trigger:** Threat model and security controls documented

Formal review of architecture against enterprise standards, best practices, and organizational policies to ensure quality and consistency.

#### Process Steps

1. **Present Architecture to ARB**

- Architecture overview (15-20 minutes) - Key design decisions and trade-offs (10-15 minutes) - Security and threat model summary (10 minutes) - Open questions and discussion topics (5 minutes)

1. **ARB Q&A and Feedback**

- ARB members ask clarifying questions - Deep dive into specific areas of concern - Challenge design decisions and assumptions - Provide recommendations and guidance

1. **Standards Compliance Check**

- **Technology Standards:** Approved tech stack and frameworks - **Architecture Patterns:** Consistency with enterprise patterns - **Security Standards:** OWASP Top 10, CWE Top 25 addressed - **Integration Standards:** API design, messaging, data exchange - **Operational Standards:** Monitoring, logging, deployment - **Compliance:** GDPR, HIPAA, PCI-DSS, SOC 2 (as applicable)

1. **ARB Decision and Feedback**

- Document ARB feedback and recommendations - Identify required changes (if any) - ARB vote on approval decision - Communicate decision and next steps

#### ARB Review Criteria & Scorecard

| Criterion | Weight | Score (1-5) | Weighted Score | Notes |
| --- | --- | --- | --- | --- |
| **Architecture Quality** | 20% | 4.5 | 0.90 | Clean separation of concerns, some complexity |
| **Standards Compliance** | 20% | 5.0 | 1.00 | Fully compliant with tech standards |
| **Security Posture** | 25% | 4.0 | 1.00 | Good threat model, some P0 controls pending |
| **Scalability & Performance** | 15% | 4.5 | 0.68 | Validated via POC, monitoring needed |
| **Operational Readiness** | 10% | 3.5 | 0.35 | Runbooks in progress, alerting TBD |
| **Technology Justification** | 10% | 4.5 | 0.45 | Strong ADRs, minor concerns on RabbitMQ ops |
| **Total** | 100% | - | **4.38/5.00** | **CONDITIONAL APPROVAL** |

**Decision Threshold:**

- **≥4.5:** Pass (Approve without conditions)
- **3.5-4.49:** Exception (Approve with conditions)
- **<3.5:** Rework (Return to design)

#### ARB Composition & Roles

| Role | Responsibility | Required Attendance |
| --- | --- | --- |
| **Lead Architect** | Present architecture, answer questions | Mandatory |
| **Security Architect** | Assess security posture, threat model | Mandatory |
| **Enterprise Architect** | Ensure alignment with enterprise standards | Mandatory |
| **Infrastructure Architect** | Validate infrastructure design, scalability | Mandatory |
| **Senior Developer Representative** | Provide implementation perspective | Mandatory |
| **QA Lead** | Assess testability and quality approach | Recommended |
| **Product Owner** | Provide business context and priorities | Recommended |
| **Compliance Officer** | Validate regulatory compliance (if applicable) | As needed |

#### ARB Meeting Agenda

**Duration:** 90-120 minutes

| Time | Activity | Duration | Lead |
| --- | --- | --- | --- |
| 0:00 | Welcome & Objectives | 5 mins | ARB Chair |
| 0:05 | Architecture Presentation | 20 mins | Lead Architect |
| 0:25 | Threat Model Summary | 10 mins | Security Architect |
| 0:35 | Q&A Session | 30 mins | ARB Members |
| 1:05 | Standards Compliance Review | 20 mins | Enterprise Architect |
| 1:25 | ARB Deliberation (Private) | 10 mins | ARB Members Only |
| 1:35 | Decision & Feedback | 10 mins | ARB Chair |
| 1:45 | Wrap-up & Next Steps | 5 mins | Lead Architect |

#### ARB Feedback & Recommendations Template

```markdown

## ARB Review: Order Processing Redesign

**Date:** 2026-03-15
**ARB Decision:** CONDITIONAL APPROVAL (Exception)
**Overall Score:** 4.38/5.00

### Strengths

1. Well-structured event-driven architecture with clear separation of concerns
2. Comprehensive threat model with realistic attack scenarios
3. Strong technology justification via ADRs and POCs
4. Scalability validated through load testing

### Areas of Concern

1. **Operational Readiness (Score: 3.5):** Runbooks incomplete, alerting strategy TBD
2. **RabbitMQ Operations:** Team lacks experience, vendor support not confirmed
3. **Eventual Consistency UX:** User-facing impacts not fully documented

### Conditions for Approval

1. **Complete Runbooks:** Deployment, rollback, incident response (Due: Sprint 14, Week 1)
2. **Finalize Alerting Strategy:** Define alerts, thresholds, escalation (Due: Sprint 14, Week 1)
3. **RabbitMQ Support Plan:** Confirm vendor support or engage external consultant (Due: Sprint 13)
4. **Eventual Consistency Documentation:** Document UX implications and user education plan (Due: Sprint 14)

### Recommendations (Not Blocking)

1. Consider implementing Saga orchestration pattern for distributed transactions
2. Evaluate circuit breaker pattern for external service calls
3. Plan for chaos engineering testing post-launch

### Approval Conditions Sign-off

- [ ] Runbooks completed and reviewed (Owner: DevOps Lead)
- [ ] Alerting strategy finalized and approved (Owner: SRE Lead)
- [ ] RabbitMQ support plan confirmed (Owner: Infrastructure Architect)
- [ ] Eventual consistency documented (Owner: Product Owner + Lead Architect)

**Next Steps:**

- Address conditions by specified dates
- Notify ARB when conditions met (email, no re-review meeting needed)
- Proceed to development (Step 19) once conditions confirmed

```

#### Best Practices

✅ **DO:**

- Prepare thoroughly for ARB presentation (practice timing)
- Welcome tough questions and feedback (improve design quality)
- Document all ARB feedback and recommendations
- Address conditions promptly and transparently
- Use ARB as a learning opportunity (share knowledge)

❌ **DON'T:**

- Present without practicing or time management
- Be defensive or dismissive of feedback
- Hide risks or challenges to get approval
- Ignore ARB recommendations (even if not blocking)
- Skip follow-up on conditional approvals

#### Observability & Metrics

| Metric | Target | Measurement Method |
| --- | --- | --- |
| ARB Approval Rate (First Time) | ≥70% | Approvals / Total reviews |
| ARB Review Completion Time | ≤2 hours | Meeting duration |
| Condition Resolution Time | ≤10 days | Days from ARB to conditions met |
| ARB Feedback Implementation | 100% | Implemented recommendations / Total |

---

### 18.4 Risk Assessment

**Owner:** Security Architect, Lead Architect
**Duration:** 1-2 days
**Trigger:** Threat model and ARB review completed

Assess and quantify security and architectural risks, prioritize by severity, and document in risk register for tracking and mitigation.

#### Process Steps

1. **Assess Threat Likelihood**

- Review each identified threat - Assess likelihood based on: - Threat actor capability (low/medium/high) - Attack surface exposure (internal/dmz/public) - Existing controls (none/partial/adequate) - Assign likelihood score (1-5)

1. **Assess Threat Impact**

- Assess business impact if threat is exploited: - Data breach (PII, financial, IP exposure) - Service disruption (downtime, degradation) - Financial loss (revenue, fines, remediation costs) - Reputational damage - Assign impact score (1-5)

1. **Calculate Risk Scores**

- Risk Score = Likelihood × Impact (1-25) - Categorize risks: - **Critical (20-25):** Immediate action required - **High (12-19):** Address before launch - **Medium (6-11):** Address within 30-90 days post-launch - **Low (1-5):** Monitor and address as resources permit

1. **Prioritize and Document Risks**

- Sort risks by score (highest first) - Document mitigation plans for critical/high risks - Assign risk owners and target dates - Update organizational risk register

#### Risk Assessment Matrix

| Risk ID | Threat Description | Asset | Likelihood (1-5) | Impact (1-5) | Risk Score | Risk Level | Mitigation | Owner | Target Date | Status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| R-001 | SQL injection in Order API | Order Database | 3 | 5 | 15 | High | ORM migration, input validation | Backend Team | Sprint 13 | In Progress |
| R-002 | Sensitive data in application logs | Customer PII | 4 | 4 | 16 | High | Log scrubbing, PII masking | Platform Team | Sprint 13 | Planned |
| R-003 | Weak authentication (password only) | User Accounts | 5 | 4 | 20 | Critical | Implement MFA | Auth Team | Sprint 13 | In Progress |
| R-004 | RabbitMQ cluster failure | Order Processing | 2 | 5 | 10 | Medium | Cluster deployment, circuit breakers | Infrastructure | Sprint 14 | Planned |
| R-005 | Admin privilege escalation | Admin Functions | 3 | 5 | 15 | High | Resource-level authorization | Backend Team | Sprint 13 | Planned |
| R-006 | API rate limit bypass | API Gateway | 2 | 3 | 6 | Medium | Enhanced monitoring, DDoS protection | DevOps | Sprint 15 | Backlog |

#### Risk Likelihood Assessment Criteria

| Score | Likelihood | Description | Indicators |
| --- | --- | --- | --- |
| 5 | Very High (>80%) | Almost certain to occur | Publicly known vulnerability, active exploitation, weak/no controls |
| 4 | High (60-80%) | Likely to occur | Common attack vector, partial controls, high attacker motivation |
| 3 | Medium (40-60%) | Possible | Moderate attack difficulty, adequate but not comprehensive controls |
| 2 | Low (20-40%) | Unlikely but possible | Difficult attack, strong controls in place, low attacker motivation |
| 1 | Very Low (<20%) | Rare | Very difficult attack, comprehensive controls, minimal exposure |

#### Risk Impact Assessment Criteria

| Score | Impact | Description | Indicators |
| --- | --- | --- | --- |
| 5 | Critical | Catastrophic business impact | Massive data breach, prolonged outage, major financial loss (>$1M), severe reputation damage |
| 4 | High | Significant business impact | Moderate data breach, significant downtime, financial loss ($100K-$1M), reputation damage |
| 3 | Medium | Moderate business impact | Limited data exposure, brief downtime, financial loss ($10K-$100K), minor reputation impact |
| 2 | Low | Minor business impact | Minimal data exposure, no downtime, financial loss (<$10K), negligible reputation impact |
| 1 | Very Low | Negligible business impact | No data exposure, no downtime, minimal financial impact, no reputation impact |

#### Risk Heatmap Visualization

```mermaid graph TD subgraph "Risk Heatmap: Likelihood vs Impact" A["1,1 (Low)"] B["1,2"] C["1,3"] D["1,4"] E["1,5"]

F["2,1"] G["2,2"] H["2,3"] I["2,4"] J["2,5"]

K["3,1"] L["3,2"] M["3,3"] N["3,4"] O["3,5 (R-001, R-005)"]

P["4,1"] Q["4,2"] R["4,3"] S["4,4 (R-002)"] T["4,5"]

U["5,1"] V["5,2"] W["5,3"] X["5,4 (R-003)"] Y["5,5"] end

style A fill:#d4edda style B fill:#d4edda style C fill:#d4edda style F fill:#d4edda style G fill:#d4edda style H fill:#fff3cd style I fill:#fff3cd style J fill:#ffc107 style K fill:#d4edda style L fill:#fff3cd style M fill:#fff3cd style N fill:#ffc107 style O fill:#ffc107 style P fill:#fff3cd style Q fill:#fff3cd style R fill:#ffc107 style S fill:#ffc107 style T fill:#f8d7da style U fill:#fff3cd style V fill:#ffc107 style W fill:#ffc107 style X fill:#f8d7da style Y fill:#f8d7da ```

#### Best Practices

✅ **DO:**

- Use consistent, objective criteria for likelihood and impact
- Involve business stakeholders in impact assessment
- Document assumptions and rationale for scores
- Update risk register regularly (at least quarterly)
- Track risk mitigation progress continuously

❌ **DON'T:**

- Rely solely on subjective risk assessments
- Ignore low-likelihood, high-impact risks (still need mitigation plans)
- Treat risk assessment as one-time activity
- Allow risks to remain unassigned or without mitigation plans
- Underestimate impact to make risk scores look better

#### Observability & Metrics

| Metric | Target | Measurement Method |
| --- | --- | --- |
| Risk Assessment Completion | 100% | Threats assessed / Total threats |
| Critical/High Risk Mitigation | 100% before launch | Mitigated risks / Total critical/high risks |
| Risk Register Update Frequency | Monthly | Last update date tracking |
| Residual Risk Score | <50 total | Sum of all remaining risk scores |

---

### 18.5 Approval/Remediation

**Owner:** ARB Chair, Lead Architect
**Duration:** 1-10 days (depending on decision)
**Trigger:** ARB review and risk assessment completed

Formalize ARB decision, document conditions or required changes, and execute remediation plan or proceed to development.

#### Process Steps

1. **Formalize ARB Decision**

- Document decision (Pass / Exception / Rework) - Record vote and rationale - Publish decision to stakeholders - Update project status in tracking system

1. **Document Conditions (if Exception)**

- List all conditions for approval - Assign owners and due dates - Define verification criteria - Plan follow-up confirmation process

1. **Execute Remediation (if Rework)**

- Document required design changes - Return to Step 10 for redesign - Schedule re-review with ARB - Communicate revised timeline

1. **Proceed to Development (if Pass or Exception with conditions met)**

- Update project plan and timeline - Communicate approval to development teams - Begin development activities (Step 19) - Monitor condition resolution (if Exception)

#### ARB Decision Criteria

| Decision | Criteria | Next Step | Typical Timeline |
| --- | --- | --- | --- |
| **Pass** | • ARB score ≥4.5/5.0 • All critical criteria met • No significant concerns • Risk profile acceptable | Proceed to Step 19 (Development) | Immediate |
| **Exception (Conditional Approval)** | • ARB score 3.5-4.49/5.0 • Minor concerns with mitigation plan • Conditions documented and assigned • Risk profile acceptable with conditions | Proceed to Step 19 after conditions confirmed | 1-10 days |
| **Rework** | • ARB score <3.5/5.0 • Significant design flaws • Unacceptable risk profile • Non-compliance with standards | Return to Step 10 (Redesign) | 2-4 weeks |

#### Conditional Approval Tracking Template

```markdown

## Conditional Approval: Order Processing Redesign

**ARB Decision Date:** 2026-03-15
**Approval ID:** ARB-2026-Q1-042
**Conditions Due:** 2026-03-25 (10 days)

### Condition #1: Complete Operational Runbooks

**Owner:** DevOps Lead (John Doe)
**Due Date:** 2026-03-22
**Status:** In Progress (70% complete)
**Requirements:**

- [x] Deployment runbook with step-by-step procedures
- [x] Rollback runbook with decision criteria
- [ ] Incident response playbook (in review)
- [ ] Disaster recovery procedures (draft complete, pending review)

**Verification:** DevOps Lead to share completed runbooks with ARB Chair for confirmation

---

### Condition #2: Finalize Alerting Strategy

**Owner:** SRE Lead (Jane Smith)
**Due Date:** 2026-03-22
**Status:** In Progress (50% complete)
**Requirements:**

- [x] Define critical alerts and thresholds
- [ ] Configure alerting in monitoring platform (in progress)
- [ ] Document escalation procedures
- [ ] Test alert delivery and response

**Verification:** SRE Lead to demonstrate working alerts to ARB Security Architect

---

### Condition #3: RabbitMQ Support Plan

**Owner:** Infrastructure Architect (Alice Johnson)
**Due Date:** 2026-03-20
**Status:** Complete ✅
**Requirements:**

- [x] Confirmed vendor support contract (CloudAMQP Enterprise)
- [x] Identified external consultant for training (RabbitMQ Consulting Ltd)
- [x] Scheduled 2-day training session (2026-04-05)

**Verification:** Contracts signed and training scheduled (verified by ARB Chair)

---

### Condition #4: Eventual Consistency Documentation

**Owner:** Product Owner + Lead Architect
**Due Date:** 2026-03-25
**Status:** Planned
**Requirements:**

- [ ] Document user-facing consistency implications
- [ ] Design UX messaging for async operations
- [ ] Create user education materials
- [ ] Define acceptable consistency SLAs

**Verification:** Product Owner to present documentation to ARB for review

---

### Overall Status

**Progress:** 2/4 conditions complete (50%)
**On Track:** Yes (all conditions expected to meet due dates)
**Next Update:** 2026-03-18

```

#### Remediation (Rework) Process

**If ARB Decision = Rework:**

1. **ARB Feedback Meeting** (1-2 hours)

- Detailed discussion of identified issues - Clarify expectations and requirements - Provide guidance on redesign approach - Answer team questions

1. **Redesign Planning** (1-2 days)

- Analyze ARB feedback and required changes - Estimate redesign effort and timeline - Update project plan and communicate impact - Assign redesign tasks to team

1. **Return to Step 10** (2-4 weeks typical)

- Execute redesign activities - Incorporate ARB feedback - Update all artefacts (diagrams, ADRs, specs) - Conduct internal reviews before re-submission

1. **ARB Re-review** (schedule 1-2 weeks out)

- Submit updated review package - Highlight changes made in response to feedback - Present to ARB for approval - Repeat process if further rework needed

#### Best Practices

✅ **DO:**

- Document ARB decision and rationale thoroughly
- Track condition resolution proactively (don't wait for due dates)
- Communicate ARB decision to all stakeholders promptly
- Treat conditional approvals seriously (conditions are requirements)
- Learn from rework decisions (improve future submissions)

❌ **DON'T:**

- Proceed to development without ARB approval (or conditions met)
- Treat conditional approval as "full approval" (conditions matter)
- Ignore ARB feedback or recommendations
- Rush through condition resolution without quality checks
- Take rework decisions personally (opportunity to improve design)

#### Observability & Metrics

| Metric | Target | Measurement Method |
| --- | --- | --- |
| ARB Approval Rate (First Time) | ≥70% | Pass decisions / Total reviews |
| Conditional Approval Rate | 20-30% | Exception decisions / Total reviews |
| Rework Rate | ≤10% | Rework decisions / Total reviews |
| Condition Resolution Time | ≤10 days | Average days from ARB to conditions met |
| Rework Cycle Time | ≤4 weeks | Average days from rework decision to re-review |

---

## Key Artifacts

### Primary Deliverables

1. **Threat Model Document**

- Data flow diagrams with trust boundaries - STRIDE threat catalog (20-50 threats) - Attack vector analysis and scenarios - Threat prioritization and risk scores

1. **Security Controls List**

- Threat-to-control mapping - Control specifications and requirements - Implementation plans and owners - Testing and validation approach

1. **ARB Review Notes**

- ARB decision (Pass / Exception / Rework) - Scorecard with ratings and feedback - Conditions for approval (if Exception) - Recommendations and guidance

1. **Risk Assessment & Register**

- Risk catalog with likelihood and impact scores - Risk heatmap visualization - Mitigation plans and owners - Residual risk assessment

1. **Approval Documentation**

- Formal ARB decision record - Conditional approval tracking (if applicable) - Remediation plan (if rework) - Stakeholder communication

### Supporting Artifacts

- Threat modeling workshop notes
- ARB presentation slides
- Condition verification evidence
- Remediation plan and timeline

---

## Best Practices Summary

### Threat Modeling Practices

✅ **DO:**

- Conduct threat modeling early (design phase, not after implementation)
- Involve diverse perspectives (security, dev, QA, architecture)
- Focus on realistic, exploitable threats
- Document threats even if controls exist
- Use visual tools (DFDs, attack trees)

❌ **DON'T:**

- Skip threat modeling to save time (it's the cheapest vulnerability detection)
- Rely solely on automated tools
- Assume "we haven't been attacked, so we're safe"
- Ignore insider threats
- Conduct threat modeling in isolation

### Security Control Practices

✅ **DO:**

- Implement defense-in-depth (multiple control layers)
- Prioritize controls by risk (critical/high first)
- Document control specifications in detail
- Assign clear ownership and deadlines
- Include both preventive and detective controls

❌ **DON'T:**

- Implement controls without understanding threats
- Rely solely on preventive controls
- Leave control ownership ambiguous
- Defer critical controls to "post-launch"
- Specify controls without implementation details

### ARB Review Practices

✅ **DO:**

- Prepare thoroughly (practice presentation)
- Welcome feedback and tough questions
- Document all ARB feedback
- Address conditions promptly
- Use ARB as learning opportunity

❌ **DON'T:**

- Present without practicing
- Be defensive about feedback
- Hide risks to get approval
- Ignore non-blocking recommendations
- Skip follow-up on conditions

---

## Metrics & Observability

### Success Metrics

| Metric | Target | Measurement Frequency | Owner |
| --- | --- | --- | --- |
| **Threat Modeling Completion** | 100% | Per project | Security Architect |
| **Threats Identified** | 20-50 | Per threat model | Security Team |
| **Critical/High Threats** | ≤10 | Per threat model | Security Team |
| **P0 Control Implementation** | 100% before launch | Per project | Development Lead |
| **ARB Approval Rate (First Time)** | ≥70% | Per quarter | Lead Architect |
| **Conditional Approval Rate** | 20-30% | Per quarter | ARB Chair |
| **Rework Rate** | ≤10% | Per quarter | ARB Chair |
| **Condition Resolution Time** | ≤10 days | Per conditional approval | Project Manager |
| **Residual Risk Score** | <50 total | Per project | Security Architect |

### Health Indicators

| Indicator | Green | Yellow | Red | Action |
| --- | --- | --- | --- | --- |
| **Critical/High Threats** | ≤5 | 6-10 | >10 | Simplify design, add controls |
| **P0 Control Implementation** | 100% | 90-99% | <90% | Escalate, delay launch if needed |
| **ARB Approval Rate** | ≥80% | 60-79% | <60% | Improve design quality, ARB training |
| **Condition Resolution** | ≤7 days | 8-10 days | >10 days | Escalate, adjust timeline |
| **Residual Risk Score** | <30 | 30-50 | >50 | Additional mitigation required |

### Continuous Improvement KPIs

- **Vulnerabilities Found in Production:** Target <5 per release (decreasing trend)
- **Security Incidents:** Target zero breaches (track near-misses for learning)
- **Threat Model Accuracy:** % of production issues identified in threat model (increasing trend)
- **ARB Review Duration:** Target ≤2 hours (consistent or decreasing)

---

## Related Steps

- **Step 17: Flow Continues** - Preparation for ARB review
- **Step 10: Architecture Design** - Source design for review (return here if rework)
- **Step 19: IAC Jobs Runner** - Development begins after approval
- **Step 28: Secrets Scan** - Security scanning during development
- **Step 25: Code Review** - Security considerations in code review

---

## Summary

Step 18 represents the critical security and architecture quality gate before development. Through systematic threat modeling, security control identification, formal ARB review, and risk assessment, vulnerabilities are identified and mitigated proactively. This gate ensures only well-designed, secure, standards-compliant architectures proceed to implementation, preventing costly security issues and architectural flaws from reaching production.

**Key Success Factors:**

- Comprehensive threat modeling with diverse perspectives
- Clear security control specifications with ownership
- Thorough ARB preparation and presentation
- Honest risk assessment and mitigation planning
- Prompt resolution of conditional approval requirements

**Expected Outcomes:**

- 20-50 threats identified and mitigated before implementation
- 100% of critical security controls implemented before launch
- ARB approval (pass or conditional) obtained
- Residual risk profile documented and accepted
- Development team ready to implement secure architecture

---

## Navigation

|
 |