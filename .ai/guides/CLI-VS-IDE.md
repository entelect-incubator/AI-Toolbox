# CLI vs IDE: When To Use Which

Use both. The best teams switch based on task type.

## Quick Rule

- Use IDE for understanding, editing, refactoring, and reviewing code.
- Use CLI for repeatable automation, scripts, CI parity, and bulk operations.

## Use IDE When

- You need deep code navigation (references, rename, symbol search)
- You are iterating on implementation details
- You are debugging with breakpoints and inline inspections
- You are writing or reviewing tests line-by-line
- You are doing cross-craft collaboration (BA/Dev/QA) with visible context

## Use CLI When

- You need deterministic repeatable workflows (`build`, `test`, `lint`)
- You need batch or repo-wide operations
- You need CI-equivalent checks locally
- You are scaffolding, validating specs, or running hooks
- You need scripting for consistent team execution

## Typical AI Delivery Workflow

1. IDE: read spec, design implementation, draft changes
2. CLI: run checks (`lint`, `test`, security scans)
3. IDE: fix findings and finalize review
4. CLI: run final pre-commit/CI-equivalent commands

## Decision Matrix

- Exploratory coding and design: IDE first
- Repeatable quality gates: CLI first
- One-file focused bug fix: IDE first, then CLI validate
- Multi-file mechanical update: CLI/script first, then IDE review
- Release readiness checks: CLI first

## Minimum CLI Command Set (Project-Agnostic)

- Format/lint
- Unit/integration tests
- Dependency vulnerability scan
- Spec validation hook
- Pre-commit quality gate

## Common Anti-Patterns

- IDE-only workflow with no CLI validation before PR
- CLI-only workflow with no semantic code review in IDE
- Running different commands locally than CI
- Skipping security checks for "small" changes

## Team Standard Recommendation

- Keep source editing and reasoning in IDE
- Keep validation and release confidence in CLI
- Document canonical CLI commands in repo docs and CI

## Practical Examples

Example: bug fix workflow
1. IDE: locate and fix null-handling bug in one service.
2. CLI: run unit tests and lint.
3. IDE: review diff for readability.
4. CLI: run pre-commit checks.

Example: bulk migration workflow
1. CLI: run codemod across module tree.
2. CLI: run tests to catch broad regressions.
3. IDE: inspect critical files and refine edge cases.
