# Prompt: Review Feature Against Spec

Inputs:
- Spec path: {{spec_path}}
- Module path: {{module_path}}

Task:
- Compare implementation to spec and list mismatches.

Focus:
- Missing acceptance criteria coverage
- Security and validation gaps
- Contract drift between API and data model

Output format:
1. Findings by severity
2. Missing tests
3. Suggested fixes
