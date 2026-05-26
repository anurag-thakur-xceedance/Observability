# Step 12: Design And Implementation

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 12 |
| **Phase** | Architecture & Design |
| **Previous Step** | Step 11: IAC Suggester Reviewer |
| **Next Step** | Step 13: Test Approach Definition |
| **Responsible Role(s)** | Development Team, Architecture |
| **Tools** | IDE, Azure DevOps or Jira |

---

## Purpose

Bridge between architecture design and implementation. This step translates architectural decisions into implementation specifications and prepares the development team for execution. It ensures developers have clear, actionable guidance to build the solution correctly and consistently.

---

## Process Flow

```mermaid graph TD A[Architecture + IAC] --> B[12.1 Implementation Planning] B --> C[12.2 Technical Specification] C --> D[12.3 Interface Definition] D --> E[12.4 Development Guidelines] E --> F[12.5 Implementation Handoff] F --> G[Development Team Ready] G --> H[Development Phase] ```

---

## Inputs

| Input | Source | Description |
| --- | --- | --- |
| Solution Architecture | Step 10 | Detailed solution architecture |
| IAC Suggestions | Step 11 | Infrastructure code suggestions |
| Component Designs | Step 10 | Component specifications |
| Sprint Backlog | Step 5 | Current sprint work items |

---

## Activities

### 12.1 Implementation Planning

**Owner:** Development Lead with Architecture
**Duration:** 1-2 business days

#### Process Steps:

1. **Break Down Work into Implementation Tasks**

- Decompose architecture components into tasks: - Frontend components and pages - Backend services and APIs - Database schema and migrations - Infrastructure provisioning - Integration points - Testing requirements - Create task hierarchy: - Epic → Feature → Story → Implementation Tasks - Map architecture components to work items - Identify dependencies between tasks - Estimate effort for each task: - Development time - Testing time - Code review time - Documentation time

1. **Determine Implementation Sequence**

- Identify critical path: - Dependencies that must be completed first - Infrastructure before application code - Core services before dependent services - Database schema before data access - Plan parallel work streams: - Frontend and backend can work in parallel (with API contract) - Independent services can be developed concurrently - Testing can overlap with development - Consider risk mitigation: - Implement high-risk items early - Prototype uncertain areas - Plan spikes for unknowns

1. **Define Development Phases**

- Phase 1: Foundation - Infrastructure provisioning - Database schema - Core authentication/authorization - Base API framework - Phase 2: Core Features - Primary business logic - Main user flows - Key integrations - Phase 3: Enhancement - Additional features - Optimizations - Polish and refinement - Phase 4: Hardening - Performance tuning - Security hardening - Production readiness

1. **Plan Integration Strategy**

- Define integration approach: - **Bottom-Up:** Build and integrate small units first - **Top-Down:** Build high-level structure, fill in details - **Big Bang:** Integrate everything at once (risky) - **Incremental:** Integrate in stages (recommended) - Plan integration points: - When to integrate frontend with backend - When to integrate with external services - When to integrate multiple microservices - Define integration testing strategy: - Mock external dependencies initially - Use contract testing for API boundaries - Integration tests for each integration point

1. **Identify Technical Prerequisites**

- Development environment setup: - IDE and tools installation - Local development environment - Access to development infrastructure - Sample data and test accounts - Code repository setup: - Repository structure - Branch strategy (main, develop, feature branches) - CI/CD pipeline configuration - Code review process - Dependencies and libraries: - NuGet/npm packages required - Third-party service credentials - Database connection strings (non-prod) - API keys for development

1. **Create Implementation Roadmap**

- Week-by-week plan: - Sprint 1: Infrastructure + foundation - Sprint 2: Core features implementation - Sprint 3: Integration and testing - Sprint 4: Hardening and deployment - Assign work to team members: - Based on skills and expertise - Balance workload - Consider pairing opportunities - Define checkpoints and milestones: - End of Phase 1: Foundation complete - End of Phase 2: Core features demo-able - End of Phase 3: Feature complete - End of Phase 4: Production ready

**Implementation Plan Template:**

| Phase | Tasks | Dependencies | Owner | Duration | Deliverables |
| --- | --- | --- | --- | --- | --- |
| Foundation | Infrastructure provisioning, DB schema, Auth setup | None | DevOps + Backend | 1 week | Dev environment ready, auth working |
| Core Features | User management, Dashboard UI, Business logic | Foundation | Full team | 2 weeks | Key features implemented |
| Enhancement | Additional features, Optimizations | Core Features | Full team | 1 week | All features complete |
| Hardening | Performance tuning, Security review, Docs | Enhancement | Full team | 1 week | Production ready |

---

### 12.2 Technical Specification Creation

**Owner:** Architecture Team with Tech Leads
**Duration:** 2-3 business days

#### Process Steps:

1. **Document Component Implementation Details**

- For each component, specify: - **Purpose:** What the component does - **Responsibilities:** Specific functions - **Technology:** Languages, frameworks, libraries - **Structure:** Folder/file organization - **Key Classes/Modules:** Main code structures - Include implementation notes: - Design patterns to use - Architectural principles to follow - Coding conventions - Performance considerations

1. **Define Data Models and Schemas**

- Document database schema: - Tables/collections structure - Columns/fields with data types - Primary and foreign keys - Indexes for performance - Constraints and validation rules - Specify domain models: - Entity classes and properties - Value objects - Aggregates and boundaries - Relationships between entities - Define DTOs (Data Transfer Objects): - Request models - Response models - View models - Mapping between domain and DTOs

1. **Specify Business Logic Implementation**

- Document business rules: - Validation rules - Business calculations - Workflow logic - State transitions - Provide implementation guidance: - Where to implement (service layer, domain model) - How to implement (methods, classes) - Error handling approach - Transaction boundaries - Include examples: - Code snippets for common patterns - Sample implementations - Anti-patterns to avoid

1. **Define Error Handling Strategy**

- Specify error categories: - Validation errors (400 Bad Request) - Authorization errors (401/403) - Not found errors (404) - Business logic errors (409 Conflict) - Server errors (500) - Define error response format: ```json { "error": { "code": "VALIDATION\_ERROR", "message": "User-friendly error message", "details": [ { "field": "email", "message": "Invalid email format" } ], "traceId": "correlation-id-for-debugging" } } ``` - Specify exception handling: - Global exception handler - Try-catch patterns - Logging requirements - User-facing vs. internal errors

1. **Document Security Implementation**

- Authentication implementation: - JWT token generation and validation - Token refresh mechanism - Password hashing algorithm (Argon2) - Session management - Authorization implementation: - Role-based access control (RBAC) - Claims-based authorization - Policy-based authorization - Resource-level permissions - Security best practices: - Input validation and sanitization - Output encoding - SQL injection prevention (parameterized queries) - XSS prevention - CSRF protection - Rate limiting implementation

1. **Create Technical Specification Document**

- Comprehensive specification including: - Component overview - Data models and schema - Business logic details - API specifications (see 12.3) - Error handling approach - Security implementation - Performance considerations - Testing requirements - Use consistent template: - Standard sections - Clear formatting - Code examples where helpful - Diagrams for complex logic

**Technical Specification Template:**

```markdown # Technical Specification: Auth Service

## Component Overview

**Purpose:** Handle user authentication and authorization
**Technology:** .NET 8 Web API, Entity Framework Core, Azure SQL
**Pattern:** Repository pattern with service layer

## Data Models

### User Entity

```csharp public class User { public int UserId { get; set; } public string Username { get; set; } public string Email { get; set; } public string PasswordHash { get; set; } public DateTime CreatedDate { get; set; } public DateTime? LastLoginDate { get; set; } public bool IsActive { get; set; } public ICollection UserRoles { get; set; } } ```

### Database Schema

```sql CREATE TABLE Users ( UserId INT PRIMARY KEY IDENTITY, Username NVARCHAR(50) NOT NULL UNIQUE, Email NVARCHAR(100) NOT NULL UNIQUE, PasswordHash NVARCHAR(255) NOT NULL, CreatedDate DATETIME2 DEFAULT GETUTCDATE(), LastLoginDate DATETIME2, IsActive BIT DEFAULT 1 );

CREATE INDEX IX\_Users\_Email ON Users(Email); CREATE INDEX IX\_Users\_Username ON Users(Username); ```

## Business Logic

### User Registration

```csharp public class AuthService : IAuthService { public async Task RegisterAsync(RegisterRequest request) { // 1. Validate input if (await \_userRepo.ExistsAsync(u => u.Email == request.Email)) throw new ConflictException("Email already registered");

// 2. Hash password var passwordHash = PasswordHasher.HashPassword(request.Password);

// 3. Create user entity var user = new User { Username = request.Username, Email = request.Email, PasswordHash = passwordHash, IsActive = true };

// 4. Save to database await \_userRepo.AddAsync(user); await \_unitOfWork.SaveChangesAsync();

// 5. Return DTO return \_mapper.Map(user); } } ```

## Error Handling

- Validation errors: Return 400 with field-specific messages
- Duplicate email: Return 409 Conflict
- Database errors: Return 500, log details, hide from user
- All errors include correlation ID for tracing

## Security Implementation

- **Password Hashing:** Argon2id with salt
- **JWT Tokens:** RS256 signing, 1-hour expiry
- **Refresh Tokens:** 7-day expiry, stored in database
- **Rate Limiting:** 5 login attempts per minute per IP
- **Input Validation:** FluentValidation library

## Performance Considerations

- Cache user sessions in Redis (10 min TTL)
- Use indexes on email and username columns
- Connection pooling (min: 5, max: 100)
- Async/await for all I/O operations

## Testing Requirements

- Unit tests: >80% coverage for service layer
- Integration tests: All API endpoints
- Security tests: Authentication and authorization flows

```

---

### 12.3 Interface Definition

**Owner:** Architecture Team with Backend Leads
**Duration:** 1-2 business days

#### Process Steps:

1. **Define RESTful API Contracts**

- Specify API endpoints: - HTTP method (GET, POST, PUT, DELETE) - URL path and parameters - Request body schema - Response body schema - Status codes - Use OpenAPI/Swagger specification: - Generate from code annotations - Or write spec-first and generate code - Version APIs appropriately: - /api/v1/... for initial version - /api/v2/... for breaking changes - Maintain backward compatibility when possible

1. **Create API Documentation**

- Document each endpoint: - Purpose and description - Authentication requirements - Request parameters and body - Response format and examples - Error responses - Rate limiting - Use Swagger/OpenAPI UI: - Interactive documentation - Try-it-out functionality - Code generation for clients - Include usage examples: - cURL commands - Code samples (C#, JavaScript, Python) - Common scenarios

1. **Define Event Schemas (if applicable)**

- For event-driven architecture: - Event names and types - Event payload schema - Event routing keys - Event ordering guarantees - Use schema registry: - JSON Schema or Avro - Version event schemas - Backward/forward compatibility - Document event flows: - Publishers and subscribers - Event sequences - Error handling

1. **Specify GraphQL Schema (if applicable)**

- Define GraphQL types: - Object types - Input types - Enums - Interfaces - Define queries and mutations: - Arguments and return types - Resolvers - Pagination approach - Document GraphQL API: - Schema documentation - Query examples - Mutation examples

1. **Create Contract Tests**

- Implement consumer-driven contract tests: - Use Pact or similar framework - Define expectations from consumer perspective - Validate provider meets contract - Set up contract testing in CI/CD: - Run on every PR - Publish contracts to broker - Verify contracts before deployment

1. **Establish API Governance**

- Define API standards: - Naming conventions (camelCase, kebab-case) - URL structure patterns - Error response format - Pagination approach - Filtering and sorting patterns - Review and approval process: - API design review before implementation - Breaking change approval - Deprecation process

**API Definition Template (OpenAPI/Swagger):**

```yaml openapi: 3.0.0 info: title: Auth Service API version: 1.0.0 description: Authentication and authorization API

servers: - url: https://api.example.com/v1 description: Production - url: https://api-staging.example.com/v1 description: Staging

paths: /auth/login: post: summary: Authenticate user description: Login with username and password tags: - Authentication requestBody: required: true content: application/json: schema: type: object required: - username - password properties: username: type: string example: john.doe password: type: string format: password example: P@ssw0rd123 responses: '200': description: Login successful content: application/json: schema: type: object properties: token: type: string description: JWT access token expiresIn: type: integer description: Token expiry in seconds refreshToken: type: string description: Refresh token '401': description: Invalid credentials content: application/json: schema: $ref: '#/components/schemas/ErrorResponse'

/users/{userId}: get: summary: Get user by ID description: Retrieve user details tags: - Users security: - BearerAuth: [] parameters: - name: userId in: path required: true schema: type: integer responses: '200': description: User found content: application/json: schema: $ref: '#/components/schemas/User' '404': description: User not found '401': description: Unauthorized

components: schemas: User: type: object properties: userId: type: integer username: type: string email: type: string format: email createdDate: type: string format: date-time isActive: type: boolean

ErrorResponse: type: object properties: error: type: object properties: code: type: string message: type: string traceId: type: string

securitySchemes: BearerAuth: type: http scheme: bearer bearerFormat: JWT ```

---

### 12.4 Development Guidelines

**Owner:** Development Lead with Architecture
**Duration:** 1-2 business days

#### Process Steps:

1. **Establish Coding Standards**

- Language-specific conventions: - **C#:** Follow Microsoft C# Coding Conventions - **TypeScript/JavaScript:** Follow Airbnb Style Guide - **Python:** Follow PEP 8 - Naming conventions: - Classes: PascalCase (UserService) - Methods: PascalCase (C#) or camelCase (JS/TS) - Variables: camelCase - Constants: UPPER\_SNAKE\_CASE - Private fields: \_camelCase (C#) - Code organization: - One class per file - Logical folder structure - Separation of concerns - File naming conventions

1. **Define Code Quality Standards**

- Code complexity limits: - Cyclomatic complexity <10 per method - Method length <50 lines - Class length <500 lines - File length <1000 lines - Code duplication: - No copy-paste code - Extract common logic to shared methods - Use inheritance or composition appropriately - Comments and documentation: - XML documentation for public APIs - Inline comments for complex logic - TODO comments tracked in backlog - README files for modules

1. **Specify Testing Requirements**

- Unit testing standards: - Test coverage >80% - Test naming: MethodName\_Scenario\_ExpectedResult - Arrange-Act-Assert pattern - Mock external dependencies - Integration testing: - Test all API endpoints - Test database interactions - Test external integrations - Test data management: - Use test fixtures - Clean up after tests - Isolated test data per test

1. **Define Git Workflow and Branching Strategy**

- Branch naming: - feature/[work-item-id]-short-description - bugfix/[work-item-id]-short-description - hotfix/[work-item-id]-short-description - Commit message format: ``` [WI-123] Add user authentication endpoint

- Implement login endpoint - Add JWT token generation - Include unit tests ``` - Pull request process: - Create PR from feature branch to main - Link to work item - Add description of changes - Request 2 reviewers minimum - Address review comments - Squash commits when merging

1. **Establish Code Review Standards**

- Review checklist:

- Code follows coding standards
- Tests are comprehensive and passing
- No code duplication
- Error handling implemented
- Logging added where appropriate
- Security best practices followed
- Performance considerations addressed
- Documentation updated

  - Review expectations: - Review within 24 hours - Provide constructive feedback - Approve when standards met - Request changes if issues found

  1. **Document Development Environment Setup**

  - Required tools: - Visual Studio 2022 / VS Code - .NET 8 SDK - Node.js 20 LTS - Docker Desktop - Azure CLI - Local environment setup: - Clone repository - Run database migrations - Configure appsettings.json - Start dependencies (Docker Compose) - Run application locally - IDE configuration: - Code formatting rules - Linting configuration - Extensions/plugins - Debugging setup

  **Development Guidelines Document Template:**

  ```markdown # Development Guidelines - Auth Service

  ## Coding Standards

  ### C# Conventions

  - Follow Microsoft C# Coding Conventions
  - Use PascalCase for public members, \_camelCase for private fields
  - Use async/await for all I/O operations
  - Prefer LINQ for collections

  ### Code Quality

  - Cyclomatic complexity <10
  - Method length <50 lines
  - Test coverage >80%
  - No code duplication

  ## Project Structure

  ``` AuthService/ ├── Controllers/ # API controllers ├── Services/ # Business logic ├── Repositories/ # Data access ├── Models/ # Domain entities ├── DTOs/ # Data transfer objects ├── Middleware/ # Custom middleware ├── Tests/ # Unit and integration tests └── appsettings.json # Configuration ```

  ## Testing Standards

  - xUnit for unit tests
  - Moq for mocking
  - TestContainers for integration tests
  - Naming: MethodName\_Scenario\_ExpectedResult

  ## Git Workflow

  - Branch naming: feature/WI-123-description
  - Commit format: [WI-123] Short description
  - PRs require 2 approvals
  - Squash and merge to main

  ## Code Review Checklist

  - [ ] Coding standards followed
  - [ ] Tests comprehensive (>80% coverage)
  - [ ] No security issues
  - [ ] Performance acceptable
  - [ ] Documentation updated

  ## Local Development Setup

  1. Install .NET 8 SDK
  2. Install Docker Desktop
  3. Clone repository: `git clone https://...`
  4. Run migrations: `dotnet ef database update`
  5. Start dependencies: `docker-compose up -d`
  6. Run app: `dotnet run`

  ```

  ---

  ### 12.5 Implementation Handoff

  **Owner:** Development Lead
  **Duration:** 2-4 hours (team meeting)

  #### Process Steps:

  1. **Conduct Architecture Walkthrough**

  - Present solution architecture: - High-level architecture diagram - Component breakdown - Integration points - Data flows - Explain key architectural decisions: - Why microservices (or monolith) - Technology selections rationale - Design patterns chosen - Trade-offs made - Review ADRs (Architecture Decision Records): - Context and decision - Rationale and alternatives - Consequences

  1. **Review Technical Specifications**

  - Walk through each component spec: - Component purpose and responsibilities - Implementation approach - Key classes and modules - Data models - Review API definitions: - Endpoint overview - Request/response formats - Authentication/authorization - Error handling - Discuss integration points: - External service integrations - Database interactions - Message queue usage

  1. **Demonstrate Implementation Examples**

  - Show code examples: - Sample controller implementation - Service layer example - Repository pattern usage - Error handling pattern - Walk through existing similar code: - Point to exemplar implementations - Show good patterns to follow - Highlight anti-patterns to avoid - Provide starter templates: - Project templates - Class templates - Test templates

  1. **Clarify Development Guidelines**

  - Review coding standards: - Naming conventions - Code organization - Quality standards - Explain Git workflow: - Branching strategy - Commit message format - PR process - Discuss code review expectations: - Review checklist - Turnaround time - How to address feedback

  1. **Answer Questions and Clarifications**

  - Open Q&A session: - Technical questions - Implementation approach questions - Tool and environment questions - Process questions - Document open items: - Unanswered questions (research needed) - Concerns raised - Action items - Schedule follow-up sessions: - Daily stand-ups - Weekly architecture office hours - Ad-hoc pairing sessions

  1. **Confirm Team Readiness**

  - Verify team has access to: - Code repository - Development environment - Azure resources - Documentation - Tools and services - Confirm understanding: - Implementation plan clear - Technical specs understood - Guidelines acknowledged - Assign initial tasks: - Who works on what - Pairing assignments - First milestone target

  **Implementation Handoff Checklist:**
  - [ ] Architecture walkthrough completed
  - [ ] Technical specifications reviewed
  - [ ] API definitions understood
  - [ ] Development guidelines shared
  - [ ] Code examples demonstrated
  - [ ] Git workflow clarified
  - [ ] Development environment verified
  - [ ] Access to resources confirmed
  - [ ] Questions answered
  - [ ] Tasks assigned
  - [ ] Team ready to start development**Handoff Meeting Agenda:**

  ```markdown # Implementation Handoff Meeting

  **Date:** March 10, 2026
  **Duration:** 2 hours
  **Attendees:** Dev team, Architecture, Tech Leads

  ## Agenda

  1. Architecture Overview (30 min)

  - Solution architecture walkthrough - Component breakdown - Key decisions (ADRs)

  1. Technical Specifications (30 min)

  - Component specs review - API definitions - Data models

  1. Development Guidelines (20 min)

  - Coding standards - Git workflow - Code review process

  1. Code Examples (20 min)

  - Demo implementation patterns - Show starter templates - Highlight good examples

  1. Q&A (15 min)

  - Answer questions - Document open items

  1. Next Steps (5 min)

  - Confirm access - Assign initial tasks - Set first milestone ```

  ---



  ---

  ## Best Practices

  ### ✅ DO

  - **Create clear, actionable specifications** - Developers should know exactly what to build
  - **Define APIs before implementation** - API-first design enables parallel development
  - **Provide code examples** - Show don't just tell; examples clarify expectations
  - **Document the "why" not just "what"** - Explain rationale behind decisions
  - **Involve developers early** - Get team input on technical specs before finalizing
  - **Use standard patterns and conventions** - Consistency reduces cognitive load
  - **Specify error handling explicitly** - Don't leave error scenarios ambiguous
  - **Include non-functional requirements** - Performance, security, scalability are not afterthoughts
  - **Plan for testability** - Make testing requirements clear from the start
  - **Create reusable templates** - Starter templates accelerate development
  - **Hold proper handoff sessions** - Don't just throw specs over the wall
  - **Make documentation discoverable** - Easy to find and navigate

  ### ❌ DON'T

  - **Write specs in isolation** - Collaborate with developers who will implement
  - **Over-specify implementation details** - Leave room for developer judgment
  - **Assume knowledge** - Be explicit about assumptions and prerequisites
  - **Skip the "why"** - Rationale helps developers make good decisions
  - **Use ambiguous language** - Be precise and unambiguous
  - **Create documentation and forget it** - Keep specs updated as design evolves
  - **Ignore developer feedback** - Specs should be iterated based on team input
  - **Treat handoff as one-way** - It's a conversation, not a presentation
  - **Skip code examples** - Abstract descriptions are hard to interpret
  - **Forget about maintainability** - Code will be maintained longer than written

  ---

  ## Outputs

  | Output | Destination | Description |
  | --- | --- | --- |
  | Technical Specifications | Development Team | Detailed implementation specs |
  | API Definitions | Development Team | Interface specifications |
  | Development Guidelines | Development Team | Coding standards and guidelines |
  | Implementation Plan | Step 19 | Sequence and approach for implementation |

  ---

  ## Quality Gates / Exit Criteria

  - [ ] Technical specifications completed
  - [ ] APIs and interfaces defined
  - [ ] Development guidelines established
  - [ ] Implementation plan agreed

  ---

  ## AI/Automation Augmentation

  | Capability | Tool/Service | Description |
  | --- | --- | --- |

  ---

  ## Observability & Metrics

  | Reference | Type | Description | Target |
  | --- | --- | --- | --- |
  | DK1 | Document Output | Architecture Output | All components have technical specs |
  | DK2 | Document Output | Wiki | Implementation guidelines published |
  | IMPL-1 | Quality | Specification Completeness | 100% (all required sections completed) |
  | IMPL-2 | Quality | API Documentation Coverage | 100% (all endpoints documented) |
  | IMPL-3 | Quality | Developer Understanding Score | >8/10 (survey after handoff) |
  | IMPL-4 | Efficiency | Time to First Commit | <2 days (after handoff) |
  | IMPL-5 | Efficiency | Implementation Plan Accuracy | >85% (actual vs. planned sequence) |
  | IMPL-6 | Process | Handoff Session Attendance | 100% (all dev team present) |
  | IMPL-7 | Process | Questions During Implementation | <5/week (clear specs need fewer questions) |
  | IMPL-8 | Outcome | Implementation Rework Rate | <10% (due to unclear specs) |
  | IMPL-9 | Outcome | Code Review - Standards Compliance | >90% (PRs meet guidelines first time) |

  ---

  ## Related Artefacts

  - Technical Specification Template
  - API Definition Template
  - Development Guidelines Document

  ---

  ## RACI Matrix

  | Role | Responsibility |
  | --- | --- |
  | **Responsible** | Development Lead, Architecture |
  | **Accountable** | Lead Architect |
  | **Consulted** | Development Team, QA |
  | **Informed** | Product Owner, Project Management |

  ---

  ## Related Steps

  - **Upstream:** Step 11: IAC Suggester Reviewer
  - **Downstream:** Step 13: Test Approach Definition

  ---

  ## Revision History

  | Version | Date | Author | Changes |
  | --- | --- | --- | --- |
  | 1 | 2026-03-25 | Simon Armstrong | Initial draft |

  ---

  ## Navigation

  |
   |