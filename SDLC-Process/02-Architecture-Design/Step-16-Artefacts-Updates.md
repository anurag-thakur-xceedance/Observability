# Step 16: Artefacts Updates

**Phase:** Architecture & Design
**Audience:** Architecture Team, Development Leads, Documentation Specialists
**Prerequisites:** Completed design activities (Steps 10-15)
**Outcomes:** Updated architecture documentation, ADRs, traceability, version-controlled artefacts

---

## Overview

This step ensures all architecture and design artefacts are systematically updated to reflect decisions made during the design phase. Proper documentation maintenance ensures knowledge preservation, team alignment, compliance, and enables future decision-making based on accurate historical context.

---

## Process Flow

```mermaid graph TD A[Artefacts Updates] --> B[16.1 Architecture Artefact Updates] A --> C[16.2 Wiki Updates] A --> D[16.3 Decision Record Updates] A --> E[16.4 Traceability Matrix Update] A --> F[16.5 Version Control & Review]

B --> B1[Update Architecture Diagrams] B --> B2[Update Component Specifications] B --> B3[Update Data Models] B --> B4[Update API Contracts]

C --> C1[Update Architecture Wiki] C --> C2[Update Design Patterns] C --> C3[Update Guidelines] C --> C4[Update Runbooks]

D --> D1[Capture New ADRs] D --> D2[Update Existing ADRs] D --> D3[Link ADRs to Features] D --> D4[Publish ADR Index]

E --> E1[Map Requirements to Design] E --> E2[Map Design to Tests] E --> E3[Track Coverage Gaps] E --> E4[Update Matrix]

F --> F1[Version All Artefacts] F --> F2[Peer Review] F --> F3[Commit to Repository] F --> F4[Notify Stakeholders]

B4 --> G[Updated Artefacts] C4 --> G D4 --> G E4 --> G F4 --> G

G --> H[Architecture Store] G --> I[Wiki Platform] G --> J[Version Control System]

style A fill:#e1f5ff style G fill:#d4edda style H fill:#d4edda style I fill:#d4edda style J fill:#d4edda ```

---

## Activities

### 16.1 Architecture Artefact Updates

**Owner:** Lead Architect, Solution Architect
**Duration:** 2-3 days
**Trigger:** Design phase activities completed (Steps 10-12)

Update all architecture documentation to reflect finalized design decisions, ensuring consistency and accuracy across all artefacts.

#### Process Steps

1. **Update Architecture Diagrams**

- **C4 Context Diagrams:** System boundaries and external actors - **C4 Container Diagrams:** High-level application structure - **C4 Component Diagrams:** Detailed component interactions - **Deployment Diagrams:** Infrastructure and deployment topology - **Sequence Diagrams:** Critical interaction flows - **Data Flow Diagrams:** Information movement and transformations

1. **Update Component Specifications**

- Component responsibilities and interfaces - Technology stack and framework versions - Configuration parameters and defaults - Security and compliance requirements - Performance characteristics and SLAs

1. **Update Data Models**

- Entity-Relationship Diagrams (ERDs) - Database schemas and migration scripts - API request/response schemas - Event schemas for message queues - Data validation rules and constraints

1. **Update API Contracts**

- OpenAPI/Swagger specifications - GraphQL schemas - gRPC proto definitions - REST API endpoint documentation - Versioning and deprecation policies

#### Architecture Artefact Checklist

| Artefact Type | Status | Last Updated | Owner | Review Required |
| --- | --- | --- | --- | --- |
| C4 Context Diagram | Updated | 2026-03-08 | Lead Architect | Yes |
| C4 Container Diagram | Updated | 2026-03-08 | Lead Architect | Yes |
| C4 Component Diagram | Updated | 2026-03-09 | Solution Architect | Yes |
| Deployment Diagram | Updated | 2026-03-09 | Infrastructure Architect | Yes |
| Sequence Diagrams (5) | Updated | 2026-03-09 | Solution Architect | Yes |
| Data Flow Diagrams | Updated | 2026-03-10 | Data Architect | Yes |
| Entity-Relationship Diagram | Updated | 2026-03-10 | Data Architect | Yes |
| API Specifications (OpenAPI) | Updated | 2026-03-10 | API Architect | Yes |
| Component Specifications | Updated | 2026-03-10 | Solution Architect | Yes |
| Security Architecture | Updated | 2026-03-10 | Security Architect | Yes |

#### Architecture Diagram Update Template

```markdown

## Component Diagram: Order Processing Service

**Diagram Version:** 2.1
**Last Updated:** 2026-03-09
**Author:** Jane Smith (Solution Architect)
**Status:** Approved

### Changes from Previous Version

- Added Redis cache layer for session management
- Introduced event bus for async order notifications
- Updated payment gateway integration to v3 API
- Added fraud detection service integration

### Diagram

[Mermaid/PlantUML diagram here]

### Components

- **Order API:** REST API for order management
- **Order Service:** Core business logic
- **Payment Gateway Client:** Integration with Stripe v3
- **Fraud Detection Client:** Integration with internal fraud service
- **Redis Cache:** Session and temporary data storage
- **Event Bus:** RabbitMQ for async messaging

### Dependencies

- External: Stripe Payment API v3, Internal Fraud Service
- Internal: Customer Service, Inventory Service, Notification Service

### Related ADRs

- [ADR-015: Adopt Redis for Session Management](link)
- [ADR-023: Migrate to Stripe API v3](link)
- [ADR-028: Implement Fraud Detection Integration](link)

```

#### Best Practices

✅ **DO:**

- Update diagrams using code-based tools (Mermaid, PlantUML) for version control
- Maintain diagram versioning with changelogs
- Keep diagrams at appropriate abstraction levels (avoid over-detailing)
- Link diagrams to related ADRs and specifications
- Include diagram legends and key explanations

❌ **DON'T:**

- Use proprietary binary formats (prefer text-based, version-controllable formats)
- Create diagrams without context or metadata
- Over-complicate diagrams with excessive detail
- Allow diagrams to drift from implementation
- Skip diagram reviews—treat as code artefacts

#### Observability & Metrics

| Metric | Target | Measurement Method |
| --- | --- | --- |
| Artefact Update Completion | 100% | Updated artefacts / Total required artefacts |
| Artefact Update Time | ≤3 days | Calendar days from design completion to artefact update |
| Diagram Version Control | 100% | Diagrams in version control / Total diagrams |
| Review Completion Rate | 100% | Reviewed artefacts / Total updated artefacts |

---

### 16.2 Wiki Updates

**Owner:** Technical Writer, Development Lead
**Duration:** 1-2 days
**Trigger:** Architecture artefacts finalized

Update internal wikis and documentation portals to reflect current architecture, design patterns, guidelines, and operational procedures.

#### Process Steps

1. **Update Architecture Wiki**

- System overview and architecture vision - Technology stack and rationale - Integration patterns and standards - Reference architecture diagrams - Glossary and terminology

1. **Update Design Patterns & Standards**

- Coding standards and style guides - Design patterns catalog (with examples) - Component templates and scaffolds - Security patterns and best practices - Performance optimization techniques

1. **Update Developer Guidelines**

- Development environment setup - Local testing and debugging procedures - Branch and merge strategies - Code review checklists - Troubleshooting guides

1. **Update Operational Runbooks**

- Deployment procedures - Rollback procedures - Monitoring and alerting setup - Incident response playbooks - Disaster recovery procedures

#### Wiki Structure Template

``` Architecture & Design Wiki ├── 1. Overview │ ├── System Architecture Vision │ ├── Technology Stack │ ├── Design Principles │ └── Architecture Goals ├── 2. Architecture Documentation │ ├── Context Diagrams │ ├── Container Diagrams │ ├── Component Diagrams │ ├── Data Architecture │ └── Security Architecture ├── 3. Design Patterns │ ├── API Design Patterns │ ├── Data Access Patterns │ ├── Integration Patterns │ ├── Security Patterns │ └── Resilience Patterns ├── 4. Developer Guides │ ├── Getting Started │ ├── Development Workflow │ ├── Testing Guidelines │ ├── Debugging Techniques │ └── Code Review Standards ├── 5. Operational Guides │ ├── Deployment Runbooks │ ├── Monitoring & Alerting │ ├── Incident Response │ ├── Disaster Recovery │ └── Maintenance Procedures └── 6. Decision Records (ADRs) ├── ADR Index ├── Active ADRs ├── Superseded ADRs └── Proposed ADRs ```

#### Wiki Page Update Checklist

| Page Category | Pages Updated | Status | Reviewer | Date |
| --- | --- | --- | --- | --- |
| System Overview | 3 | Complete | Lead Architect | 2026-03-10 |
| Architecture Diagrams | 8 | Complete | Solution Architect | 2026-03-10 |
| Design Patterns | 12 | In Progress | Senior Developer | 2026-03-11 |
| Developer Guides | 15 | Complete | Tech Lead | 2026-03-10 |
| API Documentation | 20 | Complete | API Architect | 2026-03-10 |
| Operational Runbooks | 10 | In Progress | DevOps Lead | 2026-03-11 |
| Security Guidelines | 5 | Complete | Security Architect | 2026-03-09 |

#### Best Practices

✅ **DO:**

- Use wiki templates for consistent structure
- Include "last updated" timestamps and author attribution
- Link related pages and create navigation paths
- Use search-friendly titles and tags
- Embed diagrams and code snippets directly

❌ **DON'T:**

- Duplicate content across multiple pages (link instead)
- Allow wiki content to become stale (set review schedules)
- Write overly long pages (break into focused topics)
- Use jargon without definitions
- Skip wiki reviews—outdated docs are worse than no docs

#### Observability & Metrics

| Metric | Target | Measurement Method |
| --- | --- | --- |
| Wiki Page Update Completion | 100% | Updated pages / Total affected pages |
| Wiki Update Time | ≤2 days | Calendar days from artefact finalization |
| Wiki Page Freshness | ≥90% pages updated within 3 months | Recent updates / Total pages |
| Wiki Page Views | Increasing trend | Monthly analytics tracking |

---

### 16.3 Decision Record Updates

**Owner:** Lead Architect, Engineering Leads
**Duration:** 1-2 days
**Trigger:** Design decisions finalized

Capture all significant architecture and design decisions in Architecture Decision Records (ADRs), ensuring rationale and context are preserved for future reference.

#### Process Steps

1. **Identify Decisions Requiring ADRs**

- Technology selections (frameworks, databases, services) - Architecture patterns (microservices, event-driven, etc.) - Integration approaches (REST, GraphQL, messaging) - Security and compliance decisions - Performance and scalability trade-offs

1. **Create New ADRs**

- Use standardized ADR template - Document context, decision, consequences - Link to related requirements and constraints - Capture alternatives considered and rejected - Assign unique ADR number and date

1. **Update Existing ADRs**

- Mark superseded ADRs as deprecated - Update ADR status (proposed → accepted → superseded) - Document evolution of decisions over time - Link new ADRs to superseded ones

1. **Publish ADR Index & Notifications**

- Maintain searchable ADR index - Notify relevant teams of new/updated ADRs - Present significant ADRs in architecture forums - Archive ADRs in version-controlled repository

#### ADR Template (MADR Format)

```markdown # ADR-027: Adopt Event-Driven Architecture for Order Processing

**Status:** Accepted
**Date:** 2026-03-08
**Decision Makers:** Lead Architect, Engineering Manager, Product Owner
**Tags:** #architecture #integration #scalability

## Context and Problem Statement

Order processing currently uses synchronous REST API calls, leading to tight coupling between services and scalability bottlenecks during peak loads. We need to decouple services and improve system resilience and scalability.

## Decision Drivers

- **Scalability:** Support 10x order volume growth
- **Resilience:** Tolerate downstream service failures gracefully
- **Decoupling:** Reduce service interdependencies
- **Complexity:** Minimize operational complexity
- **Cost:** Stay within infrastructure budget

## Considered Options

1. **Event-Driven Architecture with Message Queue**
2. **Continue with Synchronous REST APIs (status quo)**
3. **Hybrid: REST for reads, Events for writes**

## Decision Outcome

**Chosen option:** "Event-Driven Architecture with Message Queue" (Option 1)

We will adopt RabbitMQ as the message broker and implement event-driven patterns for order processing workflows. Services will publish domain events, and interested services will subscribe.

### Consequences

**Positive:**

- Improved scalability: Services can process events asynchronously at their own pace
- Better resilience: Downstream failures don't block order placement
- Loose coupling: Services communicate via events, not direct API calls
- Audit trail: Event log provides complete order history

**Negative:**

- Increased complexity: Async processing requires careful error handling
- Eventual consistency: Data may be temporarily inconsistent across services
- Operational overhead: RabbitMQ adds infrastructure to manage
- Learning curve: Team needs training on event-driven patterns

**Neutral:**

- Testing complexity shifts from integration tests to event contract tests

## Validation

- POC demonstrated 5x throughput improvement under load
- Successfully handled simulated downstream service failures
- Team completed RabbitMQ training (2 days)

## Implementation Notes

- Implement Circuit Breaker pattern for external service calls
- Use Saga pattern for distributed transactions
- Implement comprehensive event monitoring and alerting
- Document event schemas in shared repository

## Related Decisions

- ADR-015: Adopt Redis for Session Management
- ADR-018: Microservices Architecture
- ADR-025: Service Mesh for Service Discovery

## References

- [Event-Driven Architecture Patterns](https://microservices.io/patterns/data/event-driven-architecture.html)
- [RabbitMQ Best Practices](https://www.rabbitmq.com/best-practices.html)
- POC Repository: github.com/company/order-poc-events

```

#### ADR Tracking Table

| ADR # | Title | Status | Date | Decision Maker | Related Feature |
| --- | --- | --- | --- | --- | --- |
| ADR-025 | Service Mesh for Discovery | Accepted | 2026-02-15 | Lead Architect | Platform |
| ADR-026 | GraphQL for Mobile API | Accepted | 2026-03-01 | API Architect | Mobile App |
| ADR-027 | Event-Driven Order Processing | Accepted | 2026-03-08 | Lead Architect | Order System |
| ADR-028 | Fraud Detection Integration | Accepted | 2026-03-09 | Security Architect | Payment |
| ADR-029 | Redis Caching Strategy | Proposed | 2026-03-10 | Infrastructure Lead | Performance |

#### Best Practices

✅ **DO:**

- Create ADRs for all significant decisions (reversible or irreversible)
- Document decisions when made (not retrospectively)
- Include alternatives considered and why they were rejected
- Link ADRs to related requirements, features, and other ADRs
- Review ADRs periodically and update status

❌ **DON'T:**

- Create ADRs for trivial or obvious decisions
- Write ADRs without team involvement and consensus
- Skip documenting consequences (positive and negative)
- Ignore superseded ADRs—maintain history and links
- Make decisions without considering ADR documentation

#### Observability & Metrics

| Metric | Target | Measurement Method |
| --- | --- | --- |
| ADR Creation Rate | 1-3 ADRs per sprint | New ADRs created |
| ADR Completion Time | ≤2 days | Time from decision to published ADR |
| ADR Coverage | 100% | Major decisions documented / Total decisions |
| ADR Review Frequency | Quarterly | Last review date tracking |

---

### 16.4 Traceability Matrix Update

**Owner:** Business Analyst, QA Lead
**Duration:** 1-2 days
**Trigger:** Design and test documentation completed

Update the requirements traceability matrix to ensure all requirements are mapped to design components, test cases, and implementation tasks.

#### Process Steps

1. **Map Requirements to Design Components**

- Link functional requirements to architecture components - Link non-functional requirements to architectural decisions - Identify requirements without design coverage - Document design rationale for each requirement

1. **Map Design to Test Cases**

- Link design components to test scenarios - Ensure test coverage for all critical paths - Identify untested design elements - Map test types to requirements (unit, integration, E2E)

1. **Identify Coverage Gaps**

- Requirements without design coverage - Design components without test coverage - Test cases without requirement linkage (orphaned tests) - Over-tested vs. under-tested areas

1. **Update Traceability Matrix**

- Update bidirectional requirement links - Tag requirements by status (covered, partial, uncovered) - Generate coverage reports - Share with stakeholders for review

#### Traceability Matrix Template

| Requirement ID | Requirement Description | Design Component(s) | Architecture Decision (ADR) | Test Cases | Implementation Task | Status |
| --- | --- | --- | --- | --- | --- | --- |
| REQ-001 | User login with SSO | AuthService, SSOGateway | ADR-012 | TC-AUTH-001 to TC-AUTH-015 | TASK-105 | Complete |
| REQ-002 | Order placement | OrderService, PaymentGateway | ADR-027 | TC-ORDER-001 to TC-ORDER-030 | TASK-112 | In Progress |
| REQ-003 | Real-time inventory check | InventoryService, Cache | ADR-015, ADR-029 | TC-INV-001 to TC-INV-010 | TASK-118 | Planned |
| REQ-004 | Order history export | OrderService, ExportWorker | ADR-027 | TC-EXPORT-001 to TC-EXPORT-005 | TASK-125 | Planned |
| REQ-NFR-001 | Response time <200ms | Redis Cache, CDN | ADR-015, ADR-021 | TC-PERF-001 to TC-PERF-020 | TASK-130 | In Progress |

#### Coverage Analysis Report

```markdown

## Requirements Traceability Coverage Report

**Report Date:** 2026-03-10
**Sprint:** Sprint 12

### Summary

- **Total Requirements:** 87
- **Covered by Design:** 82 (94%)
- **Partially Covered:** 3 (3%)
- **Not Covered:** 2 (3%)

### Coverage by Priority

| Priority | Total | Covered | Coverage % |
| --- | --- | --- | --- |
| P0 (Critical) | 25 | 25 | 100% |
| P1 (High) | 35 | 34 | 97% |
| P2 (Medium) | 20 | 18 | 90% |
| P3 (Low) | 7 | 5 | 71% |

### Gaps Identified

1. **REQ-042:** Email notification template management - No design component identified
2. **REQ-065:** Advanced search filters - Partially covered (missing faceted search)

### Action Items

- [ ] Design component for email template management (Owner: Design Lead)
- [ ] Extend SearchService with faceted search capability (Owner: Search Architect)

```

#### Best Practices

✅ **DO:**

- Maintain bidirectional traceability (requirements ↔ design ↔ tests ↔ code)
- Use traceability tools or automated linking (Jira, Azure DevOps or Jira, etc.)
- Update traceability matrix continuously (not just at milestones)
- Review coverage gaps regularly with stakeholders
- Generate and share coverage reports

❌ **DON'T:**

- Treat traceability as a one-time activity
- Allow orphaned artefacts (tests without requirements, etc.)
- Skip gap analysis—gaps indicate risks
- Maintain traceability manually if tools are available
- Ignore low coverage areas without justification

#### Observability & Metrics

| Metric | Target | Measurement Method |
| --- | --- | --- |
| Requirements Coverage | 100% P0, ≥95% P1 | Covered requirements / Total requirements |
| Design-to-Test Coverage | ≥90% | Tested components / Total components |
| Matrix Update Time | ≤1 day | Time from design completion to matrix update |
| Coverage Gap Resolution | ≤5 days | Time from gap identification to resolution |

---

### 16.5 Version Control & Review

**Owner:** Lead Architect, Configuration Manager
**Duration:** 1 day
**Trigger:** All artefacts updated

Apply version control, conduct peer reviews, and ensure all artefacts are properly stored and accessible.

#### Process Steps

1. **Version All Artefacts**

- Apply semantic versioning (major.minor.patch) - Tag artefacts with sprint/release numbers - Maintain version history and changelogs - Archive previous versions for reference

1. **Conduct Peer Reviews**

- Assign reviewers for each artefact type - Review for accuracy, completeness, clarity - Ensure consistency across related artefacts - Approve or request revisions

1. **Commit to Version Control Repository**

- Store artefacts in Git or similar VCS - Use meaningful commit messages with context - Tag commits with version and sprint numbers - Link commits to work items and ADRs

1. **Notify Stakeholders**

- Announce updated artefacts to relevant teams - Highlight significant changes and impacts - Provide links to updated documentation - Schedule walkthrough sessions if needed

#### Version Control Strategy

| Artefact Type | Versioning Scheme | Storage Location | Review Required | Approval Authority |
| --- | --- | --- | --- | --- |
| Architecture Diagrams | Major.Minor | Git: /docs/architecture/ | Yes | Lead Architect |
| ADRs | Sequential (ADR-001) | Git: /docs/decisions/ | Yes | Architecture Board |
| API Specifications | Semantic (v2.1.0) | Git: /specs/api/ | Yes | API Architect |
| Wiki Pages | Auto-versioned | Confluence/Wiki | Yes | Page Owner |
| Test Plans | Major.Minor | Git: /docs/testing/ | Yes | QA Lead |
| Runbooks | Major.Minor | Git: /docs/runbooks/ | Yes | DevOps Lead |

#### Artefact Review Checklist

**For All Artefacts:**

- [ ] Accurate and reflects current design
- [ ] Complete with all required sections
- [ ] Consistent with related artefacts
- [ ] Clearly written and understandable
- [ ] Properly versioned with changelog
- [ ] Linked to related requirements, ADRs, components

**For Diagrams:**

- [ ] Appropriate level of abstraction
- [ ] Legend and notation explained
- [ ] Relationships clearly depicted
- [ ] Text-based format (Mermaid, PlantUML) for version control

**For ADRs:**

- [ ] Context and problem clearly stated
- [ ] Alternatives considered and evaluated
- [ ] Consequences documented (positive and negative)
- [ ] Related ADRs linked

#### Git Commit Strategy

```bash # Good commit message examples git commit -m "docs(arch): Update C4 container diagram for order service (v2.1) - Added Redis cache layer and event bus integration - Related to ADR-027, REQ-002"

git commit -m "docs(adr): Add ADR-027 for event-driven order processing - Documented decision to adopt RabbitMQ for async processing - Addresses scalability and resilience requirements"

git commit -m "docs(wiki): Update deployment runbook with rollback procedures - Added detailed rollback steps for failed deployments - Reviewed by DevOps team" ```

#### Best Practices

✅ **DO:**

- Version all documentation using semantic versioning
- Conduct peer reviews for all significant artefact updates
- Use text-based formats for diagrams (enables version control diffs)
- Write detailed commit messages with context and links
- Notify stakeholders proactively of significant updates

❌ **DON'T:**

- Skip versioning—every change should be tracked
- Commit without peer review for significant artefacts
- Use binary formats for diagrams (hard to diff and merge)
- Write vague commit messages like "updated docs"
- Assume stakeholders will discover updates—communicate explicitly

#### Observability & Metrics

| Metric | Target | Measurement Method |
| --- | --- | --- |
| Version Control Coverage | 100% | Artefacts in VCS / Total artefacts |
| Review Completion Rate | 100% | Reviewed artefacts / Total updated artefacts |
| Review Turnaround Time | ≤1 day | Time from submission to approval |
| Stakeholder Notification | 100% | Teams notified / Affected teams |

---

## Key Artifacts

### Primary Deliverables

1. **Updated Architecture Documentation**

- C4 diagrams (context, container, component) - Deployment diagrams - Sequence diagrams for critical flows - Data models and ERDs - API specifications (OpenAPI, GraphQL schemas)

1. **Updated Wiki Pages**

- System architecture overview - Design patterns catalog - Developer guides and runbooks - Operational procedures - Troubleshooting guides

1. **Architecture Decision Records (ADRs)**

- New ADRs for design phase decisions - Updated status for existing ADRs - ADR index and navigation - Links to related requirements and components

1. **Requirements Traceability Matrix**

- Requirements mapped to design components - Design components mapped to test cases - Coverage gap analysis - Implementation task linkage

1. **Version Control Commits**

- All artefacts committed to VCS - Versioned and tagged appropriately - Reviewed and approved - Stakeholders notified

### Supporting Artifacts

- Artefact version history and changelogs
- Peer review notes and approvals
- Coverage reports and gap analysis
- Stakeholder notification records

---

## Best Practices Summary

### Documentation Practices

✅ **DO:**

- Treat documentation as code (version control, reviews, CI/CD)
- Update documentation incrementally (not in large batches)
- Use text-based formats for diagrams (Mermaid, PlantUML)
- Maintain bidirectional traceability links
- Keep documentation close to code (same repository)

❌ **DON'T:**

- Create documentation after the fact (document as you go)
- Use proprietary binary formats for diagrams
- Allow documentation to drift from implementation
- Skip peer reviews for documentation updates
- Duplicate content across multiple locations

### ADR Practices

✅ **DO:**

- Document decisions when made (capture context while fresh)
- Include alternatives considered and rationale for rejection
- Document both positive and negative consequences
- Link ADRs to requirements, features, and related ADRs
- Review and update ADR status regularly

❌ **DON'T:**

- Create ADRs retrospectively (context is lost)
- Skip documenting consequences (especially negative ones)
- Make significant decisions without ADRs
- Allow ADRs to become outdated without status updates
- Write ADRs in isolation (involve team in decision)

### Traceability Practices

✅ **DO:**

- Maintain bidirectional traceability (requirements ↔ design ↔ tests ↔ code)
- Use automated tools for traceability (Jira, Azure DevOps or Jira, etc.)
- Review coverage gaps regularly
- Update traceability matrix continuously
- Generate and share coverage reports with stakeholders

❌ **DON'T:**

- Treat traceability as a compliance exercise only
- Maintain traceability manually if tools are available
- Ignore coverage gaps (they indicate risks)
- Allow orphaned artefacts (tests without requirements, etc.)
- Skip gap analysis and resolution

---

## Metrics & Observability

### Success Metrics

| Metric | Target | Measurement Frequency | Owner |
| --- | --- | --- | --- |
| **Artefact Update Completion** | 100% | Per sprint | Lead Architect |
| **Artefact Update Time** | ≤3 days | Per update cycle | Configuration Manager |
| **Review Completion Rate** | 100% | Per sprint | Lead Architect |
| **Review Turnaround Time** | ≤1 day | Per review | Reviewers |
| **Requirements Coverage** | 100% P0, ≥95% P1 | Per sprint | Business Analyst |
| **Design-to-Test Coverage** | ≥90% | Per sprint | QA Lead |
| **ADR Creation Rate** | 1-3 per sprint | Per sprint | Architecture Team |
| **Version Control Coverage** | 100% | Continuous | Configuration Manager |
| **Wiki Page Freshness** | ≥90% updated within 3 months | Monthly | Tech Lead |

### Health Indicators

| Indicator | Green | Yellow | Red | Action |
| --- | --- | --- | --- | --- |
| **Artefact Update Completion** | 100% | 90-99% | <90% | Prioritize remaining updates |
| **Requirements Coverage** | ≥95% | 85-94% | <85% | Address coverage gaps immediately |
| **Review Turnaround** | ≤1 day | 1-2 days | >2 days | Add reviewers or expedite |
| **Wiki Freshness** | ≥90% | 70-89% | <70% | Schedule wiki update sprint |
| **ADR Coverage** | 100% decisions | 90-99% | <90% | Identify undocumented decisions |

### Continuous Improvement KPIs

- **Documentation Debt:** Track outdated artefacts, target ≤5% of total
- **Artefact Accessibility:** Track wiki page views, ensure increasing trend
- **Stakeholder Satisfaction:** Survey score ≥4/5 for documentation quality
- **Time to Find Information:** Track search time, target ≤5 minutes

---

## Related Steps

- **Step 10: Architecture Design** - Source of architecture documentation to update
- **Step 11: IAC Suggester & Reviewer** - Infrastructure documentation updates
- **Step 12: Design And Implementation** - Technical specification updates
- **Step 13: Test Approach Definition** - Test plan documentation updates
- **Step 14: Performance Test Definition** - Performance test documentation updates
- **Step 15: Automation Test Definition** - Automation test documentation updates
- **Step 17: Flow Continues** - Next phase after documentation complete

---

## Summary

Step 16 ensures comprehensive, accurate, and accessible documentation of all architecture and design decisions. By systematically updating architecture artefacts, wikis, ADRs, and traceability matrices, teams preserve critical knowledge, enable informed decision-making, maintain compliance, and facilitate onboarding and knowledge transfer.

**Key Success Factors:**

- Treat documentation as code (version control, reviews, automation)
- Update documentation continuously, not in large batches
- Maintain bidirectional traceability across requirements, design, tests, and code
- Document decisions when made (capture context while fresh)
- Conduct peer reviews for all significant artefact updates

**Expected Outcomes:**

- 100% of design decisions documented in artefacts and ADRs
- Complete requirements traceability maintained
- All documentation version-controlled and peer-reviewed
- Stakeholders informed and aligned on design decisions
- Reduced knowledge silos and improved team alignment

---

## Navigation

|
 |