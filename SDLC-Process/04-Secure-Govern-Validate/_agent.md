# Secure, Govern & Validate - Agent Instructions

## Directory Purpose
This directory contains Steps 32-40 covering the security scanning, governance, and validation phase. This phase ensures code meets security standards and compliance requirements before testing.

## Files in This Directory
| File | Step | Description |
|------|------|-------------|
| `Step-32-Code-Test-Creator.md` | 32 | AI-generated test creation |
| `Step-33-SAST.md` | 33 | Static Application Security Testing |
| `Step-34-DAST.md` | 34 | Dynamic Application Security Testing |
| `Step-35-Dependency-Check.md` | 35 | Dependency vulnerability scanning |
| `Step-36-Repo-Secret-Scanning.md` | 36 | Repository-wide secrets scan |
| `Step-37-Container-Image-Scan.md` | 37 | Container security scanning |
| `Step-38-SBOM.md` | 38 | Software Bill of Materials generation |
| `Step-39-Security-Phase-Complete.md` | 39 | Security validation gate |
| `Step-40-Consistency-PR-VS-WI-DOD.md` | 40 | PR/Work Item/DoD consistency check |

## Agent Update Guidelines

### When to Update This Directory
- Changes to security scanning tools
- Updates to compliance requirements
- New vulnerability detection capabilities
- Changes to SBOM generation process

### Key Roles in This Phase
- **Security Team**: Security scans, vulnerability assessment
- **Security Lead**: Security policy, governance
- **DevOps Engineer**: Pipeline security integration
- **Compliance Officer**: Regulatory requirements

### Phase Flow
```
Develop (Step 31) → Step 32 → Step 33 → ... → Step 40 → Test (Step 41)
```

### Security Tools Integration
| Step | Tool | Scan Type |
|------|------|-----------|
| 33 | CodeQL/SonarQube | SAST - Static code analysis |
| 34 | OWASP ZAP/Burp | DAST - Runtime vulnerability |
| 35 | Dependabot/Snyk | SCA - Dependency vulnerabilities |
| 36 | GitHub Advanced Security | Secrets detection |
| 37 | Trivy/Aqua | Container image scanning |
| 38 | Syft/CycloneDX | SBOM generation |

### Critical Security Gates
- **Step 33 (SAST)**: Must pass before DAST
- **Step 35 (Dependency Check)**: License compliance verification
- **Step 37 (Container Scan)**: Required for containerized apps
- **Step 39**: All security scans must pass

### DORA Metrics Tracked
- **D3**: Change Failure Rate (security-related failures)
- Security scan coverage percentage
- Vulnerability remediation time

### Compliance Considerations
- SBOM (Step 38) required for supply chain security
- License compliance checked in Step 35
- Audit trail maintained for all security scans

### Required Updates When Modifying
1. Verify security tool versions are current
2. Update vulnerability thresholds as policies change
3. Ensure SBOM format meets compliance requirements
4. Maintain security gate criteria consistency

### Link Format
```markdown
[Step 33: SAST](Step-33-SAST.md)
```

### Outputs to Verify
- SAST Report → Security Dashboard
- DAST Report → Security Team
- Dependency Report → Compliance
- SBOM → Artifact Repository
- Security Gate Status → Release Management
