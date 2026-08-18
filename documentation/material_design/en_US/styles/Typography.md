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

## Still planned

Variable-font axes guidance (wght/GRAD/wdth/ROND with Roboto Flex) —
[[../Roadmap|Roadmap 3.2]].

Related: [[Styles]] · [[../foundations/Accessibility|Accessibility]]
