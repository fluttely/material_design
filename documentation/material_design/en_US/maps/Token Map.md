# Token Map — spec token → package symbol

Authoritative list of every scale, with exact values. If this table and `lib/`
disagree, the code wins and this file gets fixed in the same session.
Current against 1.6.0.

## Naming convention

`M3*` is the spec surface. `M3E*` is Material Expressive — the whole `m3e` module is
`@experimental`, and the prefix is what keeps generic geometry names (`Point`,
`Cubic`, `Morph`) out of your root namespace. Two Expressive tokens live outside the
module because they belong to the systems they extend: `M3ESpring` sits in the motion
library, `M3EmphasizedTypeScale` in the tokens library (no `E` — it is a type scale,
not geometry).

## Scalar scales (extension type + constant class)

| Scale | Value type | Constants (dp unless noted) | `values`? | Escape hatch |
| :--- | :--- | :--- | :-: | :--- |
| Spacing | `M3SpacingValue` | `M3Spacings`: none 0, s4, s8, s12, s16, s20, s24, s28, s32, s36, s40, s48, s56, s64, s72, s80, s96, s128, infinity | ✅ (18 finite; `infinity` is a layout directive, not a value) | `M3Contract.spacing` |
| Margins | `M3SpacingValue` | `M3Margins`: compactScreen 16, medium/expanded/large/extraLargeScreen 24 | ✅ (index-aligned with `M3ScreenSize.values`) | — |
| Spacers | `M3SpacingValue` | `M3Spacers`: pane 24 | ✅ | — |
| Corners | `M3CornerValue` | `M3Corners`: none 0, extraSmall 4, small 8, medium 12, large 16, extraLarge 28, full 9999 | ✅ | `M3Contract.corner` |
| Border widths | `M3BorderWidthValue` | `M3BorderWidths`: none 0, thin 1, thick 2, extraThick 4 | ✅ | `M3Contract.borderWidth` |
| Focus indicator | — | `M3FocusIndicator`: thickness 3 (border width), offset 3 (spacing) | — | — |
| Opacities | `M3OpacityValue` | `M3Opacities`: disabledContent .38, disabledContainer .12, divider .12, backdrop .50 | ✅ | `M3Contract.opacity` |
| State layers | `M3OpacityValue` | `M3StateLayerOpacities`: hover .08, focus .10, pressed .10, dragged .16 | ✅ | — |
| Icon sizes | `M3IconSizeValue` | `M3IconSizes`: dense 20, standard 24, medium 32, large 40, extraLarge 48 | ✅ | `M3Contract.iconSize` |
| Icon weight (`wght`) | `M3IconWeightValue` | `M3IconWeights`: thin 100 … regular 400 … bold 700 | ✅ | — |
| Icon grade (`GRAD`) | `M3IconGradeValue` | `M3IconGrades`: onDark −25, normal 0, emphasis 200 | ✅ | — |
| Icon fill (`FILL`) | `M3IconFillValue` | `M3IconFills`: unfilled 0, filled 1 | ✅ | — |
| Icon optical size (`opsz`) | `M3IconOpticalSizeValue` | `M3IconOpticalSizes`: 20, 24, 32, 40, 48 (+ `forIconSize`, clamped to 20–48) | ✅ | — |
| Z-index | `M3ZIndexValue` (int) | `M3ZIndexes`: background 0, content 1, floating 10, drawer 100, modal 1000, snackbar 2000, tooltip 9999 | ✅ | `M3Contract.zIndex` |
| Breakpoints | `M3BreakpointValue` | `M3Breakpoints`: compact 0, medium 600, expanded 840, large 1200, extraLarge 1600 | ✅ | `M3Contract.breakpoint` |
| Layout widths | `M3BreakpointValue` | `M3LayoutWidths`: pane 360, body 1040, ultraWide 1920, unbounded ∞ | ✅ (omits `unbounded`) | — |
| Elevation dp | `M3ElevationDpValue` | `M3ElevationDps`: level0 0, level1 1, level2 3, level3 6, level4 8, level5 12 | ✅ | `M3Contract.elevationDp` |
| Tones | `M3ToneValue` (int) | `M3Tones`: t0, t10, t20, t30, t40, t50, t60, t70, t80, t90, t95, t99, t100 | ✅ | — |
| Contrast levels | `M3ContrastLevelValue` | `M3ContrastLevels`: reduced −1.0, standard 0.0, medium 0.5, high 1.0 (+ `.of(context)` → high when the platform reports high contrast) | ✅ | `M3Contract.contrastLevel` |

## Component tokens (1.6.0 — the `comp` layer)

Values only: the package does not ship M3 components, it ships the numbers so a
custom control lands on the same measurements as the built-in one beside it. All are
`M3SpacingValue` on the 4dp grid.

| Class | Constants | `values`? |
| :--- | :--- | :-: |
| `M3ButtonHeights` | extraSmall 32, small 40, medium 56, large 96, extraLarge 136 | ✅ |
| `M3FabSizes` | small 40, standard 56, large 96 | ✅ |
| `M3AppBarHeights` | small 64, medium 112, large 152, bottom 80 | ✅ (the three top heights; `bottom` is a different component) |
| `M3NavigationSizes` | barHeight 80, railWidth 80, extendedRailWidth 256, drawerWidth 360, indicatorHeight 32 | — (not one scale — five different measurements) |
| `M3ListItemHeights` | oneLine 56, twoLine 72, threeLine 88 | ✅ |

⚠️ `M3ButtonHeights.extraSmall` (32) and `.small` (40) are **visual** heights below
the 48dp mobile touch minimum. Expand the tap area, not the box —
[[../foundations/Accessibility|Accessibility]].

## Composite tokens (enums)

| Token | Fields | Values |
| :--- | :--- | :--- |
| `M3Elevation` | `dp`, `shadows` | level0–level5 (0/1/3/6/8/12 dp) + `fromValue` |
| `M3Motion` | `duration`, `curve` | emphasized 500, emphasizedIncoming 450, emphasizedOutgoing 150, standard 300, standardIncoming 250, standardOutgoing 200, linear 150 (ms) |
| `M3ESpring` ⚗️ | `damping`, `stiffness` | 12 tokens, table below. `description` → `SpringDescription`, `simulation(start:, end:, velocity:)` → `SpringSimulation`, `isBouncy` |

### `M3ESpring` — the 12 spring tokens

| Token | damping | stiffness |
| :--- | --: | --: |
| `standardSpatialSlow` | 0.9 | 300 |
| `standardSpatialDefault` | 0.9 | 700 |
| `standardSpatialFast` | 0.9 | 1400 |
| `standardEffectsSlow` | 1.0 | 800 |
| `standardEffectsDefault` | 1.0 | 1600 |
| `standardEffectsFast` | 1.0 | 3800 |
| `expressiveSpatialSlow` | 0.8 | 200 |
| `expressiveSpatialDefault` | 0.8 | 380 |
| `expressiveSpatialFast` | 0.6 | 800 |
| `expressiveEffectsSlow` | 1.0 | 800 |
| `expressiveEffectsDefault` | 1.0 | 1600 |
| `expressiveEffectsFast` | 1.0 | 3800 |

The effects springs are **identical in both schemes** and all critically damped
(1.0): expression belongs to movement, not to color.

## Selectors (enums)

| Selector | Values | Resolves to |
| :--- | :--- | :--- |
| `M3ScreenSize` | compact/medium/expanded/large/extraLarge | columns, gutters, margins, widths |
| `M3InteractionState` | hover/focus/pressed/dragged | `stateLayerOpacity` |
| `M3MotionDistance` | short/medium/long/extraLong | short2/medium2/long2/extraLong2 |
| `M3MotionType` | incoming/outgoing/persistent/standard | curves |
| `M3MotionScheme` ⚗️ | standard/expressive | `spatial(speed)`, `effects(speed)`, `spring(kind, speed)`, `springs` → `M3ESpring` |
| `M3MotionSpeed` | slow/standard/fast | the speed axis of a scheme lookup |
| `M3MotionSpringKind` | spatial/effects | the kind axis of a scheme lookup |
| `M3SchemeVariant` | tonalSpot, fidelity, monochrome, neutral, vibrant, expressive, content, rainbow, fruitSalad | `DynamicSchemeVariant` (via `dynamicSchemeVariant`) |
| `M3NavigationType` | bottom/rail/drawer | navigation pattern |
| `M3InputMethodType` | touch/mouse | touch-target sizing |
| `M3PaneRole` | primary/secondary | pane width — `secondary` is fixed at `M3LayoutWidths.pane`, `primary` is `unbounded` |
| `M3PaneDisplayMode` | single/dual | whether two panes fit (`dual` from expanded up) |

⚗️ = `@experimental`.

## Style constants (not scales)

- `M3TypeScale` — 15 `TextStyle`s + `values` (see [[../styles/Typography|Typography]] table).
- `M3EmphasizedTypeScale` ⚗️ — the same 15 roles one weight step heavier, same size
  and line height, + `values` (index-aligned) and `of(style)`. The 15 roles yield 14
  distinct styles: `titleSmall` and `labelLarge` are metrically identical, so `of()`
  is a lookup by value, not by role.
- `M3MotionDuration` — short1…extraLong4 (50…1000ms). `M3MotionCurve` — 7 cubics.
- `M3ElevationShadows` — level0…level5 shadow lists.
- `M3EdgeInsetsPatterns` — card 16, dialog 24, listItem 16/8, compactPage h16,
  expandedPage h24.
- `M3VisualDensity` — standard (0,0), comfortable (−1,−1), compact (−2,−2).
- `M3EShapes` ⚗️ — 35 `M3ERoundedPolygon`s (+ `all`).
- `M3ColorSchemes` — `fromSeed`/`light`/`dark`/`fromContext`, returning a Flutter
  `ColorScheme` built from `M3SchemeVariant` + `M3ContrastLevelValue`.
- `M3ExtendedColor` / `M3ExtendedColors` — M3 custom colors (`color`, `onColor`,
  `colorContainer`, `onColorContainer`) as a `ThemeExtension`.
- `M3CanonicalLayout` (1.6.0) — the pane policy behind the canonical layouts:
  `displayModeFor(M3ScreenSize)`, `displayModeOf(BuildContext)`,
  `paneWidthFor(M3PaneRole, M3ScreenSize)`. Not a scale — a decision, exposed so an
  app can make the same one for a layout the package does not ship.

Related: [[Coverage Map]] · [[../foundations/Design Tokens|Design Tokens]]
