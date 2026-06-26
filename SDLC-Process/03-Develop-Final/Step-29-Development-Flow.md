[Previous: Step 28 - Secrets Scan](Step-28-Secrets-Scan.md) | [Next: Step 30 - Development Flow Continued](Step-30-Development-Flow-Continued.md)

# Step 29: Development Flow

| **Attribute** | **Value** |
|---|---|
| **Document Owner** | Simon Armstrong, VP Chief Architect |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Half-Yearly |
| **Next Review Due** | 2026-12-01 |
| **Last Review Carried Out** | 9 June 2026 by Simon Armstrong |

## 29.1 Overview
| **Attribute** | **Value** |
|---|---|
| **Responsible Roles** | DevOps Engineer, Development Team, CI/CD Pipeline |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Supporting Roles** | QA Lead, Release Engineer |
| **Tools** | Build tooling, artefact repository, CI/CD pipeline, versioning tooling |


## 29.2 Purpose
Step 29 builds, versions, validates, and stores the changed outputs needed for subsequent deployment and validation activities. It ensures that the implementation is converted into consistent, traceable, and reusable build artefacts under controlled automation.


## 29.3 Prerequisites
| **Prerequisite** | **Source** | **Description** |
|---|---|---|
| **Approved change set in review workflow** | Steps 20-28 | Code and configuration that have passed the required development-phase controls to this point. |
| **Build configuration** | Source control repository | Approved build instructions, dependency definitions, and packaging logic. |
| **Versioning rules** | Engineering and release standards | The versioning pattern is required for build traceability. |


## 29.4 Activities
### 29.4.1 Generate Build Artefacts
Compile, package, or assemble the change into the required build outputs.

Typical build outputs include:
- **Java or Kotlin:** Maven or Gradle build to JAR or WAR
- **JavaScript or TypeScript:** npm or webpack build to bundled files
- **Python:** packaged wheel or tarball
- **C# or .NET:** Release build output such as DLL or EXE
- **Azure Containers:** container images prepared for Azure Container Registry or App Service deployment

Build execution should remain fully automated, repeatable, and traceable to the exact commit, branch, work item, and pipeline run that produced the artefact set. Local or ad hoc builds must not be treated as authoritative deployment outputs.

Build outputs should be consistent regardless of who triggers the pipeline or when it runs, so that deployment behaviour is based on the controlled artefact set rather than environmental variation.

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

# Azure Container Registry build
az acr build --registry contosoregistry --image app:${VERSION} .
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

Versioning must support downstream rollback, release comparison, incident investigation, and auditability. Every stored artefact should be uniquely attributable to a specific pipeline execution and source revision.

Example version metadata:

```text
Version: 2.5.3+build.1234
Git SHA: a1b2c3d4
Build Date: 2026-03-10T14:23:45Z
Branch: feature/payment-gateway
```

### 29.4.3 Validate Build Outputs
Confirm that artefacts are complete, expected, and not corrupted or empty.

Validation should confirm:
- **Artefact Generation:** Artefacts are generated successfully.
- **Expected Files:** Expected files are present.
- **File Integrity:** File sizes are reasonable and non-zero.
- **Checksum Validation:** Checksums are calculated for integrity.
- **Dependency Resolution:** Dependencies are included and resolved correctly.

Validation Checks:
- [ ] Build completed without errors
- [ ] All expected artefacts present
- [ ] Artefact sizes > 0 bytes
- [ ] Checksums calculated, such as SHA256
- [ ] Dependencies resolved correctly

Validation should also confirm that no unexpected files, debug-only outputs, or incomplete packaging artefacts are being promoted as deployment-ready outputs.

### 29.4.4 Store Artefacts in the Approved Repository
Publish the build outputs to the approved artefact store or registry.

Approved storage targets may include:
- **Binaries:** Azure Artifacts
- **Containers:** Azure Container Registry
- **Packages:** Azure Artifacts feeds or NuGet

Stored artefacts should remain immutable once published under a released build version. If the output changes, a new versioned artefact should be produced instead of overwriting the existing record.

Stored metadata should include:
- **Version Number:** The assigned build or release version.
- **Build Timestamp:** The timestamp for the build execution.
- **Git Commit SHA:** The commit identifier for traceability.
- **Branch Name:** The source branch used for the build.
- **Build Pipeline Identifier:** The pipeline or run identifier associated with the artefact.

### 29.4.5 Pipeline Progression
Progress the validated build outputs to the next controlled stage only when the generated outputs are suitable for downstream deployment activity.

Pipeline progression typically includes:
- **Status Update:** Updating build or pipeline status.
- **Deployment Trigger:** Triggering deployment to the integration environment.
- **Team Notification:** Notifying the team of build success.
- **Work Item Update:** Updating work-item or delivery status where required.

Progression should occur only when build evidence, versioning, storage publication, and integrity checks all confirm that the artefact set is suitable for controlled downstream deployment.


## 29.5 Outputs
| **Output** | **Destination** | **Description** |
|---|---|---|
| **Versioned build artefacts** | Approved artefact repository | Traceable build outputs are ready for deployment and further validation. |
| **Build logs and execution evidence** | CI/CD platform | Evidence of successful build and packaging activity. |
| **Version metadata** | Artefact repository and engineering records | Commit-linked version information for tracking and rollback reference. |
| **Validated deployment-ready package** | Downstream deployment steps and engineering records | A package whose integrity, completeness, and publication status are confirmed before environment deployment begins. |


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
- Build-validation evidence showing completeness and deployment readiness


## 29.7 Quality Gates / Exit Criteria
- [ ] Build completed successfully.
- [ ] Required artefacts were generated.
- [ ] Versioning and traceability metadata were applied correctly.
- [ ] Artefact integrity and completeness checks passed.
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
| **Build Success Rate** | >=95% successful builds per reporting period | CI/CD pipeline success reports and build trend dashboards | Percentage of builds that complete successfully. |
| **Build Time** | <10 minutes per standard build run | Build pipeline timing records | Time required to compile, package, and produce the approved artefacts. |
| **Artefact Size Growth** | <20% increase from the previous stable build unless explicitly justified and approved | Artefact repository statistics and build reports | Tracks artefact size growth for unusual increases or packaging issues. |
| **Build Frequency** | 5-20 builds per active development day | CI/CD pipeline activity records | Indicates how often builds are being produced during active development. |
| **Cycle Time** | <4 hours from commit to deployment-ready artefact | Source control timestamps, build records, and deployment-readiness checkpoints | Measures delivery speed from committed change to validated build output. |
| **Publication Success Rate** | 100% of successful builds published to the approved repository | Artefact publication logs and CI/CD release evidence | Percentage of successful builds whose outputs are stored correctly in the approved artefact repository. |
| **Checksum Coverage** | 100% of deployment-ready artefacts have recorded checksum evidence | Build logs, checksum outputs, and repository publication evidence | Percentage of artefacts with integrity evidence recorded before downstream deployment. |


## 29.10 Best Practices
**DO:**
- **Keep Builds Deterministic:** Keep builds deterministic and automated.
- **Store Artefacts in Approved Registries:** Store artefacts in approved registries, not in source control.
- **Apply Traceable Versioning:** Apply traceable versioning consistently.
- **Use Semantic Versioning:** Use semantic versioning consistently.
- **Tag Artefacts for Traceability:** Tag artefacts with commit SHA for traceability.
- **Retain Build Logs:** Keep build logs for troubleshooting.

**DON'T:**
- **Accept Build Failure for Progression:** Do not treat build failure as acceptable for progression.
- **Reuse Version Numbers:** Do not reuse version numbers.
- **Skip Required Versioning:** Do not skip versioning when rollback or traceability is required.
- **Store Large Binaries in Source Control:** Do not store large binaries in source control.

Published artefacts should remain the authoritative source for downstream deployment. Rebuilding the same version outside the controlled pipeline should not be used as a substitute for the recorded artefact.


## 29.11 Summary and Key Outcomes
Step 29 builds, versions, validates, and stores artefacts through controlled CI/CD automation so that downstream deployment uses outputs that are consistent, traceable, and ready for controlled release activity.

Key Outcomes:
- **Artefact Generation:** Build outputs are compiled or packaged successfully for the approved technology stack.
- **Traceable Versioning:** Semantic versioning and commit-linked metadata are applied consistently.
- **Repository Publication:** Artefacts are stored in the approved repository or registry rather than source control.
- **Integrity Validation:** Completeness, checksum, and packaging checks confirm deployment readiness.
- **Deployment Readiness:** Downstream steps receive a validated, versioned, and reviewable artefact set.


## 29.12 RACI Matrix
| **Role** | **Responsibility** |
|---|---|
| **Responsible** | DevOps Engineer, Development Team, CI/CD Pipeline |
| **Accountable** | DevOps Manager or DevOps Lead |
| **Consulted** | QA Lead, Release Engineer |
| **Informed** | Engineering Manager, Product Owner |


## 29.13 Related Steps
- **Upstream:** [Step 28: Secrets Scan](Step-28-Secrets-Scan.md)
- **Downstream:** [Step 30: Development Flow Continued](Step-30-Development-Flow-Continued.md)


## 29.14 Revision History
| **Version** | **Date** | **Author** | **Changes** |
|---|---|---|---|
| **0.1** | 5 May 2026 | Anurag Thakur | Initial draft for Review |
| **0.1** | 9 June 2026 | Simon Armstrong | Reviewed document and provided comments for improvement |
