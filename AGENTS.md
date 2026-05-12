# AGENTS.md — Project Rules for the Observability Artifact Pack

This file captures durable working rules for any AI agent (OpenCode, Copilot, etc.) editing this repository. Read it before making changes. These rules exist because past sessions broke them and shipped noise into the artifact.

---

## 1. Style rules for Markdown content

### 1.1 Cross-references — never use the section-sign character
Do **not** use the Unicode section-sign character (U+00A7) anywhere in the pack — neither in prose, nor in tables, nor in Mermaid node labels, nor (especially) inside link labels. The character is banned at any nesting level, including inside backticks and code fences in this rule-file itself.

- In link labels, use the full readable form: `[Chapter 22, Section 3.2 — Worked Example B](22-capacity-and-scale-model.md#3-worked-sizing-examples)`.
- In prose, write `Section 3.2`, never the section-sign + number form, and never `Sec 3.2`.
- In Mermaid node labels where space is tight, use `Sec 7.2` (3 chars).
- For chapter shorthand inside prose tables or diagrams, `Ch 22` is acceptable; `Chapter 22` is preferred in prose.

### 1.2 No leftover scaffolding
Never leave `TEMP`, `TEMP TEST`, `TODO`, `FIXME`, `XXX`, `PLACEHOLDER`, `TBD-AGENT`, or "smoke-test" markers in committed content. If you need a probe to verify a tool, delete it in the same edit.

The string `TBD` *is* permitted in front-matter `owner:` fields (an explicit project convention until owners are assigned).

### 1.3 Front-matter table is mandatory
Every chapter file has a standard front-matter table directly after the H1:

```
| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |
```

These values are the current defaults. Do not deviate without explicit instruction. The YAML front-matter `chapter:` field stays numeric (e.g. `chapter: 9`), not zero-padded.

### 1.4 Heading and link conventions
- H1 only on the first heading of the file (chapter title).
- H2 sections numbered: `## 1. Purpose`, `## 2. Scope`, …
- H3 subsections numbered against parent: `### 3.1 Cardinality Governance`.
- Cross-reference link labels follow the pattern `[Chapter N. Title -> Section M. Title](file.md#m-title)` or the readable `[Chapter N, Section M — Title](...)` form.
- Anchor slugs **retain leading section numbers**: `### 3.1 Foo` → `#31-foo` (the verifier enforces this).

### 1.5 Slug rules used by the link verifier
GitHub-style slugification — implemented in `tools/verify_links.ps1`:
1. Lowercase.
2. Strip characters outside `[\p{L}\p{N} \-_]` (em-dash, `&`, `/`, `(`, `)`, etc. are dropped).
3. Collapse runs of spaces to a single `-`.
4. Trim leading/trailing hyphens.
5. **Do NOT** strip leading section numbers — `3.1 Cardinality Governance` → `31-cardinality-governance`.

---

## 2. File I/O rules (Windows PowerShell environment)

### 2.1 Always use `[System.IO.File]` for read/write
`Get-Content` and `Set-Content` corrupt em-dashes (`—`), arrows (`→`), and other non-ASCII glyphs on this Windows console. Always use:

```powershell
$enc = New-Object System.Text.UTF8Encoding($false)   # UTF-8, no BOM
$text = [System.IO.File]::ReadAllText($path)
[System.IO.File]::WriteAllText($path, $newText, $enc)
```

The `Edit` and `Write` tools in OpenCode already do this correctly — prefer them over PowerShell file cmdlets.

### 2.2 Line endings
Files are CRLF on disk (Windows repo). The verifier is line-ending agnostic, but new files should be CRLF for consistency. The `Write` tool handles this on Windows.

### 2.3 No BOM
UTF-8 **without** byte-order mark. A BOM at the start of a YAML front-matter file breaks the front-matter parser.

---

## 3. Verifier discipline

Three verifiers live under `tools/`. Run them after **every** content change that touches headings, links, or front-matter:

| Verifier | Purpose | Run after |
|---|---|---|
| `tools/verify_links.ps1` | Internal-link + anchor integrity. Reports broken count. | Any link/heading change. |
| `tools/verify_frontmatter.ps1` | YAML + table sanity, date format, status enum. | Any front-matter change. |
| `tools/regen_toc.ps1` | Regenerates `toc.md` from H1/H2. Use during final wiring. | Phase 5 only. |

**Baseline must be 0 broken links** before any commit. If a renumber introduces broken anchors, fix the external references in the same edit pass.

---

## 4. Don't-do list

- Don't write to `.git/` or alter `.gitignore` without explicit instruction.
- Don't commit unless the user explicitly asks.
- Don't `--amend` or force-push.
- Don't add new top-level files to `Artifact_Pack/` without updating `toc.md`, `README.md`, `Handover.md`, and `traceability-matrix.md` in the same change.
- Don't introduce emojis to any file. The pack is intentionally emoji-free.
- Don't fabricate vendor pricing, SLAs, or compliance control IDs. If a number is illustrative, mark it `(illustrative)`.

---

## 5. Phase-5 final-sweep checklist

Before declaring P2 done, run:

1. `Get-ChildItem Artifact_Pack -Filter *.md -Recurse | Select-String -Pattern 'TEMP|TODO|FIXME|XXX|PLACEHOLDER'` plus a separate scan for the U+00A7 character (see Section 1.1) → both must return zero hits except `TBD` in `owner:` fields.
2. `tools/verify_links.ps1` → 0 broken.
3. `tools/verify_frontmatter.ps1` → 0 errors.
4. `tools/regen_toc.ps1` then diff `toc.md` — manual TOC should match generated.
5. Spot-check 3 random chapter cross-references render correctly in a Markdown viewer (em-dash, arrow, non-ASCII chars not mangled).

---

## 6. Why this file exists

Two recurring failure modes in earlier sessions:

- A "TEMP TEST LINK" probe was left in Chapter 1 across multiple commits.
- The section-sign shorthand (U+00A7 followed by a section number) crept into cross-reference link labels (e.g. `[Chapter 27, Section 3 — NFR Register](...)` written incorrectly with the section-sign character) and tables, inconsistent with the pack's own `Section N` style.

Both were caught by the user, not by the agent. This file is the durable record of those corrections.
