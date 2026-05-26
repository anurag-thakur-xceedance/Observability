# Step 8: Sprint Commitment

## Purpose

Establish a realistic sprint scope that the team confidently commits to delivering while achieving the sprint goal.

## Process

### Input
- Prioritized, estimated backlog
- Team capacity
- Sprint goal
- Dependencies and risks

### Activities

1. **Capacity Calculation**
   - Determine team availability
   - Account for planned absences
   - Factor in meetings and ceremonies
   - Apply focus factor

2. **Scope Selection**
   - Select items matching capacity
   - Ensure alignment with sprint goal
   - Balance different work types
   - Consider dependencies

3. **Team Discussion**
   - Review selected items
   - Validate estimates
   - Identify risks
   - Confirm feasibility

4. **Commitment**
   - Team agrees to scope
   - Sprint goal confirmed
   - Commitment documented

### Output
- Committed sprint scope
- Sprint goal
- Identified risks and mitigations
- Team commitment

## Capacity Calculation

### Individual Capacity

```
Available Hours = (Working Days × Hours/Day) - Planned Absences

Productive Hours = Available Hours × Focus Factor

Story Points Capacity = Productive Hours / Average Hours per Point
```

### Team Capacity Example

```yaml
Sprint: 2026.Q1.S3
Duration: 10 working days

Team Member Capacity:
  - Alice: 10 days × 6 hrs = 60 hrs → 24 points
  - Bob: 8 days × 6 hrs = 48 hrs → 19 points  (2 days PTO)
  - Carol: 10 days × 6 hrs = 60 hrs → 24 points
  - Dave: 10 days × 6 hrs = 60 hrs → 24 points

Total Team Capacity: 91 points

Focus Factor: 0.85 (normal sprint)
Adjusted Capacity: 77 points
```

### Focus Factor Guidelines

| Scenario | Factor | Rationale |
|----------|--------|-----------|
| Normal sprint | 0.85 | Standard interruptions |
| Holiday period | 0.70 | Reduced focus |
| Major release | 0.75 | Release activities |
| New team member | 0.75 | Onboarding overhead |
| Hackathon/training | 0.60 | Dedicated time away |

## Sprint Goal

### Characteristics of Good Sprint Goals

- **Specific** - Clear, not vague
- **Achievable** - Realistic for the sprint
- **Valuable** - Delivers meaningful value
- **Measurable** - Can verify completion

### Examples

✅ Good Sprint Goals:
- "Complete user authentication migration to OAuth 2.0"
- "Launch customer dashboard beta to pilot users"
- "Reduce API response time to under 200ms"

❌ Poor Sprint Goals:
- "Work on authentication" (too vague)
- "Complete all bugs" (not specific)
- "Make progress on Q1 initiatives" (not measurable)

## Commitment Conversation

### Questions to Answer

1. **Can we complete this?**
   - Does capacity match scope?
   - Are there blocking dependencies?
   - Do we have the skills needed?

2. **Will we achieve the goal?**
   - Do selected items support the goal?
   - Is there flexibility if issues arise?
   - What's the minimum viable scope?

3. **What are the risks?**
   - Known unknowns?
   - External dependencies?
   - Technical challenges?

### Commitment Statement

```
As a team, we commit to:
- Delivering [X story points / Y items]
- Achieving: [Sprint Goal]
- By: [Sprint End Date]

We acknowledge these risks:
- [Risk 1]
- [Risk 2]

And will mitigate by:
- [Mitigation 1]
- [Mitigation 2]
```

## Scope Protection

### What's In Scope
- Committed sprint backlog items
- Associated testing
- Code reviews
- Documentation updates

### What's Out of Scope
- Unplanned work (goes to next sprint)
- Scope creep on committed items
- New feature requests

### Handling Mid-Sprint Changes

```
If change is requested:
  1. Evaluate impact on sprint goal
  2. If critical: swap equal-sized item out
  3. If not critical: add to next sprint
  4. Never silently add scope
  5. Document the change
```

## Definition of Done (DoD)

Commitment includes meeting the Definition of Done:

- [ ] Code complete and compiles
- [ ] Unit tests written and passing
- [ ] Code review completed
- [ ] Integration tests passing
- [ ] Documentation updated
- [ ] Security scan passing
- [ ] Deployed to staging
- [ ] Acceptance criteria verified
- [ ] Product Owner accepted

## Best Practices

1. **Be Realistic** - Don't over-commit
2. **Protect the Goal** - Everything should support it
3. **Leave Buffer** - Plan for the unexpected (~10-15%)
4. **Team Decision** - The team commits, not management
5. **Document It** - Record what was committed and why

## Warning Signs

| Sign | Implication |
|------|-------------|
| Team hesitant to commit | Scope too large or unclear |
| No clear sprint goal | Unfocused sprint |
| Many dependencies | Risk of blockage |
| Capacity > historical velocity | Overcommitment likely |
| Items not refined | Sprint planning will fail |

## Metrics

| Metric | Target |
|--------|--------|
| Sprint commitment predictability | > 85% |
| Sprint goal achievement | > 90% |
| Scope changes per sprint | < 10% |
| Commitment accuracy | ±15% |

## Related Steps

- Previous: [Step 7: Estimation](Step-07-Estimation.md)
- Next: [Step 9: Sprint Planning](Step-09-Sprint-Planning.md)
