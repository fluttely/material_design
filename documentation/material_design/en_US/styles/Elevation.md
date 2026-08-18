# Elevation

Spec: https://m3.material.io/styles/elevation

## Scale

`M3ElevationDps` (as `M3ElevationDpValue`): `level0` 0 · `level1` 1 · `level2` 3 ·
`level3` 6 · `level4` 8 · `level5` 12 (+ `values`).

## `M3Elevation` — the composite enum

Each level pairs `dp` with pre-built `shadows`:

```dart
M3Elevation.level2.dp;                    // 3.0
M3Elevation.level2.shadows;               // List<M3BoxShadow>
M3Elevation.level2.surfaceColor(context); // tint-blended surface
M3Elevation.fromValue(7.5);               // snaps to closest level
```

`M3ElevationComparison` extension: `isHigherThan`, `isLowerThan`, `differenceFrom`.

## Shadows

`M3ElevationShadows.level0…level5` — static shadow lists (shadow color 15% black,
`0x26000000`); `fromElevationToken(token)` and `fromElevation(dp)` (thresholds
≥12/8/6/3/1). `M3BoxShadow` has a private constructor: shadows only come from the
scale.

## Surface tint

The spec formula and high-contrast variant live in `M3SurfaceTint` — documented in
[[Color#Surface tint|Color]]. Preferred call: `colorScheme.surfaceAtElevation(level)`
or `M3Elevation.levelN.surfaceColor(context)`.

Complete for the M3 spec; no roadmap items open.

Related: [[Styles]] · [[Color]] · [[../maps/Token Map|Token Map]]
