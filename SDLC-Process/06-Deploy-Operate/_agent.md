# Deploy & Operate - Agent Instructions

## Directory Purpose
This directory contains Steps 52-57 covering the deployment and operations phase. This phase handles infrastructure provisioning, staged deployments, production release, and ongoing operations.

## Files in This Directory
| File | Step | Description |
|------|------|-------------|
| `Step-52-Pulumi-Provisioning.md` | 52 | Infrastructure provisioning with Pulumi |
| `Step-53-Staging-Pre-Prod-Deploy.md` | 53 | Staging/Pre-production deployment |
| `Step-54-Smoke-Test.md` | 54 | Post-deployment smoke testing |
| `Step-55-Feature-Flag-Release.md` | 55 | Feature flag progressive release |
| `Step-56-Deploy-To-Prod.md` | 56 | Production deployment |
| `Step-57-Application-Asset-Operation.md` | 57 | Ongoing application operations |

## Agent Update Guidelines

### When to Update This Directory
- Changes to deployment strategies
- Updates to infrastructure tooling
- New monitoring/observability capabilities
- Changes to incident response procedures

### Key Roles in This Phase
- **DevOps Engineer**: Deployment automation, IaC
- **SRE**: Production reliability, monitoring
- **Release Management**: Release coordination
- **Operations**: Day-to-day support

### Phase Flow
```
Test (Step 51) → Step 52 → Step 53 → ... → Step 57 → [Continuous Operation / Next Iteration]
```

### Deployment Strategy
| Step | Environment | Purpose |
|------|-------------|---------|
| 52 | Infrastructure | Provision cloud resources |
| 53 | Staging/Pre-Prod | Integration validation |
| 54 | Staging/Pre-Prod | Smoke test verification |
| 55 | Production (Limited) | Feature flag rollout |
| 56 | Production (Full) | General availability |
| 57 | Production | Ongoing operations |

### AI/Automation Tools in This Phase
| Step | Tool | Purpose |
|------|------|---------|
| 52 | Pulumi/Terraform | Infrastructure provisioning |
| 53-56 | Azure DevOps Pipelines | Deployment automation |
| 55 | Unleash/LaunchDarkly | Feature flag management |
| 57 | Azure Monitor/Datadog | Observability |

### Deployment Patterns
- **Blue/Green**: Zero-downtime deployments
- **Canary**: Progressive rollout with monitoring
- **Feature Flags**: Decouple deployment from release

### DORA Metrics Tracked
- **D1**: Lead Time for Changes (code to production)
- **D2**: Deployment Frequency (deploys per day/week)
- **D3**: Change Failure Rate (rollback percentage)
- **D4**: Mean Time to Recovery (incident resolution)

### Observability Requirements
| Reference | Type | Description |
|-----------|------|-------------|
| O1 | CMDB | Configuration management |
| O2 | License | License management |
| O3 | Backup | Backup verification |
| O4 | IaC | Pulumi/Azure state |
| O5 | DR/BCP | Disaster recovery |

### Required Updates When Modifying
1. Update deployment scripts when infrastructure changes
2. Maintain runbook documentation
3. Verify monitoring dashboards are current
4. Ensure incident response procedures are documented

### Link Format
```markdown
[Step 56: Deploy to Prod](Step-56-Deploy-To-Prod.md)
```

### Outputs to Verify
- Deployed Application → Production
- Monitoring Dashboards → SRE Team
- Incident Runbooks → Operations
- Feature Flag Config → Product Owner
- Operational Metrics → Leadership
