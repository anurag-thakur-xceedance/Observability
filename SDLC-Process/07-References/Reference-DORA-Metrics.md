# DORA Metrics Reference

This document defines the DORA (DevOps Research and Assessment) metrics tracked throughout the SDLC process.

---

## The Four Key Metrics

### D1: Lead Time for Changes
| Attribute | Value |
|-----------|-------|
| **Definition** | Time from code commit to successful deployment in production |
| **Measurement** | Hours/Days from merge to production deploy |
| **Target (Elite)** | Less than 1 hour |
| **Target (High)** | 1 day to 1 week |
| **Target (Medium)** | 1 week to 1 month |
| **Related Steps** | Steps 23, 31, 56 |

### D2: Deployment Frequency
| Attribute | Value |
|-----------|-------|
| **Definition** | How often an organisation deploys code to production |
| **Measurement** | Count of deploys per period |
| **Target (Elite)** | Multiple times per day |
| **Target (High)** | Once per day to once per week |
| **Target (Medium)** | Once per week to once per month |
| **Related Steps** | Steps 5, 53, 56 |

### D3: Change Failure Rate (CFR)
| Attribute | Value |
|-----------|-------|
| **Definition** | Percentage of deployments causing service degradation |
| **Measurement** | Count of defects/issues post-deploy as percentage |
| **Target (Elite)** | 0-15% |
| **Target (High)** | 16-30% |
| **Target (Medium)** | 31-45% |
| **Related Steps** | Step 56 |

### D4: Mean Time to Recovery (MTTR)
| Attribute | Value |
|-----------|-------|
| **Definition** | Time to restore service after an incident |
| **Measurement** | Average time from incident detection to resolution |
| **Target (Elite)** | Less than 1 hour |
| **Target (High)** | Less than 1 day |
| **Target (Medium)** | 1 day to 1 week |
| **Related Steps** | Steps 47, 57 |

---

## Additional Metrics

### D5: Time from Inception to PR
| Attribute | Value |
|-----------|-------|
| **Definition** | Time from work item creation to pull request |
| **Measurement** | Days from work item inception to PR creation |
| **Related Steps** | Steps 8, 9, 23, 31 |

---

## Metrics Collection Points

| Step | Metrics Collected |
|------|-------------------|
| Step 5 | D2: Deployment Frequency baseline |
| Step 8 | D4: Cycle Time, D5: Inception to PR |
| Step 23 | D5: Inception to PR |
| Step 29 | D4: Cycle Time |
| Step 31 | D5: Inception to PR |
| Step 47 | D4: MTTR testing |
| Step 53 | D2: Deployment count, D4: Cycle time |
| Step 56 | D2: Deploy count, D3: CFR, D4: Cycle time |
| Step 57 | D4: MTTR production |

---

## Reporting

DORA metrics should be reported:
- **Daily**: During active sprints (deployment frequency)
- **Weekly**: Sprint summaries
- **Monthly**: Trend analysis and improvement planning
- **Quarterly**: Strategic review and target setting

---

## Improvement Guidelines

### To Improve Lead Time:
- Reduce batch sizes (smaller PRs)
- Automate testing and deployment
- Eliminate manual approval gates where safe

### To Improve Deployment Frequency:
- Implement feature flags
- Use trunk-based development
- Automate release processes

### To Reduce Change Failure Rate:
- Enhance test coverage
- Implement blue/green deployments
- Increase security scanning

### To Reduce MTTR:
- Improve observability
- Document runbooks
- Practice incident response

---

## Revision History
| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-01-19 | | Initial draft |
