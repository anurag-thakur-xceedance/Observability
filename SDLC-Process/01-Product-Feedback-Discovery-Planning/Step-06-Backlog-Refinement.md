# Step 6: Backlog Refinement

## Purpose

Continuously refine and detail backlog items to ensure they are ready for sprint planning and development.

## Process

### Input
- Prioritized backlog items
- Stakeholder clarifications
- Technical analysis
- Design artifacts

### Activities

1. **Item Review**
   - Discuss item intent and scope
   - Clarify acceptance criteria
   - Identify edge cases
   - Review with stakeholders as needed

2. **Technical Analysis**
   - Identify technical approach
   - Discuss implementation options
   - Surface technical risks
   - Identify dependencies

3. **Story Splitting**
   - Break large items into smaller pieces
   - Ensure each piece delivers value
   - Maintain testability
   - Keep items independent

4. **Acceptance Criteria Refinement**
   - Make criteria specific and testable
   - Include happy path and edge cases
   - Add non-functional requirements
   - Verify completeness

### Output
- Refined, ready-for-development items
- Updated acceptance criteria
- Identified technical approach
- Sized items

## Refinement Ceremony

### Session Structure

**Frequency:** 1-2 times per week
**Duration:** 1-2 hours
**Attendees:** Development team, Product Owner, Scrum Master

**Agenda:**
1. Review items needing refinement (5 min)
2. Deep dive on each item (15-20 min each)
   - Product Owner presents intent
   - Team asks clarifying questions
   - Discuss technical approach
   - Refine acceptance criteria
   - Initial sizing
3. Wrap-up and next steps (5 min)

## Story Splitting Patterns

### By Workflow Steps
```
Original: "User can purchase a product"
Split:
  - User can add product to cart
  - User can enter shipping address
  - User can enter payment information
  - User can confirm and place order
```

### By Business Rules
```
Original: "Apply discount codes"
Split:
  - Apply percentage discount codes
  - Apply fixed amount discount codes
  - Apply free shipping codes
  - Validate discount code expiration
```

### By Data Variations
```
Original: "Import customer data"
Split:
  - Import customers from CSV
  - Import customers from Excel
  - Import customers from API
```

### By Operations (CRUD)
```
Original: "Manage user profiles"
Split:
  - Create user profile
  - View user profile
  - Update user profile
  - Delete user profile
```

## Acceptance Criteria Format

### Given-When-Then (Gherkin)

```gherkin
Feature: User Login

Scenario: Successful login with valid credentials
  Given I am on the login page
  And I have a valid user account
  When I enter my username and password
  And I click the login button
  Then I should be redirected to the dashboard
  And I should see a welcome message

Scenario: Failed login with invalid password
  Given I am on the login page
  When I enter a valid username
  And I enter an incorrect password
  And I click the login button
  Then I should see an error message "Invalid credentials"
  And I should remain on the login page
```

### Checklist Format

```markdown
## Acceptance Criteria

- [ ] User can enter email and password
- [ ] System validates email format
- [ ] System validates password meets requirements
- [ ] Successful login redirects to dashboard
- [ ] Failed login shows appropriate error
- [ ] Account locks after 5 failed attempts
- [ ] Password field masks input
- [ ] "Remember me" option works correctly
```

## INVEST Criteria

Good user stories are:

| Criteria | Description |
|----------|-------------|
| **I**ndependent | Can be developed without depending on others |
| **N**egotiable | Details can be discussed and refined |
| **V**aluable | Delivers value to user or business |
| **E**stimable | Team can estimate the effort |
| **S**mall | Fits within a sprint |
| **T**estable | Clear criteria for verification |

## Best Practices

1. **Timebox Discussions** - Don't let refinement sessions run long
2. **Look Ahead** - Refine items 1-2 sprints in advance
3. **Involve the Team** - Everyone participates in refinement
4. **Question Assumptions** - Challenge unclear requirements
5. **Document Decisions** - Record what was discussed and decided

## Common Issues

| Issue | Solution |
|-------|----------|
| Items too large | Apply splitting patterns |
| Unclear acceptance criteria | Use Given-When-Then format |
| Missing edge cases | Ask "what if" questions |
| Technical unknowns | Create spike stories |
| Missing stakeholder input | Invite to refinement or get async input |

## Metrics

| Metric | Target |
|--------|--------|
| Refined items per session | 3-5 |
| Items ready for next 2 sprints | 100% |
| Refinement meeting attendance | > 80% |
| Items rejected at sprint planning | < 5% |

## Related Steps

- Previous: [Step 5: Prioritization](Step-05-Prioritization.md)
- Next: [Step 7: Estimation](Step-07-Estimation.md)
