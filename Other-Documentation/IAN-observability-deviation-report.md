# IAN Observability Deck Deviation Report

Source compared:
- `Other-Documentation/IAN-Observability-Onboarding & Implementation.pptx`
- extracted text: `C:\Users\anurag.thakur\AppData\Local\Temp\opencode\ian_deck_extract.txt`

Baseline compared against:
- `Artifact_Pack/03-observability-reference-architecture.md`
- `Artifact_Pack/08-iac-for-observability-standard.md`
- `Artifact_Pack/18-application-telemetry-standard.md`
- `Artifact_Pack/25-slo-and-error-budget-framework.md`
- `Artifact_Pack/26-service-onboarding-and-instrumentation-kits.md`
- `Artifact_Pack/27-multi-tenant-and-customer-site-deployment-model.md`
- `Artifact_Pack/29-observability-long-term-archival-policy.md`

## Summary

The deck is broadly aligned on OpenTelemetry, LGTM correlation, SLOs, and structured telemetry. Containerized deployment and AKS-oriented implementation are acceptable, but some implementation details still drift from the pack baseline. The main risks are tooling drift, schema drift, and retention drift.

## Findings

### Medium: Deployment model tooling
Deck position:
Slides 4, 5, 10, and 15 describe `DaemonSet`, `Deployment`, `AKS namespace`, `OTel Operator`, `Helm`, `HPA 2-6`, and `PDB` (`ian_deck_extract.txt:74-84`, `119-142`, `283-320`, `522-537`).

Pack baseline:
The pack now permits containerized deployment with environment-specific automation and orchestration. The standard stays generic rather than requiring one runtime. Dashboard delivery remains Git-managed rather than operator-specific (`Artifact_Pack/03-observability-reference-architecture.md:24-27`, `94`, `174-187`; `Artifact_Pack/08-iac-for-observability-standard.md:20-35`; `Artifact_Pack/06-grafana-platform-standard-and-visualization-playbook.md:74-171`).

Deviation / risk:
AKS-style containerized deployment is acceptable. The main concern is over-specifying platform tooling such as `Helm` and operator-driven assumptions as if they were normative across all environments.

Recommended correction:
Keep the AKS/containerized framing, but make `Helm` and similar platform tooling clearly environment-specific rather than pack-mandated.

### High: Customer-site and tenancy model
Deck position:
Slide 10 assumes all services and collectors run in one AKS cluster and all pods send to an in-cluster collector (`ian_deck_extract.txt:283-303`).

Pack baseline:
The pack supports customer-site, shared multi-tenant, and hybrid topologies, with customer-site telemetry staying local by default and only redacted aggregates leaving site (`Artifact_Pack/27-multi-tenant-and-customer-site-deployment-model.md:24-76`).

Deviation / risk:
The deck collapses the approved deployment models into a single cluster-centric view. That is still incompatible with the pack's data residency and customer-site operating model.

Recommended correction:
Add separate topology slides for customer-site, shared multi-tenant, and hybrid deployment, or explicitly label the current AKS view as IAN-specific, not pack standard.

### High: Telemetry attribute schema
Deck position:
Slide 5 mandates `tenant.id` and references `enduser.tenant_id` (`ian_deck_extract.txt:123-139`).

Pack baseline:
The pack's tenant model uses `tenant_id` as a required resource attribute, enforced by SDK kits and gateway override (`Artifact_Pack/27-multi-tenant-and-customer-site-deployment-model.md:90-110`; `Artifact_Pack/18-application-telemetry-standard.md:35-41`, `52-61`).

Deviation / risk:
The deck uses different tenant key names than the pack. That breaks consistent queries, policy enforcement, and authoritative tenant injection.

Recommended correction:
Standardize the deck on the pack's approved attribute names, especially `tenant_id`, and remove mixed naming.

### Medium: Health and onboarding contract
Deck position:
Slide 11 requires `/healthz`, `/readyz`, and `/metrics` in every backend repo (`ian_deck_extract.txt:375-378`).

Pack baseline:
The pack PRR gate requires `/health/liveness` and `/health/readiness`; onboarding kits focus on OTel SDK emission and do not define a universal repo-local `/metrics` endpoint contract (`Artifact_Pack/26-service-onboarding-and-instrumentation-kits.md:40-56`).

Deviation / risk:
Teams following the deck would implement a different readiness contract than the pack's production-readiness review.

Recommended correction:
Align the deck's onboarding checklist and examples to the PRR gate in Chapter 26.

### Medium: Retention policy
Deck position:
Slides 6, 9, 10, and 14 set concrete retention values such as logs `30 d hot / 90 d cold`, traces `14 d`, profiles `14 d / 90 d cold`, metrics `15 d local / 13 mo`, audit `400 d hot / 7 y cold` (`ian_deck_extract.txt:156-159`, `263`, `310-316`, `483-486`).

Pack baseline:
The pack's operational retention baseline is more conservative and policy-driven: metrics `30-90 days`, logs `7-30 days`, traces `7 days`, with long-term archival handled separately under archival policy (`Artifact_Pack/09-observability-data-governance-and-retention-policy.md:28-37`, `42-59`; `Artifact_Pack/29-observability-long-term-archival-policy.md:45-53`).

Deviation / risk:
The deck hard-codes different retention periods than the approved policy. This creates governance and storage-cost drift.

Recommended correction:
Replace retention numbers in the deck with policy references or update them to match Chapters 9 and 29.

### Medium: SLO window and error-budget examples
Deck position:
Slide 7 uses a `rolling 28 d` SLO for the policy-binding API and slide 12 mixes service-specific windows and targets (`ian_deck_extract.txt:208-214`, `404-429`).

Pack baseline:
The pack's tiering framework uses `30-day rolling` windows by default and defines burn-rate bundles centrally (`Artifact_Pack/25-slo-and-error-budget-framework.md:44-80`).

Deviation / risk:
The deck introduces a competing SLO method. That weakens consistency in reporting and alert authoring.

Recommended correction:
Align examples to the Chapter 25 framework: 30-day rolling window and standard burn-rate bundles unless an explicit exception is approved.

### Medium: Grafana implementation model
Deck position:
Slide 11 says dashboards live in repo folders and are auto-imported by a `Grafana operator`; slide 15 again assumes Helm/operator workflows (`ian_deck_extract.txt:377-378`, `522-529`).

Pack baseline:
The pack's dashboards-as-code model is Git-managed and applied through approved dashboards-as-code workflows, not specifically through a Grafana operator (`Artifact_Pack/06-grafana-platform-standard-and-visualization-playbook.md:74-171`).

Deviation / risk:
The deck points teams to a more specific delivery toolchain than the approved one.

Recommended correction:
Replace `Grafana operator` language with generic dashboards-as-code wording from Chapter 6.

### Low: Security implementation specificity
Deck position:
Slides 10 and 14 prescribe `Keycloak`, `SAML`, specific PagerDuty/Slack/Jira routing, and universal `mTLS app <-> collector` (`ian_deck_extract.txt:317-320`, `488-491`).

Pack baseline:
The pack treats IdP, paging, and some auth choices as pluggable and policy-governed, with customer-site variance (`Artifact_Pack/24-observability-platform-security-architecture.md:39-75`, `158-181`).

Deviation / risk:
These are acceptable as one implementation, but the deck presents them as fixed standards.

Recommended correction:
Mark these controls as example implementations unless IAN has formally chosen them via ADR.

## Usable Content

These parts are directionally aligned with the pack and can be retained after wording cleanup:

- OpenTelemetry as the common standard across logs, metrics, and traces (`ian_deck_extract.txt:114-127`)
- structured JSON logging and trace correlation (`ian_deck_extract.txt:149-177`)
- RED / USE / SLI / SLO framing (`ian_deck_extract.txt:184-214`)
- W3C trace propagation and exemplar-linked troubleshooting (`ian_deck_extract.txt:221-245`)
- emphasis on cardinality control, redaction, and runbook-backed alerting (`ian_deck_extract.txt:455-465`, `472-501`)

## Recommended Next Actions

1. Decide whether this deck is meant to be:
   - an IAN-specific implementation example, or
   - a pack-aligned standard deck.
2. If it is an example, add a scope note on slide 1 stating it is an AKS-oriented IAN implementation.
3. If it is meant to be standard, rewrite slides 5, 10, 11, 14, and 15 to align with Chapters 3, 6, 8, 25, 26, 27, and 29, keeping the deployment language generic where possible.
4. Normalize the schema terms first: `tenant_id`, health endpoint contract, retention windows, and SLO windows.
