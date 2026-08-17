# Motion

Spec: https://m3.material.io/styles/motion

## Durations

`M3MotionDuration extends Duration` (usable anywhere a `Duration` is):
`short1–4` 50/100/150/200 · `medium1–4` 250/300/350/400 · `long1–4` 450/500/550/600 ·
`extraLong1–4` 700/800/900/1000 (ms).

## Curves

`M3MotionCurve extends ThreePointCubic`: `emphasized`, `emphasizedDecelerate`,
`emphasizedAccelerate`, `standard`, `standardDecelerate`, `standardAccelerate`,
`linear` — the official cubic control points, usable anywhere a `Curve` is.

## `M3Motion` — composite scheme enum

| Value | duration | curve |
| :--- | :--- | :--- |
| `emphasized` | long2 500ms | emphasized |
| `emphasizedIncoming` | long1 450ms | emphasizedDecelerate |
| `emphasizedOutgoing` | short3 150ms | emphasizedAccelerate |
| `standard` | medium2 300ms | standard |
| `standardIncoming` | medium1 250ms | standardDecelerate |
| `standardOutgoing` | short4 200ms | standardAccelerate |
| `linear` | short3 150ms | linear |

Extras: `asTween(begin:, end:)`; flat static aliases for `const` contexts
(`M3Motion.emphasizedDuration`, `M3Motion.emphasizedCurve`, … one pair per value);
intent selectors `M3Motion.durationFor(M3MotionDistance.long)` and
`M3Motion.curveFor(M3MotionType.incoming)` — both return M3 types, never bare
`Duration`/`Curve`.

Selectors: `M3MotionDistance` (`short`/`medium`/`long`/`extraLong` →
short2/medium2/long2/extraLong2) · `M3MotionType`
(`incoming`/`outgoing`/`persistent`/`standard`).

## The Expressive physics system (1.6.0) ⚗️

M3 Expressive (2025) made **springs** the primary motion model. A duration animates a
value over a fixed time no matter what the user did; a spring is interruptible and
velocity-aware, so a gesture handed off mid-flight continues instead of restarting.

Select through the scheme, not by naming a token:

```dart
const scheme = M3MotionScheme.expressive; // choose once, at the top of the app

controller.animateWith(
  scheme.spatial(M3MotionSpeed.fast).simulation(
        start: controller.value,
        end: 1,
        velocity: flingVelocity, // the reason to reach for a spring at all
      ),
);
```

`M3MotionScheme` (`standard` / `expressive`) resolves by intent:
`spatial(speed)`, `effects(speed)`, `spring(kind, speed)`, and `springs` (all six).
Selectors: `M3MotionSpeed` (`slow`/`standard`/`fast`) and `M3MotionSpringKind`
(`spatial`/`effects`).

### `M3ESpring` — 12 composite tokens

| Scheme | Kind | slow | standard | fast |
| :--- | :--- | :--- | :--- | :--- |
| standard | spatial | 0.9 / 300 | 0.9 / 700 | 0.9 / 1400 |
| standard | effects | 1.0 / 800 | 1.0 / 1600 | 1.0 / 3800 |
| expressive | spatial | 0.8 / 200 | 0.8 / 380 | 0.6 / 800 |
| expressive | effects | 1.0 / 800 | 1.0 / 1600 | 1.0 / 3800 |

(damping / stiffness). Members: `damping`, `stiffness`, `isBouncy`, `description` →
`SpringDescription`, `simulation(start:, end:, velocity:)` → `SpringSimulation`.

The split matters: **spatial** springs move things and may overshoot; **effects**
springs change color, opacity and tint and are critically damped, because a shape that
overshoots feels alive while a color that overshoots looks like a bug. Both schemes
ship the *same* effects springs — expression belongs to movement, not to color.

`expressiveSpatialFast` (damping 0.6) is the bounciest token Material publishes.

## Still planned

Transition-pattern presets (container transform, shared axis, fade through) and
reduced-motion fallbacks via `M3Accessibility.shouldReduceMotion` —
[[../Roadmap|Roadmap 2.3–2.4]].

Related: [[Styles]] · [[../foundations/Interaction States|Interaction States]]
