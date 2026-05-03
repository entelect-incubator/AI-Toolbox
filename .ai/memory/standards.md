# Standards

## Coding
- Prefer readable, testable code over compact tricks
- Keep functions small and side effects explicit
- Add tests for success, failure, and edge paths

## Security
- Validate all external inputs
- Enforce auth and authorization at boundary layers
- Never commit secrets; use environment-managed configuration

## Quality
- Lint and tests must pass before merge
- Generated code is a starting point, not final truth
- QA acceptance criteria must map to spec acceptance criteria
