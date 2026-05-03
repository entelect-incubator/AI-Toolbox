# AI Workflows: Claude, Gemini, And GitHub Copilot

This guide defines a controlled way to use AI tools without losing quality.

## Workflow Pattern

1. BA writes or updates spec
2. Dev prompts AI with spec context and constraints
3. Dev reviews and refactors generated output
4. QA derives test plan and executes validation
5. Team runs audit checklist before merge

Agent option for Dev implementation:
- Use `.ai/agents/dev-agent.md` when generating or refactoring feature code.

## Prompt Contract (Use In Any Tool)

Always include:
- Goal and scope
- Non-scope
- Input/output contract
- Constraints (security, performance, architecture)
- Acceptance criteria
- Required tests (happy, negative, edge)

## Claude Usage Pattern

- Use for deeper reasoning, architecture options, and refactor planning
- Ask for alternatives with trade-offs, not single-path answers
- Request explicit assumptions and open questions

Suggested prompt structure:
- Context
- Problem
- Constraints
- Required output format
- Validation checklist

## Gemini Usage Pattern

- Use for broad ideation, comparative options, and design/content exploration.
- Use strong constraints and explicit acceptance criteria before code generation.
- Keep output bounded to requested scope and ask for assumptions explicitly.

## GitHub Copilot Usage Pattern

- Use for in-editor implementation and test scaffolding
- Keep prompts local to file/module context
- Generate small chunks and validate frequently
- Prefer iterative generation over large one-shot output

## MCPs (Short Guide)

- MCPs connect AI to external tools (repo, issues, docs, CI, etc.) with explicit boundaries.
- Use MCP calls for deterministic data retrieval and workflow automation, not for replacing product decisions.
- Keep permissions least-privilege and log critical automation actions.

## Skills (Short Guide)

- Skills are reusable task playbooks the agent can invoke for specialized work.
- Keep skills narrow, explicit, and testable.
- Prefer a small set of high-quality skills over many overlapping ones.

## Mandatory Human Review

- Verify correctness against accepted spec
- Remove invented requirements
- Check error handling and boundary validation
- Ensure tests prove behavior, not implementation details

## Practical Examples

Example 1: Claude for design decision
- Ask Claude for three architecture options for rate limiting.
- Require trade-offs on latency, complexity, and failure modes.
- Select one option before coding.

Example 2: Gemini for option comparison
- Ask Gemini to compare two UX flows for onboarding.
- Require measurable pros/cons and risk notes.
- Convert selected flow into acceptance criteria.

Example 3: Copilot for implementation slice
- Prompt Copilot in a single file scope.
- Generate one function and related tests.
- Run tests and iterate in small increments.

Example 4: Dev agent with pattern guidance
- Input spec path and architecture constraints.
- Require SOLID/DRY/Clean Code checks in output.
- Use design-pattern reference only when it improves clarity and testability.
