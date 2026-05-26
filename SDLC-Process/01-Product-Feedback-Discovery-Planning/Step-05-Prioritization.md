# Step 5: Prioritization

## Purpose

Establish a consistent, transparent process for prioritizing backlog items based on business value, risk, and strategic alignment.

## Process

### Input
- Product backlog items
- Business value assessments
- Technical complexity estimates
- Strategic objectives
- Stakeholder input

### Activities

1. **Value Assessment**
   - Quantify business impact
   - Assess customer value
   - Evaluate strategic alignment
   - Consider revenue/cost impact

2. **Cost/Effort Analysis**
   - Review technical complexity
   - Consider team capacity
   - Account for dependencies
   - Factor in risk

3. **Priority Calculation**
   - Apply prioritization framework
   - Compare relative priorities
   - Resolve conflicts
   - Document decisions

4. **Stakeholder Alignment**
   - Review priorities with stakeholders
   - Address concerns
   - Gain consensus
   - Communicate decisions

### Output
- Prioritized backlog
- Priority rationale documentation
- Stakeholder agreement

## Prioritization Frameworks

### WSJF (Weighted Shortest Job First)

```
WSJF = Cost of Delay / Job Size

Cost of Delay = User-Business Value + Time Criticality + Risk Reduction

Scale: 1, 2, 3, 5, 8, 13, 20
```

| Factor | 1 | 5 | 13 | 20 |
|--------|---|---|----|----|
| User-Business Value | Minimal | Moderate | High | Critical |
| Time Criticality | Anytime | This quarter | This month | Immediate |
| Risk Reduction | None | Low | Medium | High |

### MoSCoW Method

| Priority | Definition | Percentage of Effort |
|----------|------------|---------------------|
| **Must Have** | Critical for release | 60% |
| **Should Have** | Important but not critical | 20% |
| **Could Have** | Desirable if time permits | 15% |
| **Won't Have** | Out of scope for now | 5% (planning only) |

### Priority Matrix (Impact vs Effort)

```
High Impact ┌─────────────┬─────────────┐
            │   SCHEDULE  │     DO      │
            │   (Plan It) │   (Do Now)  │
            ├─────────────┼─────────────┤
            │    AVOID    │   CONSIDER  │
            │ (Don't Do)  │  (If Time)  │
Low Impact  └─────────────┴─────────────┘
            High Effort    Low Effort
```

## Priority Levels in Azure DevOps

| Priority | Meaning | Response |
|----------|---------|----------|
| 1 - Critical | Business-critical, no workaround | Immediate action |
| 2 - High | Major impact, workaround exists | This sprint |
| 3 - Medium | Moderate impact | This quarter |
| 4 - Low | Minor impact | When capacity allows |

## Prioritization Ceremony

### Weekly Prioritization Meeting

**Attendees:** Product Owner, Tech Lead, Key Stakeholders

**Agenda:**
1. Review new items (10 min)
2. Assess business value (15 min)
3. Review technical complexity (10 min)
4. Calculate priorities (10 min)
5. Resolve conflicts (10 min)
6. Document decisions (5 min)

## Decision Criteria

When two items have similar priority scores, consider:

1. **Dependencies** - Does one unblock others?
2. **Risk** - Is there regulatory or security urgency?
3. **Learning** - Does one provide information for others?
4. **Customer Promise** - Has a commitment been made?
5. **Technical Decay** - Will delay make it harder?

## Best Practices

1. **Be Objective** - Use data and frameworks, not gut feelings
2. **Document Rationale** - Record why decisions were made
3. **Regular Review** - Priorities change; review regularly
4. **Stakeholder Buy-in** - Ensure agreement on criteria
5. **Transparent Process** - Make prioritization visible

## Common Pitfalls

| Pitfall | Solution |
|---------|----------|
| HiPPO (Highest Paid Person's Opinion) | Use data-driven frameworks |
| Recency bias | Regular review of full backlog |
| Squeaky wheel syndrome | Quantify impact objectively |
| Analysis paralysis | Time-box prioritization sessions |

## Metrics

| Metric | Target |
|--------|--------|
| Backlog items with priority | 100% |
| Priority decisions documented | 100% |
| Stakeholder priority disputes | < 10% |
| Priority changes per sprint | < 20% |

## Related Steps

- Previous: [Step 4: Sprint/Kanban Backlog](Step-04-Sprint-Kanban-Backlog.md)
- Next: [Step 6: Backlog Refinement](Step-06-Backlog-Refinement.md)
