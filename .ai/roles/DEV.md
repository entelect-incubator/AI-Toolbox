# Dev Role Playbook

Mission:
- Implement production-ready code aligned to approved specs.

Responsibilities:
- Generate initial scaffold from spec and prompt templates
- Refine business logic, integration behavior, and error handling
- Keep code traceable to spec sections and acceptance criteria

Engineering checklist:
- Apply SOLID and clean-code principles where they improve maintainability
- Keep modules cohesive with explicit dependencies
- Handle failures explicitly with meaningful error responses
- Add observability for critical business flows
- Remove generated noise and weak abstractions before merge

Testing minimums:
- Happy path tests for key acceptance criteria
- Negative path tests for validation and failure behavior
- Edge-case tests for boundary conditions

Definition of done:
- Code, tests, and docs are consistent with spec
- Security and quality standards are met
- No invented requirements outside approved scope

Handoff to QA:
- Provide criteria-to-test mapping and implementation summary
- Include evidence for happy, negative, and edge path coverage
- Next read: `.ai/guides/CROSS-CRAFT-HANDOFFS.md`
