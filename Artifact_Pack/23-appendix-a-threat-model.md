---
title: Threat Model (STRIDE) — Appendix to Observability Platform Security Architecture
chapter: 23A
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 23 Appendix A. Threat Model (STRIDE)

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

---

## 23A.1 Purpose

This appendix to [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) records a STRIDE-based threat model for the Xceedance Observability Platform. It identifies primary threats per component, the existing mitigations, residual risk, and the NFR / control reference where the mitigation is implemented.

## 23A.2 Methodology

- **Framework**: STRIDE — Spoofing, Tampering, Repudiation, Information disclosure, Denial of service, Elevation of privilege.
- **Granularity**: per platform component (see Section 3).
- **Refresh cadence**: annually, or on any major architectural change (per [Chapter 27 NFR-SEC-05](27-observability-non-functional-requirements.md)).
- **Owner**: Security Architect, ratified by ARB ([Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md)).
- **Inputs**: architecture diagrams ([Chapter 2. Observability Reference Architecture](02-observability-reference-architecture.md)), data-flow boundaries ([Chapter 2. Observability Reference Architecture -> Section 2.6.1 Network Topology and Trust Boundaries](02-observability-reference-architecture.md#261-network-topology-and-trust-boundaries)), tenant model ([Chapter 26. Multi-Tenant and Customer-Site Deployment Model](26-multi-tenant-and-customer-site-deployment-model.md)).

## 23A.3 In-Scope Components

| ID | Component | Trust Boundary |
|---|---|---|
| C1 | Instrumented service (SDK / agent) | Service workload |
| C2 | OpenTelemetry Collector (gateway) | Telemetry ingress |
| C3 | Prometheus / Mimir (metrics backend) | Storage |
| C4 | Loki (logs backend) | Storage |
| C5 | Tempo (traces backend) | Storage |
| C6 | Grafana (visualization & alerting) | User-facing |
| C7 | AIOps layer (anomaly / RCA / LLM) | Processing |
| C8 | IaC pipeline (Git → deployment) | Control plane |
| C9 | Archive store (long-term) | Retention boundary |

## 23A.4 STRIDE Threat Matrix

Legend: **L** = Low, **M** = Medium, **H** = High residual risk after mitigation.

### 23A.4.1 C1 — Instrumented Service (SDK / Agent)

| Threat | Description | Primary Mitigation | Mitigation Reference | Residual |
|---|---|---|---|---|
| **S**poofing | Rogue process emits telemetry impersonating a real service | Service identity via mTLS + workload identity | [Chapter 23](23-observability-platform-security-architecture.md), NFR-SEC-01 | L |
| **T**ampering | Local agent config altered to emit false metrics | Config in Git only; drift detection | [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md), NFR-CFG-01 | L |
| **R**epudiation | Service denies emitting a problematic event | Signed telemetry origin (resource attributes); audit trail | [Chapter 17. Application Telemetry Standard](17-application-telemetry-standard.md) | L |
| **I**nfo disclosure | PII leaks through unredacted log fields | PII redaction at source; pre-flight linter | [Chapter 17. Application Telemetry Standard -> Section 17.6 PII & Data Classification](17-application-telemetry-standard.md#176-pii-data-classification), NFR-PRV-01 | M |
| **D**oS | Misbehaving SDK floods collector | Rate-limiting per service; cardinality budget | [Chapter 22. Capacity and Scale Model -> Section 22.8 Cardinality Budget](22-capacity-and-scale-model.md#228-cardinality-budget), NFR-CAP-01 | L |
| **E**oP | SDK exploited to gain platform credentials | SDKs hold no platform creds; mTLS workload identity only | [Chapter 23](23-observability-platform-security-architecture.md) | L |

### 23A.4.2 C2 — OpenTelemetry Collector (Gateway)

| Threat | Description | Primary Mitigation | Reference | Residual |
|---|---|---|---|---|
| **S** | Spoofed collector endpoint accepts traffic | mTLS server + client auth; DNS pinning | NFR-SEC-01 | L |
| **T** | Tail-sampling rules altered to drop evidence | Config in Git; signed deploys | [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) | L |
| **R** | Origin of dropped telemetry disputed | Drop-rate metrics + sampler decisions logged | [Chapter 2. Observability Reference Architecture](02-observability-reference-architecture.md) | M |
| **I** | Tenant-mixing in multi-tenant collector | Tenant attribution processor; isolation testing | [Chapter 26](26-multi-tenant-and-customer-site-deployment-model.md), NFR-MUL-01 | M |
| **D** | Volumetric DoS at ingress | Network ACL; per-tenant rate-limit; backpressure | [Chapter 22. Capacity and Scale Model](22-capacity-and-scale-model.md), NFR-CAP-02 | M |
| **E** | Collector exploit → backend write access | Least-privilege per backend; network segmentation | [Chapter 23](23-observability-platform-security-architecture.md) | L |

### 23A.4.3 C3 / C4 / C5 — Backends (Prometheus, Loki, Tempo)

| Threat | Description | Primary Mitigation | Reference | Residual |
|---|---|---|---|---|
| **S** | Unauthorised write to backend | Backend accepts only collector identity (mTLS) | NFR-SEC-01 | L |
| **T** | Stored telemetry altered post-write | Object-storage WORM where used; integrity sampling | [Chapter 28. Observability Long-Term Archival Policy -> Section 28.5.3 Integrity & Tamper Evidence](28-observability-long-term-archival-policy.md#2853-integrity-tamper-evidence) | L |
| **R** | Admin actions denied | All admin actions logged immutably | NFR-AUD-01 | L |
| **I** | Cross-tenant query leakage | Tenant header enforcement; query-time RBAC | [Chapter 26](26-multi-tenant-and-customer-site-deployment-model.md), NFR-MUL-01 | M |
| **D** | Query-of-death exhausts backend | Query limits; per-user concurrency caps | NFR-PRF-01 | M |
| **E** | Backend compromise → lateral move | Backends in segmented subnet; no outbound except whitelisted | [Chapter 23](23-observability-platform-security-architecture.md) | L |

### 23A.4.4 C6 — Grafana (Visualization & Alerting)

| Threat | Description | Primary Mitigation | Reference | Residual |
|---|---|---|---|---|
| **S** | Account takeover via weak auth | SSO + MFA mandatory; session policy | [Chapter 23](23-observability-platform-security-architecture.md) | M |
| **T** | Dashboard or alert-rule altered out of band | All Grafana objects in Git; drift alerts | NFR-CFG-01 | L |
| **R** | User denies executing destructive query | Audit log of every query + action | NFR-AUD-01 | L |
| **I** | Dashboard exposes PII to wrong audience | Data-source RBAC; dashboard tag-based ACL | NFR-SEC-03 | M |
| **D** | Renderer overload via malicious dashboard | Render timeouts; rate-limits per user | NFR-PRF-01 | L |
| **E** | Editor escalates to Admin via API misuse | Least-privilege roles; admin actions require step-up auth | [Chapter 23](23-observability-platform-security-architecture.md) | L |

### 23A.4.5 C7 — AIOps Layer (Anomaly / RCA / LLM)

| Threat | Description | Primary Mitigation | Reference | Residual |
|---|---|---|---|---|
| **S** | Untrusted model output presented as platform fact | Model-decision provenance recorded; human-in-loop on Sev1–Sev2 | [Chapter 6. AIOps Guardrails and Implementation Playbook -> Section 6.8 AI Safety, Explainability, and LLM Data Leakage](06-aiops-guardrails-and-implementation-playbook.md#68-ai-safety-explainability-and-llm-data-leakage) | M |
| **T** | Training data poisoned to bias detections | Data lineage tracked; held-out validation set | [Chapter 6. AIOps Guardrails and Implementation Playbook -> Section 6.7 MLOps Lifecycle for AIOps Models](06-aiops-guardrails-and-implementation-playbook.md#67-mlops-lifecycle-for-aiops-models) | M |
| **R** | AI-suggested action disputed in PIR | Reproducible inference: model version + input snapshot stored | NFR-AUD-02 | L |
| **I** | LLM leaks confidential telemetry in prompt → external provider | Tenant-isolated context; redaction at prompt boundary; no PII to external LLM | [Chapter 6. AIOps Guardrails and Implementation Playbook -> Section 6.8 AI Safety, Explainability, and LLM Data Leakage](06-aiops-guardrails-and-implementation-playbook.md#68-ai-safety-explainability-and-llm-data-leakage) | **H** |
| **D** | AI runaway loop drives cost spike | Inference budget per service; circuit breaker | [Chapter 9. Observability FinOps Standard](09-observability-finops-standard.md), [Chapter 6](06-aiops-guardrails-and-implementation-playbook.md) | M |
| **E** | AI tool gains write access beyond ticket creation | Human-out-of-loop disabled by default; explicit approval for write actions | [Chapter 6](06-aiops-guardrails-and-implementation-playbook.md) | M |

### 23A.4.6 C8 — IaC Pipeline (Git → Deployment)

| Threat | Description | Primary Mitigation | Reference | Residual |
|---|---|---|---|---|
| **S** | Malicious commit by impersonator | Signed commits; required reviewers | [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) | L |
| **T** | CI runner image tampered | Pinned image digests; SBOM verified | NFR-MNT-01 | L |
| **R** | Deploy actor unknown | Pipeline run logs immutable; identity required for approval | NFR-AUD-01 | L |
| **I** | Secrets leak via build logs | Secret-scanning in CI; centralised vault | [Chapter 23](23-observability-platform-security-architecture.md) | L |
| **D** | Pipeline saturated by junk PRs | Concurrency caps; abuse detection | — | L |
| **E** | Compromised runner → prod access | Ephemeral runners; OIDC short-lived creds | [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) | M |

### 23A.4.7 C9 — Archive Store (Long-Term)

| Threat | Description | Primary Mitigation | Reference | Residual |
|---|---|---|---|---|
| **S** | Rogue process writes to archive | Archive worker is sole writer; identity-bound; KMS-gated | [Chapter 28](28-observability-long-term-archival-policy.md) | L |
| **T** | Archive object altered post-write | WORM / object-lock; signed sidecar; integrity sweeps | [Chapter 28. Observability Long-Term Archival Policy -> Section 28.5.3 Integrity & Tamper Evidence](28-observability-long-term-archival-policy.md#2853-integrity-tamper-evidence) | L |
| **R** | Restore action denied by actor | Restore ticketing + RACI approval + audit | [Chapter 28. Observability Long-Term Archival Policy -> Section 28.6.2 Restore From Archive](28-observability-long-term-archival-policy.md#2862-restore-from-archive) | L |
| **I** | Archive object exfiltrated | At-rest encryption with CMK; egress alerts | [Chapter 28. Observability Long-Term Archival Policy -> Section 28.5.4 Encryption](28-observability-long-term-archival-policy.md#2854-encryption) | M |
| **D** | Restore-storm exhausts retrieval quota | Per-tenant restore quotas; tiered retrieval | [Chapter 28. Observability Long-Term Archival Policy -> Section 28.12 Cost Model](28-observability-long-term-archival-policy.md#2812-cost-model) | L |
| **E** | Erasure abused to destroy evidence | Legal-hold gate blocks erasure; DPO approval required | [Chapter 28. Observability Long-Term Archival Policy -> Section 28.9 Legal Hold](28-observability-long-term-archival-policy.md#289-legal-hold) | L |

## 23A.5 Residual Risk Summary

| Component | Highest residual | Notes |
|---|---|---|
| C1 SDK / Agent | M (Info disclosure — PII) | Continuous linter coverage critical |
| C2 Collector | M (Info disclosure, DoS) | Multi-tenant attribution tested |
| C3 / C4 / C5 Backends | M (Info disclosure, DoS) | RBAC + query limits |
| C6 Grafana | M (Spoofing, Info disclosure) | Auth and dashboard ACLs |
| **C7 AIOps** | **H (LLM leakage to external provider)** | Prompt-boundary redaction must be enforced; periodic red-team |
| C8 IaC Pipeline | M (Elevation of privilege via runner) | Ephemeral, identity-bound runners |
| C9 Archive | M (Information disclosure) | CMK + egress alerts |

The single **High** residual risk relates to LLM data leakage at the prompt boundary (C7-I) and is tracked in the AIOps risk register ([Chapter 6. AIOps Guardrails and Implementation Playbook -> Section 6.8 AI Safety, Explainability, and LLM Data Leakage](06-aiops-guardrails-and-implementation-playbook.md#68-ai-safety-explainability-and-llm-data-leakage)).

## 23A.6 Open Threats / Action Register

| ID | Threat | Action | Owner (TBD) | Target Date |
|---|---|---|---|---|
| THR-001 | LLM prompt leakage (C7-I) | Implement prompt-boundary redaction + red-team test | Security Architect | 2026-Q3 |
| THR-002 | Cross-tenant query leakage (C3-I) | Add automated multi-tenant penetration test in CI | Platform Lead | 2026-Q3 |
| THR-003 | Dashboard ACL drift (C6-I) | Quarterly dashboard ACL audit script | Grafana Platform Lead | 2026-Q2 |
| THR-004 | Archive egress monitoring (C9-I) | Egress-volume alert thresholds tuned | Security Architect | 2026-Q3 |
| THR-005 | Compromised CI runner (C8-E) | Migrate all runners to ephemeral + OIDC | Platform Lead | 2026-Q3 |

## 23A.7 Cross-References

- [Chapter 23. Observability Platform Security Architecture](23-observability-platform-security-architecture.md) — parent chapter.
- [Chapter 6. AIOps Guardrails and Implementation Playbook](06-aiops-guardrails-and-implementation-playbook.md) — AI risk register and guardrails.
- [Chapter 26. Multi-Tenant and Customer-Site Deployment Model](26-multi-tenant-and-customer-site-deployment-model.md) — tenant boundaries used by threat model.
- [Chapter 27. Observability Non-Functional Requirements Register](27-observability-non-functional-requirements.md) — NFR-SEC controls referenced.
- [Chapter 28. Observability Long-Term Archival Policy](28-observability-long-term-archival-policy.md) — archive integrity and access controls.
- [Chapter 15. Observability Governance Charter and ARB Pack](15-observability-governance-charter-and-arb-pack.md) — ARB ratification path.

---

[↑ Back to TOC](toc.md)
