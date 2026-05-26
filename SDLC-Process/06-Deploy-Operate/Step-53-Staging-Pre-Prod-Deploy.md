# Step 53: Staging Pre-Prod Deploy

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 53 |
| **Phase** | Deploy |
| **Previous Step** | [Step 52: Pulumi Provisioning](Step-52-Pulumi-Provisioning.md) |
| **Next Step** | [Step 54: Smoke Test](Step-54-Smoke-Test.md) |
| **Responsible Role(s)** | DevOps, Release Management |
| **Tools** | Azure DevOps or Jira Pipelines, CI/CD, Docker, Kubernetes |

---

## Purpose

Deploy the application to staging/pre-production environment for final validation before production release. This provides a production-like environment for comprehensive testing and validation of the deployment process.

---

## Process Flow

---

## Activities

### 53.1 Artifact Deployment

**Deploy application artifacts:**
- Retrieve versioned artifacts from artifact repository
- Pull Docker images from container registry
- Verify artifact integrity and signatures
- Deploy containers to Kubernetes/App Services
- Update service configurations
- Apply environment-specific settings

### 53.2 Configuration Application

**Apply staging configuration:**
- Load environment variables from Key Vault
- Apply staging-specific feature flags
- Configure connection strings
- Set up logging and monitoring endpoints
- Configure external service integrations
- Apply resource limits and quotas

### 53.3 Database Migration

**Execute database changes:**
- Backup staging database
- Review migration scripts
- Execute schema migrations
- Run data migrations if required
- Verify migration success
- Update migration history

### 53.4 Service Verification

**Verify services are running:**
- Check pod/container status
- Verify service endpoints responding
- Test internal service communication
- Validate load balancer configuration
- Check SSL/TLS certificates
- Verify DNS resolution

### 53.5 Deployment Validation

**Validate deployment success:**
- Run health check endpoints
- Verify application logs
- Check resource utilization
- Test critical API endpoints
- Validate database connectivity
- Confirm monitoring data flowing

---

## Best Practices

[PASS] **DO:**
- Use blue/green or canary deployment strategies
- Automate database migration rollback procedures
- Monitor deployment in real-time
- Keep staging identical to production
- Document deployment steps
- Use immutable deployments

[FAIL] **DON'T:**
- Deploy without backup strategy
- Skip database migration testing
- Manually modify configuration
- Deploy during peak usage times
- Ignore warning signs in logs
- Skip service verification steps

---

## Deployment Pipeline Example

yamlstages:
- stage: PreDeployment
jobs:
- job: Validation
steps:
- task: ArtifactIntegrityCheck
- task: EnvironmentHealthCheck
- task: BackupDatabase</p>
<ul>
<li><p>stage: Deploy
jobs:</p>
<ul>
<li>deployment: StagingDeploy
environment: staging
strategy:
runOnce:
deploy:
steps:
- task: KubernetesManifest@0
inputs:
action: deploy
manifests: k8s/staging/\*
- task: DatabaseMigration
- task: ApplyConfiguration</li>
</ul></li>
<li><p>stage: PostDeployment
jobs:</p>
<ul>
<li>job: Verification
steps:
<ul>
<li>task: HealthCheck</li>
<li>task: ServiceVerification</li>
<li>task: GenerateReport
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul></li>
</ul></li>
</ul>
<hr />
<h2>Database Migration Template</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">sql</ac:parameter>
<ac:plain-text-body><![CDATA[-- Migration: V2.5.0<em>\_add</em>analytics\_tables.sql
-- Author: DevOps Team
-- Date: 2026-03-10</p>
<p>-- Always include rollback script
BEGIN TRANSACTION;</p>
<p>-- Create new tables
CREATE TABLE analytics<em>events (
event</em>id BIGINT PRIMARY KEY,
event<em>type VARCHAR(50) NOT NULL,
event</em>data JSONB,
created<em>at TIMESTAMP DEFAULT CURRENT</em>TIMESTAMP
);</p>
<p>-- Add indexes
CREATE INDEX idx<em>events</em>type ON analytics<em>events(event</em>type);
CREATE INDEX idx<em>events</em>created ON analytics<em>events(created</em>at);</p>
<p>-- Verify migration
SELECT COUNT(\*) FROM analytics\_events;</p>
<p>COMMIT;</p>
<p>-- ROLLBACK SCRIPT (keep commented for reference)
-- DROP TABLE IF EXISTS analytics\_events;
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Key Metrics</h2>
<table>
<thead>
<tr>
<th>Metric</th>
<th>Target</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>Deployment Time</td>
<td>&lt;15 min</td>
<td>Time to complete staging deployment</td>
</tr>
<tr>
<td>Deployment Success Rate</td>
<td>&gt;95%</td>
<td>Successful deployments/total</td>
</tr>
<tr>
<td>Migration Time</td>
<td>&lt;5 min</td>
<td>Database migration duration</td>
</tr>
<tr>
<td>Service Start Time</td>
<td>&lt;2 min</td>
<td>Time for services to become healthy</td>
</tr>
<tr>
<td>Rollback Time</td>
<td>&lt;5 min</td>
<td>Time to rollback if needed</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Entry Criteria:</strong>
- Infrastructure provisioned and validated
- Build artifacts available and verified
- Database backup completed
- Deployment runbook reviewed
- Rollback plan documented</p>
<p><strong>Exit Criteria:</strong>
- Artifacts deployed successfully
- Configuration applied correctly
- Database migrations completed
- All services running and healthy
- Health checks passing
- Monitoring active</p>
<hr />
<h2>Inputs</h2>
<table>
<thead>
<tr>
<th>Input</th>
<th>Source</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>Provisioned Infrastructure</td>
<td>Step 52</td>
<td>Ready staging environment</td>
</tr>
<tr>
<td>Build Artifacts</td>
<td>CI/CD</td>
<td>Versioned application artifacts</td>
</tr>
<tr>
<td>Deployment Configuration</td>
<td>DevOps</td>
<td>Staging deployment config</td>
</tr>
<tr>
<td>Feature Flag State</td>
<td>Unleash</td>
<td>Feature flag configuration</td>
</tr>
</tbody>
</table>
<hr />
<h2>Outputs</h2>
<table>
<thead>
<tr>
<th>Output</th>
<th>Destination</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>Deployed Application</td>
<td>Step 54</td>
<td>Application in staging environment</td>
</tr>
<tr>
<td>Deployment Report</td>
<td>Release Management</td>
<td>Deployment details</td>
</tr>
<tr>
<td>Service Status</td>
<td>SRE</td>
<td>Service health status</td>
</tr>
<tr>
<td>Migration Report</td>
<td>DBA</td>
<td>Database migration results</td>
</tr>
</tbody>
</table>
<hr />
<h2>AI/Automation Augmentation</h2>
<table>
<thead>
<tr>
<th>Capability</th>
<th>Tool/Service</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>Automated Deployment</td>
<td>Azure DevOps or Jira</td>
<td>CI/CD automated deployment</td>
</tr>
<tr>
<td>Health Monitoring</td>
<td>Azure Monitor</td>
<td>Real-time health checks</td>
</tr>
</tbody>
</table>
<hr />
<h2>Observability &amp; Metrics</h2>
<table>
<thead>
<tr>
<th>Reference</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>D2</td>
<td>DORA</td>
<td>Count of Deploys/Period</td>
</tr>
<tr>
<td>D4</td>
<td>DORA</td>
<td>Cycle Time (Deployment)</td>
</tr>
<tr>
<td>O8</td>
<td>Observability</td>
<td>Logging (ELK, App Insights)</td>
</tr>
<tr>
<td>O11</td>
<td>Observability</td>
<td>Health Checks</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>Deployment Runbook</li>
<li>Configuration Management</li>
<li>Migration Scripts</li>
<li>Rollback Procedures</li>
<li>Service Health Checklist</li>
</ul>
<hr />
<h2>RACI Matrix</h2>
<table>
<thead>
<tr>
<th>Role</th>
<th>Responsibility</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Responsible</strong></td>
<td>DevOps, Release Management</td>
</tr>
<tr>
<td><strong>Accountable</strong></td>
<td>Release Manager</td>
</tr>
<tr>
<td><strong>Consulted</strong></td>
<td>Development Lead, SRE</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>Product Owner, QA Lead</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="Step-52-Pulumi-Provisioning.md">Step 52: Pulumi Provisioning</a></li>
<li><strong>Downstream:</strong> <a href="Step-54-Smoke-Test.md">Step 54: Smoke Test</a></li>
</ul>
<hr />
<h2>Revision History</h2>
<table>
<thead>
<tr>
<th>Version</th>
<th>Date</th>
<th>Author</th>
<th>Changes</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>2026-03-25</td>
<td>Simon Armstrong</td>
<td>Initial draft</td>
</tr>
<tr>
<td>2.0</td>
<td>2026-03-10</td>
<td>OpenCode</td>
<td>Enhanced with deployment workflows</td>
</tr>
</tbody>
</table>