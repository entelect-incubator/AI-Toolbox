# DESIGN.md

## 1. Product Intent

- Product purpose:
- Primary users:
- Desired experience adjectives (max 3, explicitly defined):

## 2. Design Tokens

### Color Tokens

- --color-bg:
- --color-surface:
- --color-text:
- --color-muted:
- --color-primary:
- --color-success:
- --color-warning:
- --color-danger:

Rules:
- Use tokens only, avoid hard-coded one-off colors
- Keep semantic meaning stable across features

### Typography Tokens

- --font-display:
- --font-body:
- --font-mono:
- --text-xs / --text-sm / --text-md / --text-lg / --text-xl:

Rules:
- Heading levels must map to fixed sizes
- Body text must prioritize readability over density

### Spacing And Radius

- --space-1, --space-2, --space-3, --space-4, --space-6, --space-8
- --radius-sm, --radius-md, --radius-lg

## 3. Layout Rules

- Grid system:
- Content width limits:
- Section spacing:
- Mobile breakpoints:

## 4. Component Conventions

- Buttons:
- Inputs:
- Cards:
- Modals:
- Tables/lists:

Interaction states required:
- default, hover, active, focus, disabled, loading, error

## 5. Motion

- Motion principles:
- Duration scale:
- Easing rules:
- Reduced-motion behavior:

## 6. Accessibility

- Minimum contrast requirements:
- Keyboard navigation rules:
- Focus indicator rules:
- Screen reader naming requirements:

## 7. Content And Tone

- Voice and tone:
- Empty state style:
- Error message style:
- CTA copy style:

## 8. Responsive Behavior

- Mobile priority rules:
- Tablet adaptations:
- Desktop enhancements:

## 9. Do / Do Not

Do:
-

Do not:
-

## 10. Acceptance Checks

- [ ] New screens use token system correctly
- [ ] Components follow defined states and behaviors
- [ ] Accessibility requirements validated
- [ ] Mobile and desktop behavior documented
