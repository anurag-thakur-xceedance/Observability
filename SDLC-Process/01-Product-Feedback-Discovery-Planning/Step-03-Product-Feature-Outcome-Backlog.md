# Step 3: Product Feature/Outcome Backlog

## Purpose

Maintain a prioritized list of features and outcomes that represent the product roadmap and strategic direction.

## Process

### Input
- Approved change requests and features
- Strategic initiatives
- Technical debt items
- Compliance requirements

### Activities

1. **Backlog Organization**
   - Group features by epic/theme
   - Assign to target releases/quarters
   - Maintain parent-child relationships
   - Tag for filtering and reporting

2. **Outcome Definition**
   - Define measurable outcomes for each feature
   - Establish success criteria
   - Link to business objectives (OKRs)

3. **Roadmap Alignment**
   - Map features to roadmap timeline
   - Balance capacity across initiatives
   - Identify resource conflicts
   - Adjust priorities as needed

4. **Stakeholder Communication**
   - Regular roadmap reviews
   - Status updates on key features
   - Dependency coordination across teams

### Output
- Prioritized product backlog
- Feature roadmap
- Outcome metrics definitions

## Backlog Structure

```
Epic (Strategic Initiative)
├── Feature (Deliverable Capability)
│   ├── User Story (Implementable Work)
│   │   ├── Task (Developer Work)
│   │   └── Task
│   └── User Story
├── Feature
│   └── User Story
└── Feature
```

## Azure DevOps Configuration

### Area Path Structure
```
Project
├── Product A
│   ├── Module 1
│   └── Module 2
└── Product B
    ├── Module 1
    └── Module 2
```

### Iteration Path Structure
```
Project
├── 2026
│   ├── Q1
│   │   ├── Sprint 1
│   │   ├── Sprint 2
│   │   └── Sprint 3
│   ├── Q2
│   └── ...
```

## Backlog Views

### By Strategic Theme
- Customer Experience improvements
- Platform reliability
- Security enhancements
- Performance optimization
- Technical debt reduction

### By Target Quarter
- Q1 2026 - Committed
- Q2 2026 - Planned
- Future - Considered

### By Priority
- P1 - Critical (must deliver)
- P2 - High (should deliver)
- P3 - Medium (nice to have)
- P4 - Low (if time permits)

## Outcome Metrics Examples

| Feature | Outcome Metric | Target |
|---------|----------------|--------|
| New search feature | User task completion rate | > 90% |
| Performance optimization | Page load time | < 2 seconds |
| Security enhancement | Vulnerability count | 0 critical |

## Best Practices

1. **Limit WIP** - Don't overload the backlog with too many active items
2. **Regular Grooming** - Review and update backlog weekly
3. **Clear Ownership** - Every item has a clear owner
4. **Outcome Focus** - Define success in terms of outcomes, not outputs
5. **Visible Roadmap** - Keep stakeholders informed of priorities

## Metrics

| Metric | Target |
|--------|--------|
| Backlog items with acceptance criteria | 100% |
| Features with defined outcomes | 100% |
| Backlog grooming frequency | Weekly |
| Roadmap accuracy (planned vs delivered) | > 80% |

## Related Steps

- Previous: [Step 2: Change Request & Feature](Step-02-Change-Request-Feature.md)
- Next: [Step 4: Sprint/Kanban Backlog](Step-04-Sprint-Kanban-Backlog.md)
