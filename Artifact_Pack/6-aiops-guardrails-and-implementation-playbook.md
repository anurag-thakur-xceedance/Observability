---
title: AIOps Guardrails and Implementation Playbook
chapter: 6
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 6. AIOps Guardrails and Implementation Playbook

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 1. Strategic Intent & Guardrails
The Agentic AI layer turns observability from reactive to proactive — automated RCA, anomaly detection, and enriched ticketing against telemetry from Prometheus, Loki, and Tempo.

**Guardrails (non-negotiable):**
- AI alerts only fire when **deviation crosses defined thresholds** AND **anomaly confidence ≥ 80%** for warnings, ≥ 90% for criticals.
- Auto-remediation is restricted to **pre-approved runbooks** with full audit trails.
- Operator validation is required for model retraining feedback loops.
- False-positive rate must remain below 5%; precision ≥ 90%; recall ≥ 85%.
- Detection latency must remain below 2 minutes from anomaly onset.

## 2. AI-Driven Observability Metrics

| Category | Metric | Healthy | Warning | Critical | Notes |
|---|---|---|---|---|---|
| Anomaly Detection | Abnormal Latency Spikes | ±10% baseline | 10–25% deviation > 5 min | > 25% deviation > 2 min | Model forecasts expected P95 latency; > 25% implies probable incident or dependency slowdown. FP rate target < 5%. |
| Anomaly Detection | Unusual Traffic Patterns | ±15% | 15–30% deviation > 5 min | > 30% > 2 min or confidence > 95% | Early DDoS / load-imbalance detection. Precision ≥ 90%, recall ≥ 85%. |
| Correlation Analysis | Deployment vs Error Spike | r < 0.3 (weak) | 0.3–0.6 (moderate) | r > 0.6 (strong) | Strong positive r → recent deployments contributing to errors. Feed back into deployment practices. |
| Correlation Analysis | Scaling vs DB Saturation | r < 0.4 | 0.4–0.7 | r > 0.7 | Strong positive r → scaling events associated with DB saturation. Adjust scaling strategy / DB capacity. |

## 3. Interpreting the AI-Driven Metrics

| Element | Interpretation / Goal | Tuning Guidance |
|---|---|---|
| **Model Confidence** | Strength of detection (e.g. probability > 90%) | Use high-confidence thresholds for critical alerts to reduce noise; tune sensitivity per metric. |
| **Deviation Thresholds** | Percentage change from historical / expected baseline | Compute baselines over rolling windows (24 hours or same-day-of-week). |
| **Correlation Coefficient (r)** | Quantifies relationship between two event series (−1 to +1) | Use absolute value of r; higher means stronger correlation. Derive thresholds from historical data. |

## 4. Severity Policy for AI-Detected Events
Owned by [Chapter 4. Alerting and Incident Severity Policy -> Section 4. Domain-Specific Triggers (Reference) (subsection 4.6)](4-alerting-and-incident-severity-policy.md#4-domain-specific-triggers-reference). Summary:

| Severity | Trigger | Action |
|---|---|---|
| Info / Normal | Deviation < warning OR confidence < 70% | Record event for model training; no alert. |
| Warning | Deviation crosses warning AND confidence ≥ 80% | Validate with human triage; check recent deployments / infra changes. |
| Critical | Critical threshold AND confidence ≥ 90%, OR correlation > 0.6 sustained | Automatic incident creation or rollback trigger. |

## 5. Implementation Recommendations

### 5.1 Data Sources
- Latency, error, and throughput metrics ingested from OpenTelemetry.
- External business event streams (deployments, scaling events, feature flags).

### 5.2 AI Models
- Moving-average methods.
- Seasonal-trend decomposition.
- ML-based outlier detection (e.g. **Prophet**, **Isolation Forest**).
- Selection criteria: explainability, retraining cost, false-positive control.

### 5.3 Visualization
- Predicted-vs-actual curves overlaid in Grafana (see [Chapter 5. Grafana Platform Standard and Visualization Playbook](5-grafana-platform-standard-and-visualization-playbook.md)).
- Anomaly deviation percentages and model confidence values shown on dashboards.

### 5.4 Success Criteria
- False-positive rate **< 5%**.
- Detection latency **< 2 minutes** from anomaly onset.
- Auto-correlation insights (e.g. deployment → error, scaling → load) routinely validated by operators for retraining.
- Anomalies precision **≥ 90%**, recall **≥ 85%**.

## 6. Feedback Loop & Continuous Improvement
- Operator validation outcomes feed retraining queues.
- AI accuracy is tracked month-over-month against operator feedback (see [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md) Phase 3 targets).
- Pre-approved auto-remediation actions are reviewed quarterly.

## 7. MLOps Lifecycle for AIOps Models

Every AIOps model — anomaly detector, correlator, classifier, forecaster — follows the lifecycle below. The lifecycle is **mandatory**: no model reaches production without each stage's evidence. Lifecycle controls are audited under **OBS-C-14** in [Chapter 10. Compliance and Audit Control Matrix -> Section 5. Control Matrix (Initial)](10-compliance-and-audit-control-matrix.md#5-control-matrix-initial).

### 7.1 Lifecycle Stages

| Stage | Purpose | Required Evidence | Owner |
|---|---|---|---|
| **1. Problem framing** | Define the SLI/decision the model serves; cost of FP vs FN | Problem statement; cost-of-error analysis | AIOps Lead + Service Owner |
| **2. Data preparation** | Curate training data from telemetry archive; document features | Feature spec; data card; PII scan result | AIOps Lead + Data Governance |
| **3. Training** | Train on representative window (≥ 90 days for seasonality) | Training run logs; reproducibility hash; metrics on holdout | AIOps Lead |
| **4. Evaluation** | Hold-out + cross-validation against precision ≥ 90% / recall ≥ 85% / FP < 5% | Evaluation report; confusion matrix; bias review | AIOps Lead |
| **5. Model card** | Human-readable summary of intent, training data, evaluation, limits | Published model card (template Section 7.3) | AIOps Lead |
| **6. Shadow mode** | Run alongside existing detection without firing alerts | ≥ 14 days of shadow metrics; operator-comparison log | SRE + AIOps Lead |
| **7. ARB approval** | Governance ratification | ADR entry in [Chapter 16](16-observability-adr-decision-register.md) | ARB |
| **8. Production deployment** | Promote to live alerting, with kill-switch | Deployment record; kill-switch verified | Platform Ops |
| **9. Monitoring** | Continuous tracking of precision, recall, FP rate, drift | Monthly model-health report | AIOps Lead |
| **10. Retraining** | Triggered by drift, feedback, or seasonal change | Retraining run record; before/after comparison | AIOps Lead |
| **11. Retirement** | Decommission superseded or failed models | Retirement record; data-deletion confirmation | AIOps Lead |

### 7.2 Promotion Gates

A model **cannot** be promoted between stages without the gate evidence:

- **Stage 4 → 5.** Evaluation metrics meet thresholds (FP < 5%, precision ≥ 90%, recall ≥ 85%).
- **Stage 5 → 6.** Model card peer-reviewed by at least one engineer outside the model's author team.
- **Stage 6 → 7.** Shadow-mode disagreement rate with existing detection is documented and explained; operator panel agrees the model adds value.
- **Stage 7 → 8.** ADR ratified; kill-switch tested in non-prod.
- **Stage 9 → 10.** Drift detected (precision drop > 10% week-on-week — risk **GOV-R-06**) OR scheduled (no later than 90 days for seasonal models).

### 7.3 Model Card Template

Every model in production has a model card stored alongside its IaC. Minimum sections:

```markdown
# Model Card: <model-name>

## Intent
- Decision the model supports.
- SLI / KPI it influences.
- Cost of false positive / false negative (qualitative + quantitative if known).

## Data
- Training window (start, end, total volume).
- Feature list with provenance and PII status.
- Data exclusions (e.g. incident days excluded from baseline).

## Training
- Algorithm and library version.
- Hyperparameters.
- Reproducibility hash (training data + code + config).

## Evaluation
- Holdout precision, recall, F1, FP rate.
- Confusion matrix.
- Bias / fairness review summary (if model affects routing or prioritisation).
- Known failure modes.

## Operating Range
- Input ranges where the model is valid.
- Conditions under which the model must NOT be used (e.g. cold-start < 24h).

## Monitoring
- Live precision/recall measurement method.
- Drift triggers and thresholds.
- Kill-switch mechanism and owner.

## Approvals
- ADR ID.
- ARB approval date.
- Reviewers.
```

## 8. AI Safety, Explainability, and LLM Data Leakage

This section covers **AI safety risks specific to observability** — both predictive AIOps models and any **generative AI / LLM** use within the platform (assistants, summarisers, RCA copilots).

### 8.1 Safety Principles

1. **Human-in-the-loop for irreversible action.** No AI-driven automation may take **irreversible** actions (data deletion, prod rollback in T1 services, customer-facing comms) without explicit human confirmation.
2. **Explainability over precision.** A model with 80% precision and a clear explanation is preferred over a 95%-precision black box for any decision an operator must justify (e.g. severity escalation, page-the-on-call).
3. **Kill-switch by default.** Every AIOps model has a documented, tested kill-switch operable by Platform Ops without code change.
4. **Bias review.** Models that influence prioritisation, routing, or resourcing undergo bias review before promotion (Stage 4 evidence).
5. **Reversibility window.** Auto-remediation actions (Stage 8) must be reversible within a documented window (typically 5 minutes); irreversible actions require human approval.

### 8.2 Explainability Requirements

| Decision Class | Explainability Requirement | Acceptable Techniques |
|---|---|---|
| **Anomaly flag (info / warning)** | Show the metric, baseline, and deviation | Predicted-vs-actual overlay, deviation % |
| **Anomaly flag (critical) → page** | Show metric, baseline, deviation, contributing dimensions | SHAP / feature attribution; correlated-events list |
| **Auto-correlation (deployment → error)** | Show correlated event pair, time window, r value | Pearson r; time-aligned overlay |
| **Auto-remediation trigger** | Pre-approved runbook reference + decision rationale | Runbook ID; rule that fired; full audit log |
| **LLM-generated summary or RCA hypothesis** | Cited source telemetry; uncertainty marker | Retrieval-augmented generation (RAG) with citations |

### 8.3 LLM-Specific Risks and Controls

LLMs introduced into the observability platform (assistant chatbots, RCA copilots, summary generators) inherit the principles above and add the following controls.

| Risk | Description | Control | Owner |
|---|---|---|---|
| **Prompt injection** | Telemetry content (e.g. log line) crafted to manipulate LLM behaviour | Strict separation of system / user / context channels; treat all telemetry as untrusted; reject system-prompt overrides in retrieved content | AIOps Lead + Security |
| **Data leakage to model provider** | Sensitive telemetry sent to a hosted LLM is logged/retained by the provider | Use a provider with **zero data retention** contract OR self-hosted model; PII redaction **before** the prompt; allow-list of fields permitted in prompts | Data Governance + AIOps Lead |
| **Cross-tenant leakage** | LLM context window contains tenant A's data when serving tenant B | Per-tenant isolation of retrieval index; tenant ID enforced in retrieval filter; never share embeddings across tenants ([Chapter 26](26-multi-tenant-and-customer-site-deployment-model.md)) | Platform Ops |
| **Hallucination of incident facts** | LLM invents service names, error counts, or timeline events | RAG only — no free-form generation about facts; every factual claim must cite a telemetry source; uncertainty marker on unsupported claims | AIOps Lead |
| **Sensitive command execution** | LLM agent triggers actions (queries, runbooks) | Allow-list of commands; rate limits; full audit log; no `DELETE` / `DROP` / destructive runbook in scope | Platform Ops + Security |
| **Training-data contamination** | Production telemetry inadvertently used to train a public model | Contractual prohibition with provider; outbound data-loss prevention scan on prompt egress | Data Governance |
| **Model deprecation / version drift** | Provider silently changes model behaviour | Pin model version where supported; weekly regression test on a fixed eval set | AIOps Lead |
| **Cost runaway** | Per-incident LLM token cost spirals during a major incident | Per-tenant token budget; circuit breaker at 5× normal hourly spend | FinOps |

### 8.4 PII and Confidentiality in Prompts

Telemetry sent to **any** LLM (hosted or self-hosted) must pass through the same redaction pipeline that governs telemetry storage ([Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md)). Specifically:

1. **Allow-list, not block-list.** Only fields explicitly approved for LLM context are included in prompts. The default is **exclude**.
2. **Redaction before prompt assembly.** PII patterns (email, phone, government IDs, account numbers, customer names) are stripped or tokenised at the **prompt-builder** layer, not at the model layer.
3. **Trace IDs, not user IDs.** Operators interact with trace IDs and service identifiers; no end-user PII is ever in scope.
4. **Egress monitoring.** All outbound traffic to LLM providers is monitored; payload-size anomalies trigger investigation.
5. **Audit log of all prompts.** Every prompt and response is logged with the operator's identity, retained per [Chapter 8](8-observability-data-governance-and-retention-policy.md), and subject to the same RBAC as other telemetry.

### 8.5 AI Safety KPIs

Reported on the scorecard in [Chapter 11](11-observability-kpi-scorecard.md) and reviewed monthly by the AIOps Lead with the governance body.

| KPI | Target | Source |
|---|---|---|
| Models with current model card | 100% | Model registry |
| Models in production > 90 days without retraining review | 0 | Lifecycle audit |
| Auto-remediation actions executed without operator confirmation in T1 | 0 | Audit log |
| LLM prompts containing redacted-PII pattern (post-redaction audit) | 0 | Egress scanner |
| Cross-tenant leakage incidents | 0 | Tenant isolation test |
| LLM hallucination rate (incidents flagged by operator review) | < 2% | Operator feedback |
| Model precision regression (week-on-week, > 10% drop) | 0 active | Model-health monitor |

## 9. Cross-References
- [Chapter 1. Enterprise Observability Standards Catalog](1-enterprise-observability-standards-catalog.md) — metric standards aligned with AI baseline calculations.
- [Chapter 4. Alerting and Incident Severity Policy](4-alerting-and-incident-severity-policy.md) — enterprise severity policy.
- [Chapter 5. Grafana Platform Standard and Visualization Playbook](5-grafana-platform-standard-and-visualization-playbook.md) — Grafana visualization of AI overlays.
- [Chapter 8. Observability Data Governance and Retention Policy](8-observability-data-governance-and-retention-policy.md) — retention rules for prompt audit logs.
- [Chapter 10. Compliance and Audit Control Matrix -> Section 5. Control Matrix (Initial)](10-compliance-and-audit-control-matrix.md#5-control-matrix-initial) — OBS-C-14 audits the lifecycle in Section 7.
- [Chapter 11. Observability KPI Scorecard](11-observability-kpi-scorecard.md) — Phase 3 KPI targets (MTTD < 1 min, automated tickets > 90%); AI safety KPIs from Section 8.5.
- [Chapter 12. Incident Response Playbook](12-incident-response-playbook.md) — incident playbook integration with AI-generated tickets.
- [Chapter 16. Observability ADR Decision Register](16-observability-adr-decision-register.md) — ADR-016 governs LLM use; lifecycle gate Stage 7.
- [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) — redaction pipeline applied to LLM prompts.
- [Chapter 26. Multi-Tenant and Customer-Site Deployment Model](26-multi-tenant-and-customer-site-deployment-model.md) — tenant isolation for LLM retrieval.

---

[↑ Back to TOC](toc.md)
