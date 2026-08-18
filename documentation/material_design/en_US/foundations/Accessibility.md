# Accessibility

Spec: https://m3.material.io/foundations/accessible-design

## `M3Accessibility` (adaptive module)

Constants: `minTouchTargetMobile` 48dp · `minTouchTargetDesktop` 32dp ·
`recommendedTouchTarget` 56dp · `minContrastNormal` 4.5 · `minContrastLarge` 3.0 ·
`enhancedContrast` 7.0.

⚠️ Touch target ≠ visual height. `M3ButtonHeights.extraSmall` (32) and `.small` (40)
are spec **visual** heights below the 48dp mobile minimum; a control at those heights
expands its tap area, not its box (`MaterialTapTargetSize.padded`) —
[[../styles/Shape|Shape]].

Contrast is also a user preference, not only a check: build the scheme at the level
the platform reports with `M3ContrastLevels.of(context)` or
`M3ColorSchemes.fromContext(context, seedColor: …)` — [[../styles/Color|Color]].

Helpers:

```dart
M3Accessibility.minTouchTarget(context);            // platform-aware target size
M3Accessibility.meetsContrastRequirement(
  foreground: fg, background: bg, isLargeText: false, useEnhanced: false);
M3Accessibility.makeAccessible(color: c, background: bg); // nudges until it passes
M3Accessibility.isHighContrastMode(context);
M3Accessibility.shouldReduceMotion(context);
M3Accessibility.adaptiveDuration(context: context, normal: d); // honors reduce-motion
M3Accessibility.highContrastColorScheme(base: scheme, isDark: true);
M3Accessibility.highContrastTextTheme(textTheme);
```

`M3AccessibilityConfig` bundles the user's needs (`highContrast`, `reducedMotion`,
`largeText`, `dyslexiaFriendly`, `textScaleFactor`) — build it with
`.fromContext(context)` and apply with `applyToTheme(theme)`.

## WCAG color math (color module)

`M3ColorUtils.calculateContrast` (WCAG 2.1, 1–21), `meetsWCAGAA` (≥4.5),
`meetsWCAGAAA` (≥7.0), `meetsLargeTextAA` (≥3.0),
`adjustForAccessibility(color, background, minContrast: 4.5)`, and on `ColorScheme`:
`colorScheme.isAccessible(fg, bg)`.

## Keyboard focus (interaction module)

`M3FocusRing` draws the official indicator: `M3FocusIndicator.thickness` (3dp) ring at
`M3FocusIndicator.offset` (3dp). The 6dp inset is reserved **whether or not focused**
— tabbing to a control never shifts it. The ring observes focus, never takes it.
The 3dp thickness deliberately lives on `M3FocusIndicator`, not `M3BorderWidths`, so
it cannot leak into component outlines.

## Text (typography module)

`M3TextUtils.clampedScaler(context, maxScaleFactor: …)` — last resort for layouts
that cannot flex; it fights the user's setting, so prefer flexible layouts.
`M3TextUtils.dyslexiaFriendly(style)` · `M3TextUtils.highContrast(style)`.

## Demo debt

The demo's Accessibility page currently hand-rolls contrast checks and touch-target
examples without using `M3Accessibility`/`M3AccessibilityConfig` — it must showcase
the package API it exists to prove ([[../maps/Coverage Map|Coverage Map]]).

Related: [[Foundations]] · [[Interaction States]] · [[../styles/Typography|Typography]]
