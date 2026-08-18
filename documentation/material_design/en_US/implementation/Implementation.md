# Implementation — consuming the package

How an app adopts the contract. The consumer-facing version of this is the README +
`example/lib/main.dart`; this note is the maintainer's rationale.

## Theme setup

```dart
MaterialApp(
  theme: M3TextTheme.applyToTheme(
    ThemeData(
      useMaterial3: true,
      colorScheme: M3ColorSchemes.fromSeed(seedColor: seed),
      visualDensity: M3VisualDensity.standard,
    ),
  ),
);
```

`applyToTheme` **merges** the 15 metric-only styles onto the theme's text theme —
never `copyWith(textTheme: M3TextTheme.toTextTheme())`, which discards
brightness-resolved colors (the 1.0.0-dev.34 bug).

## Adoption path for an existing app

1. Add the dependency; nothing breaks — all wrappers are drop-in Flutter subtypes.
2. Replace primitives mechanically: `EdgeInsets` → `M3EdgeInsets`, `SizedBox` gaps →
   `M3Gap`, `BorderRadius.circular` → `M3BorderRadius`, `BoxShadow` lists →
   `M3ElevationShadows`, `TextStyle(fontSize:)` → `M3TypeScale`, ad-hoc
   `Duration`/`Curve` → `M3Motion`.
3. Values that don't fit a token: either move to the nearest token (usually right) or
   make the deviation explicit with `M3Contract.*`.
4. Gate the contract in CI:

```sh
# drift score — watch it fall during migration
grep -rn 'M3Contract\.' lib/ | wc -l
# zero-drift teams fail the build on any hit
! grep -rn 'M3Contract\.' lib/
```

## Patterns worth copying (all compiled in the test suite / example)

- **Interactive surface**: `M3FocusRing` > `M3StateLayer` > `AnimatedContainer` with
  `M3Motion.emphasized.duration/.curve` + `M3BoxDecoration` — the README showcase.
- **Responsive shell**: `M3ResponsiveScaffold` (or `M3AdaptiveScaffold`) instead of
  hand-rolled breakpoint switches.
- **Per-class values**: `M3ResponsiveValue<T>` / `M3Adaptive.responsiveValue<T>`
  instead of `if (width < 600)` chains.
- **Elevated surfaces**: `colorScheme.surfaceAtElevation(M3Elevation.level2)` instead
  of manual tint math.

## Don'ts

- Don't unwrap tokens back to doubles to do arithmetic and reinject (`s16 * 1.5`
  compiles — the result is a plain `double` and won't re-enter M3 APIs; that's the
  contract working, not a bug).
- Don't clamp text scaling globally; `M3TextUtils.clampedScaler` is per-`Text`,
  deliberate, and last-resort.
- Don't forget that the expressive module is `@experimental` — a file that touches it
  needs `// ignore_for_file: experimental_member_use`. The old collision hazard
  (`Point`, `lerp` leaking into your namespace) is gone: everything is `M3E*`-prefixed
  since 1.6.0.

Related: [[../Material Design 3|Vault home]] · [[../foundations/Design Tokens|Design Tokens]]
