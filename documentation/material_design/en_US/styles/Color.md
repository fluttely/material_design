# Color

Spec: https://m3.material.io/styles/color

## Tones — the reference layer

`M3Tones`: the 13 HCT tone stops as `M3ToneValue` — `t0` 0, `t10`, `t20`, `t30`,
`t40`, `t50`, `t60`, `t70`, `t80`, `t90`, `t95`, `t99`, `t100` (+ `values`).

## Tonal palettes (real HCT, via `material_color_utilities`)

```dart
final palette = M3TonalPalette.fromSeed(const Color(0xFF6750A4));
palette[M3Tones.t40]; // light-scheme primary
palette[M3Tones.t80]; // dark-scheme primary

final core = M3CorePalette.fromSeed(seed); // primary, secondary, tertiary,
core.neutral[M3Tones.t99];                 // neutral, neutralVariant, error
```

Constructors: `fromSeed` (Material's key-color pipeline — reproduces the baseline
exactly, verified in tests), `fromColor` (exact hue+chroma), `.of(hue:, chroma:)`.
Members: `tone(int)`, `operator []`, `tones` (sampled at every stop).

## Scheme-level helpers (on `ColorScheme`)

`M3ColorSchemeTokens` extension: `stateLayerColor(base, state)`,
`disabledContent(base)` 38%, `disabledContainer(base)` 12%,
`surfaceAtElevation(M3Elevation)`, `isAccessible(fg, bg)`.

## Surface tint

`M3SurfaceTint.calculateSurfaceColor(surface:, surfaceTint:, elevation:)` implements
the spec formula `opacity = 0.12 × (1 − e^(−dp/8))`, capped at 0.12 (≥24dp);
`highContrastSurface` uses a 1.5× multiplier capped at 0.20. On the enum:
`M3Elevation.level2.surfaceColor(context)`.

## Utilities — `M3ColorUtils`

Manipulation (`blend`, `lighten`, `darken`, `saturate`, `desaturate`), state colors
(`hover`, `pressed`, `focused`, `disabled`, `dragged`), WCAG math (see
[[../foundations/Accessibility|Accessibility]]), `isLight`, `onColor`.

`harmonize(designColor, sourceColor)` — the spec's HCT blend
(`material_color_utilities` `Blend.harmonize`): the design color's hue rotates at most
15° toward the source, chroma and tone survive, so a fixed brand color joins a seeded
scheme without becoming a different color.

```dart
final brandGreen = M3ColorUtils.harmonize(
  const Color(0xFF2E7D32),
  colorScheme.primary,
);
```

The pre-2.0 `harmonious(base)` — HSL wheel arithmetic (±30°/±120°/180°) returning
five colors — was **removed** in 1.6.0. It was an operation Material does not define.

## Opacities

`M3Opacities`: `disabledContent` 0.38 · `disabledContainer` 0.12 · `divider` 0.12 ·
`backdrop` 0.5. State layers: see
[[../foundations/Interaction States|Interaction States]].

## Schemes — `M3ColorSchemes` (1.6.0)

```dart
final scheme = M3ColorSchemes.fromSeed(
  seedColor: brandPurple,
  variant: M3SchemeVariant.expressive,
  contrastLevel: M3ContrastLevels.high,
);

// Follows platform brightness *and* the user's contrast setting:
final scheme = M3ColorSchemes.fromContext(context, seedColor: brandPurple);
```

Also `light(seedColor:, …)` and `dark(seedColor:, …)`. `M3SchemeVariant` carries the
nine spec variants — `tonalSpot` (the Material You default), `fidelity`, `monochrome`,
`neutral`, `vibrant`, `expressive`, `content`, `rainbow`, `fruitSalad` — and resolves
to Flutter's `DynamicSchemeVariant`.

> **Why this wraps Flutter instead of reimplementing it.** `ColorScheme.fromSeed`
> already runs the whole Material pipeline (`material_color_utilities` → the nine
> variants → 45 roles) and the SDK keeps it in step with the spec. A second pipeline
> here would only drift from it. What the package adds is the **contract**: a variant
> token and a contrast token in place of a `double` that silently accepts `2.7`.
> Platform dynamic color stays delegated to `dynamic_color` (documented, not wrapped).

## Contrast — `M3ContrastLevels` (1.6.0)

`M3ContrastLevelValue`: `reduced` −1.0 · `standard` 0.0 · `medium` 0.5 · `high` 1.0
(+ `values`). Escape hatch: `M3Contract.contrastLevel(…)`.

`M3ContrastLevels.of(context)` returns `high` when the platform reports a
high-contrast accessibility setting, `standard` otherwise. Contrast is a *user
preference*, and hard-coding it to standard is the most common accessibility bug in a
seeded theme.

## Custom colors — `M3ExtendedColor` (1.6.0)

A brand color expanded into the four M3 roles at the tone stops the spec fixes per
brightness (light: 40/100/90/10 — dark: 80/20/30/90):

```dart
final success = M3ExtendedColor.harmonized(
  name: 'success',
  source: const Color(0xFF2E7D32),
  harmonizeWith: colorScheme.primary,
  brightness: Theme.of(context).brightness,
);
success.color; success.onColor; success.colorContainer; success.onColorContainer;
```

`M3ExtendedColors` carries a named set through the theme as a `ThemeExtension`:

```dart
ThemeData(extensions: [
  M3ExtendedColors.of(
    {'success': const Color(0xFF2E7D32)},
    harmonizeWith: scheme.primary,
    brightness: Brightness.light,
  ),
]);

M3ExtendedColors.from(context)['success']; // empty set, not a throw, if absent
```

Related: [[Styles]] · [[Elevation]] · [[../maps/Token Map|Token Map]]
