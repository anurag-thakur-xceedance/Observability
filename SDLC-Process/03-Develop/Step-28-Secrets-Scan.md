# Step 28: Secrets Scan

**Phase:** Develop
**Owner:** CI/CD Pipeline, Security Team
**Duration:** 2-5 minutes (automated)
**Prerequisites:** IAC testing passed (Step 27), PR ready to merge

---

## Purpose

Automated scanning for exposed secrets, credentials, API keys, and sensitive information in code and configuration. Prevents accidental secret exposure in repositories.

---

## Process Flow

---

## Activities

### 28.1 Secret Pattern Scanning

**Scan for known secret patterns:**

- **API Keys:** AWS, Azure, GCP, Stripe, etc.
- **Passwords:** Hardcoded passwords in code
- **Tokens:** OAuth tokens, JWT secrets, GitHub tokens
- **Private Keys:** RSA, SSH keys
- **Connection Strings:** Database connection strings with credentials

**Pattern Examples Detected:**

```python # ❌ AWS Access Key detected aws\_access\_key = "AKIAIOSFODNN7EXAMPLE"

# ❌ Database connection string with password db\_url = "postgresql://user:password123@localhost/db"

# ❌ API key in configuration stripe\_api\_key = "sk\_live\_4eC39HqLyjWDarjtT1zdp7dc" ```

### 28.2 Credential Detection

**Detect exposed credentials:**

- Username/password combinations
- Email addresses with passwords
- API authentication credentials
- Service account keys
- Certificate private keys

**Credential Types:**

- Basic auth credentials
- Bearer tokens
- OAuth client secrets
- Database passwords
- Encryption keys

### 28.3 Configuration Analysis

**Analyze configuration files:**

- `.env` files (should not be committed)
- `config.json` with secrets
- YAML/INI files with credentials
- Docker compose files with hardcoded passwords
- Kubernetes secrets in plain text

**Configuration Issues:**

```yaml # ❌ Kubernetes secret in plain text (should use sealed secrets) apiVersion: v1 kind: Secret data: password: cGFzc3dvcmQxMjM= # base64 is not encryption!

# ❌ .env file committed DB\_PASSWORD=my\_secret\_password API\_KEY=sk\_live\_12345 ```

### 28.4 False Positive Review

**Review and filter false positives:**

- Test/dummy credentials (e.g., "test\_api\_key\_12345")
- Example code in documentation
- Already-rotated/invalid credentials
- Public test keys (Stripe test keys)

**Whitelist Examples:**

``` # Whitelist test credentials test\_api\_key = "test\_sk\_12345" # whitelisted: test credential

# Whitelist Stripe test key (publicly known) stripe\_test\_key = "pk\_test\_..." # whitelisted: public test key ```

### 28.5 Remediation Guidance

**Provide clear remediation steps:**

- Remove secrets from code immediately
- Rotate exposed credentials
- Use secret management (Azure Key Vault, AWS Secrets Manager)
- Add secrets to `.gitignore`
- Update documentation on secure secret handling

**Remediation Steps:**

1. **Remove Secret:** Delete from code, replace with reference
2. **Use Secret Manager:** Store in Azure Key Vault, reference by name
3. **Rotate Credential:** Generate new secret, invalidate old one
4. **Update `.gitignore`:** Prevent future commits of secret files
5. **Rewrite History:** Use `git filter-branch` to remove from history (if already pushed)

**Secure Alternative:**

```python # ✅ Correct approach: Use secret manager import os from azure.keyvault.secrets import SecretClient

# Load from environment variable (set in CI/CD) api\_key = os.environ.get("STRIPE\_API\_KEY")

# Or load from Key Vault secret\_client = SecretClient(vault\_url="https://...", credential=credential) api\_key = secret\_client.get\_secret("stripe-api-key").value ```

---

## Key Artifacts

**Inputs:**

- Code changes in PR
- Configuration files
- Secret patterns and rules

**Outputs:**

- Secrets scan report
- Detected secrets list
- False positive whitelist
- Remediation guidance

---

## Best Practices

✅ **DO:**

- Scan every PR before merge (automated gate)
- Use secret managers (Key Vault, Secrets Manager)
- Store secrets in environment variables or secret stores
- Rotate secrets immediately if exposed
- Add sensitive files to `.gitignore`

❌ **DON'T:**

- Hardcode secrets in code
- Commit `.env` files or configuration with secrets
- Use base64 encoding as "encryption" (it's not)
- Ignore scan results as "false positives" without verification
- Store secrets in version control (even private repos)

---

## Metrics & Observability

| Metric | Target | Description |
| --- | --- | --- |
| **Secrets Detected** | 0 | Secrets found per PR (goal: zero) |
| **False Positive Rate** | <10% | False positives / Total detections |
| **Scan Time** | <5 minutes | Time to complete secrets scan |
| **Block Rate** | <5% | PRs blocked due to secrets |
| **Rotation Time** | <2 hours | Time to rotate exposed secrets |

**Critical Alert:** Any secret detected triggers immediate notification to security team and PR author.

---

## Quality Gates

- [ ] Secrets scan executed successfully
- [ ] No secrets detected (or all whitelisted as false positives)
- [ ] Configuration files reviewed
- [ ] Exposed secrets remediated (if any)
- [ ] Secret management best practices followed

**Exit Criteria:** Zero unresolved secret detections, PR ready to merge.

---

## Secret Scanning Tools

**Popular Tools:**

- **GitGuardian:** Comprehensive secret detection
- **TruffleHog:** Git history scanning
- **GitHub Advanced Security:** Built-in secret scanning
- **Azure DevOps or Jira:** Secret scanning extension
- **detect-secrets:** Open-source scanner

---

## Related Steps

- **Step 27:** IAC Testing (previous gate)
- **Step 29:** Development Flow (proceeds if scan passes)
- **Step 18:** Threat Modeling (identified secret management requirements)

---

## Summary

Step 28 prevents accidental exposure of secrets through automated scanning, blocking merges if credentials are detected. This critical security gate protects sensitive information and enforces secure secret management practices.

**Key Outcomes:**

- Zero secrets in code (blocked if detected)
- Secure secret management enforced
- Immediate rotation if secrets exposed
- Configuration files secured
- Security posture maintained

---

## Navigation

|
 |