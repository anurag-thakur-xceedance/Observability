# D15 — Observability Governance Charter & ARB Pack

> **Purpose:** Governance model, review cadence, decision rights.
> **Source Strategy Sections:** Governance and Data Strategy (governance model); Governance Model; Architecture Governance and Review.
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1. Membership and ARB names are placeholders pending decision.

---

## 1. Purpose
Defines who governs observability standards, retention, access, and architecture decisions, and the cadence at which they are reviewed.

## 2. Governance Body
- An **observability governance body** (e.g. an architecture or SRE governance group) owns telemetry standards, retention policies, and access controls.
- Policies are reviewed on a **fixed cadence (quarterly)** or following major incidents / regulatory changes.

## 3. Decision Rights

| Domain | Decision Right |
|---|---|
| Telemetry standards (D1, D17, D19) | Governance body approves; standards owners draft. |
| Retention policy (D8) | Governance body approves; data governance lead drafts. |
| Access control (D8 §RBAC) | Identity / Security with governance body endorsement. |
| Cost / FinOps levers (D9) | Platform Ops with governance body sign-off above threshold. |
| Alerting & severity (D4) | SRE / Incident Mgmt with governance body endorsement. |
| AIOps guardrails (D6) | AI lead + governance body co-approval. |
| IaC standard (D7) | Platform Ops; ARB endorsement for cross-cloud changes. |
| Roadmap phase gates (D13) | Governance body / ARB. |

## 4. Architecture Review Board (ARB) Pack

The strategy doc retains the high-level governance narrative ("who has seen this document and the level of review"). Detailed ARB mechanics live here:

| ID | Board | Purpose | Review Type |
|---|---|---|---|
| 1 | ARB | Architecture review | TBD |
| 2 | Exception Panel | Deviations | N/A (per source) |
| 3 | SDG | Service / design governance | TBD |
| 4 | Change Board | Change approval | TBD |

> Source state: **Not Seen** for all four boards (per the strategy doc Architecture Governance and Review table). Action: schedule reviews — **decision required**.

## 5. Review Cadence
- **Quarterly:** policy and standards review; phase-gate readiness assessment.
- **Post-Incident:** governance review when major incidents trigger systemic changes (links to **D12** / **D16**).
- **Regulatory-Driven:** ad-hoc reviews triggered by changes in applicable regulations.

## 6. Data Classification & Access Governance
(Inherited from strategy "Governance Model")

- **Data Classification:** public / internal / confidential.
- **PII** prohibited in logs/traces wherever possible; masking/tokenisation/redaction enforced at source or in pipeline.
- **RBAC** in Grafana, Loki, Prometheus.
- **Least-privilege** enforced:
  - **Operations / SRE** — broad read access to production telemetry.
  - **Development** — service-specific access.
  - **Business** — curated dashboards and reports only.
- **Periodic access reviews** to remove stale or excessive permissions.

## 7. Audit & Reporting
Coordinates with **D10** for audit evidence and **D11** for governance KPIs (retention adherence, audit pass rate).

## 8. Cross-References
- **D8** — data governance policy enforced under this charter.
- **D10** — compliance evidence.
- **D11** — governance success KPIs.
- **D16** — ADRs ratified by this body.
