# Develop Phase - Agent Instructions

## Purpose
This file provides instructions for AI coding agents working within **Phase 03 - Develop** of the SDLC. Engineers can point their AI coding agents (GitHub Copilot, Azure AI, etc.) to this document to ensure alignment with the established development process.

---

## How to Use This File

### For Engineers
Point your AI agent to this file to:
- Understand the Phase 03 Develop workflow (Steps 19-31)
- Follow quality gates and exit criteria
- Generate code that aligns with organizational standards
- Understand where human review is required vs. automation

### For AI Agents
When assisting with development tasks in this phase:
1. **Always validate** that work is traceable to an approved work item
2. **Follow the execution context** (Local 🖥️ vs Server/Service ☁️ vs Human Review 👤)
3. **Enforce quality gates** before suggesting progression to next steps
4. **Include traceability** in all generated artifacts (PRs, commits, documentation)

---

## Phase 03 Process Flow

### Steps Overview
| **Step** | **Context** | **Title** | **Agent Role** |
|---|---|---|---|
| **19** | ☁️ | IaC Jobs Runner | Review IaC templates, suggest security baselines, validate policy compliance |
| **20** | 🖥️ | Unit Testing | Generate test cases, scaffold tests, identify edge cases, ensure fast execution |
| **21** | 🖥️👤 | Test Reviewer Additions | Suggest additional test scenarios, identify coverage gaps |
| **22** | 🖥️ | Comment Aware Reasoning | Improve code comments, align implementation with intent, detect mismatches |
| **23** | 🖥️ | Merge PR | Generate PR descriptions, suggest reviewers, create work item links |
| **24** | ☁️ | Linting | Auto-fix linting issues where safe, explain violations, suggest suppressions |
| **25** | 👤 | Code Review | Summarize changes for reviewers, highlight security/quality concerns |
| **26** | 👤🖥️ | Code Review Continued | Help address review feedback, suggest refactorings, explain design decisions |
| **27** | ☁️ | IaC Testing | Validate IaC changes, suggest test scenarios, identify drift risks |
| **28** | ☁️ | Secrets Scan | Identify potential secrets exposure, suggest secure alternatives |
| **29** | ☁️ | Development Flow | Assist with build configuration, packaging, versioning |
| **30** | ☁️ | Development Flow Continued | Support deployment validation, environment verification |
| **31** | 👤 | Development Complete | Generate completion checklists, verify Definition of Done |

---

## Critical Quality Gates

AI agents must **never bypass or weaken** these quality gates:

### Gate 1: Unit Tests Pass (Step 20)
- ✅ Minimum 80% code coverage required
- ✅ Tests must be FAST (< 10 minutes suite, < 1 second per test)
- ✅ Tests run BEFORE check-in (local execution)
- ❌ Do NOT suggest skipping tests or reducing coverage without explicit approval

### Gate 2: Linting Clean (Step 24)
- ✅ Zero linting errors required
- ✅ Auto-fix safe issues only
- ❌ Do NOT suggest disabling rules without justification

### Gate 3: Code Review Approved (Steps 25-26)
- ✅ Human review is REQUIRED
- ✅ AI can assist but cannot replace human approval
- ❌ Do NOT suggest merging without approval

### Gate 4: No Secrets Detected (Step 28)
- ✅ Zero secrets exposure tolerated
- ✅ Suggest secure alternatives (Key Vault, environment variables)
- ❌ Do NOT suggest committing secrets even temporarily

### Gate 5: All Checks Pass (Step 31)
- ✅ Definition of Done must be verified
- ✅ Traceability must be complete
- ❌ Do NOT progress to Phase 04 with incomplete criteria

---

## Agent Behavior Guidelines

### DO
- ✅ **Generate test cases proactively** when code changes are suggested
- ✅ **Suggest reviewers** based on code ownership and expertise
- ✅ **Include work item references** in commits and PRs
- ✅ **Explain security implications** of suggested code
- ✅ **Highlight breaking changes** clearly
- ✅ **Keep PR size focused** (< 400 lines)
- ✅ **Use approved patterns** from the codebase
- ✅ **Update documentation** alongside code changes
- ✅ **Remind engineers** to update Jira tickets and Confluence pages

### DON'T
- ❌ **Never bypass quality gates** without explicit approval
- ❌ **Never suggest hardcoded secrets** or credentials
- ❌ **Never generate untested code** without test suggestions
- ❌ **Never auto-merge** without human approval
- ❌ **Never disable security checks** without justification
- ❌ **Never create PRs without work item links**
- ❌ **Never suggest skipping reviews** for "trivial" changes

---

## DORA Metrics Awareness

AI agents should help optimize these DORA metrics:

| **Metric** | **Target** | **How Agent Can Help** |
|---|---|---|
| **D1: Lead Time for Changes** | < 1 day | Accelerate coding, testing, and PR creation; keep changes small and focused |
| **D2: Deployment Frequency** | On-demand | Automate build/test; suggest CI/CD improvements |
| **D3: Change Failure Rate** | < 15% | Generate comprehensive tests; identify edge cases; review for common bugs |
| **D5: Time From Inception to PR** | < 2 days | Streamline development workflow; suggest parallel task execution |

---

## Example Agent Interactions

### Scenario 1: Engineer Writes Code Without Tests
**Engineer:** "Here's my new feature implementation."

**Agent Response:**
```
⚠️ Quality Gate Alert: No unit tests detected for this change.

Step 20 requires:
- Minimum 80% code coverage
- Tests for happy path, edge cases, and error cases
- Fast test execution (< 1 second per test)

Suggested test scenarios:
1. [Test case 1 description]
2. [Test case 2 description]
3. [Test case 3 description]

Would you like me to generate test scaffolding?
```

### Scenario 2: Engineer Creates Large PR
**Engineer:** "Create PR for my feature."

**Agent Response:**
```
⚠️ PR Size Alert: 847 lines changed

Step 23 recommends < 400 lines for reviewability.

Suggestions:
- Split into 3 focused PRs:
  1. Data model changes (212 lines)
  2. Business logic (385 lines)
  3. UI updates (250 lines)

This will improve review quality and reduce time to first review.
```

### Scenario 3: Engineer Tries to Hardcode Secret
**Engineer:** "How do I connect to the database?"

**Agent Response:**
```
⚠️ Secret Exposure Risk: Step 28 prohibits hardcoded credentials.

Approved patterns:
1. Use Azure Key Vault reference:
   `connectionString: KeyVault.getSecret("db-connection")`

2. Use environment variable:
   `connectionString: process.env.DB_CONNECTION_STRING`

3. Use managed identity (recommended):
   `new SqlConnection(useManagedIdentity: true)`

❌ Do NOT: Hardcode credentials in code or config files
```

---

## Traceability Requirements

Every artifact generated by AI agents must include traceability:

### Commit Messages
```
<type>(<scope>): <subject>

<body explaining WHY the change was made>

Work-Item: #<issue-number>
```

### Pull Request Descriptions
```markdown
## Summary
[Brief description]

## Related Work Item
Fixes #<issue-number>

## Changes Made
- [Change 1]
- [Change 2]

## Testing Performed
- [Test scenario 1]
- [Test scenario 2]

## Review Focus Areas
- [Area 1 for reviewers to focus on]
- [Area 2 for reviewers to focus on]
```

---

## Integration with MCP Servers

AI agents can discover additional capabilities via MCP (Model Context Protocol):

| **MCP Server** | **Purpose** | **Use In Phase 03** |
|---|---|---|
| **GitHub MCP** | GitHub API interactions | PR creation, review requests, status checks |
| **Azure DevOps MCP** | Azure DevOps API interactions | Work item linking, pipeline status |
| **Policy-as-Code MCP** | Infrastructure policy validation | IaC compliance checking (Step 19, 27) |
| **Code Coverage MCP** | Coverage analysis | Test adequacy verification (Step 20, 21) |
| **Secrets Detection MCP** | Secret scanning | Pre-commit secret scanning (Step 28) |

---

## Support and Feedback

### For Engineers
- If agent suggestions violate established process, report via the feedback mechanism
- Request process clarification via this file's revision history

### For AI Agents
- When uncertain about process compliance, default to **more restrictive** interpretation
- Suggest consulting human reviewers for ambiguous situations
- Never silently bypass documented requirements

---

## Revision History
| **Version** | **Date** | **Changes** |
|---|---|---|
| **0.1** | 9 June 2026 | Initial agent instructions created based on Phase 03 review feedback |
