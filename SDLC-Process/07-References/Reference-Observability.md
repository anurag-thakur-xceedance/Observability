# Observability Reference

This document defines the observability capabilities referenced throughout the SDLC process.

---

## Observability Domains

### Infrastructure & Configuration

| ID | Capability | Description | Tools | Related Steps |
|----|------------|-------------|-------|---------------|
| O1 | Config Management (CMDB) | Configuration management database | Azure CMDB | 57 |
| O2 | Licence Management | Software licence tracking | Licence tools | 57 |
| O3 | Backups | Backup and recovery | Azure Backup | 57 |
| O4 | Infrastructure (Pulumi/Azure) | Infrastructure monitoring | Pulumi, Azure Monitor | 19, 27, 52, 57 |
| O5 | DR/BCP | Disaster recovery and business continuity | Azure Site Recovery | 57 |

### Event & Alert Processing

| ID | Capability | Description | Tools | Related Steps |
|----|------------|-------------|-------|---------------|
| O6 | Event/Alert Processing | Event collection and processing | Event Grid | 57 |
| O7 | Metrics Collection | Application and infrastructure metrics | Prometheus, Azure Monitor | 46, 54, 57 |
| O8 | Logging | Centralised logging | ELK, Application Insights | 56, 57 |
| O9 | Alerting & Notifications | Alert routing and notification | PagerDuty, Azure Alerts | 57 |

### Visualization & Analysis

| ID | Capability | Description | Tools | Related Steps |
|----|------------|-------------|-------|---------------|
| O10 | Visualization (Dashboards) | Operational dashboards | Grafana, Azure Dashboards | 57 |
| O11 | Health Checks | Service health monitoring | Custom, Kubernetes | 54, 57 |
| O12 | Anomaly Detection | ML-based anomaly detection | Azure ML, Custom | 57 |
| O13 | Trace Correlation | Distributed tracing | Jaeger, App Insights | 57 |
| O14 | Data Retention Policy | Log and metric retention | Various | 57 |

### Release & Operations

| ID | Capability | Description | Tools | Related Steps |
|----|------------|-------------|-------|---------------|
| O15 | Feature Toggle Integration | Feature flag observability | Unleash | 52, 55, 57 |
| O16 | Tenant/Customer Context | Multi-tenant monitoring | Custom | 57 |
| O17 | Self Healing | Automated recovery | Kubernetes, Custom | 47, 57 |
| O18 | Change/Release Correlation | Link changes to incidents | Azure DevOps | 57 |
| O19 | Chaos Engineering | Resilience testing observability | Chaos Monkey | 47, 57 |
| O20 | Infra Cost Tracking | Cloud cost monitoring | Azure Cost Management | 57 |
| O21 | On Call Rotation | On-call management | PagerDuty | 57 |
| O22 | Postmortems/RCA/CI | Continuous improvement | Azure DevOps Wiki | 57 |

---

## Observability by Phase

### Development Phase
- Code quality metrics
- Build success rates
- Test coverage

### Security Phase
- Vulnerability counts
- Scan pass rates
- Remediation times

### Test Phase
- Test execution metrics
- Defect rates
- Performance baselines (Apdex)

### Deploy Phase
- Deployment success rates
- Rollback frequency
- Feature flag status

### Operate Phase
- Full observability stack (O1-O22)
- SLA/SLO metrics
- Incident metrics

---

## Key Metrics by Category

### Performance (Apdex Score)
- Target: > 0.9 (Excellent)
- Acceptable: 0.75-0.9 (Good)
- Warning: 0.5-0.75 (Fair)
- Critical: < 0.5 (Poor)

### Availability
- Target: 99.9%+ uptime
- SLA compliance tracking

### Latency
- P50, P95, P99 response times
- By endpoint/service

### Error Rates
- 5xx errors
- 4xx errors
- Custom error tracking

---

## Implementation Guidelines

### Essential (Must Have)
- O7: Metrics collection
- O8: Logging
- O9: Alerting
- O11: Health checks

### Important (Should Have)
- O10: Dashboards
- O12: Anomaly detection
- O13: Trace correlation
- O18: Change correlation

### Advanced (Nice to Have)
- O17: Self healing
- O19: Chaos engineering
- O22: Automated postmortems

---

## Revision History
| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-01-19 | | Initial draft |
