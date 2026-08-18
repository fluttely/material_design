# M3 Expressive

Spec: https://m3.material.io/blog/building-with-m3-expressive (2025 update).
Package module: `lib/src/m3e/` (`expressive` barrel — standalone, no token deps).

## Scope rule

This package ships Expressive **tokens and primitives**, and Expressive **widgets
only while Flutter lacks the native equivalent** (tracked in flutter/flutter#168813).
Each stopgap widget is removed when Flutter ships the real one. Never duplicate a
component Flutter already provides.

## Naming and stability (settled in 1.6.0)

Everything the module exports carries an `M3E` prefix, which is what keeps `Point`,
`Cubic` and `Morph` out of your root namespace — the package is re-exported wholesale
from `material_design.dart`. Anything without the prefix is an implementation detail
and is now library-private: the module is one library assembled from `part` files, so
a leading underscore hides a name from the whole package while every part can still
use it.

The whole module is `@experimental`. Material is still iterating on Expressive
upstream, so names, defaults and shape geometry may change in a minor release. Code
that touches it needs `// ignore_for_file: experimental_member_use` or an equivalent
analyzer option — an opt-in the analyzer reports, rather than a stability tier a
reader has to infer.

## Shape engine (Dart port of AndroidX `graphics-shapes`)

Primitives: `M3EPoint`, `M3ECubic`, `M3ECornerRounding` (radius + smoothing),
`M3EFeature` (`M3EEdgeFeature`, `M3ECornerFeature`), `M3ERoundedPolygon` (factories:
`fromVerticesNum`, `fromVertices`, `circle`, `rectangle`, `star`, `pill`, `pillStar`),
`M3EMorph(start, end)`.

Path bridges: the `M3ERoundedPolygonToPath` and `M3EMorphToPath` extensions —
`roundedPolygon.toPath()` and `morph.toPath(progress: t)`.

`M3EShapes` — the official 35-shape library, all normalized to unit space:
circle, square, slanted, arch, semiCircle, oval, pill, triangle, arrow, fan, diamond,
clamShell, pentagon, gem, sunny, verySunny, cookie4/6/7/9/12Sided, clover4/8Leaf,
burst, softBurst, boom, softBoom, flower, puffy, puffyDiamond, ghostish, pixelCircle,
pixelTriangle, bun, heart (+ `all`).

## Shapes in the widget tree — `M3EShapeBorder` (1.6.0)

Until 1.6.0 a shape could only produce a `Path`, which meant a `CustomPainter` and no
`Card`, no `Material`, no clipped ripple. `M3EShapeBorder` is an `OutlinedBorder`
around any `M3ERoundedPolygon`, fitted to the layout rect by its own bounds:

```dart
Card(shape: M3EShapeBorder(M3EShapes.cookie7Sided));

Material(
  shape: M3EShapeBorder(M3EShapes.clover4Leaf),
  clipBehavior: Clip.antiAlias,
  child: InkWell(onTap: () {}, child: content), // the ripple is clipped too
);
```

**Morphing comes for free.** `lerpFrom`/`lerpTo` run the real `M3EMorph` algorithm
instead of crossfading two outlines, so any implicit animation that lerps the shape
morphs it:

```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 500),
  decoration: ShapeDecoration(
    color: color,
    shape: M3EShapeBorder(expanded ? M3EShapes.burst : M3EShapes.circle),
  ),
);
```

`M3EShapeMorph` is the wrapper for when the shape is the only thing animating
(`shape:`, `child:`, `color:`, `side:`, `duration:`, `curve:`, `clipBehavior:`).

Two details worth knowing: mid-morph frames are fitted to the **union** of both
endpoints' bounds, not to each frame's own bounds — otherwise the shape breathes as
the morph runs; and the endpoints settle back to plain borders, so a finished
animation stops paying for morph setup on every paint.

## Loading indicator

`M3ELoadingIndicator` / `M3ELoadingIndicator.contained()` — morphing indeterminate
indicator (container 48dp, active indicator 38dp). Options: `indicatorPolygons`
(≥2), `activeIndicatorColor`, `containerColor`, `semanticsLabel`. Theming:
`M3ELoadingIndicatorThemeData` + `M3ELoadingIndicatorTheme`.
Preset polygon sequences: `indeterminateIndicatorPolygons`,
`determinateIndicatorPolygons`.

Per spec: it replaces most uses of the indeterminate circular progress indicator for
waits under ~5s (e.g. pull-to-refresh).

## Expressive elsewhere in the package

Two Expressive systems live outside `m3e`, because they extend systems the package
already had:

- **Springs** — `M3ESpring`, `M3MotionScheme`, `M3MotionSpeed`, `M3MotionSpringKind`
  in the motion library ([[../styles/Motion|Motion]], 1.6.0).
- **Emphasized type** — `M3EmphasizedTypeScale` in the tokens library
  ([[../styles/Typography|Typography]], 1.6.0).

## Not shipping — decided, not pending (1.6.0)

The 2025 Expressive components — button groups, split button, FAB menu, toolbar — are
a **deliberate wait** on Flutter, and as of 1.6.0 that is a *recorded decision* rather
than an open question re-litigated every release ([[../Roadmap|Roadmap Phase 6]], and
the README's "What this package deliberately does not ship"). Flutter is actively
landing them (flutter/flutter#168813); shipping our own would hand every consumer a
migration the day Flutter's arrive. The answer is no until Flutter ships, and then the
answer is "use Flutter's".

`M3EShapeMorph`-based FAB and press-feedback demos fall under the same decision: they
belong in the demo, never in lib — a morphing FAB is an application of
`M3EShapeBorder`, not a component the package owes anyone.

> Historical note: until 1.6.0 `analysis_options.yaml` excluded `lib/src/m3e/**`, so
> this module was never linted. That is how `M3EPoint.angleDegrees` shipped applying
> the degrees-to-radians factor to a value already in radians. Exclusion gone, bug
> fixed, regression test in place.

Related: [[../styles/Shape|Shape]] · [[../Roadmap|Roadmap]]
