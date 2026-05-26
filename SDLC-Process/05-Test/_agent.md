# Test - Agent Instructions

## Directory Purpose
This directory contains Steps 41-51 covering the comprehensive testing phase. This phase validates functionality, performance, security, and user acceptance before deployment.

## Files in This Directory
| File | Step | Description |
|------|------|-------------|
| `Step-41-Design-Suggester.md` | 41 | AI-suggested test design improvements |
| `Step-42-Functional-Regression-Testing.md` | 42 | Functional and regression tests |
| `Step-43-Integration-Testing.md` | 43 | System integration testing |
| `Step-44-Contract-API-Testing.md` | 44 | API contract testing |
| `Step-45-Automation-Testing.md` | 45 | Automated test execution |
| `Step-46-Performance-Testing.md` | 46 | Load and performance testing |
| `Step-47-Chaos-Negative-Testing.md` | 47 | Chaos engineering and negative tests |
| `Step-48-Compatibility-Testing.md` | 48 | Cross-platform compatibility |
| `Step-49-Smoke-Testing.md` | 49 | Basic smoke tests |
| `Step-50-Surface-Area-Testing-Pen-Test.md` | 50 | Attack surface and penetration testing |
| `Step-51-SBOM-Pen-Test-Evaluator.md` | 51 | SBOM and pen test evaluation |

## Agent Update Guidelines

### When to Update This Directory
- Changes to testing frameworks
- Updates to test automation tools
- New testing methodologies
- Changes to performance baselines

### Key Roles in This Phase
- **QA Team**: Test execution, defect management
- **QA Lead**: Test strategy, quality metrics
- **QA Automation Engineer**: Automation framework, E2E tests
- **Performance Engineer**: Load testing, performance analysis
- **Penetration Testers**: Security testing

### Phase Flow
```
Secure, Govern & Validate (Step 40) → Step 41 → Step 42 → ... → Step 51 → Deploy & Operate (Step 52)
```

### Testing Types Coverage
| Steps | Testing Type | Purpose |
|-------|--------------|---------|
| 41-42 | Functional | Feature verification |
| 43-44 | Integration | System interaction |
| 45 | Automation | Repeatable test execution |
| 46 | Performance | Load, stress, scalability |
| 47 | Chaos/Negative | Resilience, failure handling |
| 48 | Compatibility | Cross-platform support |
| 49 | Smoke | Basic health check |
| 50-51 | Security | Penetration testing |

### AI/Automation Tools in This Phase
| Step | Tool | Purpose |
|------|------|---------|
| 41 | Test Design AI | Test case suggestions |
| 45 | Selenium/Playwright | E2E automation |
| 46 | JMeter/k6/Locust | Performance testing |
| 47 | Chaos Monkey/Gremlin | Chaos engineering |
| 50 | Burp Suite/OWASP ZAP | Penetration testing |

### Quality Gates
- **Step 42**: Regression pass rate ≥ 95%
- **Step 46**: Performance meets SLO baselines
- **Step 50**: No critical/high vulnerabilities
- **Step 51**: All security findings addressed

### DORA Metrics Tracked
- **D3**: Change Failure Rate (test failures in prod)
- Test coverage percentage
- Defect escape rate

### Required Updates When Modifying
1. Update test framework references when tools change
2. Maintain performance baseline documentation
3. Verify penetration test scope matches threat model
4. Ensure automation coverage metrics are current

### Link Format
```markdown
[Step 46: Performance Testing](Step-46-Performance-Testing.md)
```

### Outputs to Verify
- Test Reports → QA Dashboard
- Performance Results → SRE Team
- Pen Test Report → Security Team
- UAT Sign-off → Product Owner
- Release Candidate → Deployment Team
