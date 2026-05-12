---
title: Business Capability and Value-Stream Mapping
chapter: 20
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 20. Business Capability and Value-Stream Mapping

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

> **Closes Gaps:** A2, A5, J1 (partial).

---

## 1. Why This Chapter Exists
The strategy must be defensible at board level. "Reduce MTTR" is operational; what reviewers ask is **"What does observability do for Underwriting? For Claims? For the customer at FNOL?"** This chapter answers that question by mapping observability outcomes to business capabilities and the value streams that monetise them.

Three artifacts are produced here:
1. **Business Capability Map** (rows) × **Observability Capability** (columns).
2. **Value-Stream View** — the customer-facing journeys whose performance observability protects.
3. **Outcome → KPI → SLO → SLI → Telemetry traceability** chain.

## 2. Business Capability Map (Insurance Reference)
The Xceedance estate primarily serves **insurance carriers, MGAs, brokers, and reinsurers**. The capability axis below uses the LOMA / ACORD-aligned capability taxonomy.

| Business Capability | Tier | Criticality Driver | Data Classification | Target SLO (Availability) | RTO | RPO | Observability Coverage Required |
|---|---|---|---|---|---|---|---|
| Distribution & Quoting (Quote-to-Bind) | T1 | Direct revenue; conversion-sensitive | Confidential (PII) | 99.9% | ≤ 60 min | ≤ 15 min | Full RUM + APM + infra + DB; pre/post-login telemetry; trace from web → quote engine → rate tables |
| Policy Administration | T1 | System-of-record; regulatory | Confidential (PII) | 99.9% | ≤ 60 min | ≤ 15 min | APM + DB + change tracking; audit trail mandatory |
| Underwriting (incl. AI / rules) | T1 | Pricing accuracy; loss ratio impact | Confidential (PII + commercial) | 99.5% | ≤ 2 h | ≤ 30 min | APM + model-output telemetry; decision-trace logging |
| Claims Intake (FNOL) | T1 | Customer trust; regulatory | Confidential (PII + claim) | 99.9% | ≤ 60 min | ≤ 15 min | RUM + APM + voice/chat metrics; end-to-end trace |
| Claims Processing & Settlement | T1 | Customer SLA; reserves | Confidential (PII + financial) | 99.5% | ≤ 4 h | ≤ 1 h | APM + DB + workflow-engine telemetry; payment-rail traces |
| Billing & Collections | T2 | Cashflow | Confidential (PII + financial) | 99.5% | ≤ 4 h | ≤ 1 h | APM + DB + payment-gateway telemetry |
| Reinsurance & Treaty | T2 | Quarterly cycle | Internal | 99.0% | ≤ 8 h | ≤ 4 h | Batch-job telemetry; data-quality SLIs |
| Customer Self-Service Portal | T1 | CSAT; deflection | Confidential (PII) | 99.9% | ≤ 60 min | ≤ 15 min | RUM + APM + auth telemetry |
| Producer / Broker Portal | T2 | Channel productivity | Confidential | 99.5% | ≤ 4 h | ≤ 1 h | APM + auth + transaction telemetry |
| Reporting & Regulatory Filing | T3 | Periodic | Internal / Restricted | 99.0% | ≤ 24 h | ≤ 12 h | Batch + data-quality + lineage telemetry |
| Internal Analytics / BI | T3 | Decision support | Internal | 98.0% | ≤ 24 h | ≤ 24 h | Pipeline-health telemetry |
| Corporate IT (HR, Finance, Email) | T4 | Internal users | Internal | 98.0% | ≤ 48 h | ≤ 24 h | Standard infra telemetry |

**Tier definitions** are formalised in [Chapter 1 Section 4.1. Service Tiering Model](1-enterprise-observability-standards-catalog.md#41-service-tiering-model).

## 3. Value-Stream View

### 3.1 Value Stream — Quote-to-Bind
```
[Visitor Lands]→[Quote Form]→[Rate Engine]→[Eligibility]→[Underwriting Decision]→[Bind Offer]→[Payment]→[Policy Issue]→[Document Delivery]
       │             │             │              │                    │                   │           │            │              │
       └ RUM         └ APM/SDK     └ APM         └ DB+API trace       └ APM+ML telemetry  └ APM       └ Payment    └ Workflow     └ Email/SMS
                                                                                                       gateway       engine          delivery
                                                                                                       telemetry     telemetry       telemetry
```
**Critical KPIs on this stream:** Quote-to-Bind conversion rate, time-to-quote (P95), rate-engine latency (P95), bind success rate, payment success rate, policy-issuance latency.

### 3.2 Value Stream — FNOL-to-Settlement
```
[FNOL Channel]→[Claim Created]→[Triage]→[Assignment]→[Investigation]→[Reserve Set]→[Adjudication]→[Approval]→[Payment]→[Closure]
      │              │            │          │              │              │            │             │           │           │
      └ Voice/Chat   └ APM        └ Rules    └ Workflow    └ Doc/photo    └ DB        └ APM+ML      └ Audit     └ Payment   └ Survey
        RUM            +DB         engine     engine        ingest         write       telemetry      log         rail        telemetry
                                                            telemetry      telemetry                                          telemetry
```
**Critical KPIs:** Cycle time per stage, leakage indicators (reserve adjustments), customer-comm latency, adjudication-decision latency, fraud-flag latency.

### 3.3 Value Stream — Renewal & Retention
```
[Renewal Trigger]→[Eligibility Re-check]→[Re-rate]→[Customer Comm]→[Customer Decision]→[Bind/Lapse]
```
**Critical KPIs:** Renewal-comm delivery rate, re-rate success rate, decision-window adherence.

## 4. Outcome → KPI → SLO → SLI → Telemetry Traceability

| Business Outcome | Business KPI | SLO (per service) | SLI | Telemetry Source | Dashboard | Alert | Runbook |
|---|---|---|---|---|---|---|---|
| Quote conversion | Quote-to-Bind % | Quote-engine availability ≥ 99.9% | Successful 200/total ratio over 5-min window | Quote-engine APM + LB metrics | Grafana → Quote-to-Bind board | Burn-rate alert (multi-window) | [Chapter 12 Section 2. End-to-End Incident Sequence (Logical Flow)](12-incident-response-playbook.md#2-end-to-end-incident-sequence-logical-flow) |
| FNOL responsiveness | Time-to-FNOL-confirm (P95) | FNOL-API P95 ≤ 800ms | Server-side P95 latency | FNOL-API APM | Grafana → FNOL board | Critical if P95 > 1200ms ≥ 2 min | Domain runbook in [Chapter 3 Section 3. Application Observability Runbook](3-domain-observability-runbooks-pack.md#3-application-observability-runbook-pre-login-post-login-execution-steps) |
| Payment reliability | Payment success % | Payment-gateway availability ≥ 99.95% | Successful auth/total over 1-min | Payment-gateway exporter | Grafana → Payments board | Critical if drop below 98% ≥ 2 min | [Chapter 12. Incident Response Playbook](12-incident-response-playbook.md) |
| Policy issuance | Time-to-policy-doc (P95) | Doc-pipeline P95 ≤ 60s | Pipeline-stage durations | Workflow-engine custom metrics | Grafana → Policy issuance board | Warning if P95 > 90s | [Chapter 3 Section 3](3-domain-observability-runbooks-pack.md#3-application-observability-runbook-pre-login-post-login-execution-steps) |
| Claim cycle time | Days from FNOL to Settle | Workflow-engine availability ≥ 99.5% | Stage-transition success rate | Workflow telemetry + DB | Grafana → Claims cycle board | Warning on stage-stall > 1h | [Chapter 12](12-incident-response-playbook.md) |

The full SLO methodology — including SLI categorisation, error-budget policy, and burn-rate alert formulas — is defined in [Chapter 24. SLO and Error-Budget Framework](24-slo-and-error-budget-framework.md).

## 5. Capability-to-Artifact Mapping

| Business Capability | Primary Artifacts |
|---|---|
| All T1 capabilities | [Chapter 17. Application Telemetry Standard](17-application-telemetry-standard.md), [Chapter 24. SLO and Error-Budget Framework](24-slo-and-error-budget-framework.md), [Chapter 12. Incident Response Playbook](12-incident-response-playbook.md) |
| Customer-facing (Quoting, FNOL, Self-Service) | [Chapter 5. Grafana Platform Standard and Visualization Playbook](5-grafana-platform-standard-and-visualization-playbook.md) — customer-experience layer; [Chapter 25. Service Onboarding and Instrumentation Kits](25-service-onboarding-and-instrumentation-kits.md) for RUM kit |
| Underwriting / AI | [Chapter 6. AIOps Guardrails and Implementation Playbook](6-aiops-guardrails-and-implementation-playbook.md) for model telemetry parallels |
| Claims with payment | [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) for payment-data redaction |
| Reporting / Regulatory | [Chapter 10. Compliance and Audit Control Matrix](10-compliance-and-audit-control-matrix.md), [Chapter 8. Observability Data Governance and Retention Policy](8-observability-data-governance-and-retention-policy.md) |
| Multi-customer site | [Chapter 26. Multi-Tenant and Customer-Site Deployment Model](26-multi-tenant-and-customer-site-deployment-model.md) |

## 6. Stakeholder Value Statements
- **Underwriting Director:** "I see model-decision latency, override rates, and rule-engine errors per product line on a single board, with alerts when conversion or loss-ratio leading indicators drift."
- **Claims Operations Director:** "I see cycle-time per stage, leakage indicators, and channel-mix in real time; investigation-stage stalls page my team within minutes."
- **CISO:** "I have a complete audit trail of every change to telemetry, every PII redaction event, and every access to customer data, retained per regulatory window."
- **CFO:** "Observability cost per business transaction is tracked; chargeback to LOB is monthly."
- **Customer Operations:** "Per-customer-site dashboards show isolated tenancy; SLA breach detection ≤ 2 min."

## 7. Cross-References
- [Chapter 1 Section 4.1. Service Tiering Model](1-enterprise-observability-standards-catalog.md#41-service-tiering-model) — tier definitions consumed by this chapter.
- [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md) — KPI targets per tier.
- [Chapter 24. SLO and Error-Budget Framework](24-slo-and-error-budget-framework.md) — SLO methodology.
- [Chapter 26. Multi-Tenant and Customer-Site Deployment Model](26-multi-tenant-and-customer-site-deployment-model.md) — tenant data isolation.

---

[↑ Back to TOC](toc.md)
