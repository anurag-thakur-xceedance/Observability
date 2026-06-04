[Previous: Step 28 - Secrets Scan](Step-28-Secrets-Scan.md) | [Next: Step 30 - Development Flow Continued](Step-30-Development-Flow-Continued.md)

# Step 29: Development Flow

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |

## 29.1 Overview
| **Attribute** | **Value** |
|---|---|
| **Responsible Roles** | DevOps Engineer, Development Team, CI/CD Pipeline |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Supporting Roles** | QA Lead, Release Engineer |
| **Tools** | Build tooling, artefact repository, CI/CD pipeline, versioning tooling |


## 29.2 Purpose
Step 29 builds, versions, validates, and stores the change outputs needed for subsequent deployment and validation activities. It ensures that the implementation is converted into consistent, traceable, and reusable build artefacts under controlled automation.


## 29.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| **Approved change set in review workflow** | Steps 20-28 | Code and configuration that have passed the required development-phase controls to this point. |
| **Build configuration** | Source control repository | Approved build instructions, dependency definitions, and packaging logic. |
| **Versioning rules** | Engineering and release standards | The versioning pattern required for build traceability. |


## 29.4 Activities
### 29.4.1 Generate Build Artefacts
Compile, package, or assemble the change into the required build outputs.

Typical build outputs include:
- **Java or Kotlin:** Maven or Gradle build to JAR or WAR
- **JavaScript or TypeScript:** npm or webpack build to bundled files
- **Python:** packaged wheel or tarball
- **C# or .NET:** Release build output such as DLL or EXE
- **Docker:** container images

Example build commands:

```bash
# JavaScript / Node.js
npm ci && npm run build

# Java
mvn clean package

# Python
pip install -r requirements.txt && python setup.py bdist_wheel

# .NET
dotnet build --configuration Release

# Docker
docker build -t app:${VERSION} .
```

### 29.4.2 Apply Versioning and Traceability Metadata
Apply version, build identifier, commit reference, and other metadata needed for downstream tracking.

Versioning should typically use semantic versioning:
- **Format:** `MAJOR.MINOR.PATCH`
- Include build metadata where required, such as `2.5.3+build.1234`
- Tag with commit SHA for traceability
- Apply automated increment logic according to branch and release rules

Typical versioning strategy:
- **MAJOR:** Breaking changes
- **MINOR:** New features
- **PATCH:** Bug fixes
- **Build:** CI build number

Example version metadata:

```text
Version: 2.5.3+build.1234
Git SHA: a1b2c3d4
Build Date: 2026-03-10T14:23:45Z
Branch: feature/payment-gateway
```

### 29.4.3 Validate Build Output Integrity
Confirm that artefacts are complete, expected, and not corrupted or empty.

Validation should confirm:
- Artefacts generated successfully
 - Expected files are present
 - File sizes are reasonable and non-zero
 - Checksums are calculated for integrity
 - Dependencies are included and resolved correctly

Validation checklist:
- [ ] Build completed without errors
- [ ] All expected artefacts present
- [ ] Artefact sizes > 0 bytes
- [ ] Checksums calculated, such as SHA256
- [ ] Dependencies resolved correctly

### 29.4.4 Store Artefacts in the Approved Repository
Publish the build outputs to the approved artefact store or registry.

Approved storage targets may include:
- **Binaries:** Artifactory, Nexus, Azure Artifacts
- **Containers:** Docker Hub, Azure Container Registry, ECR
- **Packages:** npm registry, PyPI, NuGet

Stored metadata should include:
- Version number
- Build timestamp
- Git commit SHA
- Branch name
- Build pipeline identifier

### 29.4.5 Confirm Readiness for Environment Deployment
Ensure the generated outputs are suitable for the next deployment-oriented step.

Pipeline progression typically includes:
- Updating build or pipeline status
- Triggering deployment to the integration environment
- Notifying the team of build success
- Updating work-item or delivery status where required


## 29.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Versioned build artefacts** | Approved artefact repository | Traceable build outputs ready for deployment and further validation. |
| **Build logs and execution evidence** | CI/CD platform | Evidence of successful build and packaging activity. |
| **Version metadata** | Artefact repository and engineering records | Commit-linked version information for tracking and rollback reference. |


## 29.6 Key Artifacts
**Inputs:**
- Source code from the approved pull request
- Dependencies and libraries
- Build configuration files and versioning rules

**Outputs:**
- Build artefacts such as JARs, packages, or container images
- Version metadata
- Build logs
- Checksums and publication evidence


## 29.7 Quality Gates / Exit Criteria
- [ ] Build completed successfully.
- [ ] Required artefacts were generated.
- [ ] Versioning and traceability metadata were applied correctly.
- [ ] Artefacts were stored in the approved repository.
- [ ] The change is ready to proceed to Step 30.


## 29.8 AI and Automation Augmentation
| **Capability** | **Tool or Service** | **Description** |
|---|---|---|
| **Automated build execution** | CI/CD pipeline | Produces artefacts in a consistent and repeatable manner. |
| **Versioning support** | Build and release tooling | Applies traceable version information to generated outputs. |
| **Failure interpretation support** | Approved AI assistant | Helps interpret build failures or packaging issues for faster remediation. |


## 29.9 Observability and Metrics
| **Metric** | **Target** | **How It Is Tracked** | **Description** |
|---|---|---|---|
| **Build Success Rate** | >=95% | CI/CD pipeline success reports and build trend dashboards | Percentage of builds completing successfully. |
| **Build Time** | <10 minutes | Build pipeline timing records | Time required to compile, package, and produce the approved artefacts. |
| **Artifact Size Growth** | <20% increase from the previous stable build unless justified | Artefact repository statistics and build reports | Tracks artefact size growth for unusual increases or packaging issues. |
| **Build Frequency** | 5-20 builds/day | CI/CD pipeline activity records | Indicates how often builds are being produced during active development. |
| **Cycle Time** | <4 hours from commit to deployment-ready artifact | Source control timestamps, build records, and deployment-readiness checkpoints | Measures delivery speed from committed change to validated build output. |


## 29.10 Best Practices
**DO:**
- Keep builds deterministic and automated.
- Store artefacts in approved registries, not in source control.
- Apply traceable versioning consistently.

- Use semantic versioning consistently.
- Tag artefacts with commit SHA for traceability.
- Keep build logs for troubleshooting.

**DON'T:**
- Treat build failure as acceptable for progression.

- Reuse version numbers.
 - Skip versioning when rollback or traceability is required.
- Store large binaries in source control.


## 29.11 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | DevOps Engineer, Development Team, CI/CD Pipeline |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Consulted** | QA Lead, Release Engineer |
| **Informed** | Engineering Manager, Product Owner |


## 29.12 Related Steps
- **Upstream:** [Step 28: Secrets Scan](Step-28-Secrets-Scan.md)
- **Downstream:** [Step 30: Development Flow Continued](Step-30-Development-Flow-Continued.md)


## 29.13 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |

[Previous: Step 28 - Secrets Scan](Step-28-Secrets-Scan.md) | [Next: Step 30 - Development Flow Continued](Step-30-Development-Flow-Continued.md)
