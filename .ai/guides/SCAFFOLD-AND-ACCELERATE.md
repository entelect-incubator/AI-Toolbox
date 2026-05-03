# Scaffold New Projects And Accelerate Existing Ones

## Track A: New Project Scaffolding

1. Run intake questions from `.ai/guides/START-HERE.md`
2. Define first release scope and non-scope
3. Create foundational specs from `.ai/specs/templates/feature.spec.md`
4. Set architecture and standards in `.ai/memory/architecture.md` and `.ai/memory/standards.md`
5. Generate initial modules from prompt templates
6. Add baseline tests, CI checks, and quality hooks
7. Run quality audit before first release candidate

## Track B: Existing Project Acceleration

1. Run quality audit to identify highest-value gaps
2. Select top 2 to 3 modernization targets
3. Write specs for only those target slices
4. Refactor or scaffold in thin vertical increments
5. Add missing tests for changed behavior first
6. Enforce guardrails with hooks and PR checks
7. Repeat in short cycles with measurable outcomes

## Prioritization Matrix

Score each candidate initiative from 1 to 5:
- Business value
- User impact
- Risk reduction
- Delivery effort (inverse score)

Focus first on highest total score.

## Minimum Delivery Controls

- Every change maps to a spec
- Every spec maps to acceptance tests
- Every PR contains risk notes and validation evidence
- No production release without negative-path coverage

## Practical Examples

Example: new project first month
- Week 1: intake, kickoff, and three core feature specs.
- Week 2: scaffold first module and baseline test suite.
- Week 3: add observability and security checks.
- Week 4: audit and release candidate readiness review.

Example: legacy acceleration cycle
- Select payment retry as top value-risk target.
- Write focused spec slice.
- Refactor only retry module and add regression tests.
- Measure reduction in incident count after release.
