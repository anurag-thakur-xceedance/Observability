# Step 4: Sprint/Kanban Backlog

## Purpose

Organize work into actionable sprint or Kanban backlogs that teams can execute against during the development cycle.

## Process

### Input
- Prioritized product backlog
- Team capacity information
- Sprint/iteration timeline
- Dependencies from other teams

### Activities

1. **Backlog Selection**
   - Pull items from product backlog
   - Consider team capacity
   - Balance feature work with maintenance
   - Account for dependencies

2. **Work Breakdown**
   - Break features into user stories
   - Create implementation tasks
   - Identify testing tasks
   - Document dependencies

3. **Sprint vs Kanban Decision**
   - Use Sprints for planned feature work
   - Use Kanban for support/maintenance work
   - Hybrid approach for mixed workloads

4. **Ready Criteria Verification**
   - Confirm acceptance criteria are clear
   - Verify designs are complete
   - Check dependencies are resolved
   - Ensure estimates are reasonable

### Output
- Sprint/Kanban backlog
- Task breakdown
- Dependency map
- Ready-for-development items

## Sprint Backlog Structure

```yaml
Sprint: Sprint 2026.Q1.S3
Goal: "Complete user authentication refactoring"
Capacity: 120 points

Items:
  - User Story: Implement OAuth 2.0 login
    Points: 13
    Tasks:
      - Create OAuth configuration
      - Implement token handling
      - Add session management
      - Write unit tests
      
  - User Story: Add MFA support
    Points: 8
    Tasks:
      - Integrate MFA provider
      - Create MFA enrollment flow
      - Add backup codes feature
```

## Kanban Board Configuration

### Columns
1. **New** - Newly created items
2. **Ready** - Refined and ready to start
3. **In Progress** - Actively being worked
4. **In Review** - Code review/testing
5. **Done** - Completed and verified

### WIP Limits
| Column | Limit |
|--------|-------|
| Ready | 10 |
| In Progress | 5 |
| In Review | 3 |

## Definition of Ready (DoR)

Before an item enters the sprint/Kanban backlog, it must meet:

- [ ] Clear title and description
- [ ] Acceptance criteria defined
- [ ] Estimated (story points or t-shirt size)
- [ ] Dependencies identified and resolved
- [ ] Technical approach discussed
- [ ] Design artifacts available (if needed)
- [ ] Security requirements identified
- [ ] Testability confirmed

## Work Item States

```
New → Approved → Committed → In Progress → Done
         ↓           ↓
      Removed     Removed
```

## Best Practices

1. **Right-Size Items** - No item larger than 1/4 of sprint capacity
2. **Clear Acceptance** - Every item has testable acceptance criteria
3. **Balance the Work** - Mix of features, bugs, and tech debt
4. **Visible Dependencies** - Use links to show blockers
5. **Daily Updates** - Keep board state current

## Sprint Health Indicators

| Indicator | Healthy | Warning | Critical |
|-----------|---------|---------|----------|
| Items without estimates | 0 | 1-2 | >2 |
| Blocked items | 0 | 1 | >1 |
| Items >8 points | 0-1 | 2-3 | >3 |
| Missing acceptance criteria | 0 | 1 | >1 |

## Metrics

| Metric | Target |
|--------|--------|
| Sprint predictability | > 85% |
| Items meeting DoR | 100% |
| Cycle time (Kanban) | < 5 days |
| Blocked item resolution time | < 24 hours |

## Related Steps

- Previous: [Step 3: Product Feature/Outcome Backlog](Step-03-Product-Feature-Outcome-Backlog.md)
- Next: [Step 5: Prioritization](Step-05-Prioritization.md)
