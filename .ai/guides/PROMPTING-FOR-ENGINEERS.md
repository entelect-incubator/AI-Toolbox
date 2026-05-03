# Prompting For Engineers

Use this guide to get higher-quality AI output without going in circles.

## Core Rule

Prompt like a software engineer: define scope, constraints, interfaces, and validation before asking for code.

## Prompt Contract (Always Include)

- Objective: what must be delivered
- Scope: what is included
- Non-scope: what is explicitly excluded
- Inputs/outputs: contracts and data shapes
- Constraints: architecture, security, performance, style
- Validation: how success will be tested

## Anti-Circle Strategy

When iteration loops start, reset with this structure:

1. Restate one concrete target
2. Ask for smallest possible change
3. Require explicit assumptions
4. Require test cases before implementation
5. Stop and evaluate against acceptance criteria

## Prompt Patterns That Work

### Pattern 1: Build Small, Validate Fast

- Ask for one thin vertical slice
- Require unit tests first or alongside code
- Request a short risk list for that slice

Example:
- "Implement only input validation for CreateOrder handler. Do not implement persistence yet. Include unit tests for valid payload, missing fields, wrong types, and boundary values."

### Pattern 2: Spec-To-Code

- Provide feature spec path and acceptance criteria
- Instruct model not to invent requirements
- Require mapping from code sections to criteria

### Pattern 3: Review-First

- Ask model to review proposed approach before coding
- Request failure modes and edge cases
- Then request code for approved approach only

## Validation-First Prompting

Always ask for:

- Unit tests for happy, negative, and edge paths
- Contract checks for inputs and outputs
- Error behavior expectations
- Observability hooks for critical flows

Useful validation ask:
- "List the tests that prove this change works and fails safely before writing implementation."

## Reasoning Models Vs Standard Code Models (High Level)

Use reasoning-focused models when:
- You need architecture trade-offs
- You need decomposition of ambiguous requirements
- You need deeper failure analysis and refactor plans

Use fast code-generation models when:
- Scope is clear and local
- You need boilerplate, tests, and mechanical refactors
- You are iterating directly in editor with quick feedback

Practical split:
- Reasoning model: choose plan and constraints
- Code model: implement small steps and tests
- Human: final correctness, safety, and maintainability review

## Good Prompt Hygiene

- Give exact file/module context
- Use stable naming and explicit interfaces
- Forbid hidden side effects and invented requirements
- Ask for deterministic output format
- Keep prompts short but complete

## Definition Of A Good AI-Assisted Change

- Change is within scope
- Tests validate happy, negative, and edge behavior
- No requirement drift
- Code is readable and maintainable
- Risk and assumptions are explicit

## Practical Examples

Example 1: small scoped implementation prompt
- Task: Implement only request validation in src/modules/orders/api/create-order.ts.
- Constraints: No persistence changes. No new endpoints.
- Validation: Add tests for valid payload, missing required field, invalid enum, and max length boundary.

Example 2: review-first prompt
- Review this proposed approach against spec acceptance criteria AC-1 to AC-5.
- Return: risks, missing edge cases, and one recommended approach.
- Do not write code yet.

Example 3: anti-circle reset prompt
- We are looping. Restate goal in one sentence.
- Propose smallest next change only.
- List assumptions and tests before implementation.
