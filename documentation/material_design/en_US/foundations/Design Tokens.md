# Design Tokens — the contract architecture

Spec: https://m3.material.io/foundations/design-tokens

M3 defines three token layers: **reference** (raw palettes), **system** (semantic
roles and scales), and **component** (per-component values). This package implements
the **system layer as Dart types**; the reference layer exists only where it must
(HCT tonal palettes feeding color); the **component layer landed in 1.6.0** as values
only — see below.

> Historical note: a pre-1.0 plan to mirror M3's `ref/sys/comp` folders as
> `M3Ref*`/`M3Sys*`/`M3Comp*` classes was abandoned. The 1.0 architecture below is
> what shipped. Documents describing the old plan live in the archive folder.

## The three shapes a token can take

### 1. Scalar tokens — extension type + constant class

Every scale pairs an `extension type` (the *value*, singular) with an
`abstract final class` (the *scale*, plural):

```dart
extension type const M3SpacingValue._(double dp) implements double {}

abstract final class M3Spacings {
  static const M3SpacingValue s16 = M3SpacingValue._(16);
  // …
  static const List<M3SpacingValue> values = [/* ascending */];
}
```

Because the extension type `implements double`, the constant passes straight into any
Flutter API — but our own APIs demand the extension type, so a bare `17.3` cannot get
in. The constructor is library-private: the only ways to obtain an `M3SpacingValue`
are the constants and `M3Contract`.

The ten value types: `M3SpacingValue`, `M3CornerValue`, `M3BorderWidthValue`,
`M3OpacityValue`, `M3IconSizeValue`, `M3BreakpointValue`, `M3ElevationDpValue`,
`M3ZIndexValue`, `M3ToneValue`, and `M3ContrastLevelValue` (1.6.0). Full values in the
[[../maps/Token Map|Token Map]]. Every scale carries a `values` list — the last five
holdouts got theirs in 1.6.0.

### 2. Composite tokens — enums

`M3Motion` (duration + curve), `M3Elevation` (dp + shadows) and `M3ESpring`
(damping + stiffness, 1.6.0) stay enums: you always read their fields together and
never unwrap them to one number. They keep `const`, `values`, and exhaustive `switch`.

### 3. Selectors — enums that name a situation

`M3ScreenSize`, `M3InteractionState`, `M3MotionDistance`, `M3MotionType`,
`M3NavigationType`, `M3InputMethodType`, and — since 1.6.0/1.6.0 — `M3SchemeVariant`,
`M3MotionScheme`, `M3MotionSpeed`, `M3MotionSpringKind`. They resolve *to* tokens
(`M3InteractionState.hover.stateLayerOpacity`,
`M3MotionScheme.expressive.spatial(M3MotionSpeed.fast)`).

**The precise rule: no token that must be unwrapped to be used.**

## The escape hatch — `M3Contract`

Extension types erase at runtime; `17.3 as M3SpacingValue` compiles and always will.
Instead of pretending otherwise, every deliberate deviation routes through one
identifier:

```dart
M3EdgeInsets.all(M3Contract.spacing(18)) // off the 4dp grid, on purpose
```

Factories: `spacing`, `corner`, `borderWidth`, `opacity` (asserts 0–1), `iconSize`,
`breakpoint`, `elevationDp`, `zIndex`, `contrastLevel` (1.6.0). Compliance is
measurable:

```sh
grep -rn 'M3Contract\.' lib/ | wc -l
```

`M3Contract` is for **consumers**. The package itself never uses it — an off-scale
value inside `lib/` is a bug, not a deviation.

## Wrapper types carry the contract into Flutter

`M3EdgeInsets`/`M3Padding`/`M3Gap` (layout), `M3Radius`/`M3BorderRadius`/`M3Shape`/
`M3BorderSide`/`M3Border` (shape), `M3BoxDecoration`/`M3ShapeDecoration`
(decorations) — each extends the Flutter type it replaces and narrows its parameters
to M3 types. Drop-in, `const`, zero runtime cost.

## The component layer (1.6.0) — values, not widgets

`M3ButtonHeights`, `M3FabSizes`, `M3AppBarHeights`, `M3NavigationSizes`,
`M3ListItemHeights`: the per-component measurements the spec fixes, expressed in the
existing token types (all `M3SpacingValue`, all asserted on the 4dp grid) so component
values stay inside the same contract as everything else.

Deliberately **only** values. Flutter's Material library owns `FilledButton`,
`NavigationBar` and the rest; duplicating one here would create migration debt for
every consumer the day Flutter changes it. What the package can usefully own is the
numbers, so a custom control lands on the same measurements as the built-in one next
to it.

## Adding a new scale (checklist)

1. `extension type const M3XValue._(repr) implements repr` in the tokens library.
2. `abstract final class M3Xs` with `static const` members + `values` list.
3. `M3Contract.x(…)` factory if the scale is open-ended.
4. Tests: spec values, ordering, `values` completeness, 4dp-grid adherence if applicable.
5. Doc comments citing the m3.material.io page and units.
6. Triad + maps update (see `CLAUDE.md`).

Related: [[Foundations]] · [[../maps/Token Map|Token Map]] · [[../Roadmap|Roadmap]]
