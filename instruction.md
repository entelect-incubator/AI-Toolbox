# AI Toolbox

This file is kept for continuity. Use `README.md` as the primary entry point.

Primary navigation:
- README.md
- CONTRIBUTING.md
- SECURITY.md
- .ai/guides/LEARNING-PATH.md
- .ai/guides/START-HERE.md
- .ai/guides/TEAM-KICKOFF-CHECKLIST.md
- .ai/guides/CROSS-CRAFT-HANDOFFS.md
- .ai/guides/AI-INSTRUCTIONS.md
- .ai/guides/AI-WORKFLOWS.md
- .ai/guides/PROMPTING-FOR-ENGINEERS.md
- .ai/guides/CLI-VS-IDE.md
- .ai/guides/SECURITY-OWASP-TOP10.md
- .ai/guides/AI-CODE-QUALITY-TOOLS.md
- .ai/guides/QUALITY-SCORECARD.md
- .ai/guides/DESIGN-MD-GUIDE.md
- .ai/guides/QUALITY-AUDIT.md
- .ai/guides/SCAFFOLD-AND-ACCELERATE.md
- .ai/examples/golden-path-feature-delivery.md
- .ai/references/sdd-references.md

This repository is a practical AI delivery toolbox for:
- BA (business analysis and requirements)
- Dev (implementation and refactoring)
- QA (validation and test design)
- Architecture and standards governance

It follows a 5-layer model inspired by your reference:
1. Memory layer
2. Knowledge/spec layer
3. Guardrail layer
4. Delegation layer
5. Distribution/prompt layer

## SDD Modes (Core Concepts)

- Spec-first: write the feature spec first, then use it for AI-assisted development.
- Spec-anchored: keep the spec after implementation and evolve the feature through spec updates.
- Spec-as-source: treat the spec as the long-term source file and minimize direct human edits to generated code.

Reference summary:
- .ai/references/sdd-references.md

## Folder Map

- .ai/memory: architecture, standards, and decisions
- .ai/specs: source of truth for machine-readable specs
- .ai/hooks: validation scripts and quality guardrails
- .ai/agents: bounded task definitions for subagents
- .ai/plugins: prompts and BEADS-like generation templates
- .ai/roles: role-specific ways of working

## Quick Start

1. BA writes feature specs from .ai/specs/templates/feature.spec.md
2. Dev runs generation workflow using .ai/plugins/copilot-prompts/generate-feature.md
3. QA derives tests from acceptance criteria using .ai/plugins/copilot-prompts/qa-test-plan.md
4. Team runs checks from .ai/hooks before merge

## Suggested Team Flow

1. BA: Create or update a feature spec in .ai/specs/features
2. Architect: Confirm alignment with .ai/memory/architecture.md and .ai/memory/standards.md
3. Dev: Generate scaffold and implement in src/modules/<feature>
4. QA: Validate behavior and non-functional requirements
5. Merge only when spec, code, and tests are traceable

## Initial Setup Checklist

- [ ] Fill in architecture conventions in .ai/memory/architecture.md
- [ ] Fill in coding/security standards in .ai/memory/standards.md
- [ ] Add your first 3 to 5 feature specs in .ai/specs/features
- [ ] Tune generation templates in .ai/plugins/beads/templates
- [ ] Wire hook scripts into your CI pipeline
