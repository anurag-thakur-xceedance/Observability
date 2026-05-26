# Step 9: Sprint Planning

## Purpose

Create a detailed plan for the sprint that enables the team to work effectively toward the sprint goal.

## Process

### Input
- Committed sprint scope
- Sprint goal
- Team capacity
- Technical approach from refinement

### Activities

1. **Sprint Goal Review**
   - Confirm sprint goal with team
   - Align understanding
   - Identify success criteria

2. **Item Review**
   - Walk through each committed item
   - Confirm understanding
   - Clarify any remaining questions

3. **Task Breakdown**
   - Break items into tasks
   - Estimate task hours
   - Identify task owners

4. **Plan Validation**
   - Verify tasks fit capacity
   - Check for gaps
   - Identify first day tasks

### Output
- Sprint plan with tasks
- Task assignments
- Sprint board ready
- First day activities identified

## Sprint Planning Meeting

### Structure (2-hour sprint = 2-4 hour planning)

**Part 1: What (1-2 hours)**
- Review sprint goal
- Walk through committed items
- Confirm acceptance criteria
- Identify dependencies

**Part 2: How (1-2 hours)**
- Task breakdown
- Technical approach discussion
- Estimate tasks
- Assign initial owners

### Attendees

| Role | Responsibility |
|------|----------------|
| Product Owner | Clarifies requirements, accepts scope |
| Scrum Master | Facilitates, tracks time, ensures completion |
| Development Team | Breaks down work, estimates, plans |
| Technical Lead | Guides technical approach |

## Task Breakdown

### Task Types

```yaml
Development Tasks:
  - Implementation (code writing)
  - Unit test creation
  - Integration work
  - API development

Review Tasks:
  - Code review
  - Design review
  - Documentation review

Testing Tasks:
  - Test case creation
  - Manual testing
  - Automation updates

Supporting Tasks:
  - Environment setup
  - Data preparation
  - Documentation updates
```

### Task Sizing

| Size | Hours | Example |
|------|-------|---------|
| XS | 1-2 | Fix typo, update config |
| S | 2-4 | Add simple validation |
| M | 4-8 | Implement new method |
| L | 8-16 | Create new component |

> ⚠️ Tasks over 16 hours should be split

### Example Breakdown

```yaml
User Story: "User can reset password via email"
Estimate: 8 points

Tasks:
  - Create password reset request endpoint (M, 6h)
  - Implement email token generation (S, 3h)
  - Build reset password form component (M, 5h)
  - Create password update endpoint (S, 4h)
  - Write unit tests for reset flow (M, 4h)
  - Update API documentation (S, 2h)
  - Code review (S, 2h)
  - Integration testing (S, 3h)

Total: 29 hours (3-4 developer days)
```

## Sprint Board Setup

### Board Columns

```
To Do → In Progress → In Review → Done
```

### Task States

| State | Description |
|-------|-------------|
| To Do | Not started |
| In Progress | Actively being worked |
| In Review | Code review or testing |
| Done | Completed and verified |

### Card Information

Each task card should show:
- Title
- Assigned to
- Remaining hours
- Parent work item
- Blocked indicator (if applicable)

## First Day Plan

Identify what each team member will work on first:

```yaml
Day 1 Assignments:
  Alice: 
    - Start: "Create password reset request endpoint"
    - Then: "Implement email token generation"
  
  Bob:
    - Start: "Build reset password form component"
  
  Carol:
    - Start: "[Other story] API development"
```

## Sprint Board Visualization

```
┌─────────────────────────────────────────────────────────────┐
│ Sprint 2026.Q1.S3 - Goal: Password Reset Feature            │
├─────────────┬───────────────┬─────────────┬─────────────────┤
│   To Do     │  In Progress  │  In Review  │      Done       │
├─────────────┼───────────────┼─────────────┼─────────────────┤
│ ┌─────────┐ │ ┌───────────┐ │             │                 │
│ │Task 3   │ │ │Task 1     │ │             │                 │
│ │6h       │ │ │Alice 4h   │ │             │                 │
│ └─────────┘ │ └───────────┘ │             │                 │
│ ┌─────────┐ │ ┌───────────┐ │             │                 │
│ │Task 4   │ │ │Task 2     │ │             │                 │
│ │4h       │ │ │Bob 3h     │ │             │                 │
│ └─────────┘ │ └───────────┘ │             │                 │
└─────────────┴───────────────┴─────────────┴─────────────────┘
```

## Best Practices

1. **Complete the Plan** - Don't leave planning incomplete
2. **Everyone Participates** - All team members create tasks
3. **Right-Size Tasks** - Keep tasks under 16 hours
4. **Clear Ownership** - Assign tasks upfront when possible
5. **Update Daily** - Keep the board current

## Sprint Planning Checklist

Before ending planning:

- [ ] Sprint goal clearly stated and understood
- [ ] All committed items have tasks
- [ ] Tasks are estimated in hours
- [ ] First day work identified
- [ ] Dependencies between tasks noted
- [ ] Risks acknowledged
- [ ] Sprint board is set up
- [ ] Team has questions answered

## Common Pitfalls

| Pitfall | Solution |
|---------|----------|
| Planning takes too long | Time-box, prepare items beforehand |
| Tasks too large | Enforce 16-hour max |
| Missing tasks discovered later | Use DoD checklist during planning |
| Over-detailed planning | Plan just enough, refine as needed |
| Missing team members | Reschedule or async input |

## Metrics

| Metric | Target |
|--------|--------|
| Planning meeting effectiveness | > 4/5 rating |
| Tasks identified vs actual | > 90% |
| First day productivity | All team members working |
| Re-planning needed | < 15% of tasks |

## Related Steps

- Previous: [Step 8: Sprint Commitment](Step-08-Sprint-Commitment.md)
- Next Phase: [Architecture & Design](../02-Architecture-Design/README.md)

---

*This concludes the Product Feedback & Discovery and Planning phase. The team is now ready to begin technical work in the Architecture & Design phase.*
