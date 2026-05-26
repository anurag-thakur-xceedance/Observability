# Step 40: Consistency PR VS WI DOD

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 40 |
| **Phase** | Secure, Govern & Validate |
| **Previous Step** | [Step 39: Security Phase Complete](Step-39-Security-Phase-Complete.md) |
| **Next Step** | [Step 41: Design Suggester](../05-Test/Step-41-Design-Suggester.md) |
| **Responsible Role(s)** | AI/Automation, QA Team |
| **Tools** | WorkItem Intelligence, Azure DevOps or Jira API, AI/ML |

---

## Purpose

AI-powered validation ensuring pull request deliverables are consistent with work item Definition of Done (DoD) criteria and acceptance conditions. This automated quality check verifies that implemented code meets documented requirements.

---

## Process Flow

---

## Activities

### 40.1 PR and Work Item Correlation

**Link pull requests to work items:**
- Scan merged PRs since last validation
- Extract work item references from PR descriptions
- Validate PR-to-work-item linkage
- Identify orphaned PRs (no work item)
- Map multiple PRs to single work item
- Track work item implementation status

**Correlation Example:**
markdown## PR #456: Implement user authentication
<strong>Linked Work Items:</strong>
- US-1234: User login functionality
- US-1235: Password reset feature
- BUG-789: Fix session timeout issue</p>
<p><strong>Status:</strong>
- PR merged: 2026-03-09
- Work items: In Progress -> Ready for Test
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>40.2 Definition of Done Extraction</h3>
<p><strong>Parse DoD criteria from work items:</strong>
- Extract acceptance criteria from work item
- Parse Definition of Done checklist
- Identify technical requirements
- Extract test coverage requirements
- Parse documentation requirements
- Identify non-functional requirements</p>
<p><strong>DoD Template:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[work\_item: US-1234
title: "User Login Functionality"</p>
<p>acceptance\_criteria:
- Users can login with email and password
- Invalid credentials show error message
- Successful login redirects to dashboard
- Failed login attempts are logged
- Session expires after 30 minutes</p>
<p>definition<em>of</em>done:
code:
- Code reviewed and approved
- Unit tests written (&gt;80% coverage)
- Integration tests passing
- No critical/high security issues</p>
<p>documentation:
- API documentation updated
- User guide updated</p>
<p>testing:
- All acceptance criteria validated
- Security testing completed
- Performance requirements met
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>40.3 AI-Powered Consistency Analysis</h3>
<p><strong>Analyze PR content against DoD:</strong>
- Review code changes in PR
- Analyze test additions/modifications
- Check documentation updates
- Validate security scan results
- Review code review comments
- Assess completeness of implementation</p>
<p><strong>AI Analysis Prompt:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Analysis Task
Review PR #456 and verify it meets all DoD criteria for US-1234.</p>
<p><strong>PR Content:</strong>
- Files changed: 12
- Lines added: 450
- Lines removed: 80
- Tests added: 15
- Documentation updated: Yes</p>
<p><strong>DoD Criteria:</strong>
[List of criteria from work item]</p>
<p><strong>Question:</strong>
Does this PR fully implement all acceptance criteria and meet the DoD?
Identify any gaps or inconsistencies.
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>40.4 Gap Identification and Reporting</h3>
<p><strong>Identify inconsistencies and gaps:</strong>
- Missing functionality vs acceptance criteria
- Insufficient test coverage
- Missing documentation updates
- Unaddressed security concerns
- Incomplete implementation
- Deviations from requirements</p>
<p><strong>Gap Report Example:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Consistency Check: PR #456 vs US-1234</p>
<h3>[PASS] Met Criteria (4/6)</h3>
<ul>
<li>Users can login with email/password</li>
<li>Invalid credentials show error</li>
<li>Session expiration implemented</li>
<li>Unit tests &gt;80% coverage</li>
</ul>
<h3>[FAIL] Gaps Identified (2/6)</h3>
<ul>
<li><p><strong>Missing</strong>: Failed login attempt logging</p>
<ul>
<li>Severity: Medium</li>
<li>Location: Expected in src/auth/logger.ts</li>
<li>Action Required: Add audit logging</li>
</ul></li>
<li><p><strong>Incomplete</strong>: API documentation</p>
<ul>
<li>Severity: Low</li>
<li>Location: docs/api/authentication.md</li>
<li>Action Required: Document new endpoints</li>
</ul></li>
</ul>
<h3>Recommendation</h3>
<p>[WARN] Create follow-up task for missing logging functionality.
Document API updates before proceeding to testing.
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>40.5 Compliance Reporting and Tracking</h3>
<p><strong>Generate and track compliance:</strong>
- Create compliance report per work item
- Update work item with validation results
- Track DoD compliance metrics
- Flag items for follow-up
- Notify stakeholders of gaps
- Update project dashboards</p>
<hr />
<h2>Best Practices</h2>
<h3>DoD Validation</h3>
<p>[PASS] <strong>DO:</strong>
- Validate every PR against linked work item
- Use AI to detect subtle inconsistencies
- Check both functional and non-functional criteria
- Review test coverage as part of validation
- Document all gaps clearly</p>
<p>[FAIL] <strong>DON'T:</strong>
- Skip validation for "minor" PRs
- Accept PRs without work item linkage
- Ignore gaps in documentation
- Bypass DoD for urgent changes
- Mark work items complete with known gaps</p>
<h3>Work Item Management</h3>
<p>[PASS] <strong>DO:</strong>
- Maintain clear, measurable acceptance criteria
- Keep DoD checklist up to date
- Link all PRs to work items
- Update work item status based on validation
- Track DoD compliance metrics</p>
<p>[FAIL] <strong>DON'T:</strong>
- Write vague or unmeasurable criteria
- Allow PRs without work item links
- Proceed to testing with gaps
- Skip DoD validation steps
- Ignore AI-identified gaps</p>
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
<td>DoD Compliance Rate</td>
<td>&gt;95%</td>
<td>PRs meeting all DoD criteria</td>
</tr>
<tr>
<td>PR Linkage Rate</td>
<td>100%</td>
<td>PRs linked to work items</td>
</tr>
<tr>
<td>Gap Detection Rate</td>
<td>Track</td>
<td>Percentage of PRs with gaps</td>
</tr>
<tr>
<td>Mean Time to Gap Resolution</td>
<td>&lt;2 days</td>
<td>Time to fix identified gaps</td>
</tr>
<tr>
<td>Acceptance Criteria Coverage</td>
<td>100%</td>
<td>All criteria addressed in PRs</td>
</tr>
<tr>
<td>Automated Validation Rate</td>
<td>100%</td>
<td>All PRs automatically validated</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Entry Criteria:</strong>
- Security gate passed (Step 39)
- PRs merged to main branch
- Work items have defined acceptance criteria
- DoD checklist defined for work items</p>
<p><strong>Exit Criteria:</strong>
- All PRs analyzed
- PR-work item correlation complete
- DoD criteria extracted
- Consistency analysis completed
- Gaps identified and documented
- Compliance report generated
- Follow-up tasks created for gaps</p>
<hr />
<h2>AI Consistency Check Example</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">python</ac:parameter>
<ac:plain-text-body><![CDATA[def validate<em>pr</em>consistency(pr<em>id, work</em>item<em>id):
pr = get</em>pr<em>details(pr</em>id)
work<em>item = get</em>work<em>item(work</em>item\_id)</p>
<pre><code># Extract criteria
acceptance\_criteria = work\_item.acceptance\_criteria
dod\_checklist = work\_item.definition\_of\_done
# Analyze PR
code\_changes = pr.get\_diff()
tests\_added = pr.get\_test\_files()
docs\_updated = pr.get\_doc\_files()
# AI Analysis
analysis = ai\_model.analyze({
"pr\_content": code\_changes,
"tests": tests\_added,
"docs": docs\_updated,
"acceptance\_criteria": acceptance\_criteria,
"dod": dod\_checklist
})
# Generate report
return {
"met\_criteria": analysis.satisfied\_criteria,
"gaps": analysis.identified\_gaps,
"compliance\_score": analysis.score,
"recommendations": analysis.recommendations
}
</code></pre>
<p>]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Compliance Report Template</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[
<strong>Work Item:</strong> US-1234 - User Login Functionality
<strong>Pull Request:</strong> PR #456
<strong>Validation Date:</strong> 2026-03-10
<strong>Status:</strong> [WARN] Partial Compliance</p>
<h2>Acceptance Criteria Validation</h2>
<table>
<thead>
<tr>
<th>ID</th>
<th>Criteria</th>
<th>Status</th>
<th>Evidence</th>
</tr>
</thead>
<tbody>
<tr>
<td>AC1</td>
<td>Users can login with email/password</td>
<td>[PASS] Pass</td>
<td>Implemented in auth.service.ts:45</td>
</tr>
<tr>
<td>AC2</td>
<td>Invalid credentials show error</td>
<td>[PASS] Pass</td>
<td>Error handling in login.component.ts:78</td>
</tr>
<tr>
<td>AC3</td>
<td>Success redirects to dashboard</td>
<td>[PASS] Pass</td>
<td>Router.navigate in auth.guard.ts:23</td>
</tr>
<tr>
<td>AC4</td>
<td>Failed attempts logged</td>
<td>[FAIL] Gap</td>
<td>No logging implementation found</td>
</tr>
<tr>
<td>AC5</td>
<td>Session expires after 30 min</td>
<td>[PASS] Pass</td>
<td>Session config in app.config.ts:12</td>
</tr>
</tbody>
</table>
<h2>Definition of Done Validation</h2>
<h3>Code Quality</h3>
<ul>
<li>Code reviewed and approved (2 approvers)</li>
<li>Unit tests written (coverage: 85%)</li>
<li>Integration tests passing</li>
<li>No critical/high security issues</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>API documentation updated</li>
<li>User guide update pending</li>
</ul>
<h3>Testing</h3>
<ul>
<li>Security testing completed</li>
<li>Performance requirements met</li>
</ul>
<h2>Summary</h2>
<ul>
<li><strong>Compliance Score:</strong> 90% (9/10 criteria met)</li>
<li><strong>Gaps:</strong> 1 functional, 0 technical</li>
<li><strong>Recommendation:</strong> Create follow-up task for audit logging</li>
<li><strong>Clearance for Testing:</strong> [PASS] Yes (with follow-up tracked)
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul>
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
<td>DoD Validation</td>
<td>WorkItem Intelligence</td>
<td>AI-powered consistency checking</td>
</tr>
<tr>
<td>NLP Analysis</td>
<td>AI/ML</td>
<td>Parse and understand requirements</td>
</tr>
<tr>
<td>Code Analysis</td>
<td>GitHub API</td>
<td>Extract PR content and changes</td>
</tr>
<tr>
<td>Gap Detection</td>
<td>AI/ML</td>
<td>Identify missing implementations</td>
</tr>
<tr>
<td>Report Generation</td>
<td>Automation</td>
<td>Generate compliance reports</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>DoD Consistency Reports</li>
<li>Gap Analysis Documents</li>
<li>Work Item Updates</li>
<li>Follow-up Task Tickets</li>
<li>Compliance Dashboard</li>
<li>Validation Audit Log</li>
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
<td>Development Team, Product Owner, Scrum Master</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>Development Lead, Project Management</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="Step-39-Security-Phase-Complete.md">Step 39: Security Phase Complete</a></li>
<li><strong>Downstream:</strong> <a href="../05-Test/Step-41-Design-Suggester.md">Step 41: Design Suggester</a></li>
<li><strong>Related:</strong> <a href="../01-Product-Feedback-Discovery-Planning/Step-04-Work-Item-Integration.md">Step 04: Work Item Integration</a></li>
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
<td>Enhanced with AI-powered DoD validation workflows</td>
</tr>
</tbody>
</table>