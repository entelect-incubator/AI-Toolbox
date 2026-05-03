# Cross-Craft Handoffs (BA -> Dev -> QA)

Use this map so each craft knows what to receive, what to deliver, and where to go next.

## Flow Overview

1. BA prepares spec package
2. Dev implements against spec package
3. QA validates against spec package
4. Team closes gaps through audit and updates spec

## BA -> Dev Handoff

BA sends:
- Approved feature spec path
- Acceptance criteria list
- Constraints, assumptions, and non-scope

Dev checks before coding:
- Spec is testable and deterministic
- Inputs/outputs/contracts are clear
- Open questions are resolved or flagged

Next docs:
- `.ai/roles/DEV.md`
- `.ai/guides/AI-WORKFLOWS.md`

## Dev -> QA Handoff

Dev sends:
- Implemented scope summary mapped to acceptance criteria
- Test evidence (happy, negative, edge)
- Known risks and deferred items

QA checks before validation:
- Every acceptance criterion is covered
- Critical paths have automated tests
- Failure behavior is explicit and reproducible

Next docs:
- `.ai/roles/QA.md`
- `.ai/guides/QUALITY-AUDIT.md`

## QA -> BA/Dev Feedback Loop

QA sends:
- Defects with reproducible steps
- Spec mismatches and ambiguity findings
- Coverage gaps and release risks

Team action:
- Update spec first when behavior changes are needed
- Re-run implementation/test cycle
- Record remaining risks and decision owners

## Handoff Done Criteria

- Inputs are complete for the receiving craft
- Decisions and assumptions are documented
- Evidence is attached, not implied
- Next owner is explicit

## Practical Examples

Example: BA to Dev handoff package
- Spec: checkout-retry.feature.md
- Acceptance criteria: AC-1 to AC-7 mapped.
- Constraints: PCI requirement, no schema change in Sprint 1.

Example: Dev to QA evidence package
- Test report shows happy and negative coverage.
- Known risk: retry backoff tuning deferred.
- QA receives reproducible steps for all touched flows.
