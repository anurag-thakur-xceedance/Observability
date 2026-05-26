# References - Agent Instructions

## Directory Purpose
This directory contains reference documentation that supports all SDLC phases. These documents provide cross-cutting information about roles, metrics, tools, and standards.

## Files in This Directory
| File | Topic | Description |
|------|-------|-------------|
| `Reference-Roles-RACI.md` | Roles & RACI | Role definitions and responsibility matrix |
| `Reference-AI-Automation.md` | AI/Automation | AI tools and automation capabilities |
| `Reference-DORA-Metrics.md` | DORA Metrics | DevOps performance metrics |
| `Reference-Observability.md` | Observability | Monitoring and observability standards |
| `Reference-Document-Outputs.md` | Documents | Document output requirements per phase |

## Agent Update Guidelines

### When to Update This Directory
- Role changes or organizational restructuring
- New AI/automation tool adoption
- Updates to DORA metric targets
- Changes to observability standards

### Reference Document Purposes

#### Roles & RACI
- Defines all roles involved in the SDLC
- RACI matrix for each phase
- Role responsibilities and handoffs

#### AI/Automation
- Catalog of AI tools used in SDLC
- MCP Server capabilities
- GitHub Copilot integration points
- Automation opportunities per phase

#### DORA Metrics
- **D1**: Lead Time for Changes
- **D2**: Deployment Frequency
- **D3**: Change Failure Rate
- **D4**: Mean Time to Recovery
- **D5**: Time From Inception to PR

#### Observability
- **O1**: Configuration Management (CMDB)
- **O2**: License Management
- **O3**: Backup Verification
- **O4**: Infrastructure as Code State
- **O5**: Disaster Recovery/BCP

#### Document Outputs
- Required documents per phase
- Template locations
- Approval workflows

### Cross-Reference Guidelines
Reference documents should be linked from step files using:
```markdown
See [Roles & RACI](Reference-Roles-RACI.md) for role definitions.
```

### Maintenance Schedule
| Document | Review Frequency | Owner |
|----------|------------------|-------|
| Roles & RACI | Quarterly | PMO |
| AI/Automation | Monthly | DevOps Lead |
| DORA Metrics | Monthly | SRE Lead |
| Observability | Quarterly | SRE Lead |
| Document Outputs | Quarterly | Architecture |

### Required Updates When Modifying
1. Notify all phase owners when roles change
2. Update step files when AI tools change
3. Maintain metric baseline documentation
4. Verify observability dashboards match documentation

### Link Format
```markdown
[Reference: DORA Metrics](Reference-DORA-Metrics.md)
```

### Integration Points
Reference documents are used by:
- All step files (role references)
- AI agents (tool capabilities)
- Dashboards (metric definitions)
- Runbooks (observability standards)
