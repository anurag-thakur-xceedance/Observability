# Develop - Agent Instructions

## Directory Purpose
This directory contains Steps 19-31 covering the development phase. This is where code is written, reviewed, and merged following DevSecOps practices.

## Files in This Directory
| File | Step | Description |
|------|------|-------------|
| `Step-19-IAC-Jobs-Runner.md` | 19 | Infrastructure provisioning execution |
| `Step-20-Unit-Testing.md` | 20 | Unit test implementation |
| `Step-21-Test-Reviewer-Additions.md` | 21 | Test review and additions |
| `Step-22-Comment-Aware-Reasoning.md` | 22 | AI-assisted code understanding |
| `Step-23-Merge-PR.md` | 23 | Pull request merging |
| `Step-24-Linting.md` | 24 | Code linting and standards |
| `Step-25-Code-Review.md` | 25 | Peer code review |
| `Step-26-Code-Review-Continued.md` | 26 | Extended code review |
| `Step-27-IAC-Testing.md` | 27 | Infrastructure code testing |
| `Step-28-Secrets-Scan.md` | 28 | Secrets detection in code |
| `Step-29-Development-Flow.md` | 29 | Development workflow |
| `Step-30-Development-Flow-Continued.md` | 30 | Continued development |
| `Step-31-Development-Complete.md` | 31 | Development completion gate |

## Agent Update Guidelines

### When to Update This Directory
- Changes to coding standards
- Updates to code review processes
- New development tools or IDE integrations
- Changes to branching strategy

### Key Roles in This Phase
- **Development Team**: Code implementation, unit tests
- **Development Lead**: Code review, technical decisions
- **DevOps Engineer**: IaC, pipeline configuration
- **QA Team**: Test review, quality gates

### Phase Flow
```
Architecture (Step 18) → Step 19 → Step 20 → ... → Step 31 → Secure, Govern & Validate (Step 32)
```

### AI/Automation Tools in This Phase
| Step | Tool | Purpose |
|------|------|---------|
| 19 | Pulumi/Terraform | IaC execution |
| 20 | GitHub Copilot | Unit test generation |
| 22 | Comment-Aware AI | Code context understanding |
| 24 | ESLint/Prettier | Code linting |
| 25-26 | Code Review AI | Review assistance |
| 28 | GitHub Advanced Security | Secrets scanning |

### DevSecOps Integration Points
- **Step 24 (Linting)**: First quality gate
- **Step 25-26 (Code Review)**: Human verification
- **Step 28 (Secrets Scan)**: Security integration
- **Step 31**: Development completion gate

### DORA Metrics Tracked
- **D1**: Lead Time for Changes (PR creation to merge)
- **D2**: Deployment Frequency (builds per day)
- **D5**: Time From Inception to PR (tracked from Entry Point A)

### Required Updates When Modifying
1. Maintain consistency with branching strategy
2. Update tool references when changing linters/scanners
3. Verify code review requirements match team policies
4. Ensure secrets scanning aligns with security policies

### Link Format
```markdown
[Step 25: Code Review](Step-25-Code-Review.md)
```

### Outputs to Verify
- Merged Code → Main Branch
- Unit Test Results → QA Dashboard
- Linting Reports → Development Team
- Secrets Scan Results → Security Team
- IaC Deployed → Cloud Environment
