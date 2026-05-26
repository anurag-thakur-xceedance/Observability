# Document Outputs Reference

This document defines the key document outputs (DK) referenced throughout the SDLC process.

---

## Document Output Inventory

| ID | Name | Description | Owner | Related Steps |
|----|------|-------------|-------|---------------|
| DK1 | Architecture Output | Architecture artefacts, HLD, LLD, ADRs, Threat Modeling | Architecture | 3, 10, 12, 16, 18 |
| DK2 | Wiki | Process documentation, runbooks, guides | All Teams | 3, 12, 16 |
| DK3 | Code Statistics | Code coverage, quality metrics, LOC | Development | 20 |
| DK4 | Tech Debt Updates/Inventory | Technical debt register and updates | Development | 16 |
| DK5 | Work Item Updates | Azure DevOps work item status | Scrum Master | 4, 31, 40 |
| DK6 | Sprints | Sprint planning and execution documentation | Scrum Master | 5 |
| DK7 | Regression Testing Results | Feature and defect reports | QA | 42, 45 |
| DK8 | Defect Report and Analysis | Defect documentation and root cause | QA | 42 |
| DK9 | SecOps Output | Vulnerability scores, compliance reports | Security | 33, 34, 35, 37, 39, 48, 50, 51 |

---

## Document Output Details

### DK1: Architecture Output

**Contents:**
- High-Level Design (HLD)
- Low-Level Design (LLD)
- Architecture Decision Records (ADRs)
- Context Diagrams
- NFR Documentation
- Threat Modeling Artefacts

**Storage Location:** Architecture Repository, Wiki

**Update Frequency:** Per sprint/release

---

### DK2: Wiki

**Contents:**
- Process documentation
- Runbooks
- How-to guides
- Team agreements
- Technical guides

**Storage Location:** Azure DevOps Wiki

**Update Frequency:** Continuous

---

### DK3: Code Statistics

**Contents:**
- Code coverage reports
- Cyclomatic complexity
- Lines of code
- Code quality metrics
- Duplication analysis

**Storage Location:** Build artifacts, SonarQube

**Update Frequency:** Per build

---

### DK4: Tech Debt Updates/Inventory

**Contents:**
- Tech debt register
- Debt categorisation
- Remediation priority
- Impact assessment
- Debt trends

**Storage Location:** Azure DevOps, Wiki

**Update Frequency:** Per sprint

---

### DK5: Work Item Updates

**Contents:**
- Work item status changes
- Sprint progress
- Velocity metrics
- Burndown/burnup charts
- Backlog health

**Storage Location:** Azure DevOps

**Update Frequency:** Continuous (automated)

---

### DK6: Sprints

**Contents:**
- Sprint planning notes
- Sprint goals
- Capacity planning
- Sprint retrospectives
- Sprint demos

**Storage Location:** Azure DevOps, Wiki

**Update Frequency:** Per sprint

---

### DK7: Regression Testing Results

**Contents:**
- Test execution results
- Pass/fail rates
- Feature test coverage
- Regression suite status
- Trend analysis

**Storage Location:** Azure DevOps Test Plans

**Update Frequency:** Per test cycle

---

### DK8: Defect Report and Analysis

**Contents:**
- Defect list
- Severity/priority classification
- Root cause analysis
- Resolution tracking
- Defect metrics

**Storage Location:** Azure DevOps

**Update Frequency:** Continuous

---

### DK9: SecOps Output

**Contents:**
- SAST scan results
- DAST scan results
- Dependency scan results
- Container scan results
- Vulnerability scores
- Compliance status
- Pen test results
- Surface area analysis
- ISO compatibility

**Storage Location:** Security tools, Azure DevOps

**Update Frequency:** Per scan/release

---

## Document Retention

| Document Type | Retention Period | Archive Location |
|---------------|------------------|------------------|
| Architecture (DK1) | Permanent | Archive storage |
| Wiki (DK2) | Permanent | Wiki history |
| Code Stats (DK3) | 2 years | Build artifacts |
| Tech Debt (DK4) | Permanent | Azure DevOps |
| Work Items (DK5) | Permanent | Azure DevOps |
| Sprints (DK6) | 2 years | Azure DevOps |
| Test Results (DK7) | 2 years | Test storage |
| Defects (DK8) | 2 years | Azure DevOps |
| Security (DK9) | 5 years | Security archive |

---

## Revision History
| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-01-19 | | Initial draft |
