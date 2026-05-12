---
marp: true
theme: default
paginate: true
size: 16:9
header: 'Observability Strategy | Board of Directors'
footer: 'Confidential — For Senior Management & Board Review'
style: |
  section { font-family: 'Segoe UI', Arial, sans-serif; font-size: 26px; padding: 50px 70px; }
  h1 { color: #0B3D91; font-size: 44px; }
  h2 { color: #0B3D91; font-size: 34px; border-bottom: 2px solid #0B3D91; padding-bottom: 6px; }
  h3 { color: #1F4E79; }
  strong { color: #0B3D91; }
  table { font-size: 22px; }
  blockquote { border-left: 4px solid #0B3D91; color: #333; }
  section.title { background: linear-gradient(135deg, #0B3D91 0%, #1F4E79 100%); color: white; }
  section.title h1, section.title h2, section.title p { color: white; border: none; }
---

<!-- _class: title -->

# Observability Strategy Rollout

## From Reactive Firefighting to Proactive Intelligence

**Presented to:** Senior Management & Board of Directors
**Prepared by:** Office of the CTO — Platform & SRE
**Status:** Decision & Approval Required

<!--
This is a strategic conversation, not a technical one. Frame the presentation as the modernization of how we run the business operationally — every customer-facing service, from Underwriting to Claims to FNOL, is underpinned by what we are about to discuss. The board is being asked to endorse a direction, ratify foundational architectural decisions, and authorize the first phase of execution. Keep the discussion at the level of business outcomes: customer trust, operational resilience, and the freeing of engineering capacity for growth.
-->

---

## Executive Summary — Why Now

- Our current operating posture is **reactive**: incidents are discovered through customer complaints rather than internal signals.
- **Tool sprawl** has created blind spots, duplicated spend, and inconsistent service quality across business lines.
- A unified observability capability moves us from **detecting failure to anticipating it**.
- The result is **faster recovery, fewer customer-visible incidents, and engineering capacity redirected from firefighting to growth**.
- This is a **competitive differentiator** for an insurance carrier — not a back-office upgrade.

<!--
The cost of inaction is not abstract. Every quarter we delay, we continue to lose engineering capacity to incident response, we continue to pay for overlapping tools, and we continue to learn about outages from customers rather than from our own systems. The window of opportunity is real: open standards have matured to the point where we can build a future-proof platform without locking ourselves into any single vendor. The board should hear this as a modernization investment with compounding returns — every phase makes the next phase cheaper and faster.
-->

---

## Current State vs. Future Vision

| Dimension | Today | Future State |
|---|---|---|
| **Visibility** | Siloed logs, metrics, traces across teams | Single pane of glass across all services |
| **Detection** | Customers often notify us first | Internal systems detect before customer impact |
| **Diagnosis** | Manual root-cause investigation | AI-assisted, evidence-backed diagnosis |
| **Coverage** | Inconsistent across services | Uniform standard for every critical service |
| **Cost Posture** | Fragmented and unpredictable | Governed, transparent, attributable to lines of business |

<!--
This slide grounds the conversation in evidence rather than opinion. The "today" column is uncomfortable but accurate; it is the picture our own teams describe when interviewed. The "future state" column is not aspirational marketing — each item is tied to a measurable acceptance criterion in the underlying program plan. If pressed on which gap concerns leadership most, point to governance and cost discipline: without those, every other dimension regresses within a couple of quarters of any platform refresh.
-->

---

## Strategic Pillars — A Single Operating Standard

- **Metrics** — what is happening across the estate in real time
- **Logs** — what was said, with full forensic and audit value
- **Traces** — where it happened, end-to-end across the customer journey
- **Business Insights** — what it means in terms of revenue, conversion, and customer experience

> **Foundation:** an open, vendor-neutral data standard — eliminates lock-in, future-proofs the investment, and lets us change tools without re-instrumenting every service.

<!--
Four pillars, deliberately simplified for this audience. The decisive message is the fourth pillar — Business Insights. This is what separates modern observability from traditional IT monitoring: we will instrument value streams such as Quote-to-Bind and FNOL-to-Settlement, so that for the first time we can connect a technical event to a business consequence in real time. The choice of an open standard is strategically important: it is what guarantees we are never trapped by a vendor's pricing model or product roadmap.
-->

---

## Expected Business Impact

- **Reliability** — formal service-level commitments for customer-facing systems, backed by error budgets that govern the trade-off between speed and stability.
- **Speed of Recovery** — incidents detected, diagnosed, and resolved materially faster than today, with fewer escalations to senior engineers.
- **Customer Experience** — issues caught and remediated before they reach the customer; broker and policyholder confidence preserved.
- **Operational Resilience** — clear, tested recovery commitments for every tier of service, defensible to regulators and rating agencies.
- **Growth Enablement** — engineering capacity reclaimed from incident response is redirected to product delivery and innovation.

<!--
Dwell on this slide. Each bullet maps to a board-level concern: reliability speaks to the regulator and rating agency view, speed of recovery to operational risk, customer experience to NPS and retention, resilience to business continuity, and growth to the CFO's interest in delivery throughput. The error-budget mechanism deserves particular attention — it is the institutional discipline that automatically slows feature releases on any service that has consumed its reliability allowance. This is how we hard-wire the trade-off between speed and stability into the operating model rather than relying on case-by-case judgement.
-->

---

## Business Value by Function

| Business Function | What Observability Delivers |
|---|---|
| **Underwriting** | Faster quote turnaround; fewer broker-facing service interruptions |
| **Claims & FNOL** | End-to-end visibility of the claim journey; SLA breaches anticipated, not reported |
| **Customer Self-Service** | Portal degradation detected before customers experience or report it |
| **Finance / CFO** | Cost transparency by transaction and line of business; basis for chargeback |
| **Risk & Compliance** | Continuous, auditable evidence for SOC 2, ISO 27001, and GDPR |

<!--
This slide answers the implicit question every executive in the room is asking: what is in this for my function? The answer is direct and specific. For the CFO, observability becomes a financial control plane — we can see and attribute the cost of running each business process. For the CISO and Head of Risk, it is a continuous compliance evidence engine that replaces point-in-time audits with always-on assurance. For business heads, it is the structural difference between learning of an outage from a customer and catching it ourselves. Use this slide to invite each executive to name their single highest-priority value driver.
-->

---

## Resource Requirements — Investment View

- **Talent** — a small dedicated Platform and Site Reliability squad, augmented by a Community of Practice that draws on existing engineers; **no large net-new headcount**.
- **Tooling Posture** — open-source core technologies, eliminating per-seat and per-host vendor licensing for the foundation layer.
- **Funding Model** — Phase 1 absorbed within the existing platform budget envelope; cost savings from tool consolidation **self-fund** subsequent phases.
- **Cost Discipline** — formal FinOps practice with budget envelopes per service tier and automated alerts on variance.
- **Talent Development** — engineers across the organisation up-skilled through a champions network, not a parallel team.

<!--
The financial story here is unusually favourable: this is not a "spend money now to save money in five years" pitch. The savings from tool consolidation in Phase 1 substantially fund the more ambitious capabilities in later phases. We are not asking for new headcount of any scale — we are asking for a focused squad that becomes the centre of excellence and uses the Community of Practice model to scale enablement across existing teams. The single largest cost risk in any observability program is uncontrolled telemetry growth; our FinOps standard is designed specifically to govern that, with budget envelopes and automated escalation built in from day one.
-->

---

## Twelve-Month Roadmap — Three Phases

| Phase | Theme | Outcome |
|---|---|---|
| **Phase 1 — Foundation** | "See when something breaks" | Critical services instrumented to a common standard; baseline measures established |
| **Phase 2 — Correlation** | "Understand why it broke" | Logs, metrics, and traces correlated; alerts that are actionable rather than noisy |
| **Phase 3 — Intelligence** | "Fix it before users notice" | AI-assisted anomaly detection, automated root-cause analysis, predictive alerting |

- Each phase is **gated by sustained outcomes** — not by activity completed — and requires explicit governance sign-off before the next phase begins.

<!--
The phased approach is deliberately conservative. Each phase delivers standalone value: even if Phase 3 were deferred, Phases 1 and 2 alone would justify the investment. The phase-gate mechanism is critical — we will not advance on the basis of activity, only on the basis of measured outcomes sustained over time. This is how we protect the board from the classic transformation failure mode of milestones-met-but-value-not-delivered. The governance review at each gate is the formal checkpoint where leadership retains the option to pause, accelerate, or redirect the program.
-->

---

## Governance & Accountability

- **Architecture Review Board** — ratifies standards, reviews phase gates, approves material decisions.
- **Service Design Group** — ensures every new service onboards to the standard, with no quiet exceptions.
- **Exception Panel** — every deviation from standard is approved, time-boxed, and visible.
- **Change Board** — controls production rollouts and holds rollback authority.
- All material decisions are captured as **Architectural Decision Records** — versioned, auditable, defensible to regulators and to the board itself.

<!--
Governance is the single biggest determinant of long-term success — more so than tooling, more so than talent. Four bodies, clear remit, no overlap. Every material decision becomes an Architectural Decision Record, which gives us a defensible audit trail. The Exception Panel deserves particular emphasis: every standards exception is approved, time-boxed, and tracked, which means there are no permanent exceptions — this is the single most important guard against the slow erosion of standards that destroys most enterprise platforms over time. We will report governance outcomes to the Technology Committee of the Board on a regular cadence.
-->

---

## Compliance & Risk Mitigation

- **In-scope frameworks** — SOC 2 Type II · ISO 27001 · GDPR
- **On the watch-list** — PCI DSS · DORA · NIS2 (anticipated obligations as our European footprint grows)
- **Built-in controls:**
  - Personally identifiable information **redacted at the source**, never landing in our backends
  - Tiered data retention aligned to regulatory and business needs
  - Role-based access enforced uniformly across the platform
  - Continuous evidence collection — **audit-ready by design**

<!--
This slide is for the audit-committee perspective in the room. Observability done poorly creates compliance risk — telemetry can become a back door for sensitive data exfiltration. Observability done well becomes a continuous compliance asset. We have engineered for the latter from day one: PII redaction is enforced at the collection layer rather than at the destination, so sensitive data never reaches our storage systems. The watch-list items are flagged because they represent emerging regulations that will likely apply to our European operations in the near term — we are positioning the platform to absorb them without re-architecture.
-->

---

## Key Risks & Mitigations

| Risk | Mitigation |
|---|---|
| Tool consolidation surfaces **migration debt** | Phased decommissioning with parallel running; no big-bang cut-overs |
| AI-driven detection produces **false positives during ramp-up** | Human-in-the-loop guardrails before full automation in later phases |
| **Telemetry cost overruns** as adoption scales | FinOps budgets per service tier with automated variance alerts |
| **Standards drift** as the platform matures | Architecture Review Board enforcement and decision-record audit trail |
| **Adoption fatigue** across engineering teams | Pull-based Community of Practice model; champions per service |

<!--
We have sequenced these risks by likelihood and material impact. The migration-debt risk is the most certain — every consolidation surfaces hidden complexity — and we mitigate with parallel running and a published decommissioning schedule. The cost risk is the one most often underestimated in observability programs; our FinOps standard institutes hard budget envelopes per service tier with automated escalation, which prevents quiet runaway spend. The adoption risk is rated relatively low because we are using a pull model — engineers genuinely want better tools, and we are giving them better tools rather than imposing process.
-->

---

## Call to Action — Decisions Requested Today

The Board is asked to approve:

1. **Endorse the Observability Strategy** as a twelve-month enterprise priority.
2. **Ratify the foundational architectural decisions** that underpin the platform.
3. **Approve the governance cadence** — with regular reporting to the Technology Committee.
4. **Confirm the compliance scope** — SOC 2 Type II, ISO 27001, and GDPR as primary frameworks.
5. **Authorize Phase 1 funding** within the existing platform budget envelope.

> **Outcome on approval:** Phase 1 commences immediately; the first outcomes report is delivered to the Board at the next quarterly review.

<!--
Close with clarity. Five specific asks, none of them open-ended, none of them requesting incremental capital outside the existing envelope. The strategic ask is endorsement and governance; the financial ask is modest because Phase 1 is self-funded through existing platform budgets and savings from tool consolidation. Emphasise the commitment: execution begins immediately on approval, and the first measured outcomes are reported back to the board at the next quarterly review. This is a strategy designed to be held accountable. Invite questions, but steer the conversation toward decision: what additional information does the board need today in order to grant the five approvals on this slide?
-->
