# AI Toolbox

Practical, role-based guidance to deliver software with AI while keeping quality high.

This repo is built for:
- BA (business analysis and requirements)
- Dev (implementation and refactoring)
- QA (validation and test strategy)

## Start Here

1. Follow the learner path in `.ai/guides/LEARNING-PATH.md`
2. Pick your starting scenario in `.ai/guides/START-HERE.md`
3. Run the kickoff one-pager: `.ai/guides/TEAM-KICKOFF-CHECKLIST.md`
4. Align on delivery standards in `.ai/guides/AI-INSTRUCTIONS.md`
5. Use the role playbooks:
- `.ai/roles/BA.md`
- `.ai/roles/DEV.md`
- `.ai/roles/QA.md`
6. Use cross-craft handoffs to coordinate delivery:
- `.ai/guides/CROSS-CRAFT-HANDOFFS.md`
7. Run an audit before major implementation:
- `.ai/guides/QUALITY-AUDIT.md`
8. Run security gate before merge:
- `.ai/guides/SECURITY-OWASP-TOP10.md`
9. Choose execution mode:
- New build or major scaffold: `.ai/guides/SCAFFOLD-AND-ACCELERATE.md`
- Existing project acceleration: `.ai/guides/SCAFFOLD-AND-ACCELERATE.md`

## What Is In This Repository

- `.ai/memory`: architecture standards and decisions
- `.ai/specs`: source of truth for deterministic feature specs
- `.ai/hooks`: quality checks and guardrails
- `.ai/agents`: delegated task definitions
- `.ai/plugins`: prompt and scaffold templates
- `.ai/roles`: role playbooks
- `.ai/guides`: process and execution guidance

## Agent Shortcuts

- Dev implementation agent:
  `.ai/agents/dev-agent.md`

## AI Tooling Guidance

- Safe prototyping using hosted builders:
  `.ai/guides/PROTOTYPING-SAFETY.md`
- Team workflows for Claude, Gemini, and GitHub Copilot:
  `.ai/guides/AI-WORKFLOWS.md`
- Prompting guide for engineers:
  `.ai/guides/PROMPTING-FOR-ENGINEERS.md`
- CLI vs IDE usage guide:
  `.ai/guides/CLI-VS-IDE.md`
- Design system docs with DESIGN.md:
  `.ai/guides/DESIGN-MD-GUIDE.md`
- OWASP security checklist:
  `.ai/guides/SECURITY-OWASP-TOP10.md`
- AI code quality tool selection:
  `.ai/guides/AI-CODE-QUALITY-TOOLS.md`

## Spec-Driven Development Modes

- Spec-first: write a strong spec first, then run AI-assisted implementation from that spec.
- Spec-anchored: keep the spec after delivery and continue evolving feature behavior through it.
- Spec-as-source: treat the spec as the main source over time and regenerate/update code from spec changes.

## External References

- Curated references and summaries:
  `.ai/references/sdd-references.md`

## Quick Team Flow

1. BA creates or updates spec from `.ai/specs/templates/feature.spec.md`
  Use `.ai/specs/features/customer-search.spec.md` as a completed example.
2. Dev implements from spec and standards, not from vague prompts
3. QA validates happy path, negative path, edge cases, and regressions
4. Team audits against checklist before merge

## Design Template

- Start your project design system file from:
  `.ai/specs/templates/DESIGN.md`

## Repository Setup

- Ignore local/editor/build artifacts with `.gitignore`
- Apply recommended repo controls from `.github/REPOSITORY-SETTINGS.md`
- Use `.github/pull_request_template.md` for traceable spec-linked changes
- Follow contribution standards in `CONTRIBUTING.md`
- Follow vulnerability process in `SECURITY.md`
- Use ownership routing in `.github/CODEOWNERS` and `.github/REVIEW-ROUTING.md`
- Use issue intake templates in `.github/ISSUE_TEMPLATE/`
- CI gate runs in `.github/workflows/quality-gates.yml`

## Operational Additions

- Golden path example:
  `.ai/examples/golden-path-feature-delivery.md`
- Monthly quality KPI cadence:
  `.ai/guides/QUALITY-SCORECARD.md`
