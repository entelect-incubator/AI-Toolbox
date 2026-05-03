# Prompt: Generate Feature Module

You are generating production-grade code from a deterministic spec.

Inputs:
- Spec path: {{spec_path}}
- Feature name: {{feature_name}}

Constraints:
- Follow .ai/memory/architecture.md
- Follow .ai/memory/standards.md
- Implement only what the spec states
- No invented requirements
- Include secure defaults and input validation at boundaries
- Flag applicable OWASP Top 10 risks and mitigation notes

Output structure:
- src/modules/{{feature_name}}/api
- src/modules/{{feature_name}}/service
- src/modules/{{feature_name}}/model
- src/modules/{{feature_name}}/tests

Required output:
1. Route/controller skeleton
2. Service skeleton
3. Model or DTO skeleton
4. Test skeleton aligned to acceptance criteria
5. Security checklist notes for impacted OWASP categories
