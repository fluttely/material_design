# Material Design 3 — vault home

This vault documents the `material_design` Flutter package: a **design contract** that
expresses the Material Design 3 spec (https://m3.material.io/) as Dart types. It is
working documentation for maintainers — the consumer-facing docs are the README, the
single-file `example/`, and the live demo (https://fluttely.github.io/material_design/).

Everything here describes the **1.6.0 API**: extension types (`M3SpacingValue`) +
`abstract final` constant classes (`M3Spacings.s16`) + the `M3Contract` escape hatch.
The pre-1.0 enum API (`M3SpacingToken.space16.value`) no longer exists; if you find a
reference to it in this vault, that reference is a bug. So is any unprefixed
Expressive name (`Point`, `Morph`, `MaterialShapes`) or `M3ColorUtils.harmonious` —
all of them were renamed or removed in 1.6.0.

## The contract in one paragraph

APIs accept M3 extension types instead of `double`/`int`, so off-scale values fail to
compile. Scalar tokens are `static const` values used directly — no `.value` unwrap,
no lost `const`-ness. Enums are reserved for composite tokens (`M3Motion`,
`M3Elevation`, `M3ESpring`) and selectors (`M3ScreenSize`, `M3InteractionState`,
`M3MotionScheme`, `M3SchemeVariant`). Because extension types erase at runtime,
deviation is possible — but only through one greppable identifier:
`M3Contract.spacing(18)`.

The package models all three M3 token layers now: reference where it must (HCT
palettes), system throughout, and — since 1.6.0 — component, as *values only*. It
still ships no M3 components; Flutter's Material library owns those.

## Structure

### Foundations — [[foundations/Foundations|Foundations]]
- [[foundations/Design Tokens|Design Tokens]] — how the token architecture actually works
- [[foundations/Accessibility|Accessibility]] — contrast, touch targets, reduced motion
- [[foundations/Adaptive Design|Adaptive Design]] — window size classes, responsive
  widgets, canonical layouts
- [[foundations/Interaction States|Interaction States]] — state layers, focus, density

### Styles — [[styles/Styles|Styles]]
- [[styles/Color|Color]] — tonal palettes, schemes, contrast, custom colors ·
  [[styles/Typography|Typography]] — baseline + emphasized scales ·
  [[styles/Shape|Shape]] — corner scale + the component measurements ·
  [[styles/Elevation|Elevation]] · [[styles/Motion|Motion]] — durations, curves, springs

### Expressive
- [[expressive/M3 Expressive|M3 Expressive]] — shape engine, 35-shape library,
  `M3EShapeBorder`/`M3EShapeMorph`, loading indicator

### Maps
- [[maps/Token Map|Token Map]] — spec token → package symbol, with exact values
- [[maps/Coverage Map|Coverage Map]] — spec area → lib / tests / README / example / demo status

### Implementation
- [[implementation/Implementation|Implementation]] — consuming the package in an app

### Plan
- [[Roadmap]] — the gap analysis against m3.material.io and the phased action plan

## Module dependency graph

```text
tokens ──┬─> shape ──┬─> interaction
         ├─> layout ─┤
         ├─> color ──┴─> adaptive
         └─> typography
motion  ─────────────────> interaction, adaptive
expressive (standalone)
```

## Vault conventions

- `en_US/` is the source of truth; `pt_BR/` mirrors it file-for-file. Edit English
  first, then port the change.
- Wikilinks are folder-relative from the locale root (`[[styles/Color|Color]]`), so
  the two locales never cross-link into each other.
- Code fences must compile against the current `lib/` — when an API changes, the vault
  changes in the same working session (see `CLAUDE.md`).
- The vault is git-ignored and pub-ignored: local working notes, never published.
