# Product Feedback, Discovery & Planning - Agent Instructions

## Directory Purpose
This directory contains Steps 1-9 covering the initial planning phase of the SDLC. This phase transforms project requirements into actionable sprint work items.

## Files in This Directory
| File | Step | Description |
|------|------|-------------|
| `Step-01-Design-Stakeholders.md` | 1 | Stakeholder collaboration on work items |
| `Step-02-Copilot-Review.md` | 2 | AI-assisted review of requirements |
| `Step-03-Architecture-Artefact-Store.md` | 3 | Architecture documentation storage |
| `Step-04-Work-Item-Integration.md` | 4 | Azure DevOps work item creation |
| `Step-05-Team-Creates-Sprint.md` | 5 | Sprint creation and setup |
| `Step-06-Sprint-Definition.md` | 6 | Sprint goal and scope definition |
| `Step-07-Design-Feedback.md` | 7 | Design review and feedback loop |
| `Step-08-Resource-Timeline-Suggester.md` | 8 | AI-powered resource planning |
| `Step-09-PR-META-Design-Feedback.md` | 9 | PR metadata and design feedback |

## Agent Update Guidelines

### When to Update This Directory
- Changes to sprint planning processes
- Updates to stakeholder involvement
- New AI/automation capabilities for planning
- Changes to Azure DevOps work item templates

### Key Roles in This Phase
- **Product Owner**: Backlog prioritization, acceptance criteria
- **Scrum Master**: Sprint ceremonies, impediment removal
- **Architecture Team**: Technical feasibility, design guidance
- **SRE**: Operational requirements

### Phase Flow
```
Entry Point D → Step 1 → Step 2 → ... → Step 9 → Architecture & Design (Step 10)
```

### AI/Automation Tools in This Phase
| Step | Tool | Purpose |
|------|------|---------|
| 2 | GitHub Copilot | Requirement analysis |
| 4 | MCP Server - ADO | Work item automation |
| 8 | WorkItem Intelligence | Resource/timeline suggestions |
| 9 | PR-META | Design feedback automation |

### DORA Metrics Tracked
- **D5**: Time From Inception to PR (starts at Entry Point A, tracked through this phase)

### Required Updates When Modifying
1. Maintain Previous/Next step link consistency
2. Update role assignments if process changes
3. Verify AI tool references are current
4. Ensure Quality Gates match sprint ceremonies

### Link Format
```markdown
[Step 5: Team Creates Sprint](Step-05-Team-Creates-Sprint.md)
```

### Outputs to Verify
- Refined Work Items → Azure DevOps
- Sprint Backlog → Development Team
- Architecture Considerations → Step 10
- Test Requirements → QA Team
