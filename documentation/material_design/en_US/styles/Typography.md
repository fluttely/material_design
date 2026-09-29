# Typography

Spec: https://m3.material.io/styles/typography

## `M3TypeScale` — the 15 baseline styles

| Style | size | line height | tracking | weight |
| :--- | --: | --: | --: | --: |
| displayLarge | 57 | 64 | −0.25 | 400 |
| displayMedium | 45 | 52 | 0 | 400 |
| displaySmall | 36 | 44 | 0 | 400 |
| headlineLarge | 32 | 40 | 0 | 400 |
| headlineMedium | 28 | 36 | 0 | 400 |
| headlineSmall | 24 | 32 | 0 | 400 |
| titleLarge | 22 | 28 | 0 | 400 |
| titleMedium | 16 | 24 | 0.15 | 500 |
| titleSmall | 14 | 20 | 0.1 | 500 |
| bodyLarge | 16 | 24 | 0.5 | 400 |
| bodyMedium | 14 | 20 | 0.25 | 400 |
| bodySmall | 12 | 16 | 0.4 | 400 |
| labelLarge | 14 | 20 | 0.1 | 500 |
| labelMedium | 12 | 16 | 0.5 | 500 |
| labelSmall | 11 | 16 | 0.5 | 500 |

All `const TextStyle`s carrying metrics only — no color, so they merge cleanly into
any theme. `M3TypeScale.values` (1.6.0) lists them in the order above.

## `M3EmphasizedTypeScale` — the emphasized scale (1.6.0) ⚗️

M3 Expressive made emphasis part of the type system instead of something each call
site improvises with `copyWith(fontWeight: FontWeight.bold)` — which is how a codebase
ends up with four different ideas of what "bold" means.

The same 15 roles, one weight step heavier, each keeping its baseline's **size and
line height** so a swap never reflows a layout. Two spec relationships: roles that are
regular (400) become medium (500); roles already medium — the titles and labels —
become bold (700). Tracking moves only where the spec adjusts it (the display and
headline roles normalise to 0; `bodyLarge` tightens 0.5 → 0.15).

```dart
Text('Balance', style: M3TypeScale.titleMedium),
Text(r'$12,480', style: M3EmphasizedTypeScale.headlineLarge),

// Safe on an already-customised style — anything unrecognised comes back unchanged.
final style = isSelected
    ? M3EmphasizedTypeScale.of(M3TypeScale.bodyLarge)
    : M3TypeScale.bodyLarge;
```

`values` is index-aligned with `M3TypeScale.values`.

⚠️ The 15 roles produce **14** distinct styles: `titleSmall` and `labelLarge` are
metrically identical (14/20/0.1/w500), so `of()` is a lookup **by value, not by role**.
Harmless — their emphasized forms are identical too — but pinned by a test so it is a
documented fact rather than a surprise.

## `M3TextTheme`

`toTextTheme()` builds a Flutter `TextTheme`; `applyToTheme(theme)` **merges** onto
the theme's existing text theme so brightness-resolved colors and `fontFamily`
survive (the 1.0.0-dev.34 lesson: `copyWith(textTheme:)` blanked every text color).

## `M3TextUtils`

- `clampedScaler(context, minScaleFactor:, maxScaleFactor:)` — bounded `TextScaler`;
  a deliberate accessibility trade, use after the layout has been made to flex.
- `responsiveDisplay(context)` — displaySmall < 600dp, displayMedium < 1200dp, else
  displayLarge.
- `dyslexiaFriendly(style)` — +0.12 letterSpacing, height ≥ 1.6, one weight step up.
- `mono(style)` — Roboto Mono + system mono stack, tracking 0.
- `highContrast(style)` — one weight step bolder.
- `withFontFamily(base:, fontFamily:, fallback:)` — custom family over the system
  sans-serif stack.
- `withWeightAxis(style)` / `textThemeWithWeightAxis(theme)` — the style's own
  `fontWeight`, set on the `wght` axis (Unreleased). See below.

`highContrast` and `dyslexiaFriendly` step to the next *named* weight by value. They
used to look the weight up in `FontWeight.values`, and since Flutter 3.41 a weight
like `FontWeight(450)` (what `FontWeight.lerp` produces mid-animation) is in no list —
the miss resolved to `w100`, making "bolder" text thinner. Fixed, with a regression
test that failed against the old code.

## Variable fonts (Roboto Flex) — Roadmap 3.2

**What the spec gives a value for:** only the weight. The type scale fixes one weight
per role (and the emphasized scale one step above it). It defines no grade, width,
roundness or optical size for text — unlike icons, where `GRAD` has published stops
(`M3IconGrades`). So the package encodes the weight axis and nothing else; inventing
text grades would be exactly the kind of number this package exists to keep out.

**Why the weight needs help at all:** until **Flutter 3.41** a `FontWeight` did not
reach the `wght` axis of a variable font
([flutter/flutter#148026](https://github.com/flutter/flutter/issues/148026), engine
commit `e090117`, first stable 3.41.0). The package floor is 3.27, so on 3.27–3.38 an
app that bundles Roboto Flex draws every role at the font's default weight, and
`M3EmphasizedTypeScale` renders identical to the baseline. `withWeightAxis` sets
`FontVariation('wght', fontWeight.value)` — a number the style already carries.

- **Harmless elsewhere**: a static font has no `wght` axis and ignores it; on 3.41+ it
  repeats what `FontWeight` already sets.
- **Apply it last**: an explicit `wght` *overrides* `FontWeight`, so a later
  `copyWith(fontWeight:)` draws the old weight on a variable font. `highContrast` and
  `dyslexiaFriendly` re-sync an existing axis; they never add one.
- **Map emphasis first**: `M3EmphasizedTypeScale.of` looks up by value, so a style that
  already has variations comes back unchanged.
- **Animation bonus**: two styles with the same axes in the same order lerp the axis
  continuously, so a baseline → emphasized transition is smooth instead of snapping.

**Left to the caller, deliberately:** `GRAD`, `wdth`, `ROND`, `slnt`. `opsz` too:
Flutter documents `FontVariation.opticalSize` as normally derived from the font size,
and OpenType (points) and CSS (px) disagree on its unit, so setting it explicitly
would be a guess. Revisit if the spec publishes type-axis values.

When the package floor reaches Flutter 3.41, `withWeightAxis` becomes redundant and
can be removed.

Related: [[Styles]] · [[../foundations/Accessibility|Accessibility]]
