# Shape

Spec: https://m3.material.io/styles/shape

## The 10-level corner radius scale

Spec: https://m3.material.io/styles/shape/corner-radius-scale

`M3Corners` (as `M3CornerValue`): `none` 0 · `extraSmall` 4 · `small` 8 · `medium` 12
· `large` 16 · `largeIncreased` 20 · `extraLarge` 28 · `extraLargeIncreased` 32 ·
`extraExtraLarge` 48 · `full` 9999 (+ `values`). Exactly ten — the scale is closed;
anything else goes through `M3Contract.corner(…)`.

The scale had seven levels until the 2025 update added `largeIncreased`,
`extraLargeIncreased` and `extraExtraLarge` (Unreleased here). They are **baseline**
M3, not Expressive extras — Material Components for Android
(`ShapeAppearance.Material3.Corner.*`) and Compose (`Shapes.*`) ship them next to the
original seven — so they live in `M3Corners`, not under `m3e`.

> **Rendering note:** Flutter shrinks radii that do not fit their box, proportionally,
> until they do. A 48dp corner needs a box at least 96dp on its short side, or it draws
> as a pill. That is why the demo and example galleries use 96dp-square swatches.

## The shape family (each extends its Flutter counterpart)

| Type | Extends | Notes |
| :--- | :--- | :--- |
| `M3Radius` | `Radius` | `const M3Radius(M3CornerValue)` + the 10 statics |
| `M3BorderRadius` | `BorderRadius` | `.all/.vertical/.horizontal/.only` (M3Radius params) + 10 statics |
| `M3Shape` | `RoundedRectangleBorder` | `Card(shape: M3Shape.medium)`; 10 statics |
| `M3BorderSide` | `BorderSide` | `outlineColor` + `M3BorderWidthValue`; `.thin/.thick/.extraThick`, `none`; width 0 ⇒ `BorderStyle.none` |
| `M3Border` | `Border` | `.fromBorderSide`, `.all(outlineColor:, width:)`, `.thin/.thick/.extraThick`; `none` is `const` since 1.6.0 |
| `M3BoxDecoration` | `BoxDecoration` | narrows `borderRadius`/`border`/`boxShadow` to M3 types |
| `M3ShapeDecoration` | `ShapeDecoration` | requires `M3Shape`; `withM3Shape`/`addM3Shadows` extensions |

## Border widths

`M3BorderWidths`: `none` 0 · `thin` 1 · `thick` 2 · `extraThick` 4 (+ `values`).
The 3dp focus ring is deliberately **not** here — it lives on `M3FocusIndicator`
([[../foundations/Accessibility|Accessibility]]).

## Icons

`M3IconSizes`: `dense` 20 · `standard` 24 · `medium` 32 · `large` 40 · `extraLarge`
48 (+ `values`).

The four Material Symbols variable axes landed in **1.7.0**, each as its own scale:

- `M3IconWeights` — `wght`: `thin` 100 · `extraLight` 200 · `light` 300 ·
  `regular` 400 · `medium` 500 · `semiBold` 600 · `bold` 700.
- `M3IconGrades` — `GRAD`: `onDark` -25 · `normal` 0 · `emphasis` 200. Grade changes
  stroke thickness *without* changing the icon's width, which is what makes it the
  axis for optical correction rather than restyling.
- `M3IconFills` — `FILL`: `unfilled` 0 · `filled` 1. Fill is a **state**: M3 marks
  the selected destination by moving along the axis, not by swapping glyphs.
- `M3IconOpticalSizes` — `opsz`: mirrors `M3IconSizes`, plus
  `forIconSize(size)` which clamps into the 20–48 range the axis is defined over.

`M3IconStyle` is an `IconThemeData` built only from those tokens, with
`opticalSize` defaulting to `size` (the spec rule) and presets for `standard`,
`dense`, `selected`, `onDarkSurface` and `disabled`. It is a contract, not a widget —
Flutter's `Icon` already renders the axes.

The three non-size axes need the **Material Symbols variable font**; with Flutter's
bundled static `Icons` font the values are carried but not drawn.

## Expressive shapes

The 35-shape library, `M3ERoundedPolygon`, morphing, and the `M3EShapeBorder` /
`M3EShapeMorph` adapters (1.6.0) live in [[../expressive/M3 Expressive|M3 Expressive]].
`M3EShapeBorder` is an `OutlinedBorder`, so an expressive shape goes anywhere an
`M3Shape` does:

```dart
Card(shape: M3EShapeBorder(M3EShapes.cookie7Sided));
```

## Component measurements (1.6.0)

The `comp` token layer fixes the per-component sizes the spec publishes:
`M3ButtonHeights` (32/40/56/96/136) · `M3FabSizes` (40/56/96) · `M3AppBarHeights`
(64/112/152, `bottom` 80) · `M3NavigationSizes` (barHeight 80, railWidth 80,
extendedRailWidth 256, drawerWidth 360, indicatorHeight 32) · `M3ListItemHeights`
(56/72/88). All `M3SpacingValue`, all on the 4dp grid — full table in the
[[../maps/Token Map|Token Map]].

```dart
SizedBox(height: M3ButtonHeights.medium, child: FilledButton(…));
```

⚠️ `M3ButtonHeights.extraSmall` (32) and `.small` (40) are **visual** heights, below
the 48dp mobile touch minimum. A control at those heights expands its tap area, not
its box (Flutter does this with `MaterialTapTargetSize.padded`) —
[[../foundations/Accessibility|Accessibility]].

Related: [[Styles]] · [[Elevation]] · [[../maps/Token Map|Token Map]]
