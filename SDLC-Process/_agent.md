# SDLC Process - Agent Instructions

## Directory Purpose
This is the root directory for the Software Development Lifecycle (SDLC) Process documentation. It contains the master process overview and links to all phase-specific subdirectories.

## Directory Structure
```
Process/
├── 00-Entry-Points/      # Entry points A-D (Intake, Concept, Project, Planning)
├── 01-Product-Feedback-Discovery-Planning/  # Steps 1-9
├── 02-Architecture-Design/                  # Steps 10-18
├── 03-Develop/                              # Steps 19-31
├── 04-Secure-Govern-Validate/               # Steps 32-40
├── 05-Test/                                 # Steps 41-51
├── 06-Deploy-Operate/                       # Steps 52-57
├── 07-References/                           # Reference documents
├── 00-Home.md                               # Main entry page
└── 00-SDLC-Overview.md                      # Process overview
```

## Agent Update Guidelines

### When to Update This Directory
- Adding new SDLC phases or major process changes
- Updating the master navigation structure
- Adding new reference categories

### File Naming Conventions
- Phase directories: `NN-Phase-Name/` (e.g., `01-Product-Feedback-Discovery-Planning/`)
- Step files: `Step-NN-Step-Name.md` (e.g., `Step-01-Design-Stakeholders.md`)
- Reference files: `Reference-Topic-Name.md`
- Order files: `.order` (no extension, controls wiki navigation)

### Link Format for Azure DevOps Wiki
Use absolute paths from docs root:
```markdown
[Link Text](Phase-Directory/Step-File.md)
```
Do NOT include `.md` extension in links.

### Required Sections for Step Files
Each step file MUST include:
1. **Overview Table** - Step number, phase, prev/next steps, roles, tools
2. **Purpose** - What this step accomplishes
3. **Inputs** - What comes into this step
4. **Activities** - What happens during this step
5. **Outputs** - What this step produces
6. **Quality Gates / Exit Criteria** - Checklist for step completion
7. **AI/Automation Augmentation** - Applicable AI tools
8. **Observability & Metrics** - DORA metrics, observability refs

### Updating .order Files
The `.order` file controls wiki navigation order. List filenames without extensions, one per line:
```
00-Home
00-SDLC-Overview
00-Entry-Points
01-Product-Feedback-Discovery-Planning
...
```

### Cross-References
When referencing other steps:
- Use the step number and name: "See [Step 15: Automation Test Definition](02-Architecture-Design/Step-15-Automation-Test-Definition.md)"
- Maintain bidirectional links (Previous/Next step references)

### Metadata to Preserve
Each step file contains metadata that should be updated when process changes:
- Responsible Role(s)
- Tools used
- DORA metric references (D1-D5)
- Observability references (O1-O5)
- AI/Automation capabilities

## Contact
For questions about this SDLC process documentation, contact the DevOps or Architecture team.
