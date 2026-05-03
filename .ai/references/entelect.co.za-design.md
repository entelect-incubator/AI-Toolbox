---
version: alpha
name: Entelect Dark Orbit
description: A dark, technology-forward corporate system with luminous accents, generous spacing, and restrained editorial typography.
colors:
  primary: "#002850"
  secondary: "#0A4FA3"
  tertiary: "#9EDB1E"
  neutral: "#020101"
  surface: "#0E1630"
  on-surface: "#FFFFFF"
  text-muted: "#D7DCE6"
  border: "#374151"
  error: "#D63C3C"
typography:
  headline-display:
    fontFamily: "Myriad Pro Regular"
    fontSize: "46px"
    fontWeight: 400
    lineHeight: "51px"
    letterSpacing: "0px"
  headline-lg:
    fontFamily: "Myriad Pro Regular"
    fontSize: "42px"
    fontWeight: 400
    lineHeight: "46px"
    letterSpacing: "0px"
  headline-md:
    fontFamily: "Myriad Pro Light"
    fontSize: "28px"
    fontWeight: 400
    lineHeight: "31px"
    letterSpacing: "0px"
  headline-sm:
    fontFamily: "Myriad Pro Regular"
    fontSize: "23px"
    fontWeight: 400
    lineHeight: "26px"
    letterSpacing: "0px"
  body-lg:
    fontFamily: "Myriad Pro Light"
    fontSize: "18px"
    fontWeight: 400
    lineHeight: "28px"
    letterSpacing: "0px"
  body-md:
    fontFamily: "Myriad Pro Light"
    fontSize: "14px"
    fontWeight: 400
    lineHeight: "27px"
    letterSpacing: "0px"
  body-sm:
    fontFamily: "Myriad Pro Light"
    fontSize: "13px"
    fontWeight: 400
    lineHeight: "20px"
    letterSpacing: "0px"
  label-lg:
    fontFamily: "Myriad Pro Light"
    fontSize: "14px"
    fontWeight: 400
    lineHeight: "20px"
    letterSpacing: "0px"
  label-md:
    fontFamily: "Myriad Pro Light"
    fontSize: "13px"
    fontWeight: 400
    lineHeight: "18px"
    letterSpacing: "0px"
  label-sm:
    fontFamily: "Myriad Pro Light"
    fontSize: "12px"
    fontWeight: 400
    lineHeight: "16px"
    letterSpacing: "0px"
rounded:
  none: 0px
  sm: 4px
  md: 8px
  lg: 25px
  xl: 32px
  full: 9999px
spacing:
  xs: 6px
  sm: 14px
  md: 26px
  lg: 36px
  xl: 150px
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-surface}"
    typography: "{typography.label-lg}"
    rounded: "{rounded.lg}"
    padding: "8px 23px"
    height: "40px"
  button-secondary:
    backgroundColor: "transparent"
    textColor: "{colors.on-surface}"
    typography: "{typography.label-lg}"
    rounded: "{rounded.sm}"
    padding: "8px 23px"
    height: "40px"
  button-link:
    backgroundColor: "transparent"
    textColor: "{colors.on-surface}"
    typography: "{typography.label-md}"
    rounded: "{rounded.none}"
    padding: "0px"
  card:
    backgroundColor: "{colors.neutral}"
    textColor: "{colors.on-surface}"
    rounded: "{rounded.md}"
    padding: "16px"
  input:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.on-surface}"
    rounded: "{rounded.sm}"
    padding: "12px"
  chip:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-surface}"
    typography: "{typography.label-sm}"
    rounded: "{rounded.full}"
    padding: "6px 12px"
  navbar-link:
    backgroundColor: "transparent"
    textColor: "{colors.on-surface}"
    typography: "{typography.label-md}"
    rounded: "{rounded.none}"
    padding: "0px"
---

# Entelect Dark Orbit

## Overview
Entelect presents as a polished, enterprise technology brand with a dark cinematic atmosphere and a strong sense of motion. The tone is professional and confident rather than playful, with bright white type and electric blue/green arcs creating a futuristic, innovation-led feel. The layout is spacious and editorial, giving large headlines room to breathe while keeping navigation and calls to action minimal and precise.

## Colors
- **Primary (#002850):** A deep navy-blue used for branded action buttons, darker graphic surfaces, and the company’s core corporate accent.
- **Secondary (#0A4FA3):** A vivid technical blue that supports the luminous orbital artwork and adds energy without overwhelming the interface.
- **Tertiary (#9EDB1E):** A sharp lime-green highlight used sparingly as a glow-like accent, giving the system its signature electric edge.
- **Neutral (#020101):** Near-black background that establishes the site’s dark stage and maximizes contrast for white typography.
- **Surface (#0E1630):** A slightly lifted navy surface for layered panels and content containers that need separation from the base background.
- **On-surface (#FFFFFF):** Pure white used for headlines, navigation, and primary actions to maintain clarity and strong contrast.
- **Text-muted (#D7DCE6):** Soft cool gray for supporting copy and cookie text, preserving readability while reducing visual weight.
- **Border (#374151):** A subdued slate border for cards and subtle structure without breaking the flat dark aesthetic.
- **Error (#D63C3C):** Reserved for validation and destructive states; it should remain rare in this otherwise restrained palette.

## Typography
The system uses Myriad Pro as the dominant voice, with Regular for titles and Light for supporting copy and navigation. Headlines are large, open, and unembellished, with no visible letter-spacing adjustments; the result is a clean corporate editorial rhythm rather than a display-heavy style.

- **Headline Display / LG / MD / SM:** Use Myriad Pro Regular or Light depending on hierarchy. Headlines are composed in sentence case, with generous line heights that keep large blocks of text airy and legible.
- **Body LG / MD / SM:** Body copy uses Myriad Pro Light at smaller sizes, reinforcing the brand’s refined, understated tone. The 14px body style with a 27px line height is especially important for long-form reading.
- **Labels:** Navigation, buttons, and small metadata use lightweight text at 12–14px. There is no uppercase convention visible; instead, clarity comes from spacing, contrast, and placement.

## Layout
The composition is a fluid full-width layout with strong left alignment for content and oversized visual artwork anchored to the right and corners. Sections breathe with very large vertical gaps, using the 150px spacing token to separate major moments like hero, services, and subsequent content blocks.

Use a spacious grid with wide gutters and generous edge padding so the layout never feels crowded. Content cards and modules should sit on subtle dark surfaces with 16px internal padding, while buttons and navigation items remain compact and horizontally balanced.

## Elevation & Depth
Depth is created more through contrast, glow, and layered color fields than through traditional shadow stacking. The interface is mostly flat, but the orbital artwork and occasional soft shadow treatment add a sense of dimensional motion.

Cards use a thin border and a restrained dark surface instead of heavy elevation. Primary buttons may carry a soft shadow effect in richer implementations, but overall the system prefers tonal layering and luminous edges over pronounced material depth.

## Shapes
The shape language is a mix of soft corporate rounding and controlled geometry. Interactive controls lean on pill-like forms for primary actions, while secondary elements use modest 4px to 8px radii for a more formal, architectural feel.

Overall, shapes are smooth but not overly rounded. The large decorative arcs and circular motifs echo the full-radius language used in pills and badges, reinforcing the orbit-inspired brand identity.

## Components
### Buttons
- **Primary (`button-primary`):** The main call to action uses `primary` background, white text, `rounded.lg`, and compact vertical padding for a 40px-tall control. It should feel decisive and solid, with strong contrast and minimal decoration.
- **Secondary (`button-secondary`):** Use a transparent background, white text, and a thin outline style when a lighter action is needed. Keep the form understated and avoid adding fill or heavy shadow.
- **Link (`button-link`):** Use for header actions, text actions, and low-emphasis navigation. It should look like plain text, with zero padding or border treatment.
- Button states should remain subtle; prioritize color shifts and border clarity over large motion or raised depth.

### Cards
- **Card (`card`):** Cards are dark, bordered containers with `rounded.md`, 16px padding, and no shadow. They should feel like organized content panels rather than floating surfaces.
- Use cards to segment services, insights, or supporting content without breaking the overall dark field.

### Inputs
- Inputs should follow the same subdued dark-surface logic as cards, with a modest radius and enough internal padding for comfortable typing.
- Focus states should rely on bright contrast or border color changes, not aggressive glow or thick outlines.

### Navigation and utility items
- Navbar links use small, light-weight white text with no underlines in the default state.
- Dropdown indicators are minimal and should remain visually secondary to the text label.
- Keep utility controls, such as language or cookie actions, compact and aligned to the site’s precise rhythm.

### Chips and badges
- Chips should be pill-shaped, compact, and high-contrast, using the tertiary accent only when emphasis is needed.
- Keep labels short and readable; avoid dense text inside rounded capsules.

## Do's and Don'ts
- Do use a dark navy-to-near-black foundation with white foreground text for maximum clarity.
- Do keep typography light, spacious, and sentence-cased rather than decorative or highly stylized.
- Do preserve generous whitespace between major sections so the page feels premium and breathable.
- Do use blue and lime accents sparingly to reinforce the orbit motif, not to flood the UI.
- Don't introduce bright neutral backgrounds or light-mode surfaces as a dominant pattern.
- Don't rely on heavy shadows, glossy gradients, or thick borders for hierarchy.
- Don't over-round interactive elements; reserve full pills for primary emphasis and badges.
- Don't convert navigation or body copy to uppercase unless there is a specific utility need.