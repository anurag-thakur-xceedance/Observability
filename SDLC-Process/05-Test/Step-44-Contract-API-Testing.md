# Step 44: Contract API Testing

## Overview

| Attribute | Value |
| --- | --- |
| **Step Number** | 44 |
| **Phase** | Test |
| **Previous Step** | [Step 43: Integration Testing](Step-43-Integration-Testing.md) |
| **Next Step** | [Step 45: Automation Testing](Step-45-Automation-Testing.md) |
| **Responsible Role(s)** | QA Team, Development Team |
| **Tools** | Pact, Postman, Rest-Assured, Spring Cloud Contract |

---

## Purpose

Validate API contracts between service consumers and providers to prevent integration failures. Contract testing ensures both parties agree on API specifications before deployment, enabling independent service development and deployment.

---

## Process Flow

---

## Activities

### 44.1 Contract Definition and Validation

**Define API contracts between services:**
- Document consumer expectations
- Define provider capabilities
- Specify request/response formats
- Define error scenarios
- Version contract specifications
- Validate contract syntax

**Contract Example (Pact):**
javascript// Consumer contract definition
describe('Order Service as Consumer', () =&gt; {
const provider = new Pact({
consumer: 'OrderService',
provider: 'PaymentService',
})</p>
<p>const EXPECTED\_BODY = {
id: like('payment-123'),
status: term({ matcher: 'SUCCESS|FAILED', generate: 'SUCCESS' }),
amount: like(99.99),
currency: like('USD')
}</p>
<p>it('should process payment successfully', async () =&gt; {
await provider.addInteraction({
state: 'payment can be processed',
uponReceiving: 'a payment request',
withRequest: {
method: 'POST',
path: '/api/payments',
headers: { 'Content-Type': 'application/json' },
body: {
orderId: 'order-456',
amount: 99.99,
currency: 'USD'
}
},
willRespondWith: {
status: 200,
headers: { 'Content-Type': 'application/json' },
body: EXPECTED\_BODY
}
})</p>
<pre><code>// Execute consumer test
const response = await orderService.processPayment('order-456', 99.99)
expect(response.status).toBe('SUCCESS')
</code></pre>
<p>})
})
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>44.2 Consumer-Driven Contract Testing</h3>
<p><strong>Test from consumer perspective:</strong>
- Define consumer expectations
- Generate mock provider responses
- Validate consumer can handle responses
- Test error scenarios
- Generate contract artifacts
- Version consumer contracts</p>
<p><strong>Consumer Test Scenarios:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Consumer: Order Service</p>
<h2>Provider: Payment Service</h2>
<h3>Test Cases</h3>
<ol>
<li><p><strong>Successful Payment</strong></p>
<ul>
<li>Request: Valid payment data</li>
<li>Expected: 200 OK, payment ID returned</li>
</ul></li>
<li><p><strong>Insufficient Funds</strong></p>
<ul>
<li>Request: Payment with insufficient balance</li>
<li>Expected: 402 Payment Required, error message</li>
</ul></li>
<li><p><strong>Invalid Card</strong></p>
<ul>
<li>Request: Payment with invalid card</li>
<li>Expected: 400 Bad Request, validation errors</li>
</ul></li>
<li><p><strong>Timeout Handling</strong></p>
<ul>
<li>Request: Payment takes too long</li>
<li>Expected: Consumer handles gracefully
]]&gt;</ac:plain-text-body>
</ac:structured-macro></li>
</ul></li>
</ol>
<h3>44.3 Provider Contract Verification</h3>
<p><strong>Verify provider meets contracts:</strong>
- Load consumer contracts
- Replay requests against actual provider
- Verify responses match contract
- Test provider state transitions
- Validate error responses
- Check backward compatibility</p>
<p><strong>Provider Verification:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">java</ac:parameter>
<ac:plain-text-body><![CDATA[// Provider verification test
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM\_PORT)
@Provider("PaymentService")
@PactBroker(host = "pact-broker.example.com", port = "443", scheme = "https")
public class PaymentServiceContractTest {</p>
<p>@TestTemplate
@ExtendWith(PactVerificationInvocationContextProvider.class)
void pactVerificationTestTemplate(PactVerificationContext context) {
context.verifyInteraction();
}</p>
<p>@State("payment can be processed")
public void paymentCanBeProcessed() {
// Setup: Ensure payment service is in correct state
testDataService.createTestPaymentAccount();
}</p>
<p>@State("insufficient funds")
public void insufficientFunds() {
// Setup: Configure account with low balance
testDataService.createLowBalanceAccount();
}
}
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>44.4 API Compatibility and Versioning</h3>
<p><strong>Ensure backward compatibility:</strong>
- Compare new contracts with previous versions
- Identify breaking changes
- Validate API versioning strategy
- Test multiple contract versions
- Check deprecation warnings
- Verify migration paths</p>
<p><strong>Breaking Change Detection:</strong>
<ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Contract Compatibility Analysis</p>
<h3>[PASS] Non-Breaking Changes (Safe)</h3>
<ul>
<li>Adding optional fields</li>
<li>Adding new endpoints</li>
<li>Adding enum values (with default handling)</li>
<li>Relaxing validation constraints</li>
</ul>
<h3>[FAIL] Breaking Changes (Requires Coordination)</h3>
<ul>
<li>Removing fields</li>
<li>Renaming fields</li>
<li>Changing field types</li>
<li>Making optional fields required</li>
<li>Removing endpoints</li>
<li>Changing HTTP methods</li>
<li>Modifying error response structures</li>
</ul>
<h3>Example Breaking Change Detected</h3>
<p><strong>Version:</strong> v2.4.0
<strong>Change:</strong> Removed <code>paymentMethod</code> field from response
<strong>Impact:</strong> 3 consumers affected
<strong>Action Required:</strong> Update consumers before deploying provider
]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<h3>44.5 Contract Publishing and Documentation</h3>
<p><strong>Manage contract lifecycle:</strong>
- Publish contracts to Pact Broker
- Generate API documentation from contracts
- Track contract versions
- Notify stakeholders of changes
- Maintain contract registry
- Document compatibility matrix</p>
<hr />
<h2>Best Practices</h2>
<h3>Contract Testing</h3>
<p>[PASS] <strong>DO:</strong>
- Write consumer tests from consumer's perspective
- Test both success and error scenarios
- Version contracts explicitly
- Use Pact Broker for contract sharing
- Automate contract verification in CI/CD</p>
<p>[FAIL] <strong>DON'T:</strong>
- Test provider implementation details
- Include authentication in contracts (mock it)
- Create overly specific contracts
- Skip provider verification
- Allow breaking changes without migration plan</p>
<h3>API Design</h3>
<p>[PASS] <strong>DO:</strong>
- Follow semantic versioning
- Use backward-compatible changes when possible
- Deprecate before removing
- Document API changes clearly
- Provide migration guides</p>
<p>[FAIL] <strong>DON'T:</strong>
- Break contracts without coordination
- Remove endpoints without deprecation period
- Change response structure unexpectedly
- Skip version numbers
- Deploy incompatible changes simultaneously</p>
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
<td>Contract Coverage</td>
<td>100%</td>
<td>All service interactions have contracts</td>
</tr>
<tr>
<td>Contract Pass Rate</td>
<td>100%</td>
<td>All contracts verified successfully</td>
</tr>
<tr>
<td>Breaking Changes</td>
<td>0</td>
<td>No breaking changes without coordination</td>
</tr>
<tr>
<td>Contract Version Drift</td>
<td>&lt;2 versions</td>
<td>Consumers within 2 versions of provider</td>
</tr>
<tr>
<td>API Documentation Accuracy</td>
<td>100%</td>
<td>Docs match actual contracts</td>
</tr>
</tbody>
</table>
<hr />
<h2>Quality Gates</h2>
<p><strong>Entry Criteria:</strong>
- Integration tests passed (Step 43)
- API specifications defined
- Consumer requirements documented
- Provider services available</p>
<p><strong>Exit Criteria:</strong>
- All consumer contracts defined
- All provider verifications passed
- No breaking changes detected (or planned)
- Contracts published to broker
- API documentation updated
- Compatibility matrix current</p>
<hr />
<h2>Pact Workflow Example</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">yaml</ac:parameter>
<ac:plain-text-body><![CDATA[contract<em>testing:
consumer</em>phase:
- name: "Run consumer tests"
command: "npm run test:consumer"</p>
<pre><code>- name: "Publish contracts"
command: "npm run pact:publish"
env:
PACT\_BROKER\_BASE\_URL: "https://pact-broker.example.com"
PACT\_BROKER\_TOKEN: ${{ secrets.PACT\_TOKEN }}
</code></pre>
<p>provider\_phase:
- name: "Fetch contracts"
command: "npm run pact:fetch"</p>
<pre><code>- name: "Verify provider"
command: "npm run test:provider"
- name: "Can I deploy?"
command: |
pact-broker can-i-deploy \
--pacticipant PaymentService \
--version ${{ github.sha }} \
--to-environment production
</code></pre>
<p>]]&gt;</ac:plain-text-body>
</ac:structured-macro></p>
<hr />
<h2>Contract Broker Dashboard</h2>
<p><ac:structured-macro ac:name="code">
<ac:parameter ac:name="language">markdown</ac:parameter>
<ac:plain-text-body><![CDATA[## Pact Broker - Contract Status</p>
<table>
<thead>
<tr>
<th>Consumer</th>
<th>Provider</th>
<th>Contract Version</th>
<th>Status</th>
<th>Last Verified</th>
</tr>
</thead>
<tbody>
<tr>
<td>OrderService</td>
<td>PaymentService</td>
<td>v2.1.0</td>
<td>[PASS] Compatible</td>
<td>2026-03-10</td>
</tr>
<tr>
<td>OrderService</td>
<td>InventoryService</td>
<td>v1.5.2</td>
<td>[PASS] Compatible</td>
<td>2026-03-10</td>
</tr>
<tr>
<td>UserService</td>
<td>NotificationService</td>
<td>v3.0.0</td>
<td>[WARN] Pending</td>
<td>-</td>
</tr>
<tr>
<td>CartService</td>
<td>ProductService</td>
<td>v2.0.1</td>
<td>[PASS] Compatible</td>
<td>2026-03-09</td>
</tr>
</tbody>
</table>
<h2>Compatibility Matrix</h2>
<ul>
<li><strong>Production Environment:</strong> All contracts compatible</li>
<li><strong>Staging Environment:</strong> 1 contract pending verification</li>
<li><strong>Development:</strong> 2 breaking changes in progress
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
<td>Contract Testing</td>
<td>Pact</td>
<td>Consumer-driven contract testing</td>
</tr>
<tr>
<td>API Testing</td>
<td>Postman/Newman</td>
<td>Automated API validation</td>
</tr>
<tr>
<td>Contract Verification</td>
<td>Rest-Assured</td>
<td>Provider verification</td>
</tr>
<tr>
<td>Contract Management</td>
<td>Pact Broker</td>
<td>Contract versioning and publishing</td>
</tr>
<tr>
<td>Documentation Generation</td>
<td>OpenAPI</td>
<td>Auto-generate API docs from contracts</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Artefacts</h2>
<ul>
<li>Consumer Contract Specifications</li>
<li>Provider Contract Specifications</li>
<li>Pact Broker Contracts</li>
<li>API Documentation (OpenAPI/Swagger)</li>
<li>Compatibility Matrix</li>
<li>Breaking Change Log</li>
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
<td>QA Team, Development Team (both consumer &amp; provider)</td>
</tr>
<tr>
<td><strong>Accountable</strong></td>
<td>QA Lead</td>
</tr>
<tr>
<td><strong>Consulted</strong></td>
<td>Architecture Team, API Owners</td>
</tr>
<tr>
<td><strong>Informed</strong></td>
<td>Product Owner, All Service Teams</td>
</tr>
</tbody>
</table>
<hr />
<h2>Related Steps</h2>
<ul>
<li><strong>Upstream:</strong> <a href="Step-43-Integration-Testing.md">Step 43: Integration Testing</a></li>
<li><strong>Downstream:</strong> <a href="Step-45-Automation-Testing.md">Step 45: Automation Testing</a></li>
<li><strong>Related:</strong> <a href="../04-Secure-Govern-Validate/Step-34-DAST.md">Step 34: DAST</a></li>
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
<td>Enhanced with contract testing workflows and Pact examples</td>
</tr>
</tbody>
</table>