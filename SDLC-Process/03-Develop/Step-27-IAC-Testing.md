# Step 27: IAC Testing

**Phase:** Develop
**Owner:** CI/CD Pipeline, DevOps Engineer
**Duration:** 5-10 minutes (automated)
**Prerequisites:** PR approved (Step 26), IAC changes present

---

## Purpose

Test Infrastructure as Code (IAC) changes to validate infrastructure will provision correctly, comply with policies, and estimate costs before deployment.

---

## Process Flow

---

## Activities

### 27.1 IAC Plan Generation

**Generate infrastructure change preview:**

- Run `pulumi preview` or equivalent
- Show resources to be created/updated/deleted
- Display configuration changes
- Identify potential issues

**Example Plan Output:**

``` Previewing update (dev): + 3 to create ~ 2 to update - 1 to delete

Resources: + aws:s3/bucket:Bucket order-processing-bucket-dev + aws:rds/instance:Instance order-db-dev + aws:ec2/securityGroup:SecurityGroup order-sg-dev ~ aws:lambda/function:Function order-processor (version update) ~ aws:dynamodb/table:Table session-store (throughput change) - aws:ec2/instance:Instance legacy-server (no longer needed) ```

### 27.2 Plan Validation

**Validate plan for correctness:**

- No syntax errors in IAC code
- All required parameters provided
- Resource dependencies correct
- Naming conventions followed
- Tags applied consistently

**Validation Checks:**

- [ ] IAC syntax valid
- [ ] Required parameters present
- [ ] Resource names follow convention
- [ ] Tags include: environment, owner, cost-center
- [ ] Dependencies properly declared

### 27.3 Policy Compliance Check

**Check against IAC policies:**

- **Security:** No public S3 buckets, encryption enabled
- **Cost:** Resources within budget limits
- **Compliance:** Required tags present, approved regions
- **Best Practices:** HA configuration, backup enabled

**Policy Examples:**

- Deny public S3 buckets (enforce private)
- Require encryption at rest for databases
- Enforce tagging (environment, owner, cost-center)
- Restrict to approved AWS regions
- Require multi-AZ for production databases

**Policy Violation Example:**

``` Policy Violation: Security Policy

- Resource: aws:s3/bucket:Bucket order-processing-bucket
- Issue: Public access enabled
- Severity: High
- Recommendation: Set publicAccessBlock to true

```

### 27.4 Drift Detection

**Detect infrastructure drift:**

- Compare IAC state with actual infrastructure
- Identify manual changes not in code
- Highlight configuration drift
- Alert on unexpected changes

**Drift Example:**

``` Drift Detected:

- Resource: aws:rds/instance:Instance order-db-dev
- Expected: db.t3.medium
- Actual: db.t3.large (manually resized)
- Action: Update IAC or revert infrastructure

```

### 27.5 Cost Estimation

**Estimate infrastructure costs:**

- Calculate monthly costs for changes
- Compare to current costs (delta)
- Highlight expensive resources
- Alert if exceeds budget

**Cost Report Example:**

``` Estimated Monthly Cost: Current: $850/month Proposed: $1,245/month Delta: +$395/month (+46%)

Top Changes: + RDS Instance (db.t3.large): +$180/month + S3 Bucket (estimated 500GB): +$12/month ~ Lambda (increased memory): +$8/month ```

---

## Key Artifacts

**Inputs:**

- IAC code changes (Pulumi, Terraform, etc.)
- IAC policies and guardrails
- Current infrastructure state

**Outputs:**

- IAC plan (preview of changes)
- Policy compliance report
- Drift detection report
- Cost estimation

---

## Best Practices

✅ **DO:**

- Run IAC testing on every PR with infrastructure changes
- Review plans carefully before applying
- Address policy violations immediately
- Document reasons for drift (if intentional)
- Set budget alerts for cost increases

❌ **DON'T:**

- Apply IAC changes without preview/plan
- Ignore policy violations
- Make manual infrastructure changes (use IAC)
- Skip cost estimation
- Merge with detected drift (investigate first)

---

## Metrics & Observability

| Metric | Target | Description |
| --- | --- | --- |
| **IAC Test Pass Rate** | ≥95% | IAC tests passing / Total IAC PRs |
| **Policy Compliance Rate** | 100% | PRs compliant with policies |
| **Drift Incidents** | 0 | Manual changes detected |
| **Cost Variance** | <10% | Actual vs. estimated costs |
| **IAC Test Time** | <10 minutes | Time to run IAC tests |

---

## Quality Gates

- [ ] IAC plan generated successfully
- [ ] Plan validated (no errors)
- [ ] Policy compliance checks passed
- [ ] No unexpected drift detected
- [ ] Cost estimation reviewed and approved

**Exit Criteria:** IAC tests pass, no policy violations, ready for secrets scan.

---

## Related Steps

- **Step 11:** IAC Suggester & Reviewer (IAC code source)
- **Step 19:** IAC Jobs Runner (infrastructure provisioning)
- **Step 26:** Code Review Continued (approval before IAC testing)
- **Step 28:** Secrets Scan (next security gate)

---

## Summary

Step 27 validates infrastructure changes through automated IAC testing, ensuring correctness, policy compliance, and cost control before deployment. This prevents infrastructure issues and cost overruns.

**Key Outcomes:**

- Infrastructure changes validated
- Policy compliance verified
- Drift detected and addressed
- Costs estimated and approved
- Secure infrastructure deployment

---

## Navigation

|
 |