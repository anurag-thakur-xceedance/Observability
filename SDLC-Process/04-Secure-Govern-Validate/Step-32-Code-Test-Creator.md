# Step 32: Code Test Creator

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 32 |
| **Phase** | Secure, Govern & Validate |
| **Previous Step** | [Step 31: Development Complete](../03-Develop/Step-31-Development-Complete.md) |
| **Next Step** | [Step 33: SAST](Step-33-SAST.md) |
| **Responsible Role(s)** | AI/Automation, QA Team |
| **Tools** | WorkItem Intelligence, AI/ML, GitHub Copilot |

---

## Purpose

AI-powered code and test generation to enhance test coverage and identify gaps before security validation. This step analyzes code against work item requirements and automatically generates additional test cases to ensure comprehensive validation.

---

## Process Flow

---

## Activities

### 32.1 AI Code Analysis

**Analyze code structure and existing test coverage:**
- Scan codebase for untested code paths
- Identify complex logic requiring additional validation
- Map code to work item acceptance criteria
- Detect edge cases and boundary conditions
- Analyze code dependencies and integration points

**Key Actions:**
- Run static analysis to identify code complexity
- Compare code coverage against thresholds
- Identify critical paths without test coverage
- Map business logic to functional requirements

### 32.2 Test Gap Identification

**Identify areas needing additional test coverage:**
- Compare existing tests against code structure
- Identify missing unit tests for public methods
- Find integration scenarios without coverage
- Detect untested error handling paths
- Validate exception scenarios

### 32.3 Test Generation

**AI generates additional test cases:**
- Create unit tests for untested methods
- Generate integration test scenarios
- Build edge case and boundary tests
- Create negative test cases for error paths
- Generate parameterized tests for variations

**Generation Template:**
pythondef test<em>user</em>registration<em>edge</em>cases():
"""Generated test for user registration edge cases"""
# Test with maximum length username
result = register\_user(username="x" \* 255, email="test@example.com")
assert result.success == True</p>
<pre><code># Test with special characters
result = register\_user(username="user@#$", email="test@example.com")
assert result.error == "Invalid characters"
# Test with duplicate email
result = register\_user(username="newuser", email="existing@example.com")
assert result.error == "Email already exists"
</code></pre>
<p>]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>32.4 Work Item Alignment</h3>
<p><strong>Validate tests against work item criteria:</strong>
- Map generated tests to acceptance criteria
- Ensure all requirements have corresponding tests
- Validate test scenarios match user stories
- Check for completeness of functional coverage
- Verify non-functional requirement testing</p>
<p><strong>Alignment Checklist:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Work Item #1234 Test Coverage
- AC1: User can register with valid email
- AC2: System validates email format
- AC3: Duplicate emails rejected
- AC4: Password complexity enforced
- AC5: Confirmation email sent (manual test required)
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>32.5 Human Review and Integration</h3>
<p><strong>QA team reviews and approves generated tests:</strong>
- Review AI-generated test quality
- Validate test assertions are meaningful
- Check for test maintainability
- Verify tests align with standards
- Integrate approved tests into test suite</p>
<hr />
<h2>Best Practices</h2>
<h3>Test Generation</h3>
<p>[PASS] <strong>DO:</strong>
- Generate tests for all public APIs
- Include edge cases and boundary conditions
- Create both positive and negative test scenarios
- Add descriptive test names and comments
- Follow existing test patterns and conventions</p>
<p>[FAIL] <strong>DON'T:</strong>
- Generate tests that duplicate existing coverage
- Create tests without meaningful assertions
- Generate overly complex or fragile tests
- Bypass human review of generated tests
- Ignore project-specific test standards</p>
<h3>Review Process</h3>
<p>[PASS] <strong>DO:</strong>
- Review all generated tests before integration
- Validate test assertions are correct
- Ensure tests are maintainable and readable
- Run tests to verify they pass
- Check tests fail when code is broken</p>
<p>[FAIL] <strong>DON'T:</strong>
- Auto-commit generated tests without review
- Accept tests with weak or missing assertions
- Integrate tests that are flaky or unreliable
- Skip validation of test quality
- Ignore failing generated tests</p>
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
<td>Code Coverage Increase</td>
<td>+5-15%</td>
<td>Coverage improvement from generated tests</td>
</tr>
<tr>
<td>Test Gap Resolution</td>
<td>90%</td>
<td>Percentage of identified gaps addressed</td>
</tr>
<tr>
<td>Generated Test Quality</td>
<td>&gt;85%</td>
<td>Percentage of generated tests approved</td>
</tr>
<tr>
<td>Requirements Coverage</td>
<td>100%</td>
<td>Work item acceptance criteria with tests</td>
</tr>
<tr>
<td>Review Turnaround</td>
<td>&lt;2 hours</td>
<td>Time to review and integrate tests</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Entry Criteria:</strong>
- Development phase completed
- Code committed to repository
- Existing test suite passing
- Work item requirements defined</p>
<p><strong>Exit Criteria:</strong>
- Code analyzed by AI system
- Test gaps identified and documented
- Additional tests generated
- Human review completed
- Approved tests integrated
- Coverage thresholds met
- All work item criteria have tests</p>
<hr />
<h2>AI/Automation Capabilities</h2>
<table>
<thead>
<tr>
<th>Capability</th>
<th>Tool/Service</th>
<th>Purpose</th>
</tr>
</thead>
<tbody>
<tr>
<td>Code Analysis</td>
<td>WorkItem Intelligence</td>
<td>Analyze code structure and complexity</td>
</tr>
<tr>
<td>Test Generation</td>
<td>GitHub Copilot</td>
<td>Generate test cases from code</td>
</tr>
<tr>
<td>Gap Detection</td>
<td>AI/ML Analysis</td>
<td>Identify missing test scenarios</td>
</tr>
<tr>
<td>Coverage Analysis</td>
<td>Coverage Tools</td>
<td>Measure test coverage improvements</td>
</tr>
<tr>
<td>Requirement Mapping</td>
<td>WorkItem Intelligence</td>
<td>Map tests to acceptance criteria</td>
</tr>
</tbody>
</table>
<hr />
<h2>Test Generation Configuration</h2>
<p><strong>Example AI Configuration:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[test\_generation:
languages:
- python
- typescript
- java</p>
<p>coverage\_targets:
unit: 80%
integration: 70%
e2e: 60%</p>
<p>generation<em>rules:
- generate</em>edge<em>cases: true
- include</em>negative<em>tests: true
- follow</em>existing<em>patterns: true
- max</em>tests<em>per</em>method: 5</p>
<p>quality<em>gates:
min</em>assertion<em>count: 1
require</em>docstrings: true
follow<em>naming</em>convention: true
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>AI-Generated Test Suite</li>
<li>Test Gap Analysis Report</li>
<li>Coverage Improvement Report</li>
<li>Work Item Test Mapping Matrix</li>
<li>Test Generation Configuration</li>
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
<td>AI/Automation, QA Team</td>
</tr>
<tr>
<td><strong>Accountable</strong></td>
<td>QA Lead</td>
</tr>
<tr>
<td><strong>Consulted</strong></td>
<td>Development Team, Product Owner</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>Development Lead, Security Team</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="../03-Develop/Step-31-Development-Complete.md">Step 31: Development Complete</a></li>
<li><strong>Downstream:</strong> <a href="Step-33-SAST.md">Step 33: SAST</a></li>
<li><strong>Related:</strong> <a href="../03-Develop/Step-20-Unit-Testing.md">Step 20: Unit Testing</a></li>
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
<td>Enhanced with AI test generation workflows</td>
</tr>
</tbody>
</table>