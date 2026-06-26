---
title: Threat Model (STRIDE) — Appendix to Observability Platform Security Architecture
chapter: 24A
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# Annexure C — Threat Model (STRIDE)

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](annexure-b-concepts-glossary.md)

| **Document Owner** | CoE-Architecture |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **First Review** | 1-Aug-2026 |
| **Next Review Due** | 1-Nov-2026 |

---

## 1 Purpose

This appendix to [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) records a STRIDE-based threat model for the Xceedance Observability Platform. It identifies primary threats per component, the existing mitigations, residual risk, and the NFR / control reference where the mitigation is implemented.

## Summary for Non-Security Readers

The most important takeaways are:

1. **Do not let unknown systems emit telemetry.** Every producer must authenticate before the platform accepts metrics, logs, or traces.
2. **Do not hand-edit platform configuration.** Dashboards, alert rules, collector configs, and sampling rules must come from reviewed Git changes.
3. **Do not put PII into telemetry.** Service teams must redact sensitive fields before logs or traces leave the application or customer-site edge.
4. **Do not mix tenants.** Tenant labels, storage boundaries, and Grafana access must prevent cross-tenant reads.
5. **Do not let AI act without guardrails.** AIOps recommendations require provenance, human review for high-impact actions, and prompt-boundary redaction.
6. **Do not trust archives unless they are tamper-evident.** Long-term evidence must be signed, immutable, and restorable with an audit trail.
7. **Do not skip drills.** DR, restore, access review, and red-team exercises prove that controls work before a real incident.

## 2 Methodology

- **Framework**: STRIDE — Spoofing, Tampering, Repudiation, Information disclosure, Denial of service, Elevation of privilege.
- **Granularity**: per platform component (see Section 4).
- **Refresh cadence**: annually, or on any major architectural change (per [Chapter 28. Observability Non-Functional Requirements Register](28-observability-non-functional-requirements.md)).
- **Owner**: Security Architect, ratified by ARB ([Chapter 16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md)).
- **Inputs**: architecture diagrams ([Chapter 3. Observability Reference Architecture](03-observability-reference-architecture.md)), data-flow boundaries ([Chapter 3. Observability Reference Architecture -> Section 3.6.1 Network Topology and Trust Boundaries](03-observability-reference-architecture.md#361-network-topology-and-trust-boundaries)), tenant model ([Chapter 27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md)).

## 3 In-Scope Components

| ID | Component | Trust Boundary |
|---|---|---|
| C1 | Instrumented service (SDK / agent) | Service workload |
| C2 | OpenTelemetry Collector (gateway) | Telemetry ingress |
| C3 | Prometheus / Mimir (metrics backend) | Storage |
| C4 | Loki (logs backend) | Storage |
| C5 | Tempo (traces backend) | Storage |
| C6 | Grafana (visualisation and alerting) | User-facing |
| C7 | AIOps layer (anomaly / RCA / LLM) | Processing |
| C8 | IaC pipeline (Git → deployment) | Control plane |
| C9 | Archive store (long-term) | Retention boundary |

## 4 STRIDE Threat Matrix

Legend: **L** = Low, **M** = Medium, **H** = High residual risk after mitigation.

### 4.1 C1 — Instrumented Service (SDK / Agent)

| Threat | Description | Primary Mitigation | Mitigation Reference | Residual |
|---|---|---|---|---|
| **S**poofing | Rogue process emits telemetry impersonating a real service | Service identity via mTLS + workload identity | [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md), NFR-SEC-01 | L |
| **T**ampering | Local agent config altered to emit false metrics | Config in Git only; drift detection | [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md), NFR-CFG-01 | L |
| **R**epudiation | Service denies emitting a problematic event | Signed telemetry origin (resource attributes); audit trail | [Chapter 18. Application Telemetry Standard](18-application-telemetry-standard.md) | L |
| **I**nfo disclosure | PII leaks through unredacted log fields | PII redaction at source; pre-flight linter | [Chapter 18. Application Telemetry Standard -> Section 18.6 PII & Data Classification](18-application-telemetry-standard.md#186-pii-data-classification), NFR-PRV-01 | M |
| **D**oS | Misbehaving SDK floods collector | Rate-limiting per service; cardinality budget | [Chapter 23. Capacity and Scale Model -> Section 23.8 Cardinality Budget](23-capacity-and-scale-model.md#238-cardinality-budget), NFR-CAP-01 | L |
| **E**oP | SDK exploited to gain platform credentials | SDKs hold no platform creds; mTLS workload identity only | [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) | L |

**Net effect:** service teams must use approved SDK/agent configuration, preserve required resource attributes, and validate PII redaction before telemetry leaves the service boundary.

### 4.2 C2 — OpenTelemetry Collector (Gateway)

| Threat | Description | Primary Mitigation | Reference | Residual |
|---|---|---|---|---|
| **S** | Spoofed collector endpoint accepts traffic | mTLS server + client auth; DNS pinning | NFR-SEC-01 | L |
| **T** | Tail-sampling rules altered to drop evidence | Config in Git; signed deploys | [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md) | L |
| **R** | Origin of dropped telemetry disputed | Drop-rate metrics + sampler decisions logged | [Chapter 3. Observability Reference Architecture](03-observability-reference-architecture.md) | M |
| **I** | Tenant-mixing in multi-tenant collector | Tenant attribution processor; isolation testing | [Chapter 27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md), NFR-MUL-01 | M |
| **D** | Volumetric DoS at ingress | Network ACL; per-tenant rate-limit; backpressure | [Chapter 23. Capacity and Scale Model](23-capacity-and-scale-model.md), NFR-CAP-02 | M |
| **E** | Collector exploit → backend write access | Least-privilege per backend; network segmentation | [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) | L |

**Net effect:** platform teams must treat Collectors as security boundaries: authenticate inputs, enforce tenant labels, rate-limit traffic, and keep Collector config in Git.

### 4.3 C3 / C4 / C5 — Backends (Prometheus, Loki, Tempo)

| Threat | Description | Primary Mitigation | Reference | Residual |
|---|---|---|---|---|
| **S** | Unauthorised write to backend | Backend accepts only collector identity (mTLS) | NFR-SEC-01 | L |
| **T** | Stored telemetry altered post-write | Object-storage WORM where used; integrity sampling | [Chapter 29. Observability Long-Term Archival Policy -> Section 29.5.3 Integrity & Tamper Evidence](29-observability-long-term-archival-policy.md#2953-integrity-tamper-evidence) | L |
| **R** | Admin actions denied | All admin actions logged immutably | NFR-AUD-01 | L |
| **I** | Cross-tenant query leakage | Tenant header enforcement; query-time RBAC | [Chapter 27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md), NFR-MUL-01 | M |
| **D** | Query-of-death exhausts backend | Query limits; per-user concurrency caps | NFR-PRF-01 | M |
| **E** | Backend compromise → lateral move | Backends in segmented subnet; no outbound except whitelisted | [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) | L |

**Net effect:** backend operators must enforce mTLS, immutable audit logs, tenant-aware query controls, and query/concurrency limits.

### 4.4 C6 — Grafana (Visualisation and Alerting)

| Threat | Description | Primary Mitigation | Reference | Residual |
|---|---|---|---|---|
| **S** | Account takeover via weak auth | SSO + MFA mandatory; session policy | [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) | M |
| **T** | Dashboard or alert-rule altered out of band | All Grafana objects in Git; drift alerts | NFR-CFG-01 | L |
| **R** | User denies executing destructive query | Audit log of every query + action | NFR-AUD-01 | L |
| **I** | Dashboard exposes PII to wrong audience | Data-source RBAC; dashboard tag-based ACL | NFR-SEC-03 | M |
| **D** | Renderer overload via malicious dashboard | Render timeouts; rate-limits per user | NFR-PRF-01 | L |
| **E** | Editor escalates to Admin via API misuse | Least-privilege roles; admin actions require step-up auth | [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) | L |

**Net effect:** Grafana owners must keep SSO/MFA, least-privilege roles, dashboard ACLs, and Git-provisioned dashboards in place.

### 4.5 C7 — AIOps Layer (Anomaly / RCA / LLM)

| Threat | Description | Primary Mitigation | Reference | Residual |
|---|---|---|---|---|
| **S** | Untrusted model output presented as platform fact | Model-decision provenance recorded; human-in-loop on Sev1–Sev2 | [Chapter 7. AIOps Guardrails and Implementation Playbook -> Section 7.8 AI Safety, Explainability, and LLM Data Leakage](07-aiops-guardrails-and-implementation-playbook.md#78-ai-safety-explainability-and-llm-data-leakage) | M |
| **T** | Training data poisoned to bias detections | Data lineage tracked; held-out validation set | [Chapter 7. AIOps Guardrails and Implementation Playbook -> Section 7.7 MLOps Lifecycle for AIOps Models](07-aiops-guardrails-and-implementation-playbook.md#77-mlops-lifecycle-for-aiops-models) | M |
| **R** | AI-suggested action disputed in PIR | Reproducible inference: model version + input snapshot stored | NFR-AUD-02 | L |
| **I** | LLM leaks confidential telemetry in prompt → external provider | Tenant-isolated context; redaction at prompt boundary; no PII to external LLM | [Chapter 7. AIOps Guardrails and Implementation Playbook -> Section 7.8 AI Safety, Explainability, and LLM Data Leakage](07-aiops-guardrails-and-implementation-playbook.md#78-ai-safety-explainability-and-llm-data-leakage) | **H** |
| **D** | AI runaway loop drives cost spike | Inference budget per service; circuit breaker | [Chapter 10. Observability FinOps Standard](10-observability-finops-standard.md), [Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md) | M |
| **E** | AI tool gains write access beyond ticket creation | Human-out-of-loop disabled by default; explicit approval for write actions | [Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md) | M |

**Net effect:** AIOps owners must keep AI advisory by default, redact prompts, record model provenance, and require approval for any write-capable action.

### 4.6 C8 — IaC Pipeline (Git → Deployment)

| Threat | Description | Primary Mitigation | Reference | Residual |
|---|---|---|---|---|
| **S** | Malicious commit by impersonator | Signed commits; required reviewers | [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md) | L |
| **T** | CI runner image tampered | Pinned image digests; SBOM verified | NFR-MNT-01 | L |
| **R** | Deploy actor unknown | Pipeline run logs immutable; identity required for approval | NFR-AUD-01 | L |
| **I** | Secrets leak via build logs | Secret-scanning in CI; centralised vault | [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) | L |
| **D** | Pipeline saturated by junk PRs | Concurrency caps; abuse detection | — | L |
| **E** | Compromised runner → prod access | Ephemeral runners; OIDC short-lived creds | [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md) | M |

**Net effect:** platform teams must use signed commits, pinned runner images, short-lived credentials, and immutable deployment logs.

### 4.7 C9 — Archive Store (Long-Term)

| Threat | Description | Primary Mitigation | Reference | Residual |
|---|---|---|---|---|
| **S** | Rogue process writes to archive | Archive worker is sole writer; identity-bound; KMS-gated | [Chapter 29. Observability Long-Term Archival Policy](29-observability-long-term-archival-policy.md) | L |
| **T** | Archive object altered post-write | WORM / object-lock; signed sidecar; integrity sweeps | [Chapter 29. Observability Long-Term Archival Policy -> Section 29.5.3 Integrity & Tamper Evidence](29-observability-long-term-archival-policy.md#2953-integrity-tamper-evidence) | L |
| **R** | Restore action denied by actor | Restore ticketing + RACI approval + audit | [Chapter 29. Observability Long-Term Archival Policy -> Section 29.6.2 Restore From Archive](29-observability-long-term-archival-policy.md#2962-restore-from-archive) | L |
| **I** | Archive object exfiltrated | At-rest encryption with CMK; egress alerts | [Chapter 29. Observability Long-Term Archival Policy -> Section 29.5.4 Encryption](29-observability-long-term-archival-policy.md#2954-encryption) | M |
| **D** | Restore-storm exhausts retrieval quota | Per-tenant restore quotas; tiered retrieval | [Chapter 29. Observability Long-Term Archival Policy -> Section 29.12 Cost Model](29-observability-long-term-archival-policy.md#2912-cost-model) | L |
| **E** | Erasure abused to destroy evidence | Legal-hold gate blocks erasure; DPO approval required | [Chapter 29. Observability Long-Term Archival Policy -> Section 29.9 Legal Hold](29-observability-long-term-archival-policy.md#299-legal-hold) | L |

**Net effect:** archive owners must ensure only the archive worker writes evidence, every restore is approved and logged, and legal hold blocks destructive actions.

## 5 Residual Risk Summary

| Component | Highest residual | Notes |
|---|---|---|
| C1 SDK / Agent | M (Info disclosure — PII) | Continuous linter coverage critical |
| C2 Collector | M (Info disclosure, DoS) | Multi-tenant attribution tested |
| C3 / C4 / C5 Backends | M (Info disclosure, DoS) | RBAC + query limits |
| C6 Grafana | M (Spoofing, Info disclosure) | Auth and dashboard ACLs |
| **C7 AIOps** | **H (LLM leakage to external provider)** | Prompt-boundary redaction must be enforced; periodic red-team |
| C8 IaC Pipeline | M (Elevation of privilege via runner) | Ephemeral, identity-bound runners |
| C9 Archive | M (Information disclosure) | CMK + egress alerts |

The single **High** residual risk relates to LLM data leakage at the prompt boundary (C7-I) and is tracked in the AIOps risk register ([Chapter 7. AIOps Guardrails and Implementation Playbook -> Section 7.8 AI Safety, Explainability, and LLM Data Leakage](07-aiops-guardrails-and-implementation-playbook.md#78-ai-safety-explainability-and-llm-data-leakage)).

## 6 Open Threats / Action Register

| ID | Threat | Action | Owner (TBD) | Target Date |
|---|---|---|---|---|
| THR-001 | LLM prompt leakage (C7-I) | Implement prompt-boundary redaction + red-team test | Security Architect | 2026-Q3 |
| THR-002 | Cross-tenant query leakage (C3-I) | Add automated multi-tenant penetration test in CI | Platform Lead | 2026-Q3 |
| THR-003 | Dashboard ACL drift (C6-I) | Quarterly dashboard ACL audit script | Grafana Platform Lead | 2026-Q2 |
| THR-004 | Archive egress monitoring (C9-I) | Egress-volume alert thresholds tuned | Security Architect | 2026-Q3 |
| THR-005 | Compromised CI runner (C8-E) | Migrate all runners to ephemeral + OIDC | Platform Lead | 2026-Q3 |

## 7 Cross-References

- [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) — parent chapter.
- [Chapter 7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md) — AI risk register and guardrails.
- [Chapter 27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md) — tenant boundaries used by threat model.
- [Chapter 28. Observability Non-Functional Requirements Register](28-observability-non-functional-requirements.md) — NFR-SEC controls referenced.
- [Chapter 29. Observability Long-Term Archival Policy](29-observability-long-term-archival-policy.md) — archive integrity and access controls.
- [Chapter 16. Observability Governance Charter and ARB Pack](16-observability-governance-charter-and-arb-pack.md) — ARB ratification path.

---

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](annexure-b-concepts-glossary.md)
