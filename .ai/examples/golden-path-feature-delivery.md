# Golden Path: End-To-End Feature Delivery

Use this as a reference run for spec-driven delivery.

## Scenario

Feature: Order retry on payment timeout.

## Step 1: Intake

- Create issue from `.github/ISSUE_TEMPLATE/feature-intake.md`
- Answer `START-HERE` questions
- Confirm scope/non-scope and risks

## Step 2: BA Spec

- Create spec at `.ai/specs/features/order-retry.md`
- Include happy and negative requirements
- Add Mermaid sequence for timeout and retry/failure branches

## Step 3: Dev Implementation

- Use `.ai/agents/dev-agent.md`
- Generate/implement module changes in small slices
- Keep SOLID/DRY/Clean Code and design-pattern checks

## Step 4: QA Validation

- Build input matrix from acceptance criteria
- Validate happy, negative, and boundary paths
- Capture expected vs actual outcomes

## Step 5: Security Gate

- Run `.ai/guides/SECURITY-OWASP-TOP10.md`
- Document impacted OWASP categories and mitigations

## Step 6: Audit And PR

- Run `.ai/guides/QUALITY-AUDIT.md`
- Open PR using `.github/pull_request_template.md`
- Ensure `quality-gates` workflow passes

## Done Criteria

- Spec and code are aligned
- Tests and security evidence are attached
- Risks and rollback notes are documented
