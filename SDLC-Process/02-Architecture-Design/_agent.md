# Architecture & Design - Agent Instructions

## Directory Purpose
This directory contains Steps 10-18 covering the architecture and design phase. This phase establishes the technical foundation, security considerations, and test strategies before development begins.

## Files in This Directory
| File | Step | Description |
|------|------|-------------|
| `Step-10-Architecture-Design.md` | 10 | Solution architecture definition |
| `Step-11-IAC-Suggester-Reviewer.md` | 11 | Infrastructure as Code review |
| `Step-12-Design-And-Implementation.md` | 12 | Detailed design documentation |
| `Step-13-Test-Approach-Definition.md` | 13 | Test strategy definition |
| `Step-14-Performance-Test-Definition.md` | 14 | Performance test planning |
| `Step-15-Automation-Test-Definition.md` | 15 | Automation test framework |
| `Step-16-Artefacts-Updates.md` | 16 | Architecture artefact updates |
| `Step-17-Flow-Continues.md` | 17 | Process continuation checkpoint |
| `Step-18-Threat-Modeling-Architecture-Review.md` | 18 | Security threat modeling |

## Agent Update Guidelines

### When to Update This Directory
- Changes to architecture review processes
- Updates to security review requirements
- New IaC tools or patterns
- Changes to test strategy frameworks

### Key Roles in This Phase
- **Lead Architect**: Architecture decisions, enterprise alignment
- **Security Lead**: Threat modeling, security requirements
- **QA Lead**: Test strategy, automation framework
- **DevOps Lead**: IaC review, infrastructure patterns

### Phase Flow
```
Planning (Step 9) → Step 10 → Step 11 → ... → Step 18 → Develop (Step 19)
```

### AI/Automation Tools in This Phase
| Step | Tool | Purpose |
|------|------|---------|
| 10 | Architecture Copilot | Design assistance |
| 11 | IAC Suggester/Reviewer | Infrastructure code review |
| 13-15 | Test Intelligence | Test strategy suggestions |
| 18 | Threat Modeling AI | Security analysis |

### Security Considerations
Step 18 (Threat Modeling) is a critical security gate:
- Must complete before development begins
- Identifies security requirements for development
- Feeds into security testing phases (Steps 32-40)

### DORA Metrics Tracked
- Design review cycle time
- Architecture decision documentation rate

### Required Updates When Modifying
1. Maintain architecture decision records (ADRs)
2. Update security requirements if threat model changes
3. Verify IaC patterns align with current standards
4. Ensure test definitions match quality gates

### Link Format
```markdown
[Step 18: Threat Modeling](Step-18-Threat-Modeling-Architecture-Review.md)
```

### Outputs to Verify
- Solution Architecture Document → Architecture Artefact Store
- Threat Model → Security Team
- Test Strategy → QA Team
- IaC Templates → DevOps
- Performance Test Plan → Performance Engineering
