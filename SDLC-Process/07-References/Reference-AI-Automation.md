# AI/Automation Augmentation Reference

This document defines the AI and automation capabilities used throughout the SDLC process via the Streamline ACT MCP Layer.

---

## AI Intelligence Domains

### WorkItem Intelligence
AI-powered work item analysis and management capabilities.

| Capability | Description | Related Steps |
|------------|-------------|---------------|
| Copilot Review | AI-assisted code and content review | 2, 25 |
| Resource/Timeline Suggester | AI-powered resource and timeline suggestions | 5, 8 |
| Design Feedback | Intelligent design feedback and recommendations | 7, 9 |
| PR META | Pull request metadata analysis and work item correlation | 9, 23 |
| Test Reviewer/Additions | AI-powered test review and enhancement suggestions | 21 |
| Code/Test Creator | AI-assisted code and test generation | 20, 32 |
| Consistency PR VS WI DOD | Validate PR content against work item Definition of Done | 40 |
| Comment Aware Reasoning | Analysis of code comments and documentation | 22 |
| Secrets Scan | AI-powered secret detection | 28 |

### DevSecOps Intelligence
AI-powered development and security operations.

| Capability | Description | Related Steps |
|------------|-------------|---------------|
| IAC Suggester/Reviewer | AI-powered Infrastructure as Code suggestions | 11 |
| IAC Jobs Runner | Automated IAC execution and validation | 19 |

### SecOps Intelligence
AI-powered security operations and analysis.

| Capability | Description | Related Steps |
|------------|-------------|---------------|
| SBOM | AI-assisted SBOM generation and analysis | 38 |
| SBOM / Pen Test Evaluator | AI-powered correlation of SBOM and pen test findings | 51 |

### Streamline Think (General Intelligence)
General-purpose AI for design and analysis.

| Capability | Description | Related Steps |
|------------|-------------|---------------|
| Design Suggester | General design suggestions based on patterns | 41 |

---

## MCP Server Capabilities

### MCP Server - ADO (Azure DevOps)
Work item integration and management automation.

| Capability | Description | Related Steps |
|------------|-------------|---------------|
| Work Item Management | Automated work item CRUD operations | 1, 4 |
| Sprint Management | Sprint creation and management | 5, 6 |
| Query Execution | WIQL query execution | Various |
| Linking | Automated work item linking | 4, 23 |

---

## Tool Integration

### Infrastructure Tools

| Tool | Purpose | Related Steps |
|------|---------|---------------|
| Pulumi | Infrastructure as Code | 11, 19, 52 |
| Unleash | Feature flag management | 52, 55 |

### Security Tools

| Tool | Purpose | Related Steps |
|------|---------|---------------|
| SonarCube | SAST scanning | 33 |
| Burp Suite | DAST scanning | 34 |
| OWASP Dependency Check | Dependency scanning | 35 |
| Aqua/Trivy | Container scanning | 37 |

### Testing Tools

| Tool | Purpose | Related Steps |
|------|---------|---------------|
| JMeter | Performance testing | 46 |
| Azure Load Testing | Load testing | 46 |
| Chaos Monkey | Chaos engineering | 47 |

---

## Automation Patterns

### Human-in-the-Loop
For all AI-augmented steps, human review is required before accepting AI suggestions. This ensures:
- Quality control
- Accountability
- Learning feedback

### Conditional Execution
Some steps are conditionally executed based on:
- Change surface area
- Risk level
- Feature flags
- Capacity

### Progressive Automation
Automation levels can be adjusted based on:
- Team maturity
- Risk tolerance
- Compliance requirements

---

## N8N Orchestration

The Streamline ACT MCP Layer uses N8N for workflow orchestration:
- Connecting AI capabilities
- Triggering automated workflows
- Managing state between steps
- Integrating with external systems

---

## AI Model Guidelines

### Input Quality
- Provide complete context
- Use structured data where possible
- Include relevant history

### Output Validation
- Always validate AI outputs
- Track accuracy over time
- Provide feedback for improvement

### Responsible Use
- Transparency in AI usage
- Human oversight
- Bias monitoring
- Security of AI models

---

## Revision History
| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-01-19 | | Initial draft |
