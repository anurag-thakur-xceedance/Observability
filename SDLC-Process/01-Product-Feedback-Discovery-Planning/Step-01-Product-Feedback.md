# Step 1: Product Feedback

## Purpose

Capture, analyze, and organize product feedback from customers, stakeholders, and internal teams to inform product direction and improvement.

## Process

### Input
- Customer feedback (support tickets, surveys, interviews)
- Stakeholder requests
- Market research
- Analytics and usage data
- Internal team observations

### Activities

1. **Collect Feedback**
   - Monitor support channels for recurring issues
   - Review customer survey responses
   - Analyze product usage analytics
   - Gather input from sales and customer success teams

2. **Categorize Feedback**
   - Bug reports
   - Feature requests
   - Usability improvements
   - Performance concerns
   - Security requirements

3. **Analyze Patterns**
   - Identify common themes
   - Quantify impact (number of users affected)
   - Assess business value
   - Evaluate technical feasibility

4. **Document Insights**
   - Create summary reports
   - Link feedback to existing backlog items
   - Flag urgent issues for immediate attention

### Output
- Documented feedback items
- Prioritized feedback summary
- Linked Azure DevOps work items

## Azure DevOps Integration

### Creating Feedback Items

```
Work Item Type: Feature or Bug
Tags: customer-feedback, [source-channel]
Fields:
  - Title: Clear summary of feedback
  - Description: Detailed feedback with context
  - Customer Impact: Number of customers/requests
  - Business Value: Estimated value if addressed
```

### Useful Queries

- All open feedback items
- Feedback by source/channel
- High-impact feedback not yet prioritized

## Best Practices

1. **Respond Promptly** - Acknowledge feedback within 24-48 hours
2. **Be Specific** - Document exact quotes and scenarios
3. **Quantify Impact** - Always note how many users/customers are affected
4. **Close the Loop** - Notify customers when their feedback is addressed
5. **Regular Review** - Hold weekly feedback triage sessions

## Metrics

| Metric | Target |
|--------|--------|
| Feedback response time | < 48 hours |
| Feedback to backlog conversion rate | > 60% |
| Customer feedback items addressed per sprint | ≥ 2 |

## Related Steps

- Next: [Step 2: Change Request & Feature](Step-02-Change-Request-Feature.md)
- Related: [Step 5: Prioritization](Step-05-Prioritization.md)
