# Contributing Guide

This repository follows a spec-driven workflow.

## Before You Start

1. Read `README.md`
2. Follow `.ai/guides/LEARNING-PATH.md`
3. Confirm role expectations in `.ai/roles/BA.md`, `.ai/roles/DEV.md`, and `.ai/roles/QA.md`

## Standard Contribution Flow

1. Open an issue using `.github/ISSUE_TEMPLATE`
2. Draft or update spec in `.ai/specs`
3. Implement in small scoped changes
4. Validate with tests, security checks, and audit checklist
5. Open PR using `.github/pull_request_template.md`

## Required Quality Gates

- Pass GitHub Actions workflow: `quality-gates`
- Include acceptance-criteria mapping
- Include happy, negative, and boundary-path test evidence
- Include OWASP check evidence for affected surfaces

## Role Handoffs

- BA -> Dev: approved spec and acceptance criteria
- Dev -> QA: implementation summary and test evidence
- QA -> Team: defect/risk feedback and release recommendation

Use `.ai/guides/CROSS-CRAFT-HANDOFFS.md` for full handoff details.
