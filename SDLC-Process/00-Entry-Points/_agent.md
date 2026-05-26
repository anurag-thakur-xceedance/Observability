# Entry Points - Agent Instructions

## Directory Purpose
This directory contains the four SDLC entry points (A-D) that define how work enters the development lifecycle. These represent different starting scenarios for projects and work items.

## Files in This Directory
| File | Entry Point | Description |
|------|-------------|-------------|
| `Step-A-Intake-Process.md` | A - New Product/Feature Idea | Initial intake and business case review |
| `Step-B-Concept-To-Project.md` | B - Concept to Project | Converting approved concepts to projects |
| `Step-C-Project-Initiation.md` | C - Project Initiation | Formal project setup and charter |
| `Step-D-Project-Team-Initialise-Planning.md` | D - Team Planning | Team initialization and sprint planning |

## Agent Update Guidelines

### When to Update This Directory
- Adding new entry point types
- Modifying intake criteria or processes
- Updating governance requirements for project initiation

### Entry Point Flow
```
A (Intake) → B (Concept to Project) → C (Project Initiation) → D (Team Planning) → Step 1
```

### Key Stakeholders for Entry Points
- **Step A**: Business Leadership, Program Management
- **Step B**: Product Owner, Architecture
- **Step C**: Project Management, Sponsors
- **Step D**: Scrum Master, Development Lead, Product Owner

### Required Updates When Modifying
1. Update the Previous/Next step links in overview table
2. Ensure Quality Gates align with governance requirements
3. Update DORA metric references (D5 starts tracking at Step A)
4. Maintain consistency with Project Charter templates

### Link Format
```markdown
[Step A: Intake Process](Step-A-Intake-Process.md)
```

### Integration Points
Entry points connect to:
- Architecture Artefact Store (Step A outputs)
- Azure DevOps Work Items (Step D creates initial backlog)
- Resource/Timeline Suggester AI (Step A, D)

## Outputs to Verify
- Project Charter (Draft) → Architecture Artefact Store
- Terms of Reference (ToR) → Project Management
- Initial Backlog → Azure DevOps
- Sprint Definition → Step 1
