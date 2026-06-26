# Step 19: IaC Jobs Runner - Execution Checklist

**Purpose:** Infrastructure as Code execution checklist for DevOps Engineers and Platform Engineers to ensure compliant and traceable infrastructure provisioning.

**Version:** 0.1  
**Last Updated:** 9 June 2026  
**For:** Human engineers and AI agents

---

## Pre-Execution Checklist

### 1. Authorization and Scope
- [ ] Work item is approved and assigned
- [ ] Architecture Review Board (ARB) approval received (Step 18)
- [ ] Target environment scope is clearly defined (dev/test/staging/pre-prod/prod)
- [ ] Change record or sprint backlog linkage is confirmed

### 2. IaC Context Validation
- [ ] Correct IaC branch identified
- [ ] Stack or workspace name verified
- [ ] State backend location confirmed
- [ ] Deployment credentials and service connections available
- [ ] Secrets references validated (Azure Key Vault, etc.)

### 3. Policy and Standards Alignment
- [ ] Landing zone alignment verified
- [ ] Naming standards reviewed
- [ ] Tagging model confirmed (application, owner, environment, cost centre, data classification, support group)
- [ ] Security baseline requirements documented

---

## Execution Checklist

### 4. Static Validation (19.4.2)
- [ ] **Syntax validation passed** (`pulumi preview` or `terraform plan`)
- [ ] **Dependencies resolved** (modules, providers)
- [ ] **Security patterns analyzed** (no insecure configurations)
- [ ] **Policy-as-code checks passed** (enterprise policy packs/sets)
- [ ] **Approved modules verified** (only whitelisted modules used)
- [ ] **Secret referencing validated** (no hardcoded secrets)

### 5. Provisioning Execution (19.4.3)
- [ ] **Pipeline execution started** (fully automated, non-interactive)
- [ ] **Correct scope targeted** (stack, workspace, subscription, resource group)
- [ ] **Idempotency confirmed** (repeated runs converge safely)
- [ ] **Network and connectivity provisioned**
- [ ] **Compute and platform services created**
- [ ] **Data services deployed**
- [ ] **Identity and access configured**
- [ ] **Ingress and certificates applied**
- [ ] **Observability enabled** (diagnostics, monitoring agents)

### 6. Security Baseline Application (19.4.4)
- [ ] **Private networking or controlled ingress enforced**
- [ ] **Encryption at rest enabled**
- [ ] **Encryption in transit enabled**
- [ ] **RBAC applied using least privilege**
- [ ] **Managed identities configured** (no static credentials)
- [ ] **Secret retrieval from approved store verified**
- [ ] **Diagnostics enabled by default** (logs, metrics, traces, audit events)
- [ ] **Backup and retention configured**
- [ ] **Mandatory tags applied**

### 7. Environment Validation (19.4.5)
- [ ] **Pipeline jobs completed successfully**
- [ ] **Resources are healthy and reachable**
- [ ] **Application dependencies available**
- [ ] **Service identity access boundaries validated**
- [ ] **Configuration values loaded correctly**
- [ ] **Monitoring signals emitted** (logs, metrics flowing to platform)
- [ ] **No critical policy violations remain**
- [ ] **Smoke connectivity tests passed** (databases, queues, storage, APIs)

---

## Post-Execution Checklist

### 8. Traceability and Evidence (19.4.6)
- [ ] **Pipeline run reference captured**
- [ ] **Commit SHA recorded**
- [ ] **Work item linkage confirmed**
- [ ] **Stack/workspace name documented**
- [ ] **Plan/preview summary saved**
- [ ] **Resource inventory captured**
- [ ] **Policy validation results stored**
- [ ] **Approval evidence recorded**

### 9. Documentation Updates (19.4.7)
- [ ] **Environment purpose documented**
- [ ] **Target environment name and location recorded**
- [ ] **Resource inventory published**
- [ ] **Network and access design documented**
- [ ] **Configuration baseline recorded**
- [ ] **Secret references documented** (without exposing values)
- [ ] **Monitoring and logging expectations specified**
- [ ] **Ownership assigned** (engineering, platform, security, support)
- [ ] **Source and execution links added**

### 10. Quality Gates Met (19.7)
- [ ] **Work item scope confirmed before execution**
- [ ] **IaC source passed all validation checks**
- [ ] **Correct environment targeted**
- [ ] **All resources provisioned successfully**
- [ ] **Mandatory security controls applied**
- [ ] **No unresolved critical/high-severity policy violations**
- [ ] **Environment health checks passed**
- [ ] **Deployment evidence captured and stored**
- [ ] **Environment ready for Step 20 without manual correction**

---

## Sign-Off

**Executed By:** ___________________________  
**Date:** ___________________________  
**Work Item:** ___________________________  
**Pipeline Run:** ___________________________  
**Environment:** ___________________________

**Approved By (DevOps Lead):** ___________________________  
**Date:** ___________________________

---

## Common Failure Prevention

Refer to [Step 19 Common Failure Modes](#1911-common-failure-modes-and-prevention) in the main document for:
- Wrong environment updated prevention
- Provisioning drift controls
- Secrets exposure prevention
- Partial deployment mitigation
- Policy non-compliance prevention
- Unobservable environment fixes

---

## Machine-Readable Checklist

For AI agents and automation tools:

```json
{
  "step": "19",
  "title": "IaC Jobs Runner",
  "version": "0.1",
  "checklist_items": [
    {
      "id": "19.01",
      "category": "pre_execution",
      "item": "Work item approved and assigned",
      "required": true,
      "automation_check": "workitem.status == 'approved'"
    },
    {
      "id": "19.02",
      "category": "pre_execution",
      "item": "ARB approval received",
      "required": true,
      "automation_check": "arb_approval.exists(step=18)"
    },
    {
      "id": "19.03",
      "category": "execution",
      "item": "Syntax validation passed",
      "required": true,
      "automation_check": "pipeline.validation.status == 'passed'"
    },
    {
      "id": "19.04",
      "category": "execution",
      "item": "Policy-as-code checks passed",
      "required": true,
      "automation_check": "policy_engine.result == 'pass' && policy_engine.violations.critical == 0"
    },
    {
      "id": "19.05",
      "category": "execution",
      "item": "No hardcoded secrets detected",
      "required": true,
      "automation_check": "secrets_scan.findings == 0"
    },
    {
      "id": "19.06",
      "category": "security_baseline",
      "item": "Encryption at rest enabled",
      "required": true,
      "automation_check": "resources.all(encryption_at_rest == true)"
    },
    {
      "id": "19.07",
      "category": "security_baseline",
      "item": "RBAC using least privilege",
      "required": true,
      "automation_check": "rbac_assignments.all(role_level <= 'contributor')"
    },
    {
      "id": "19.08",
      "category": "validation",
      "item": "Environment health checks passed",
      "required": true,
      "automation_check": "health_checks.all_passed()"
    },
    {
      "id": "19.09",
      "category": "post_execution",
      "item": "Documentation updated",
      "required": true,
      "automation_check": "docs.last_updated >= deployment.timestamp"
    },
    {
      "id": "19.10",
      "category": "quality_gate",
      "item": "Environment ready for Step 20",
      "required": true,
      "automation_check": "environment.ready_state == true && manual_corrections == 0"
    }
  ]
}
```

---

**Note for AI Agents:**  
This checklist is both human-readable (for engineers) and machine-readable (JSON format). When assisting with Step 19, validate all checklist items before suggesting progression to Step 20.
