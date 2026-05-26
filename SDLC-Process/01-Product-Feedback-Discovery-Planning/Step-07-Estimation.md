# Step 7: Estimation

## Purpose

Provide consistent, reliable estimates for backlog items to enable capacity planning and sprint commitment.

## Process

### Input
- Refined backlog items
- Acceptance criteria
- Technical approach
- Historical data

### Activities

1. **Estimation Session**
   - Review item requirements
   - Discuss complexity factors
   - Compare to reference stories
   - Reach team consensus

2. **Complexity Assessment**
   - Technical complexity
   - Domain complexity
   - Integration complexity
   - Testing complexity

3. **Risk Consideration**
   - Unknown factors
   - Dependencies on others
   - Technology unfamiliarity
   - Requirement uncertainty

4. **Calibration**
   - Compare to completed items
   - Adjust based on actuals
   - Maintain consistency

### Output
- Estimated backlog items
- Confidence levels
- Identified risks

## Estimation Techniques

### Story Points (Fibonacci)

Use the modified Fibonacci sequence: 1, 2, 3, 5, 8, 13, 20, 40, 100

| Points | Meaning |
|--------|---------|
| 1 | Trivial, well-understood, quick |
| 2 | Simple, straightforward |
| 3 | Small but some complexity |
| 5 | Medium complexity, understood approach |
| 8 | Complex, multiple components |
| 13 | Large, significant effort, some unknowns |
| 20 | Very large, should consider splitting |
| 40+ | Epic-level, must be split |

### T-Shirt Sizing

| Size | Story Points Equivalent | Description |
|------|------------------------|-------------|
| XS | 1-2 | Hours of work |
| S | 3 | 1-2 days |
| M | 5 | 3-5 days |
| L | 8 | 1 week |
| XL | 13 | 1-2 weeks |
| XXL | 20+ | Split required |

### Planning Poker

1. Product Owner presents the item
2. Team discusses and asks questions
3. Each team member privately selects an estimate
4. All reveal simultaneously
5. High/low estimators explain reasoning
6. Discuss and re-vote if needed
7. Consensus reached (or average/round up)

## Reference Stories

Maintain a set of reference stories for calibration:

```yaml
Reference Stories:
  1-point:
    - "Update button text from 'Submit' to 'Save'"
    - "Add tooltip to form field"
  
  3-point:
    - "Add new field to existing form with validation"
    - "Create new API endpoint for existing data"
  
  5-point:
    - "Implement new search filter with UI"
    - "Add export to CSV functionality"
  
  8-point:
    - "Create new dashboard widget with data aggregation"
    - "Integrate with new external API"
  
  13-point:
    - "Implement new authentication flow"
    - "Create new report with multiple data sources"
```

## Estimation Considerations

### Include in Estimate
- Development time
- Unit testing
- Code review time
- Bug fixing
- Documentation updates
- Integration testing support

### Exclude from Estimate
- Sprint ceremonies
- General meetings
- Unplanned work buffer
- Environment setup (unless story-specific)

## Handling Uncertainty

### High Uncertainty → Spike

If an item cannot be estimated due to unknowns:

```yaml
Type: Spike
Title: "Investigate [technology/approach] for [feature]"
Time-box: 2-4 hours (or 1-2 days max)
Output: 
  - Technical approach recommendation
  - Revised estimates for original story
  - Identified risks
```

### Confidence Levels

| Confidence | Meaning | Action |
|------------|---------|--------|
| High (80%+) | Well understood | Proceed with estimate |
| Medium (50-80%) | Some unknowns | Add risk buffer |
| Low (<50%) | Many unknowns | Create spike first |

## Common Estimation Mistakes

| Mistake | Solution |
|---------|----------|
| Estimating ideal time | Include realistic factors |
| Anchoring on first number | Use planning poker |
| Forgetting testing | Include in Definition of Done |
| Individual estimates | Team consensus |
| Not using references | Maintain reference stories |

## Best Practices

1. **Team Consensus** - The team estimates, not individuals
2. **Relative Sizing** - Compare to known items, not hours
3. **Don't Negotiate** - Estimates aren't commitments
4. **Include Everything** - Development, testing, review
5. **Update with Learning** - Refine as you learn more

## Velocity Tracking

Track team velocity to improve planning:

```
Sprint Velocity = Sum of story points completed

Team Average Velocity = Average over last 3-5 sprints

Sprint Capacity = Team Average Velocity × Focus Factor
```

| Focus Factor | Situation |
|--------------|-----------|
| 1.0 | No interruptions expected |
| 0.8 | Normal sprint |
| 0.6 | Holidays or team changes |
| 0.5 | Major disruptions expected |

## Metrics

| Metric | Target |
|--------|--------|
| Estimation accuracy | ±20% |
| Items with estimates | 100% (for sprint items) |
| Velocity consistency | σ < 15% |
| Team participation in estimation | 100% |

## Related Steps

- Previous: [Step 6: Backlog Refinement](Step-06-Backlog-Refinement.md)
- Next: [Step 8: Sprint Commitment](Step-08-Sprint-Commitment.md)
