# Review Routing

Use this routing model for predictable reviews.

## Required Reviewers By Change Type

- Specs and requirements changes:
  - BA owner
  - Architecture owner
- Implementation and templates:
  - Dev owner
  - QA owner (for acceptance criteria mapping)
- Security-sensitive changes:
  - Security owner
  - QA owner
- CI, policy, and governance changes:
  - Engineering lead

## Pull Request Review Checklist

- Scope matches approved spec
- Acceptance criteria mapping included
- Test evidence includes happy/negative/boundary paths
- OWASP review evidence included where applicable
- Risk and rollback notes included

## Escalation Rules

- Conflicting review feedback: escalate to engineering lead
- High-severity unresolved risk: block merge until decision owner signs off
