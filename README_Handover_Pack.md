# Observability Agent Handover Pack

This folder contains everything needed for another team member to continue the observability document extraction using their agent.

## Folder Contents
- `Observability-Strategy.docx` (original source)
- `Observability-Strategy_Annotated_v2.docx` (section headers annotated with extraction guidance)
- `Observability_Extraction_Plan.xlsx` (structured mapping + destination docs)
- `Observability_Handover_Context.md` (what has been done and why)
- `Observability_Extraction_Table.md` (full section-to-destination table)
- `Observability_Agent_Prompt.md` (ready-to-run prompt for the next agent)

## Step-by-Step: How To Use With Another Agent
1. Open your preferred coding/document agent.
2. Give the agent the prompt from `Observability_Agent_Prompt.md`.
3. Tell the agent to read these files first, in order:
   - `Observability_Handover_Context.md`
   - `Observability_Extraction_Table.md`
   - `Observability_Extraction_Plan.xlsx`
   - `Observability-Strategy_Annotated_v2.docx`
4. Ask the agent to execute extraction in this order:
   - Create target artifacts D1-D19
   - Process sections marked `EXTRACT`
   - Process sections marked `MIXED` (keep concise strategy narrative, move detailed content)
   - Leave `KEEP` sections in the strategy doc
5. Require a completion report from the agent including:
   - Files created/updated
   - Sections completed
   - Sections pending
   - Open decisions requiring human input
6. Review the final strategy doc for brevity and executive readability.

## Success Criteria
- Strategy document remains concise and executive-facing.
- Operational/technical/policy details are moved to destination artifacts.
- Every source section has traceability to one or more destination artifacts.

## Notes
- Use `Observability-Strategy_Annotated_v2.docx` as the authoritative annotated source.
- Use `Observability_Extraction_Plan.xlsx` as the authoritative mapping tracker.
