# Prompt For Follow-On Agent

Use this prompt as-is with the next team member's coding/automation agent.

## Prompt
You are taking over an observability document decomposition task. Continue from existing outputs; do not restart discovery.

### Context Files (read first)
- `Observability_Handover_Context.md`
- `Observability-Strategy_Annotated_v2.docx`
- `Observability_Extraction_Plan.xlsx`

### Objective
Operationalize the extraction plan by creating destination artifacts and moving content from the strategy doc into the correct target documents, preserving a concise executive strategy in the source.

### Required Outcomes
1. Create a target artifact pack aligned to D1-D19 from the extraction workbook.
2. For each section in `Section Mapping`:
   - If `KEEP`: leave in strategy doc.
   - If `EXTRACT`: move substantive content to destination artifact(s), leave a short pointer in strategy.
   - If `MIXED`: keep strategic narrative, extract implementation/detail/policy/runbook content.
3. Add traceability table(s):
   - `Source Section -> Target Artifact(s)`
   - `Target Artifact -> Source Section(s)`
4. Produce a final handover markdown with:
   - files created,
   - extraction completion status,
   - unresolved ambiguities/decisions needed.

### Guardrails
- Do not change the business intent of any section.
- Avoid duplicating detailed technical content in the strategy document.
- Keep executive strategy readable (short narrative, high-level architecture, roadmap view, governance intent).
- Keep implementation details in standards/playbooks/policies.

### Suggested Execution Sequence
1. Create artifact skeletons (D1-D19) as markdown files.
2. Process sections in order of appearance from source doc.
3. Fill each artifact with extracted content and section references.
4. Update strategy doc with concise pointers where detail was extracted.
5. Run consistency pass for overlap and contradictions.

### Deliverable Format
Return a concise report with:
- `Created Files`
- `Sections Processed`
- `Sections Pending`
- `Decisions Required`
- `Recommended Next Step`
