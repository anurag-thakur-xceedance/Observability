# Step 03: Architecture Artefact Store

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 3 |
| **Phase** | Product Feedback & Discovery |
| **Previous Step** | Step 2: Copilot Review |
| **Next Step** | Step 4: Work Item Integration |
| **Responsible Role(s)** | Architecture Team |
| **Tools** | Wiki, Architecture Repository |

---

## Purpose

Central repository for architecture artefacts that supports the development lifecycle. This store maintains all architectural documentation, diagrams, and decisions that inform implementation and ensure consistency across the project.

---

## Inputs

| Input | Source | Description |
| --- | --- | --- |
| Enhanced Work Items | Step 2 | Work items with AI enhancements |
| Architecture Considerations | Step 1 | Technical considerations from stakeholders |
| Existing Architecture Docs | Architecture Repository | Current architecture documentation |

---

## Activities

### 3.1 Artefact Retrieval

**Owner:** Architecture Team
**Duration:** 1-2 business days

#### Process Steps:

1. **Identify Required Artefacts**

- Based on work items from Steps 1-2, identify needed artefacts: - **System Context Diagrams:** How system fits in ecosystem - **Architecture Decision Records (ADRs):** Past decisions affecting work - **High-Level Design (HLD) Documents:** Existing system designs - **Component Diagrams:** System structure and relationships - **Data Models:** Database schemas and data flows - **API Specifications:** Existing API contracts - **Infrastructure Diagrams:** Deployment and infrastructure - **Security Models:** Authentication, authorization patterns - **Integration Diagrams:** External system interactions

1. **Search Architecture Repository**

- Search centralized architecture store: - **Wiki/Confluence:** Documentation pages - **Git Repository:** Architecture docs in version control - **Azure DevOps or Jira Wiki:** Team documentation - **SharePoint/OneDrive:** Shared documents - **Architecture Tool:** Specialized tools (Sparx EA, Archimate) - Use keywords from work items to find relevant docs - Check document version and currency

1. **Assess Artefact Relevance**

- Evaluate retrieved artefacts: - **Currency:** Is document up-to-date? - **Accuracy:** Does it reflect current state? - **Completeness:** Contains needed information? - **Applicability:** Relevant to current work items? - Identify outdated or obsolete artefacts needing updates

1. **Gap Analysis**

- Identify missing artefacts: - New features requiring new designs - Undocumented existing systems - Missing architecture views or perspectives - Incomplete or outdated documentation - Prioritize artefacts to create or update based on work item needs

**Artefact Catalog:**

| Artefact Type | Description | When Needed | Format |
| --- | --- | --- | --- |
| Context Diagram | System boundaries and external entities | New features, integrations | C4 Model - Level 1 |
| Container Diagram | High-level system architecture | System changes | C4 Model - Level 2 |
| Component Diagram | Internal system structure | Component changes | C4 Model - Level 3 |
| ADR | Architecture decisions and rationale | Understanding past choices | Markdown |
| Data Model | Database schemas and relationships | Data structure changes | ERD, UML |
| API Specification | API endpoints and contracts | API changes | OpenAPI/Swagger |
| Deployment Diagram | Infrastructure and deployment | Infrastructure changes | UML, C4 |
| Sequence Diagram | Process flows and interactions | Complex workflows | UML, PlantUML |

---

### 3.2 Artefact Creation/Update

**Owner:** Architecture Team / Solution Architect
**Duration:** 3-5 business days (varies by complexity)

#### Process Steps:

1. **Create New Artefacts**

For each identified gap, create appropriate artefact:

**A. System Context Diagram (C4 Level 1)**

- Show system in context of users and external systems - Identify: - Primary users and personas - External systems and services - Data sources and sinks - Third-party integrations - Use C4 notation or standard tools - Keep high-level and accessible to non-technical stakeholders

**B. Container Diagram (C4 Level 2)**

- Show high-level system architecture - Identify: - Web applications, APIs, services - Databases and data stores - Message queues or event buses - External service integrations - Technology choices for each container - Show major communication paths

**C. Component Diagram (C4 Level 3)**

- Detail internal structure of containers - Identify: - Major components and modules - Component responsibilities - Inter-component dependencies - Key abstractions and interfaces - Use for areas affected by work items

**D. Sequence Diagrams**

- Model complex workflows and interactions - Show: - Actor initiating flow - Sequence of system interactions - Data passed between components - Decision points and branching - Error handling flows - Use for critical or complex user journeys

1. **Update Existing Artefacts**

- Revise outdated artefacts: - Add new components or services - Update relationships and dependencies - Reflect architecture evolution - Document changes and rationale - Maintain version history - Mark outdated versions as deprecated

1. **Select Appropriate Tools**

- **Diagramming Tools:** - **Draw.io/Diagrams.net:** Free, web-based, integrates with many platforms - **Lucidchart:** Collaborative cloud-based diagrams - **Microsoft Visio:** Enterprise diagramming - **PlantUML:** Text-based diagram generation - **Mermaid:** Markdown-based diagrams (good for Git) - **Architecture Tools:** - **Sparx Enterprise Architect:** Full-featured modeling - **Archi/Archimate:** Enterprise architecture - **API Documentation:** - **Swagger/OpenAPI:** REST API specifications - **Postman:** API documentation and testing - Choose tools with version control integration

1. **Apply Architecture Patterns**

- Use established patterns where applicable: - **Microservices:** Independent, loosely coupled services - **API Gateway:** Single entry point for clients - **Event-Driven:** Asynchronous event-based communication - **CQRS:** Separate read and write models - **Saga Pattern:** Distributed transaction management - **Circuit Breaker:** Fault tolerance and resilience - **Backend for Frontend (BFF):** Client-specific backends - Document pattern selection and rationale - Reference pattern catalog or standards

**Architecture Documentation Standards:**

- Use consistent notation (C4, UML, ArchiMate)
- Include legend/key for diagram elements
- Add title, version, date, and author
- Provide description and context
- Use meaningful naming conventions
- Keep diagrams focused and uncluttered
- Layer details across multiple diagrams

---

### 3.3 Context Diagrams

**Owner:** Lead Architect
**Duration:** 1-2 business days

#### Process Steps:

1. **System Context Definition**

- Define system boundary: - What is inside the system (in scope) - What is outside the system (external dependencies) - Where data enters and exits - Who uses the system - Establish clear scope for architecture work

1. **Identify External Actors**

- **Users and Personas:** - End users (customers, employees) - Administrators - Support personnel - API consumers - **External Systems:** - Identity providers (Azure AD, Auth0) - Payment gateways - Email services - CRM systems - Analytics platforms - Partner systems - **Data Sources:** - Legacy databases - Third-party data feeds - File systems - External APIs

1. **Define Interactions**

- Show how actors interact with system: - User actions (UI, CLI, API) - System integrations (REST, GraphQL, messaging) - Data flows (read, write, sync) - Authentication and authorization - Label interactions with protocols or methods

1. **Create C4 Level 1 Diagram**

``` [User] --> [Your System] : Uses [Your System] --> [External API] : Calls [Your System] --> [Database] : Reads/Writes [Email Service] --> [Your System] : Sends notifications ``` - Use standard C4 notation: - Blue boxes for internal systems - Grey boxes for external systems/people - Arrows for relationships - Keep simple and high-level - Focus on understanding for stakeholders

**Context Diagram Best Practices:**

- One diagram per system or major subsystem
- Show only direct relationships (no transitive)
- Use business language, not technical jargon
- Include all major external dependencies
- Update as system boundaries change
- Review with non-technical stakeholders for clarity

---

### 3.4 Architecture Decision Recording

**Owner:** Architecture Team (collective)
**Duration:** Ongoing (30 min to 1 hour per ADR)

#### Process Steps:

1. **Identify Decision Points**

- Recognize when an ADR is needed: - Technology selection (frameworks, databases, platforms) - Architecture pattern choice - Significant design trade-offs - Integration approach decisions - Security or compliance choices - Performance or scalability strategies - Major refactoring or modernization

1. **Use ADR Template**

Standard ADR structure:

```markdown # ADR-XXX: [Short Title]

## Status [Proposed | Accepted | Deprecated | Superseded by ADR-YYY]

## Context What is the issue that we're seeing that is motivating this decision? - Business context - Technical context - Constraints and requirements - Relevant background information

## Decision What is the change that we're proposing and/or doing? - Clear statement of the decision - Chosen solution or approach - Key aspects of the decision

## Consequences What becomes easier or more difficult to do because of this change? - Positive consequences (benefits) - Negative consequences (trade-offs, costs) - Risks and mitigation - Impact on other systems or teams

## Alternatives Considered What other options were evaluated? - Alternative 1: [Description and why not chosen] - Alternative 2: [Description and why not chosen]

## References - Related ADRs - External documentation - Research or benchmarks ```

1. **Document Decision Process**

- Record who was involved: - Decision makers - Consulted experts - Informed stakeholders - Note when decision was made - Link to discussions or meetings - Capture dissenting opinions if significant

1. **Evaluate Alternatives**

- For each alternative, document: - **Pros:** Benefits and advantages - **Cons:** Drawbacks and limitations - **Costs:** Implementation and operational costs - **Risks:** Technical and business risks - **Complexity:** Development and operational complexity - Use decision matrix for complex choices:

| Criterion | Weight | Option A | Option B | Option C |
| --- | --- | --- | --- | --- |
| Performance | 30% | 8 | 6 | 9 |
| Cost | 25% | 6 | 9 | 5 |
| Scalability | 20% | 7 | 7 | 8 |
| Team Skills | 15% | 9 | 6 | 5 |
| Maintainability | 10% | 7 | 8 | 6 |
| **Weighted Score** |  | **7.4** | **7.3** | **7.1** |

1. **Store and Version ADRs**

- Store ADRs in version control: - Git repository with docs/adr/ folder - Markdown format for easy diffs - Sequential numbering (ADR-001, ADR-002, etc.) - Commit ADRs with meaningful messages - Tag or branch for major decisions - Make ADRs searchable and discoverable

1. **Communicate Decisions**

- Announce significant ADRs to team: - Team meeting presentation - Email summary to stakeholders - Link in project wiki or documentation - Include in sprint reviews if relevant - Ensure affected parties understand implications - Gather feedback and questions

**ADR Best Practices:**

- Write ADRs in present tense (record current state)
- Be concise but complete
- Focus on "why" not just "what"
- Include enough context for future understanding
- Update status as decisions evolve
- Link related ADRs (supersedes, relates to)
- Review and update periodically
- Make ADRs immutable (create new ADR for changes)

---

### 3.5 Artefact Publishing

**Owner:** Architecture Team
**Duration:** 1 business day

#### Process Steps:

1. **Organize Artefacts**

- Structure artefacts logically: ``` Architecture/ ├── Overview/ │ ├── System-Context.png │ ├── Container-Diagram.png │ └── Technology-Radar.md ├── Components/ │ ├── API-Gateway/ │ ├── User-Service/ │ └── Payment-Service/ ├── ADRs/ │ ├── ADR-001-Use-Microservices.md │ ├── ADR-002-Choose-PostgreSQL.md │ └── ADR-003-Event-Driven-Architecture.md ├── Data-Models/ │ ├── ER-Diagrams/ │ └── Data-Dictionary.md ├── APIs/ │ ├── openapi.yaml │ └── API-Guidelines.md ├── Infrastructure/ │ ├── Deployment-Diagram.png │ └── Infrastructure-as-Code/ └── Security/ ├── Threat-Model.md └── Security-Architecture.md ```

1. **Version Control Integration**

- Commit artefacts to Git repository: - Use meaningful commit messages - Tag major versions or milestones - Create pull requests for review - Maintain changelog for significant updates - Enable collaboration and history tracking

1. **Wiki Publication**

- Publish to team wiki: - Create wiki structure mirroring repository - Embed diagrams and documents - Create table of contents and navigation - Add search keywords and tags - Make easily discoverable and browsable

1. **Link to Work Items**

- Create traceability from artefacts to work items: - Add wiki links to Azure DevOps or Jira work items - Tag work items with relevant artefacts - Create artefact reference in work item comments - Use consistent naming conventions - Enable bidirectional navigation

1. **Notification and Communication**

- Announce new or updated artefacts: - Post in team channels (Teams/Slack) - Email to architecture review board - Present in sprint planning or review - Add to architecture newsletter if exists - Include summary of changes and impact

1. **Access Control and Permissions**

- Set appropriate access levels: - Public artefacts: All team members can view - Restricted artefacts: Architecture team and leads - Confidential: Security or compliance-sensitive docs - Use repository or wiki permissions - Ensure external stakeholders have appropriate access

1. **Maintain Artefact Catalog**

- Create and maintain central catalog: - List of all artefacts with descriptions - Links to locations (repo, wiki, other) - Ownership and contact information - Last updated date - Relevance to projects or systems - Make catalog the entry point for finding artefacts

**Artefact Catalog Example:**

| Artefact | Type | Location | Owner | Last Updated | Related Systems |
| --- | --- | --- | --- | --- | --- |
| System Context Diagram | Diagram | [Wiki Link] | Lead Architect | 2026-01-15 | All |
| ADR-003: Event Architecture | ADR | [Git Link] | Architect | 2026-01-10 | Event Service |
| API Specification | OpenAPI | [Git Link] | API Lead | 2026-01-20 | API Gateway |
| User Data Model | ERD | [Wiki Link] | Data Architect | 2026-01-12 | User Service |

**Publishing Checklist:**

- [ ] Artefacts organized logically
- [ ] Committed to version control
- [ ] Published to wiki or documentation site
- [ ] Linked from relevant work items
- [ ] Team notified of availability
- [ ] Access permissions configured
- [ ] Catalog updated
- [ ] Review feedback incorporated

---

## Outputs

| Output | Destination | Description |
| --- | --- | --- |
| Architecture Artefacts | Step 4, Step 10 | Updated architecture documentation |
| Context Diagrams | Wiki | System context diagrams |
| Architecture Decision Records | Wiki | Documented architecture decisions |
| HLD (High-Level Design) | Step 10 | High-level design documents |
| NFRs | Step 13 | Non-functional requirements |

---

## Quality Gates / Exit Criteria

- [ ] Relevant artefacts retrieved or created
- [ ] Artefacts reviewed and approved
- [ ] Artefacts published to central store
- [ ] Traceability to work items maintained

---

## AI/Automation Augmentation

| Capability | Tool/Service | Description |
| --- | --- | --- |

---

## Observability & Metrics

| Reference | Type | Description |
| --- | --- | --- |
| DK1 | Document Output | Architecture Output - Artefacts |
| DK2 | Document Output | Wiki |

---

## Related Artefacts

- Architecture Decision Record Template
- Context Diagram Template
- High-Level Design Template
- NFR Template

---

## RACI Matrix

| Role | Responsibility |
| --- | --- |
| **Responsible** | Architecture Team |
| **Accountable** | Lead Architect |
| **Consulted** | Development Lead, SRE |
| **Informed** | Product Owner, Development Team |

---

## Related Steps

- **Upstream:** Step 2: Copilot Review
- **Downstream:** Step 4: Work Item Integration

---

## Revision History

| Version | Date | Author | Changes |
| --- | --- | --- | --- |
| 1 | 2026-03-25 | Simon Armstrong | Initial draft |

---

## Navigation

|
 |