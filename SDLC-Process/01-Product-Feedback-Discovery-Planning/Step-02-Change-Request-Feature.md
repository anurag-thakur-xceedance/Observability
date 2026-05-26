# Step 2: Change Request & Feature

## Purpose

Formally document and evaluate change requests and new feature proposals to ensure proper analysis and tracking.

## Process

### Input
- Product feedback items
- Stakeholder requests
- Technical improvements
- Compliance requirements
- Market/competitive analysis

### Activities

1. **Submit Change Request/Feature**
   - Use standard template for consistency
   - Include business justification
   - Identify impacted systems/components
   - Estimate rough scope

2. **Initial Review**
   - Verify completeness of submission
   - Check for duplicates
   - Assess alignment with product strategy
   - Identify key stakeholders

3. **Impact Analysis**
   - Technical feasibility assessment
   - Resource requirements estimate
   - Risk identification
   - Dependencies mapping

4. **Approval Workflow**
   - Product Owner review
   - Technical lead review (for significant changes)
   - Stakeholder sign-off (for major features)

### Output
- Approved Feature/Change Request work items
- Initial sizing estimates
- Identified risks and dependencies

## Work Item Templates

### Feature Request

```yaml
Type: Feature
Fields:
  Title: [ACTION] - [SUBJECT] - [BENEFIT]
  Description: |
    ## Summary
    Brief description of the feature

    ## Business Value
    Why is this important? What problem does it solve?

    ## User Story
    As a [persona], I want [goal] so that [benefit]

    ## Acceptance Criteria
    - [ ] Criterion 1
    - [ ] Criterion 2
    - [ ] Criterion 3

    ## Technical Considerations
    Any known technical constraints or dependencies

  Priority: [1-4]
  Business Value: [Points]
  Effort: [T-Shirt Size: S/M/L/XL]
  Tags: feature-request
```

### Change Request

```yaml
Type: User Story or Bug
Fields:
  Title: [CHANGE] - [Component] - [Description]
  Description: |
    ## Current Behavior
    What happens today?

    ## Requested Change
    What should happen instead?

    ## Justification
    Why is this change needed?

    ## Impact Assessment
    - Systems affected:
    - Users affected:
    - Risk level: [Low/Medium/High]

  Tags: change-request
```

## Approval Matrix

| Change Type | Approver(s) | SLA |
|-------------|-------------|-----|
| Minor Enhancement | Product Owner | 2 days |
| New Feature | Product Owner + Tech Lead | 5 days |
| Major Feature | Product Owner + Architecture Board | 10 days |
| Breaking Change | All stakeholders | 15 days |

## Best Practices

1. **Be Specific** - Vague requests lead to vague outcomes
2. **Include Context** - Explain the "why" not just the "what"
3. **Think Dependencies** - What else will this affect?
4. **Size Appropriately** - Break large features into smaller increments
5. **Link Related Items** - Connect to feedback, bugs, or other features

## Metrics

| Metric | Target |
|--------|--------|
| Request to triage time | < 3 days |
| Approval decision time | Per approval matrix |
| Feature specification quality score | > 80% |

## Related Steps

- Previous: [Step 1: Product Feedback](Step-01-Product-Feedback.md)
- Next: [Step 3: Product Feature/Outcome Backlog](Step-03-Product-Feature-Outcome-Backlog.md)
