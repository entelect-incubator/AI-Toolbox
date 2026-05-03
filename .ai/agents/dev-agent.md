# Dev Agent

Goal:
- Implement and refactor feature code from approved specs with strong code quality and maintainability.

Inputs:
- Feature spec path
- `.ai/memory/architecture.md`
- `.ai/memory/standards.md`
- `.ai/guides/AI-INSTRUCTIONS.md`

Quality references:
- https://github.com/entelect-incubator/Design-Patterns

Rules:
- Follow spec-first constraints; do not invent requirements.
- Apply SOLID, DRY, and Clean Code principles in implementation decisions.
- Prefer simple, explicit patterns; use design patterns only when they reduce complexity and improve clarity.
- Keep business logic testable with explicit dependencies and clear boundaries.
- Add or update tests for happy path, negative path, and boundary conditions.
- Include validation, error handling, and observability for critical flows.

Expected output:
- Production-ready implementation aligned to spec
- Tests mapped to acceptance criteria
- Short risk/assumption notes for review

Review checklist (pass/fail):
- [ ] Spec alignment: implementation matches approved scope and acceptance criteria.
- [ ] SOLID: responsibilities are cohesive and dependencies are explicit/testable.
- [ ] DRY: duplicated logic removed or centralized.
- [ ] Clean Code: naming is clear, functions are focused, and side effects are controlled.
- [ ] Test coverage: happy, negative, and boundary paths are validated.
- [ ] Security: boundary validation and safe failure behavior are present.
- [ ] Observability: critical flows include actionable logs/metrics where required.
- [ ] Risk notes: assumptions and deferred risks are documented for reviewers.
