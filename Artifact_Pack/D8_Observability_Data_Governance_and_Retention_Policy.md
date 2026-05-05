# D8 — Observability Data Governance & Retention Policy

> **Purpose:** Data lifecycle, retention tiers, governance controls, ownership.
> **Source Strategy Sections:** Governance and Data Strategy (data-governance controls); Telemetry retention tiers; Worked Example: Applying Retention Policy.
> **Status:** Skeleton populated from Observability-Strategy.docx v0.1.

---

## 1. Purpose
This policy defines what telemetry is collected, how long each data type is retained, where it is stored, who can access it, and how it is governed, audited, and eventually deleted or archived. It exists to keep observability data **useful, compliant, and cost-effective** through its lifecycle.

## 2. Scope
- Metrics, logs, traces, RCA records.
- All environments (production / non-production).
- All hosting locations covered by the Compose-based stack (on-prem, customer site, cloud VM).

## 3. Telemetry Retention Tiers
A tiered retention model balances cost, performance, and investigatory needs. Retention can be refined per environment, per service criticality, and per regulatory requirement.

| Data Type | Typical Retention Window | Rationale |
|---|---|---|
| Metrics | 30–90 days | Trend analysis, capacity planning, SLO/SLA tracking |
| Logs | 7–30 days | Near-term incident investigation and security analysis |
| Traces | 7 days | High-resolution debugging of recent issues / performance hotspots |
| RCA summaries | 1 year (or longer per policy) | Long-term learning, auditability, governance reviews |

## 4. Worked Example: Applying Retention Policy

**Scenario.** A customer-facing insurance platform processes policy quotes and claims 24/7. The platform must meet strict uptime SLAs, support operational analytics, and maintain auditability for at least 12 months.

### 4.1 Metrics (30–90 days)
- High-resolution scrapes (10–30 s) retained for **30 days**.
- Down-sampled metrics (5–15 min roll-ups) retained for **90 days**.
- **Purpose:** SLO breach analysis (30 days); capacity planning, seasonal trend analysis, cost optimisation (90 days).

### 4.2 Logs (7–30 days)
- Application + infrastructure logs in **hot storage 7–14 days**.
- Security / audit-relevant logs optionally forwarded to **SIEM** with longer retention (e.g. 90–365 days as required by policy).
- **Purpose:** RCA of recent incidents and deployments; short-term forensic visibility.

### 4.3 Traces (7 days)
- Full-fidelity traces retained for **7 days**.
- Beyond 7 days, only **trace-derived metrics** (span counts, latency percentiles by endpoint) retained via metrics backends.
- **Purpose:** Deep end-to-end debugging recently after issues occur; manage high-volume trace storage cost.

### 4.4 RCA Summaries (1 year)
- For each major incident, structured RCA records (timeline, impact, root cause, corrective actions) stored in a central knowledge base for **12 months or longer**.
- **Purpose:** Compliance and audit reviews; trend analysis of recurring failure modes; "never-repeat" actions.

## 5. Data Classification
- Telemetry classified by sensitivity (public / internal / confidential).
- **PII and sensitive data are prohibited in logs and traces** wherever possible; masking, tokenisation, or redaction enforced **at source or in the OpenTelemetry pipeline**.
- Classification determines storage location, encryption requirements, and access levels.

## 6. Data Quality and Standards
- A standard telemetry schema (naming conventions for metrics, labels, log fields, trace attributes) is maintained; see **D1** and **D19**.
- Data quality checks (missing labels, malformed logs, excessive cardinality) implemented in the telemetry pipeline.
- Services are required to meet minimum instrumentation standards before production promotion.

## 7. Deletion and Retention Enforcement
- Automated retention rules configured in storage backends (Prometheus, Loki, Tempo, object storage).
- Deletion jobs and compaction processes monitored to ensure compliance with policy and regulations (e.g. GDPR-aligned deletion timelines when applicable).

## 8. Lifecycle Mechanics (linked to FinOps)
Cost-related lifecycle mechanics (hot / warm / cold storage, downsampling) are owned by **D9 — Observability FinOps Standard**. This policy authorises those mechanics; cost optimisation details live in D9.

## 9. Success Criteria
- **100%** of production services emit telemetry that conforms to the approved schema.
- **Retention policy adherence ≥ 99%** across metrics, logs, traces, and RCA repositories.
- **No audit failures** attributable to observability data handling.
- Demonstrable reuse of RCA summaries in post-incident reviews and risk assessments.

(Outcome measurement maintained in **D11**.)

## 10. Cross-References
- **D1 / D19** — telemetry standards and data model the policy enforces.
- **D9** — cost-driven lifecycle mechanics.
- **D10** — compliance and audit control matrix.
- **D11** — KPI scorecard for governance success.
- **D15** — governance charter ownership.
