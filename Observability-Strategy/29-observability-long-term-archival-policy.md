---
title: Observability Long-Term Archival Policy
chapter: 29
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 29. Observability Long-Term Archival Policy

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Reviewed Date | Status |
|---|---|---|---|---|
| 0.1 | TBD | Internal |  | Draft |
---

## 29.1 Purpose

This policy governs the **long-term archival** (greater than 1 year) of observability telemetry — distinct from the operational retention tiers (hot / warm / cold) defined in [9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md). It defines what is archived, in what form, for how long, where, who can access it, and how it is eventually destroyed.

## 29.2 Scope

- All telemetry classes (metrics, logs, traces, events, profiles) that have a regulatory, contractual, legal, or forensic retention obligation extending beyond the operational cold tier.
- Audit logs and security telemetry that must satisfy SOC 2, ISO 27001, GDPR, and sector-specific obligations (HIPAA, PCI DSS, NIS2, DORA, where applicable).
- AI/ML training data and AI decision logs (per [7. AIOps Guardrails and Implementation Playbook](07-aiops-guardrails-and-implementation-playbook.md)).

Out-of-scope: short-term operational retention (covered by Chapter 8) and live backup/replication for HA/DR (covered by [22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md)).

## 29.3 Archival Categories

| Category | Description | Default Archive Period | Trigger |
|---|---|---|---|
| **Compliance** | Audit-relevant telemetry required by regulation or audit standard | 7 years | SOC 2 / ISO / sector regulation |
| **Contractual** | Telemetry covered by customer-contract SLA evidence clauses | Per contract (typically 3–6 years) | Customer agreement |
| **Forensic** | Telemetry tagged during a security incident or supporting investigation | 7 years from incident close | Incident response (Sev 1 / security) |
| **Legal Hold** | Telemetry subject to litigation, regulatory enquiry, or e-discovery | Indefinite until hold lifted | Legal Department instruction |
| **Operational Reference** | Pre-/post-major-change reference data (e.g. capacity baselines) | 3 years | Platform / Capacity team |
| **AI / ML** | Training data, AI inference logs, model lineage | 5 years (or per regulator) | Model deployment |

## 29.4 Retention Schedule (Worked View)

| Telemetry Class | Operational Cold End | Archive Period | Total Retention | Destruction Method |
|---|---|---|---|---|
| Application logs (Tier-1) | up to 90 days | 6 years 9 months | 7 years | Cryptographic erasure |
| Audit logs (security) | policy-controlled operational retention | 6 years | 7 years | Cryptographic erasure |
| Metrics (aggregated, downsampled) | up to 90 days operational before archival / longer-horizon retention applies | 4 years 11 months | 6 years | Cryptographic erasure |
| Traces (sampled) | 14–15 days operational | None by default; archive on incident | per incident | Cryptographic erasure |
| Profiles | 14–90 days where enabled | Archive only where policy or investigation requires | policy-driven | Cryptographic erasure |
| Incident / PIR records | 1 year | 6 years | 7 years | Cryptographic erasure |
| AI inference logs | 1 year | 4 years | 5 years | Cryptographic erasure |
| Customer-site telemetry | per customer contract | per customer contract | per customer contract | Customer-specified |

> Worked example continues from [Chapter 9. Observability Data Governance and Retention Policy -> Section 9.4 Worked Example: Applying Retention Policy](09-observability-data-governance-and-retention-policy.md#94-worked-example-applying-retention-policy).

## 29.5 Storage Architecture

### 29.5.1 Archive Storage Tiers

| Tier | Provider Example | Retrieval SLA | Use |
|---|---|---|---|
| **Archive-Standard** | Azure Blob Cool / S3 Standard-IA | seconds–minutes | Frequently queried compliance archive |
| **Archive-Cold** | Azure Blob Archive / S3 Glacier Flexible | 1–12 hours | Audit-evidence, rarely-queried |
| **Archive-Deep** | S3 Glacier Deep Archive | up to 48 hours | Maximum-retention, lowest-cost class |
| **On-prem WORM** | Hardware WORM appliance (customer-site) | seconds–minutes | Customer-site sovereignty requirements |

### 29.5.2 Format & Portability

- Archive format: **OpenTelemetry-native JSON or Parquet**, gzip- or zstd-compressed. No vendor-proprietary formats.
- Metadata sidecar (JSON) per archive batch: schema version, source service, classification, retention category, hash, signing certificate fingerprint, original-write timestamp range.
- Schema versioning: OpenTelemetry Semantic Conventions version recorded in the sidecar so future readers can apply correct interpretation.

### 29.5.3 Integrity & Tamper Evidence

| Control | Mechanism |
|---|---|
| Integrity hashing | SHA-256 of each archive object stored in sidecar + tier-level manifest |
| Tamper evidence | Sidecar signed with platform signing key; signature verified on every restore |
| Periodic verification | Automated re-hash sample of ≥ 1% of archives per quarter |
| Bit-rot detection | Annual end-to-end checksum sweep on Archive-Deep tier |
| Immutability | WORM lock (object-lock or vendor-equivalent) for the full retention period |

### 29.5.4 Encryption

- At rest: AES-256, customer-managed key (CMK) where data residency requires; tenant-isolated keys for multi-tenant deployments.
- In transit: TLS 1.3 to the archive endpoint; mTLS where backend supports.
- Key rotation: annual; old keys retained for the lifetime of objects encrypted with them (then cryptographically erased — see Section 7.3).

## 29.6 Data Lifecycle

### 29.6.1 Promotion to Archive

Promotion is automated by an archival worker that runs daily:

1. Reads the operational cold-store retention manifest.
2. Selects records whose cold-tier retention has expired and whose retention category is non-zero.
3. Applies privacy treatment per Section 8 (redaction, de-identification, or aggregation).
4. Writes to the selected archive tier with sidecar metadata.
5. Records the promotion in the archive ledger (immutable).
6. Deletes from the cold store after sidecar signing and ledger commit.

### 29.6.2 Restore From Archive

- Restore is a controlled operation; not self-service for users.
- Restore SLAs: Archive-Standard ≤ 4 h; Archive-Cold ≤ 12 h; Archive-Deep ≤ 48 h.
- Restore requires:
  - Ticket with documented business / legal reason.
  - Approval per RACI matrix (see [Chapter 16. Observability Governance Charter and ARB Pack -> Section 16.4.1 RACI Matrix](16-observability-governance-charter-and-arb-pack.md#1641-raci-matrix)).
  - Signature verification before re-ingest.
  - Audit-log entry on completion.

### 29.6.3 Destruction

- **Cloud-backed archives.** Cryptographic erasure (key deletion) is the primary destruction method.
- **Customer-site or on-prem archives.** Physical media destruction certificate retained where physical media is used.
- **Evidence retention.** Destruction certificate retained for **2 years** after destruction event.
- **Legal-hold gate.** Destruction is blocked while any legal hold is active on the record.

## 29.7 Privacy Treatment Before Archival

| Treatment | When Applied | Method |
|---|---|---|
| **Verbatim retention** | Audit, security, contractual evidence | None — full fidelity |
| **PII redaction** | Application telemetry retained for operational reference | Field-level redaction per [Chapter 18. Application Telemetry Standard -> Section 18.6 PII & Data Classification](18-application-telemetry-standard.md#186-pii-data-classification) |
| **De-identification** | Long-term trend / analytics data | k-anonymity (k≥5), pseudonymisation |
| **Aggregation** | Cost / capacity baselines | Hourly / daily roll-ups; raw events not retained |

## 29.8 Access Control

| Role | Read | Restore | Approve Restore | Destroy |
|---|---|---|---|---|
| Platform engineer (on-call) | No | No | No | No |
| SRE / observability lead | Metadata only | No | No | No |
| Compliance officer | Metadata + restore request | Yes | No | No |
| Legal counsel | Metadata only | No | Yes | No (legal-hold gate) |
| Data Protection Officer | Metadata + erasure request | Yes (for DSR) | Yes (DSR / erasure) | Yes (cryptographic) |
| Internal audit | Metadata + read after approval | Yes (audit context) | No | No |

Access is governed by [24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) and reviewed quarterly.

## 29.9 Legal Hold

- Trigger: written instruction from Legal Counsel naming records, custodians, and scope.
- Effect: archive worker tags affected records as `legal_hold=true`; destruction is blocked regardless of retention category.
- Duration: until written release from Legal Counsel.
- Audit: every legal-hold application and release is logged immutably.

## 29.10 Right to Erasure (GDPR Art. 17)

- Erasure requests are received by the Data Protection Officer.
- DPO determines whether the record qualifies (e.g. exemption under GDPR Art. 17(3) for legal obligation or public interest).
- If qualified: archive worker performs **cryptographic erasure** of the affected records' keys within **30 days**.
- Aggregated and pseudonymised records are exempt where re-identification is no longer feasible (see Section 8).
- Erasure certificate retained for 2 years.

## 29.11 Chain of Custody (Forensic / Legal)

For records tagged Forensic or Legal Hold:

1. Sidecar metadata records original-write source, hash, and signing certificate.
2. Every read or restore is logged with: requester, approver, timestamp, purpose, ticket reference.
3. Restored copies are produced as **sealed packages** (tar + signature + chain-of-custody manifest).
4. Recipient acknowledgement is captured; recipient must destroy or return on completion of legal proceedings.

## 29.12 Cost Model

Archival cost is tracked separately from operational FinOps (see [10. Observability FinOps Standard](10-observability-finops-standard.md)).

| Metric | Target |
|---|---|
| Archive cost per TB-year | Tracked, trended; target reduction YoY |
| Restore frequency | Tracked; informs tier choice |
| Egress cost per restore | Tracked; alerts on outlier |
| Tier rebalancing | Annual review — promote rarely-touched data to deeper tier |

## 29.13 Data Residency

- Archive location must satisfy the data-classification residency requirement of the source telemetry.
- EU-origin personal data archives in EU region only.
- Customer-site telemetry archives at the customer site by default unless contract permits otherwise.
- Region for each archive batch recorded in sidecar metadata.

## 29.14 Roles & Responsibilities (Summary)

| Role | Responsibility |
|---|---|
| Platform Lead (owner) | Operates archival pipeline; reports on KPIs |
| Data Protection Officer | Owns Privacy Treatment policy; approves erasure |
| Legal Counsel | Applies / releases legal hold; approves restore for legal use |
| Compliance Officer | Approves audit restores; signs off retention schedule |
| Internal Audit | Periodic verification of archive integrity & retention adherence |
| ARB | Approves changes to this policy |

Full RACI in [Chapter 16. Observability Governance Charter and ARB Pack -> Section 16.4.1 RACI Matrix](16-observability-governance-charter-and-arb-pack.md#1641-raci-matrix).

## 29.15 KPIs

| KPI | Target |
|---|---|
| Archive integrity verification pass rate | 100% on quarterly sample |
| Restore SLA adherence | ≥ 95% within tier SLA |
| Erasure SLA adherence | ≥ 99% within 30 days |
| Legal-hold breaches | 0 |
| Audit findings on archive controls | 0 critical, 0 high |
| Carbon impact per TB archived (sustainability) | Tracked, trended |

## 29.16 Cross-References

- [9. Observability Data Governance and Retention Policy](09-observability-data-governance-and-retention-policy.md) — operational retention (precedes archive).
- [10. Observability FinOps Standard](10-observability-finops-standard.md) — cost-management context.
- [11. Compliance and Audit Control Matrix](11-compliance-and-audit-control-matrix.md) — control evidence mapping.
- [Chapter 18. Application Telemetry Standard -> Section 18.6 PII & Data Classification](18-application-telemetry-standard.md#186-pii-data-classification) — PII classification used for privacy treatment.
- [22. Observability Platform HA and DR Design](22-observability-platform-ha-and-dr-design.md) — distinction from backup/DR.
- [24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) — encryption, access control, audit logging.
- [28. Observability Non-Functional Requirements Register](28-observability-non-functional-requirements.md) — archival NFRs (NFR-REC-03, NFR-PRV-03, NFR-CMP-03, etc.).

---

[↑ Back to TOC](toc.md)
