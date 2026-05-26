# Step 29: Development Flow

**Phase:** Develop
**Owner:** CI/CD Pipeline, DevOps
**Duration:** 5-15 minutes (automated)
**Prerequisites:** Secrets scan passed (Step 28), PR approved

---

## Purpose

Build artifacts, apply versioning, and store in artifact repository as part of the CI/CD pipeline. Prepares code for deployment to integration environments.

---

## Process Flow

---

## Activities

### 29.1 Build Artifact Generation

**Compile and package code:**

- **Java/Kotlin:** Maven/Gradle build → JAR/WAR
- **JavaScript/TypeScript:** npm/webpack build → bundled files
- **Python:** pip install + package → wheel/tar.gz
- **C#/.NET:** dotnet build → DLL/EXE
- **Docker:** Build container images

**Build Commands:**

```bash # JavaScript/Node.js npm ci && npm run build

# Java mvn clean package

# Python pip install -r requirements.txt && python setup.py bdist\_wheel

# .NET dotnet build --configuration Release

# Docker docker build -t app:${VERSION} . ```

### 29.2 Artifact Versioning

**Apply semantic versioning:**

- Format: `MAJOR.MINOR.PATCH` (e.g., 2.5.3)
- Include build metadata: `2.5.3+build.1234`
- Tag with commit SHA for traceability
- Auto-increment based on changes

**Versioning Strategy:**

- **MAJOR:** Breaking changes (manual increment)
- **MINOR:** New features (auto-increment on feature branch)
- **PATCH:** Bug fixes (auto-increment on bugfix branch)
- **Build:** CI build number

**Version Example:**

``` Version: 2.5.3+build.1234 Git SHA: a1b2c3d4 Build Date: 2026-03-10T14:23:45Z Branch: feature/payment-gateway ```

### 29.3 Artifact Storage

**Store in artifact repository:**

- **Binaries:** Artifactory, Nexus, Azure Artifacts
- **Containers:** Docker Hub, Azure Container Registry, ECR
- **Packages:** npm registry, PyPI, NuGet

**Storage Metadata:**

- Version number
- Build timestamp
- Git commit SHA
- Branch name
- Build pipeline ID

### 29.4 Build Validation

**Validate build outputs:**

- Artifacts generated successfully
- Expected files present
- File sizes reasonable (not empty or corrupted)
- Checksums calculated for integrity
- Dependencies included

**Validation Checks:**

- [ ] Build completed without errors
- [ ] All expected artifacts present
- [ ] Artifact sizes > 0 bytes
- [ ] Checksums calculated (SHA256)
- [ ] Dependencies resolved correctly

### 29.5 Pipeline Progression

**Progress to next stage:**

- Update pipeline status
- Trigger deployment to integration environment
- Notify team of build success
- Update work item status

---

## Key Artifacts

**Inputs:**

- Source code (merged PR)
- Dependencies and libraries
- Build configuration files

**Outputs:**

- Build artifacts (JAR, Docker image, etc.)
- Version metadata
- Build logs
- Checksums and signatures

---

## Best Practices

✅ **DO:**

- Use semantic versioning consistently
- Store artifacts in dedicated repository (not Git)
- Tag artifacts with commit SHA for traceability
- Calculate checksums for artifact integrity
- Keep build logs for troubleshooting

❌ **DON'T:**

- Store large binaries in Git (use artifact repository)
- Reuse version numbers (each build unique)
- Skip versioning (critical for rollback)
- Ignore build warnings (fix proactively)
- Build in production (always use CI/CD)

---

## Metrics & Observability

| Metric | Target | Description |
| --- | --- | --- |
| **Build Success Rate** | ≥95% | Successful builds / Total builds |
| **Build Time** | <10 minutes | Time to compile and package |
| **Artifact Size** | Monitor trend | Artifact size (alert on large increases) |
| **Build Frequency** | 5-20/day | Number of builds per day |
| **Cycle Time (DORA)** | <4 hours | Commit to deployment ready |

---

## Quality Gates

- [ ] Build successful (zero errors)
- [ ] Artifacts generated and validated
- [ ] Versioning applied correctly
- [ ] Artifacts stored in repository
- [ ] Checksums calculated
- [ ] Ready for deployment

**Exit Criteria:** Artifacts built, versioned, and stored; ready for deployment (Step 30).

---

## Related Steps

- **Step 28:** Secrets Scan (previous gate)
- **Step 30:** Development Flow Continued (deployment)
- **Step 31:** Development Complete (phase completion)

---

## Summary

Step 29 builds, versions, and stores artifacts through CI/CD automation, ensuring consistent and traceable deployments. Automated builds reduce errors and accelerate delivery.

**Key Outcomes:**

- Build artifacts generated
- Semantic versioning applied
- Artifacts stored in repository
- Build validated
- Ready for deployment

---

## Navigation

|
 |