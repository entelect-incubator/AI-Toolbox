# Design MD Guide

Design MD is a design system document that AI tools can read to generate more consistent UI decisions across a project.

Reference:
- https://stitch.withgoogle.com/docs/design-md/overview

## Why Use DESIGN.md

- Keeps generated UI consistent across pages and components
- Reduces prompt repetition for design direction
- Improves cross-team alignment on tokens and patterns
- Makes review easier because decisions are documented once

## Where To Keep It

- Store as `DESIGN.md` at the project root for easy discovery
- Keep content concise, explicit, and token-driven
- Version it like code and review via pull requests

## Recommended Sections

1. Brand and product intent
2. Color tokens and usage rules
3. Typography scale and font usage
4. Spacing and layout grid rules
5. Component style conventions
6. Motion and interaction principles
7. Accessibility requirements
8. Content and microcopy tone
9. Responsive behavior
10. Do and do-not examples

## Authoring Tips For AI Consumption

- Prefer concrete rules over abstract taste
- Use named tokens rather than raw values in prose
- Include examples of valid and invalid usage
- Keep ambiguous words out ("nice", "modern", "clean") unless defined
- Update DESIGN.md whenever core visual decisions change

## Suggested Workflow

1. Draft first version from product and brand goals
2. Generate one UI slice with AI
3. Review mismatches and tighten DESIGN.md rules
4. Repeat until output is stable
5. Reuse DESIGN.md across new features

## Validation Checklist

- Are colors and typography consistent with tokens?
- Are interactive states defined and visible?
- Is contrast acceptable and keyboard navigation supported?
- Do mobile and desktop layouts follow the same system?
- Are reusable components visually and behaviorally consistent?

## Starter Template

Use `.ai/specs/templates/DESIGN.md` as your baseline and tailor it to your product.

## Practical Examples

Example: token rule in DESIGN.md
- Primary button background must use --color-primary.
- Hover state must darken by one defined token step.
- Disabled state must reduce contrast but remain readable.

Example: AI prompt with design constraints
- Build account settings page using DESIGN.md tokens only.
- Do not introduce new colors or font sizes.
- Include mobile and desktop variants with consistent spacing scale.
