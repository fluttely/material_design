# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 1.8.0

The package's central rule — README, `example/` and `demo/` must never drift apart —
had been written down since 1.0 and checked by nobody. Prose does not fail a build,
so it drifted: nine exported scales were undocumented in at least one of the three,
the README was missing two entire sections of its own API tour, and a demo caption
advertised a class named `M3EShapeBorders` that has never existed in any version.
None of that is something a Dart compiler can see. This release turns the rule into a
program, fixes everything the program found on its first run, and puts it in CI.

No public API changed in this release.

### 🏗 Architecture

- **`tool/verify.sh` is the gate now**, and `.github/workflows/tests.yml` runs that
  same script rather than a parallel list of steps. Two lists of checks drift the way
  two lists of pages drift; one script cannot disagree with itself. It runs format,
  analyze, tests, the two new checkers, the example and the demo, reporting every
  failure in one pass instead of stopping at the first.
- **`tool/check_triad.dart` enforces the triad.** It fails when a token scale is
  missing from README, `example/lib/main.dart` or `demo/`; when the three disagree on
  the canonical section order; and when any prose or UI string names an `M3*`
  identifier that no longer exists in `lib/`. That last check is the one no test could
  ever replace — a string is invisible to the compiler, which is exactly why the
  pre-1.0 demo advertised deleted `M3*Token` enums for months.
- **`tool/check_changelog.dart` replaces the snippet.** Verifying this file against
  pub.dev used to mean copying a Python block out of the contributor notes and pasting
  it into a shell — a checker you have to copy before you can run is a checker that
  does not run. It is a program now, wired into the gate, and it checks four things:
  that `pubspec.yaml` and the top section agree, that sections run newest-first, that
  none is duplicated, and that the set of documented versions matches what pub.dev
  actually serves.
- **`flutter analyze` is back in CI.** It had been commented out since the expressive
  module was unlinted. The tree is at zero issues across package, example and demo,
  and the gate keeps it there.

### 🐛 Bug Fixes

- **The shape-morph showcase named a class that does not exist.** Its caption
  described lerping two `M3EShapeBorders`; the type is `M3EShapeBorder`. Found by the
  new dead-name check on its first run, which is the entire argument for having one.

### 📚 Documentation

The demo answered "what does this token look like" for every family and "how do I
write it" for none of them, so the answer to the second question lived only in the
README — one snippet per family, at README length. The showcase now carries both.

- **The demo has a Code mode.** Every one of the 23 destinations gained a second
  page: the same families the Visual page renders, written out as the calls that
  produce them, each recipe pairing a live preview with the snippet that made it and
  a copy button. A `Visual / Code` switch in the rail and the drawer moves between
  them, and the choice survives changing destination — a reader who came for the code
  stays in the code. It is a mode of the shell rather than 23 more rail entries
  because a token family and the code that uses it are one subject, not two.
- **Snippets are checked, not trusted.** Every recipe lives in a Dart string in
  `demo/lib/recipe_pages/`, which puts it inside the dead-name check's reach: a
  snippet naming an `M3*` identifier that no longer exists fails `check_triad.dart`.
  That is not hypothetical — the first run of the gate over the new pages caught a
  recipe advertising `M3BoxShadows`, a class that has never existed.
- **The code viewer is themed rather than vendored.** Rather than a highlighting
  package, `demo/lib/recipes/dart_syntax.dart` colours from the ambient `ColorScheme`,
  so snippets restyle with the seed and the brightness like everything else on the
  page. Numeric literals take the `error` role on purpose: in a package whose whole
  argument is that `16.0` should be `M3Spacings.s16`, a bare number in a snippet
  should look like the thing you are being taught not to write.
- **The README was missing two sections of its own API tour.** Colour schemes,
  variants and contrast levels were folded into `5. Color` with no heading of their
  own, and `M3Contract` was an unnumbered aside. They are `### 5b. Schemes, variants &
  contrast` and `## 11. Breaking the contract, deliberately` now, so README, example
  and demo present the API in one order — the order that is checked.
- **Nine scales were exported but undocumented somewhere.** `M3LayoutWidths` appeared
  in none of the three artifacts at all; `M3Corners`, `M3ZIndexes` and `M3ElevationDps`
  were absent from both README and example; `M3Breakpoints`, `M3Opacities`,
  `M3StateLayerOpacities` and `M3Spacers` were missing from the example, and
  `M3ElevationShadows` from the demo. All nine are covered in all three now, including
  a layout-widths card on the Breakpoints page explaining what separates a threshold
  from a content width.
- **The demo's shape scale reads its labels off `M3Corners`** instead of carrying
  hand-typed dp strings beside the radii, so the example cannot state a number the
  token disagrees with.

### ✅ Tests

- **The demo's navigation tests no longer depend on navigation order.** They used to
  name the first destination, assume it was on screen, and `pumpAndSettle` on a shell
  whose first page might animate forever — so reordering the rail failed five tests
  about state layers, which have nothing to do with ordering. They now read the
  selected destination off `showcaseDestinations`, scroll the rail before tapping,
  disambiguate a label that a section and its only destination share, and pump bounded
  frames. Ordering is a presentation decision; tests should not have a vote.
- **Both halves of every destination render in CI.** The per-page test now runs twice
  per destination — once for the Visual page, once for the Code page — and asserts
  that a code page titles itself with its destination's label, so the two halves
  cannot drift apart in name. Two model tests cover the wiring itself: 23 pairs were
  connected by hand, and two destinations pointing at the same recipe page is the
  copy-paste mistake that looks completely fine in the rail.

### 🧹 Chore

- **Expressive leads the demo's navigation.** It is the newest part of the spec and
  the part a visitor is least likely to know exists, so it takes the position that
  costs no scrolling. The rail, drawer and shell all follow, because all three still
  derive from the single destination list.
- **`.claude/` carries the repetitive rituals**: a hook that formats every Dart file
  on write, so the formatting gate can no longer be what fails, plus commands for the
  eight-artifact checklist a new scale has to satisfy and for the release sequence.
  `tool/` and `.claude/` are both excluded from the published archive.
- **`CLAUDE.md` and the `documentation/` vault are tracked now.** Both were gitignored
  on the reasoning that they were personal working notes. They are not: they hold the
  reasoning behind the API decisions and the gap analysis against the spec, and
  keeping that out of the repository put it precisely where no contributor could find
  it. Both stay out of the published archive — contributors need them, consumers
  installing the package do not.

## 1.7.0

Icons were the one M3 style area the package typed only halfway. `M3IconSizes` has
been there since the beginning, but the Material Symbols font has four variable axes
and Flutter exposes all of them as bare doubles — so weight, grade, fill and optical
size were the last place in an M3-typed UI where a raw number was the only option.
This release closes that gap and rebuilds the demo's navigation on top of the
package's own measurements.

### ✨ Features

- **The Material Symbols axes are scales now**: `M3IconWeights` (`thin` 100 …
  `regular` 400 … `bold` 700), `M3IconGrades` (`onDark` -25, `normal` 0, `emphasis`
  200), `M3IconFills` (`unfilled` 0 / `filled` 1) and `M3IconOpticalSizes` (20 · 24 ·
  32 · 40 · 48, mirroring `M3IconSizes`). Each is an extension type over `double`, so
  it passes straight to `Icon.weight`, `Icon.grade`, `Icon.fill` and
  `Icon.opticalSize` while keeping arbitrary values out.
- **`M3IconOpticalSizes.forIconSize(size)`** returns the optical size that matches a
  rendered size — the spec's rule, since `opsz` exists to hold stroke weight
  perceptually constant — clamping into the 20–48 range the axis is defined over so
  a size routed through `M3Contract` still lands on a legal value.
- **`M3IconStyle`** is an `IconThemeData` whose every axis is a token, so it drops
  into `ThemeData.iconTheme`, `IconTheme`, and any `iconTheme:` slot without a
  wrapper widget. `opticalSize` defaults to `size`, which is the spec behaviour, so
  the common case needs no argument. Presets carry the states the spec names:
  `standard`, `dense`, `selected` (filled), `onDarkSurface` (grade -25, cancelling
  the optical bloom of light-on-dark strokes) and `disabled` (38%).
  Consistent with the rest of the package, this is a *contract*, not a component —
  Flutter's `Icon` already renders the axes; what was missing was the typing.
  `color` is deliberately **not** defaulted, because icon color is a color-scheme
  role rather than an icon token. Flutter's behaviour behind that is worth knowing:
  an `IconThemeData` with a null color puts `Icon` on its black fallback, so
  replacing `ThemeData.iconTheme` wholesale needs a `color`, and restyling a subtree
  wants `IconTheme.merge` rather than `IconTheme`. Both are spelled out in the doc
  comment and the README, and pinned by a test.
- **`M3NavigationSizes.indicatorWidth` (56dp) and `.railDestinationHeight` (56dp).**
  The active indicator is a 56×32dp pill, but only its height was tokenised in 1.6.0,
  which left every caller drawing a custom rail inventing the width — the demo among
  them.

### 📚 Documentation

- **README gains section 4b, Icons**, and `example/lib/main.dart` gains the matching
  section, in the same position. Both state plainly that the three non-size axes are
  rendered by the Material Symbols variable font: with Flutter's bundled (static)
  `Icons` font the values are carried but not drawn. The tokens are the same either
  way; what changes is the font you ship.

### 🏗 Architecture

The demo is part of the contract's evidence, so it is held to it. Its navigation was
901 lines in `main.dart` built from two hand-synchronised lists — a `List<Widget>` of
pages and a `List<NavigationRailDestination>` of labels — addressed by offset
arithmetic. Inserting a page in the middle silently pointed every label below it at
the wrong screen.

- **One declarative source of truth.** `demo/lib/showcase/showcase_destinations.dart`
  pairs each page with its destination and groups them into sections; the rail, the
  drawer and the body all derive from that list. `main.dart` is 37 lines.
- **The demo models what it showcases.** The rail's destination is drawn from
  `M3NavigationSizes` (rail width, indicator size), `M3StateLayer` (hover, focus and
  press feedback, replacing a hand-rolled `AnimationController`), `M3Motion` and
  `M3BorderRadius`; the layout switch reads `M3ScreenSize.of(context)` instead of
  comparing `MediaQuery` widths by hand. Remaining literal opacities in the showcase
  pages now go through `M3Contract.opacity`, so every deviation is greppable.
- **The rail's destination states follow the spec.** Hover used to light the whole
  80×56dp block; the M3 state layer belongs to the **active indicator**, so it is now
  the 56×32dp stadium around the icon that responds — and it responds to the pointer
  anywhere on the destination, label included. The layer is painted over the
  indicator rather than behind it, so a *selected* destination gives the same
  feedback an unselected one does, in the content role it sits on
  (`onSecondaryContainer` selected, `onSurface` otherwise) at the opacity
  `M3InteractionState` assigns. Labels take `labelMedium` on `onSurface` in both
  states and destinations sit 12dp apart, matching `NavigationRail`'s own M3
  defaults; destinations are now focusable, activate on Enter/Space, and report
  their selected state to the semantics tree. The indicator also **arrives and
  leaves by scaling in X** rather than by fading its fill: a `secondaryContainer`
  fading through 500ms of emphasized easing is a translucent tint, which is exactly
  what a hover state layer looks like — so picking a new destination flashed the old
  one as if the pointer had crossed it. The fill now switches in 100ms and the
  emphasized motion lives in the scale, the way `NavigationIndicator` does it.
- **A demo test suite.** `demo/test/` renders every showcase page, exercises both
  navigation presentations, and pins the rail's hover/selected colors and the icon
  page's layout at three window widths. It immediately found four real defects: a
  `ListTile` whose ink was hidden by a decorated ancestor, an uncancellable start-up
  timer in the expressive shapes preview, an icon theme that blacked out every
  inherited icon in dark mode, and a 249px overflow on a narrow window.

## 1.6.0

Six development milestones, released together as one version. Each is written up
below under the number it carried while in progress; only `1.6.0` was published, so
only `1.6.0` has a section of its own. Between them they pay off the namespace debt an
audit found in the 1.0 surface and close the roadmap's colour, motion, typography,
shape and layout phases — the package now covers every M3 style area and models all
three M3 token layers.

> **On the version number.** This release contains breaking changes and is still a
> minor bump. `0.28.1` went straight to `1.0.0`, so nobody is on `1.x`, and spending
> `2.0.0` on cleanup that no one has to migrate through would misstate the package's
> maturity for the rest of its life. Breaking changes stay allowed on `1.x` until the
> package has real adopters; after that they take a major. There are no deprecation
> shims either — the old names are gone, and the migration table at the end maps every
> one of them.

### 1.1.0 — API hygiene and the documentation triad *(internal)*

An audit of the 1.0 surface against https://m3.material.io/ turned up namespace and
consistency debt that gets more expensive to fix with every adopter. `1.0.x` has none
yet, so it is being paid off now, before the roadmap adds anything on top of it.

The headline problem: importing `package:material_design/material_design.dart` used
to drop `Point`, `Cubic`, `Morph`, `lerp`, `distance`, `square`, `convex`, `twoPi` and
two dozen more unprefixed names into your namespace. That is a collision waiting to
happen in any file that also touches `dart:ui` or `vector_math`.

#### 💥 Breaking Changes

- **The M3 Expressive geometry engine is namespaced.** Every public type is now
  prefixed: `M3EPoint`, `M3ECubic`, `M3ECornerRounding`, `M3EFeature`,
  `M3ERoundedPolygon`, `M3EMorph`, `M3EShapes`, `M3ELoadingIndicatorTheme`,
  `M3EPointTransformer`, and the `toPath` extensions. Prefixing was chosen over the
  alternative of moving the engine to an opt-in library, because
  `M3ELoadingIndicator`'s own API takes `M3ERoundedPolygon` — a split would have
  forced two imports for one widget.
- **The engine's helpers are private now.** `lerp`, `distance`, `square`, `convex`,
  `interpolate`, `radialToCartesian`, `binarySearchBy`, `pathFromCubics`,
  `featureMapper`, `distanceEpsilon`, `twoPi`, `Measurer`, `LengthMeasurer`,
  `MeasuredPolygon`, `MeasuredCubic`, `DoubleMapper`, `DistanceVertex`,
  `ProgressableFeature` and the `DoubleCoerce`/`Matrix4` extensions were
  implementation details of the morph algorithm that happened to be reachable. The
  two members annotated `@internal` — `Cubic.fromPoints` and
  `RoundedPolygon.fromFeatures` — are genuinely private rather than merely
  documented as off-limits.
- **`MaterialShapes` is `M3EShapes`.** The source had carried a `// TODO: rename it`
  since it landed; it was also the only token-like class in the package without an
  `M3` prefix.
- **`InputMethodType` is `M3InputMethodType`.** The last unprefixed symbol outside
  the expressive module.
- **`M3ColorUtils.harmonious` is replaced by `M3ColorUtils.harmonize`.** The old one
  rotated hues on the HSL wheel by fixed amounts (±30°, ±120°, 180°) and returned
  five colors — an operation Material does not define. `harmonize(designColor,
  sourceColor)` is the spec algorithm: a bounded hue shift in HCT via
  `Blend.harmonize`, so a fixed brand color can be pulled into a seeded scheme
  without becoming a different color.

#### ✨ Features

- **The whole `m3e` module is `@experimental`.** Material is still iterating on
  Expressive upstream, and the package had no way to say so — there were zero
  `@experimental` annotations in `lib/`. Opting in is now a visible decision the
  analyzer reports, rather than something a reader has to infer from a doc comment.
- **`values` lists on the remaining scales.** `M3Margins`, `M3Spacers`,
  `M3Opacities`, `M3StateLayerOpacities` and `M3LayoutWidths` had none, so galleries
  and property tests were hand-maintaining their own copies and silently going stale.
  `M3Margins.values` is index-aligned with `M3ScreenSize.values`, and the lists that
  would otherwise be misleading exclude layout directives rather than sorting them as
  values (`M3Spacings.values` still omits `infinity`; `M3LayoutWidths.values` omits
  `unbounded`).
- **`M3Border.none` is `const`.** It was the only `none` in the shape family declared
  as a mutable static, which quietly cost `const`-ness at every call site that used it.

#### ✅ Tests

- **Property tests for the scale contract** (`values_lists_test.dart`): every
  numeric scale is asserted ascending, the new `values` lists are asserted complete,
  `M3Margins` is checked against `M3ScreenSize.pageMargin` index by index, and
  `M3Border.none` is asserted usable in a `const` context. 160 tests to 167.

#### 📚 Documentation

- **Spec URLs on the token classes**, per the traceability rule in `CLAUDE.md`.
- README, `example/`, and the demo updated for the new names; the example and the
  shape showcase now carry an explicit `ignore_for_file: experimental_member_use`
  with a comment explaining what opting in means.

### 1.2.0 — Colour schemes, variants and contrast *(internal)*

Roadmap phase 1: the color system. The package generated real HCT tonal palettes but
stopped short of *schemes* — a consumer who wanted a vibrant or high-contrast scheme
dropped out of the contract and back to raw Flutter calls, and a consumer with brand
colors had no spec-correct way to fit them into a seeded palette.

#### ✨ Features

- **`M3ColorSchemes` builds schemes with tokens instead of loose values.**
  `fromSeed(seedColor:, variant:, brightness:, contrastLevel:)`, plus `light`, `dark`,
  and `fromContext`. It wraps Flutter's own `ColorScheme.fromSeed` rather than
  reimplementing the Material pipeline: the SDK already runs
  `material_color_utilities` and is kept in step with the spec, so a second pipeline
  here would only drift from it. What the package adds is the contract —
  a typed variant and a typed contrast level in place of a `double` that silently
  accepts `2.7`.
- **`M3SchemeVariant`** — the nine spec variants (`tonalSpot`, `fidelity`,
  `monochrome`, `neutral`, `vibrant`, `expressive`, `content`, `rainbow`,
  `fruitSalad`) as a selector that resolves to Flutter's `DynamicSchemeVariant`. A
  test asserts the mapping stays exhaustive, so an SDK that adds a tenth variant
  fails the build rather than silently going out of date.
- **`M3ContrastLevels`** — `reduced` (-1.0), `standard` (0.0), `medium` (0.5), `high`
  (1.0), with `M3Contract.contrastLevel` as the escape hatch. `M3ContrastLevels.of(context)`
  reads the platform's accessibility setting: hard-coding standard contrast is the
  most common accessibility bug in a seeded theme, and `M3ColorSchemes.fromContext`
  now makes the correct thing the short thing.
- **`M3ColorUtils.harmonize`** — the spec's HCT blend, replacing the HSL hue-wheel
  arithmetic removed in 1.1.0. It rotates a fixed brand color at most 15° toward the
  seed so it belongs to the scheme without becoming a different color.
- **`M3ExtendedColor` and `M3ExtendedColors`** — M3 "custom colors": a brand color
  expanded into the four spec roles (`color`, `onColor`, `colorContainer`,
  `onColorContainer`) at the tone stops the spec fixes per brightness, optionally
  harmonized, and carried through the theme as a `ThemeExtension`.
  `M3ExtendedColors.from(context)` returns an empty set rather than throwing when the
  extension is absent, so a widget degrades instead of crashing.

#### ✅ Tests

- Scheme equivalence against Flutter for identical inputs, exhaustiveness of the
  variant mapping, a contrast assertion that measures the actual onSurface/surface
  ratio rather than trusting the parameter, the four role tone stops in both
  brightnesses, and theme round-tripping. 167 tests to 182.

#### 📚 Documentation

- README color section, a new `5b` section in the single-file example with live
  variant and contrast selectors, and a **Schemes** page in the demo showing all nine
  variants, the four contrast levels with their measured ratios, and harmonization
  side by side with the raw brand colors.

### 1.3.0 — Expressive spring motion *(internal)*

Roadmap phase 2: the motion physics system. M3 Expressive (2025) made springs the
primary motion model alongside the duration/curve pairs the package already shipped.
A duration animates a value over a fixed time no matter what the user did; a spring
carries velocity, so a gesture handed off mid-flight continues instead of restarting.

This release also removes an analysis blind spot that had been hiding since the
expressive module landed.

#### ✨ Features

- **`M3ESpring`** — the twelve published Material spring tokens as a composite enum
  (`damping` and `stiffness` are read together, never unwrapped), with
  `description` returning a Flutter `SpringDescription` and `simulation(start:, end:,
  velocity:)` a ready `SpringSimulation`. Values are taken from the Material source
  rather than inferred: standard spatial springs are damped 0.9 at stiffness
  300/700/1400, expressive spatial 0.8/0.8/0.6 at 200/380/800.
- **`M3MotionScheme`** — `expressive` (Material's default) and `standard`
  (utilitarian), selected by intent through `spatial(speed)` and `effects(speed)`
  rather than by naming a token. The split matters: spatial springs move things and
  are allowed to overshoot, effects springs change color and opacity and are
  critically damped, because a shape that overshoots feels alive while a color that
  overshoots looks like a bug. Both schemes ship the *same* effects springs —
  expression belongs to movement, not to color — and a test asserts it.
- **`M3MotionSpeed`** and **`M3MotionSpringKind`** as the accompanying selectors.

#### 🐛 Bug Fixes

- **`M3EPoint.angleDegrees` returned neither degrees nor radians.** It computed
  `angleRadians * pi / 180` — the degrees-to-radians factor applied to a value that
  was already in radians. It now converts properly (`* 180 / pi`), covered by a
  regression test. Technically breaking, but the getter never produced a usable
  number and nothing in the package, demo, or example read it.

#### 🏗 Architecture

- **The expressive module is analysed again.** `analysis_options.yaml` had excluded
  `lib/src/m3e/**` since the module landed, so a third of the package was never
  linted — which is how the `angleDegrees` bug survived. The exclusion is gone and
  the module is clean under `very_good_analysis`: 19 missing API docs written, two
  `Matrix4.scale` calls migrated to `scaleByDouble` (verified bit-identical for these
  arguments), two parameter reassignments replaced with locals, and six TODOs either
  given an owner and a reason or deleted as stale. A comment records the trap that
  hid it: `analyzer.exclude` suppresses a path even when you name it explicitly on
  the command line.

#### ✅ Tests

- Spring spec values, the scheme/speed selector matrix, and physics assertions that
  actually run the simulation — a bouncy spring is asserted to overshoot, a
  critically damped one never to, every token to settle at its target, and initial
  velocity to advance the curve. 182 tests to 199.

#### 📚 Documentation

- README motion section, a spring runner in the example that shows overshoot against
  a critically damped baseline, and a **Springs** page in the demo with the full
  token table and a velocity hand-off demo.

### 1.4.0 — The emphasized type scale *(internal)*

Roadmap phase 3: the emphasized type scale. M3 Expressive made emphasis part of the
type system rather than something each call site improvises with
`copyWith(fontWeight: FontWeight.bold)` — which is how a codebase ends up with four
different ideas of what "bold" means.

#### ✨ Features

- **`M3EmphasizedTypeScale`** — the 15 roles again, one weight step heavier. Each
  emphasized style keeps its baseline's `fontSize` and line height, so swapping one
  in never reflows a layout; only weight changes, plus tracking on the few roles the
  spec adjusts. Two relationships, both from the spec: roles that are regular (400)
  become medium (500), and roles already medium — the titles and labels — become
  bold (700). A test asserts both invariants across all 15 rather than trusting the
  table.
- **`M3EmphasizedTypeScale.of(style)`** maps a baseline style to its counterpart and
  returns anything else unchanged, so `isSelected ? M3EmphasizedTypeScale.of(s) : s`
  is safe on a customised style.
- **`M3TypeScale.values`** — the 15 baseline styles as an ordered list, index-aligned
  with the emphasized ones. Every other scale in the package already had `values`;
  the type scale was the exception.

#### ✅ Tests

- Writing the property tests surfaced a spec fact worth recording: `titleSmall` and
  `labelLarge` are **metrically identical** (14sp / 20 line height / 0.1 tracking /
  weight 500), so the 15 roles collapse to 14 distinct `TextStyle` values. That makes
  `of()` a lookup by value rather than by role — harmless, because the pair's
  emphasized forms are identical too, but now asserted and documented rather than
  discovered by whoever hits it next. 199 tests to 210.

#### 📚 Documentation

- README typography section, a baseline-vs-emphasized comparison in the example, and
  the demo's typography page extended to show all 15 pairs with the numeric proof
  that the swap is layout-safe.

### 1.5.0 — Shape adapters and component tokens *(internal)*

Roadmap phase 4: shape adapters and the component token layer. The 35-shape
Expressive library shipped in 1.0 but could only produce a `Path`, which meant a
`CustomPainter` and no `Card`, no `Material`, no clipped ripple. And the package
implemented M3's system token layer while leaving the component layer — the actual
per-component measurements — undocumented, so anyone building a custom control was
back to guessing.

#### ✨ Features

- **`M3EShapeBorder`** — an `OutlinedBorder` around any `M3ERoundedPolygon`, so the
  shape library drops into `Card(shape:)`, `Material(shape:)`, `ShapeDecoration`, and
  clips an `InkWell` ripple. The polygon is fitted to the layout rect by its own
  bounds, so shapes that are not normalised still fill the box.
- **Morphing comes for free.** `lerpFrom`/`lerpTo` run the real `M3EMorph` algorithm
  rather than crossfading two outlines, so any implicit animation that lerps a shape
  morphs it — an `AnimatedContainer` with a `ShapeDecoration` is enough. Mid-morph
  frames are fitted to the *union* of the two endpoints' bounds rather than to each
  frame's own bounds, which would otherwise make the shape breathe as it ran; a test
  pins that. Endpoints settle back to plain borders so a finished animation stops
  paying for morph setup on every paint.
- **`M3EShapeMorph`** — the implicit-animation wrapper, for when the shape is the only
  thing animating.
- **The component token layer**: `M3ButtonHeights` (the five Expressive size classes),
  `M3FabSizes`, `M3AppBarHeights`, `M3NavigationSizes`, `M3ListItemHeights` — all
  typed `M3SpacingValue`, all on the 4dp grid (asserted). Values only: this package
  still does not ship M3 components, because Flutter's Material library owns them and
  duplicating one would create migration debt the day Flutter changes it. What the
  package can usefully own is the numbers, so a custom control lands on the same
  measurements as the built-in one beside it.
- **`M3ResponsiveNavigation.getRailWidth` returns a token** (`M3SpacingValue`) drawn
  from `M3NavigationSizes` instead of the `256.0`/`80.0` literals it had inlined —
  roadmap item 5.3, closed early because the token layer landed here. The 256dp
  extended width was verified against Flutter's own `NavigationRail.minExtendedWidth`
  default rather than taken from memory.

#### ✅ Tests

- Shape fitting is pinned by ratio rather than by absolute size, because
  `Path.getBounds()` is conservative for cubics — it includes control points, so an
  exactly-fitted shape measures a few percent over its rect. Doubling the rect must
  double the path exactly, and shifting the rect must shift it exactly; those hold to
  1e-4 regardless of the conservative bound.
- Component values are asserted against the spec and against each other (a standard
  FAB is a medium button; the drawer is a layout pane; each list line adds 16dp).
- One assertion documents a trap instead of hiding it: `M3ButtonHeights.extraSmall`
  (32dp) and `.small` (40dp) are **below** the 48dp mobile touch minimum. That is the
  spec — they are visual heights, and Material expands the tap area around them
  rather than growing the button. Now stated in the doc comment and asserted.
  210 tests to 238.

#### 📚 Documentation

- README gains the shape-border usage and a component-measurements section; the
  example draws its expressive shapes through `Material(shape:)` instead of a
  hand-rolled painter; the demo gains a component tokens page and a morph demo.

### 1.6.0 — Canonical layouts and the scope boundary

Roadmap phase 5: the canonical layouts. M3 names three — list-detail, supporting
pane, and feed — and the interesting part is that they do **not** collapse the same
way on a phone. Getting that wrong is the usual bug: apps hide supporting content
behind navigation because that is what list-detail does, even though the support is
part of the same task rather than a separate destination.

This release also closes the roadmap's phase 6 by writing the decision down instead
of writing code.

#### ✨ Features

- **`M3ListDetailLayout`** — list beside detail on expanded windows; on compact the
  detail *replaces* the list and `onNavigateBack` returns, wired through `PopScope` so
  the system back gesture works. `placeholder` fills the detail pane when nothing is
  selected and both panes fit.
- **`M3SupportingPaneLayout`** — primary beside supporting; on compact the support
  *stacks below* rather than being navigated to. `supportingFirst` flips the order.
- **`M3FeedLayout`** — a grid whose column count, gutters, and page margin all come
  from the window size class (1/2/3/4/5 columns). `itemColumns` overrides only the
  classes you name, so a denser phone grid does not mean restating the other four.
- **`M3CanonicalLayout`** — the shared policy, exposed: `displayModeFor`,
  `displayModeOf`, `paneWidthFor`. Two panes need expanded (840dp) or wider, because
  at medium a 360dp pane leaves the primary narrower than a phone.

#### 📚 Documentation

- **The scope boundary is now in the README rather than implied.** The package does
  not ship M3 components — Flutter's Material library owns them, and duplicating one
  creates migration debt the day Flutter changes it. The package ships the contract
  they are built from, including their measurements. The single exception is an
  Expressive widget Flutter lacks (`M3ELoadingIndicator`), which is a marked stopgap
  and gets removed when Flutter ships its own. The 2025 Expressive components
  (button groups, split button, FAB menu, toolbars) are deliberately *not*
  reimplemented while flutter/flutter#168813 is in flight — that is roadmap phase 6,
  and the answer is to wait.
- README adaptive section, a supporting-pane miniature in the example, and a demo
  page with all three layouts live at the current window size.
- **The emphasized type scale is described precisely now.** The README said swapping
  in an emphasized style "never reflows the layout", which overclaims: size and line
  height are identical, so the vertical rhythm is safe, but tracking moves on the
  roles the spec adjusts, so a line can come out marginally wider.
- **Closes a triad gap `1.5.0` left**: the component tokens reached the README and the
  demo but never the example. Auditing the coverage map caught it, which is what that
  map is for. `example/lib/main.dart` now has an `8b` section, including the
  below-touch-target warning rendered from the real
  `M3Accessibility.minTouchTargetMobile` comparison rather than a hardcoded note.

#### ✅ Tests

- The collapse behaviour is asserted at real widths rather than described: at 400dp
  the detail replaces the list while the supporting pane stacks *and stays visible*;
  at 1000dp both go side by side; the feed's column count and gutters are read off
  the actual `SliverGridDelegate` at five widths. 238 tests to 251.

---

### Migration from 1.0.x

| 1.0.x | 1.1.0 |
| :--- | :--- |
| `MaterialShapes.heart` | `M3EShapes.heart` |
| `RoundedPolygon` | `M3ERoundedPolygon` |
| `Morph` | `M3EMorph` |
| `Point` / `Cubic` / `Feature` | `M3EPoint` / `M3ECubic` / `M3EFeature` |
| `CornerRounding` | `M3ECornerRounding` |
| `PointTransformer` | `M3EPointTransformer` |
| `LoadingIndicatorTheme` | `M3ELoadingIndicatorTheme` |
| `InputMethodType` | `M3InputMethodType` |
| `M3ColorUtils.harmonious(base)` → 5 colors | `M3ColorUtils.harmonize(design, source)` → 1 color |
| `lerp`, `distance`, `Measurer`, … | removed from the public API |

Code that uses the expressive module now needs
`// ignore_for_file: experimental_member_use`, or an equivalent analyzer option.

## 1.0.1

The three consumer-facing surfaces — README, `example/`, and the hosted demo — had
drifted apart, and the demo still carried pre-1.0 artifacts (UI headings naming
deleted `M3*Token` enums, commented-out code calling removed APIs, an Expressive page
that overflowed its own constraints). This release aligns the triad around one
canonical section order and cleans the demo up to the API it showcases. No library
code changed.

### 📚 Documentation

- **README rewritten to be direct**: leads with the before/after table and a quick
  start; the API tour now covers every exported family (adaptive helpers,
  accessibility, `M3EdgeInsetsPatterns`, `M3GapUtils`, the Expressive namespace
  caveat) in a fixed section order shared with the example and the demo. The
  showcase snippet is unchanged and still compiled by `test/readme_showcase_test.dart`.
- **`example/lib/main.dart` rebuilt as a guided tour**: still deliberately a single
  copy-pasteable file, now organized into the same 11 numbered sections as the
  README, exercising each family with only package tokens — including `M3Contract`,
  which the old example never showed.
- **Demo aligned with the 1.0 API**: stale `M3*Token` names removed from headings,
  dead pages and commented-out legacy blocks deleted, the Expressive page rebuilt
  (loading indicators no longer overflow; the 35-shape morphing preview is finally
  enabled, re-themed to the ambient color scheme), and new showcases added for the
  responsive widgets, `M3Accessibility`, and `M3Contract`. Navigation now reads
  Foundations / Styles / Utilities / Expressive.
- **`CLAUDE.md` expanded into the project constitution**: contract philosophy, module
  graph, the README ↔ example ↔ demo triad rule with its canonical section order,
  commit/changelog/versioning conventions, and verification steps.

### 🧹 Chore

- **Demo metadata caught up with reality**: pubspec description and SDK floor
  (Dart `>=3.6.0`, Flutter `>=3.27.0`, matching the package), a real README, proper
  web titles/manifest, and removal of the broken `deploy.sh` (deploys go through
  `.github/workflows/deploy-demo.yml`).

## 1.0.0

`1.0.0` turns the package from a collection of tokens into a **design contract**: M3 scales are expressed as types, and stepping outside them requires saying so.

This release breaks every call site from `0.28.x`. The [migration guide](#migration-from-028x) below maps each old name to its replacement.

**On the `1.0.0-dev` series.** Thirty-five dev builds led here, but only three reached pub.dev — `1.0.0-dev.8`, `1.0.0-dev.9` and `1.0.0-dev.10`, documented in their own sections below. `1.0.0-dev.1` through `1.0.0-dev.7` and `1.0.0-dev.11` through `1.0.0-dev.35` were internal to this release: they exist as commits, never as installable versions, so their changes are described here rather than listed as versions nobody could depend on.

### 💥 Breaking Changes

- **Type-safe token values everywhere.** Every scale is now an extension type over its primitive: `M3SpacingValue`, `M3BorderWidthValue`, `M3OpacityValue`, `M3CornerValue`, `M3IconSizeValue`, `M3BreakpointValue`, `M3ElevationDpValue`, `M3ZIndexValue`, `M3ToneValue`. They `implement` their representation type, so they pass straight into any Flutter API that takes a `double`/`int`.
- **Scalar token enums removed.** `M3SpacingToken`, `M3CornerToken`, `M3BorderWidthToken`, `M3OpacityToken`, `M3IconSizeToken`, `M3ZIndexToken`, `M3BreakpointToken`, `M3MarginToken`, `M3SpacerToken`, `M3StateLayerOpacityToken`, `M3ElevationToken` and the `IM3Token` interface are gone, along with the `.value` unwrap that cost `const`-ness at every call site.
- **`M3Motion` and `M3Elevation` are now enums.** These are *composite* tokens — you read `duration`+`curve` and `dp`+`shadows` together, never unwrap them to one number — so an enum is the right shape. They stay `const`, and gain `values` and exhaustive `switch`. See the philosophy section of the README for the precise rule.
- **`M3Contract` is the single escape hatch.** Extension types are erased at runtime, so `17.3 as M3SpacingValue` has always compiled and no Dart design can stop it. Instead of claiming otherwise, deviations now route through `M3Contract.spacing(18)`, `M3Contract.corner(10)`, and friends — one greppable identifier you can audit or ban.
- **Strict 7-level shape scale.** `none` (0dp, renamed from `zero`), `extraSmall`, `small`, `medium`, `large`, `extraLarge`, `full`. `M3Radius` now takes an `M3CornerValue` rather than any `double`.
- **Typography overhaul.** `M3TextStyle`/`M3TextStyleToken`/`M3TypeScaleCategory` are replaced by `M3TypeScale` (the 15 styles as `const TextStyle`), `M3TextTheme` (build a Flutter `TextTheme`), and `M3TextUtils` (transformations).
- **`M3TextUtils.adaptive` removed.** It pre-scaled `fontSize` and then rewrote `height` so absolute line height stayed *fixed* while the font grew — text overlapped at high text-scale settings — and it double-scaled, since `Text` applies the ambient `TextScaler` on top. Replaced by `M3TextUtils.clampedScaler(context, maxScaleFactor: …)`, which returns a clamped `TextScaler` to hand to `Text`.
- **`ColorScheme` state layer helpers deduplicated.** `hoverLayerOn` / `focusLayerOn` / `pressLayerOn` / `dragLayerOn` and the parallel `M3ColorSchemeStateLayers` extension collapse into one `colorScheme.stateLayerColor(base, M3InteractionState.hover)`. The state-to-opacity mapping now lives once, on `M3InteractionState.stateLayerOpacity`.
- **`M3ColorUtils.tonalPalette` removed** in favour of the real `M3TonalPalette` (see Features). The old one approximated HCT with HSL lightness.
- **`M3EdgeInsetsPatterns.button` removed.** Its own doc admitted it rounded a 10dp spec value to the nearest 12dp token — an off-spec value inside a package that promises none.
- **`M3Motion.getDurationByDistance` / `getEasingByType` renamed** to `durationFor` / `curveFor`, and they now return `M3MotionDuration` / `M3MotionCurve` instead of widening to bare `Duration` / `Curve`.
- **SDK floor corrected to Flutter `>=3.27.0`, Dart `>=3.6.0`.** The package already used `Color.withValues` and `Color.a`, which do not exist below 3.27 — the previously declared `>=3.19.0` would not have compiled.
- **`M3Accessibility`** is now `abstract final class` rather than `abstract interface class`; it is a namespace of statics and was never implementable.
- **Deprecated APIs deleted:** the `deprecated/` folder, dead commented-out code, and the orphaned `M3Container` file that was never exported.

### ✨ Features

- **Real tonal palettes.** `M3TonalPalette` and `M3CorePalette` generate colors in HCT space through `material_color_utilities` — the same math Material Design uses. `M3TonalPalette.fromSeed(seed)[M3Tones.t40]` reproduces the Material baseline `primary` exactly (verified in the test suite). `M3CorePalette.fromSeed` yields all six palettes (primary, secondary, tertiary, neutral, neutralVariant, error).
- **`M3Tones`** — the 13 tone stops (0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 95, 99, 100) as typed constants.
- **`M3StateLayer`** — applies the correct M3 overlay for hover (8%), focus (10%), pressed (10%), and dragged (16%), with M3 precedence when several states are active at once.
- **`M3FocusRing`** — the official 3dp ring at a 3dp offset. The inset is reserved whether or not the child is focused, so tabbing to a control never shifts it. The ring observes focus rather than taking it, and adds no tab stop of its own.
- **`M3FocusIndicator`** — focus ring `thickness` and `offset` as their own tokens, kept off `M3BorderWidths` so 3dp cannot leak into ordinary component outlines.
- **`values` lists on every scale** — `M3Spacings.values`, `M3Corners.values`, `M3BorderWidths.values`, `M3IconSizes.values`, `M3ZIndexes.values`, `M3Breakpoints.values`, `M3ElevationDps.values`, `M3Tones.values` — for building galleries and property tests without hand-maintained lists.
- **`M3LayoutWidths`** — body (1040dp), pane (360dp), ultraWide (1920dp) and unbounded, replacing magic numbers previously inlined in `M3ScreenSize`.
- **`M3ScreenSize.minWidth`**, and `gutterWidth`/`pageMargin` now return `M3SpacingValue` rather than bare doubles.
- **`M3TextTheme.applyToTheme` merges rather than replaces.** `M3TypeScale` carries metrics only — no style defines a `color` — so `theme.copyWith(textTheme: toTextTheme())` would swap out the whole `TextTheme`, discarding the brightness-aware one `ThemeData`'s constructor already resolved. All fifteen styles would come out with `color: null`, which the engine paints black, in both themes. Merging onto `theme.textTheme` means `TextStyle.merge` overwrites only the non-null metric fields, so the resolved color and the `fontFamily` `Typography` supplies both survive.

### 🏗 Architecture

- **The package is now nine modules**, not one 56-file `part of` monolith: `tokens`, `motion`, `shape`, `layout`, `color`, `typography`, `interaction`, `adaptive`, `expressive`. `material_design.dart` is a barrel of `export`s and the dependency graph runs one way. Private members are now genuinely private to their module.
- The token layer stays a single library by design — the type-safe wrappers need library-private constructors, and splitting them would force those public and dissolve the contract.

### ✅ Tests

- Test count raised from 88 to 158, covering the areas the rewrite left unverified: tonal palette generation (against Material's own baseline), focus ring layout stability and focus semantics, state layer precedence, motion scheme/alias consistency, breakpoint boundaries, text scaling, elevation, and the token scales themselves (4dp grid adherence, ordering, spec values).
- The README showcase is compiled and rendered by `test/readme_showcase_test.dart`, so documentation cannot drift from the API.
- Regression coverage for the type scale applied to a theme: light and dark must resolve to different non-null colors while the M3 metrics still land, and a `Text` rendered under a dark theme must paint light rather than black.

### 📦 Packaging

- **Published archive is 134 KB rather than 692 KB**, thanks to `.pubignore`. `demo/` is a complete Flutter project (~1.1 MB of platform scaffolding) that ships as a hosted web demo instead, and `documentation/` is an Obsidian vault of working notes listed in `.gitignore` yet still tracked — pub was bundling both.
- **`example/`**: keeps `lib/` and `pubspec.yaml`, which pub.dev renders, and drops the native runners beneath them.
- A root `.pubignore` replaces `.gitignore` for pub's purposes, so the standard build artefacts are repeated in it.

### 🧹 Chore

- **Toolchain on Flutter 3.47.0 (stable)**: development had been on a seven-month-old `master` build. `flutter pub get` on 3.47 migrated `analysis_options.yaml` in the package and the example to exclude build and platform directories; those migrations are kept.
- **`homepage:`**: dropped the empty key; `repository:` already points at the source.

---

## Migration from 0.28.x

### Scalar tokens: drop `.value`, use the constant

| 0.28.x | 1.0.0 |
| :--- | :--- |
| `M3SpacingToken.space16` / `.value` | `M3Spacings.s16` |
| `M3SpacingToken.space4` … `space128` | `M3Spacings.s4` … `s128` |
| `M3MarginToken.compactScreen` | `M3Margins.compactScreen` |
| `M3SpacerToken.pane` | `M3Spacers.pane` |
| `M3CornerToken.zero` | `M3Corners.none` |
| `M3CornerToken.medium.value` | `M3Corners.medium` |
| `M3BorderWidthToken.thin.value` | `M3BorderWidths.thin` |
| `M3OpacityToken.disabledContent.value` | `M3Opacities.disabledContent` |
| `M3StateLayerOpacityToken.hover.value` | `M3StateLayerOpacities.hover` |
| `M3IconSizeToken.standard.value` | `M3IconSizes.standard` |
| `M3ZIndexToken.modal.value` | `M3ZIndexes.modal` |
| `M3BreakpointToken.expanded.value` | `M3Breakpoints.expanded` |
| `M3ElevationToken.level3` | `M3Elevation.level3` |
| `M3Elevation.level3Dp` | `M3ElevationDps.level3` |
| `M3Shadows.level2` | `M3ElevationShadows.level2` |

### Typography

| 0.28.x | 1.0.0 |
| :--- | :--- |
| `M3TextStyle.bodyLarge` | `M3TypeScale.bodyLarge` |
| `M3TextStyleUtils.*` | `M3TextUtils.*` |
| `M3TypeScaleCategory.*` | removed — use the 15 named styles |
| `M3TextUtils.adaptive(...)` | `M3TextUtils.clampedScaler(context, maxScaleFactor: …)` on `Text.textScaler` |

### Color

| 0.28.x | 1.0.0 |
| :--- | :--- |
| `colorScheme.hoverLayerOn(c)` | `colorScheme.stateLayerColor(c, M3InteractionState.hover)` |
| `colorScheme.focusLayerOn(c)` | `colorScheme.stateLayerColor(c, M3InteractionState.focus)` |
| `colorScheme.pressLayerOn(c)` | `colorScheme.stateLayerColor(c, M3InteractionState.pressed)` |
| `colorScheme.dragLayerOn(c)` | `colorScheme.stateLayerColor(c, M3InteractionState.dragged)` |
| `M3ColorUtils.tonalPalette(c)` | `M3TonalPalette.fromColor(c)` |
| `M3TonalPalette.tone40` (an `int`) | `M3Tones.t40`, or `palette[M3Tones.t40]` for the color |

### Responsive

| 0.28.x | 1.0.0 |
| :--- | :--- |
| `M3BreakpointToken.getScreenSize(context)` | `M3ScreenSize.of(context)` |
| `M3BreakpointToken.fromWidth(w)` | `M3ScreenSize.fromWidth(w)` |

### Motion

| 0.28.x | 1.0.0 |
| :--- | :--- |
| `MotionDistance` / `MotionType` | `M3MotionDistance` / `M3MotionType` |
| `M3MotionDuration.extralong1` | `M3MotionDuration.extraLong1` |
| `M3Motion.getDurationByDistance(d)` | `M3Motion.durationFor(d)` |
| `M3Motion.getEasingByType(t)` | `M3Motion.curveFor(t)` |

### Values that are no longer on a scale

Anything that was a raw `double` and is now rejected by the type system was, by definition, off-spec. Two ways forward:

```dart
// Preferred: snap to the nearest token.
M3EdgeInsets.all(M3Spacings.s16)

// When the value is genuinely required: say so, once, visibly.
M3EdgeInsets.all(M3Contract.spacing(17.3))
```

Then audit what is left:

```sh
grep -rn 'M3Contract\.' lib/
```

## 1.0.0-dev.10

### 💥 Breaking Changes

- **Consumer utilities migrated to the 1.0.0 API**: `M3Adaptive`, `M3Accessibility`, `M3ResponsiveBuilder`, `M3ResponsiveGrid`, `M3ResponsiveGridConfig`, `M3ResponsiveScaffold`, `M3ResponsiveValue` and `M3ResponsiveVisibility` now consume static token constants rather than the removed enums.

### 🔄 Refactor

- **`M3ResponsiveGridConfig`**: Simplified to plain fields now that the values it carries no longer need unwrapping.


## 1.0.0-dev.9

### 💥 Breaking Changes

- **`deprecated/` folder deleted**: `M3ElevationToken`, `M3Elevations` and `M3Shadows` were deprecated in `0.27.0` and are now removed. Use `M3Elevation`, `M3ElevationDps` and `M3ElevationShadows`.

### 🧹 Chore

- **Dead commented-out code removed** throughout, including a large block in `M3ShapeDecoration` and the commented section headers that padded the barrel file.
- Roughly 1,470 lines deleted, 11 added.


## 1.0.0-dev.8

### 💥 Breaking Changes

- **`M3TypeScaleCategory` enum removed**: the five categories (display, headline, title, body, label) were a grouping in the specification, not a value anyone needed at runtime.
- **`M3TextStyle` utility extensions removed**: the responsive, accessible and adaptive text-style helpers are gone pending a rewrite that separates tokens from transformations.

### 🔄 Refactor

- Reduced the typography files by roughly 310 lines ahead of the type scale rewrite.


## 0.35.0-dev

### 🚀 Major Release - Design Token Architecture

This version introduces a complete architectural overhaul with a professional token-based design system, making this package suitable for enterprise applications.

### ✨ Features

- **Design Token System Architecture**: Complete implementation of the three-tier token hierarchy (Reference → System → Component tokens)
  - **Reference Tokens**: Raw values for elevation, shadow opacity, and tonal overlays
  - **System Tokens**: Semantic elevation levels with proper token relationships
  - **Component Tokens**: Component-specific elevation values for Cards, Buttons, FABs, Dialogs, and Navigation components
  - **Token Resolver**: Advanced token validation and hierarchy management
  - **Context Extensions**: Easy access to tokens via `context.cardElevation`, `context.buttonDuration`, etc.

- **Enhanced Elevation System**: Completely rewritten elevation system with token architecture
  - **ElevatedSurface Widget**: Professional elevated surface widget with token support
  - **MaterialElevation**: Utility class for state-based elevation management
  - **Tonal Elevation**: Full dark theme support with primary overlay calculations
  - **State Management**: Hover, pressed, dragged, and disabled elevation states
  - **Performance Optimized**: Const constructors and efficient token resolution

- **Motion System Enhancement**: Expanded motion system with comprehensive token support
  - **Duration Tokens**: Component-specific animation durations
  - **Easing Tokens**: Component-specific animation curves
  - **Choreographed Animations**: MotionChoreographer for complex animation sequences
  - **Context Access**: Easy access via `context.buttonDuration`, `context.fabEasing`, etc.

- **Shape System Enhancement**: Improved shape system with better token integration
  - **Shape Tokens**: Component-specific shape definitions
  - **Context Extensions**: Access shapes via context for better DX
  - **Performance Improvements**: Optimized shape calculations

### 📚 Documentation

- **Complete README Overhaul**: Comprehensive documentation rewrite featuring:
  - Professional package description and value proposition
  - Complete API documentation with examples
  - Token system explanation and usage patterns
  - Advanced usage patterns and custom theme extensions
  - Testing guidelines and best practices
  - Component-specific token reference tables
  - Enterprise-ready examples and patterns

### 🔧 Developer Experience

- **Type Safety**: Full TypeScript-style type safety with strongly typed tokens
- **IDE Support**: Enhanced IntelliSense and autocomplete support
- **Self-Documenting**: Every token includes metadata and descriptions
- **Debugging Tools**: Token debugging utilities and validation helpers
- **Performance**: Const constructors throughout for optimal performance

### 🏗️ Architecture

- **Enterprise-Ready**: Scalable architecture suitable for large applications
- **Maintainable**: Clear separation of concerns with token hierarchy
- **Extensible**: Easy to extend with custom tokens and components
- **Testable**: Comprehensive token validation and testing utilities

### 🔄 Breaking Changes

- **Elevation API**: The elevation system has been completely rewritten with token-based architecture. Migration guide available in README.
- **Component Access**: Component-specific values now accessed via context extensions (e.g., `context.cardElevation.elevated`)

This release establishes the foundation for a professional, enterprise-grade Material Design 3 implementation in Flutter.


## 0.34.0-dev

### ✨ Features

- **Material Design 3 Elevation System**: Implemented the complete Material Design 3 elevation system in `lib/src/styles/elevation/elevation_system.dart`. This feature includes:
  - **`MaterialElevation`**: Defines the standard elevation levels from 0 to 5.
  - **`MaterialShadows`**: Provides the box shadows for each elevation level.
  - **`TonalElevation`**: Implements tonal elevation for dark themes.
  - **`ElevatedSurface`**: A widget that applies elevation to its child.
  - **`ComponentElevation`**: Predefined elevation values for common Material Design 3 components.

### 📚 Documentation

- **`README.md` Update**: Added a new section for the Elevation System with usage examples.

### 🔄 Refactor

- **Public API Enhancement**: Updated main export file to include the new elevation system, making it available through the public API.


## 0.33.0-dev

### ✨ Features

- **Motion System**: Implemented the complete Material Design 3 motion system, including easing and duration tokens.
  - **`duration.dart`**: Provides standardized durations for animations.
  - **`easing.dart`**: Provides standard easing curves for natural and expressive motion.

### 📚 Documentation

- **`README.md` Overhaul**: The `README.md` has been completely rewritten to be more concise and provide better examples for all features.


## 0.32.0-dev

### ✨ Features

- **Material Design 3 Shape System**: Implemented the complete Material Design 3 shape system in `lib/src/styles/shape/shape_system.dart`. This feature includes:
  - **`ShapeScale`**: Defines the corner radius scale from `none` (0dp) to `full` (circular).
  - **`CornerShape`**: Allows for creating shapes with individual corner radii.
  - **`CornerFamily`**: Supports both `rounded` and `cut` corner styles.
  - **`ShapeScheme`**: A complete shape scheme for consistent application-wide shapes.
  - **`MaterialShapes`**: A factory for creating various shape borders like `rounded`, `cut`, and `continuous`.
  - **`ComponentShapes`**: Predefined shapes for common Material Design 3 components.
  - **`ShapeTheme`**: A Theme extension for integrating the shape system with Flutter's theme.
  - **`ShapeContainer`**: A widget for applying shapes to its child.


## 0.31.0-dev

### ✨ Features

- **Accessibility Tools for Flutter**: A comprehensive collection of widgets and utilities to simplify the implementation of accessibility features in Flutter applications. This new feature, located in `lib/src/foundations/accessibility.dart`, includes:
  - **`AccessibilityProvider`**: A centralized provider to manage configurations like dynamic text scaling, high-contrast themes, and touch target sizing.
  - **`TouchTargetSpec`**: Defines minimum touch target sizes (48x48dp) and spacing to ensure usability.
  - **`ContrastUtils`**: Utilities for calculating and validating WCAG contrast ratios.
  - **`FocusIndicatorSpec`**: Specifications for focus indicators to improve keyboard navigation.
  - **`AccessibilityValidator`**: A tool to validate widgets against accessibility requirements.
  - **`AccessibleTouchTarget`**: A widget to ensure minimum touch target size for interactive elements.
  - **And much more**: Includes utilities for screen readers, keyboard navigation, live regions, and color blindness simulation.

### 📚 Documentation

- **Enhanced README.md**: Updated with a new section on "Accessibility Tools for Flutter", including an integrated usage example.

### 🧹 Chores

- **Updated .gitignore**: Added `documentation` to the list of ignored directories.


## 0.30.0-dev

### ✨ Features

- **Material Design 3 Adaptive System**: Complete implementation of the Material Design 3 adaptive design system in `lib/src/foundations/adaptive.dart`. This comprehensive system includes:
  - **Window Size Classes**: Five breakpoints (compact: 0-599dp, medium: 600-839dp, expanded: 840-1199dp, large: 1200-1599dp, extra-large: 1600dp+) following the official Material Design 3 specifications
  - **Canonical Layouts**: Support for single-pane, list-detail, supporting pane, and feed layout patterns with automatic recommendations based on screen size
  - **Adaptive Grid System**: Complete 12-column grid system with responsive margins and gutters
  - **Navigation Recommendations**: Automatic navigation type suggestions (bottom navigation, navigation rail, navigation drawer) based on window size class
  - **Responsive Utilities**: Helper methods for responsive calculations, orientation detection, and layout decisions

### 📚 Documentation

- **Enhanced README.md**: Updated with new "Material Design 3 (2025)" branding and comprehensive documentation improvements:
  - **Adaptive Design Examples**: Complete example code showing how to use `AdaptiveConfig` for responsive layouts
  - **Responsive Layout Guide**: Step-by-step guide for implementing adaptive layouts with different navigation patterns
  - **Enhanced Feature List**: Updated feature highlights with new adaptive design capabilities
  - **Improved Code Examples**: More comprehensive usage examples with better formatting and clarity

### 🔄 Refactor

- **Public API Enhancement**: Updated main export file to include the new adaptive design system, making it available through the public API

### 🧹 Chores

- **Code Cleanup**: Removed obsolete entries from `.gitignore` for better repository organization


## 0.29.0-dev

### 💥 Breaking Changes

- **Complete Token System Refactor**: The entire token system has been refactored to a new, more robust, and unified API. All old token files have been removed and replaced by a new centralized design token system. This is a major breaking change that will require a complete migration.

### ✨ Features

- **New Design Token System**: A new, unified design token system has been introduced in `lib/src/foundations/design_tokens.dart`. This new system provides a more consistent and scalable architecture for managing design tokens.
- **Hierarchical Tokens**: The new system implements a three-tier token hierarchy (reference, system, and component tokens) for better organization and maintainability.

### 🔄 Refactor

- **Consolidated Token Files**: All token-related files have been removed and replaced by a single, centralized token system. This simplifies the project structure and makes it easier to manage tokens.
- **Updated Main Export**: The main `material_design.dart` file has been updated to export the new design token system.

## 0.28.1

### ✨ Features

- **`M3EdgeInsets` with `M3MarginToken`**: The `M3EdgeInsets` class now supports `M3MarginToken`, allowing for responsive margins to be applied directly to padding.

### 📚 Documentation

- **Complete `README.md` Overhaul**: The `README.md` has been completely rewritten to provide a comprehensive guide on how to use each class in the design system.
  - **How to Use Each Class**: A new section with detailed tables for all design system components, including `Typography`, `Spacing`, `Shape`, `Decorations`, `Elevation`, `Motion`, and `Responsive Layout`.
  - **Updated Examples**: All examples have been updated to reflect the latest best practices and API usage.
  - **Improved Quick Reference**: The quick reference tables have been updated and expanded to include all available tokens and classes.

### 🔄 Refactor

- **`M3EdgeInsets`**: Refactored to support both `M3SpacingToken` and `M3MarginToken`.
- **`M3ShapeDecoration`**: Fixed the constructor to align with super class.
- **Tests**: Updated `M3EdgeInsets` tests to use `const` for improved performance.

### chore

- **`.gitignore`**: Added `documentation` to the `.gitignore` file.

## 0.28.0

### 💥 Breaking Changes

- **`M3EdgeInsets` Refactor for `const` Support**: The `M3EdgeInsets` class has been completely refactored to support `const` constructors. This is a significant performance improvement but may require updates to your code.
  - **Before**: `M3EdgeInsets.all(M3SpacingToken.space16)` (was not `const`)
  - **After**: `const M3EdgeInsets.all(M3SpacingToken.space16)` (is now `const`)
- **`M3Container` Deprecated**: The `M3Container` widget has been deprecated and will be removed in a future version. Use the standard `Container` with `const` `M3EdgeInsets` and `M3BoxDecoration` for better performance and flexibility.

### ✨ Features

- **`const` `M3EdgeInsets`**: Create `EdgeInsets` at compile time for maximum performance.
- **`const` `M3Radius` and `M3BorderRadius`**: `const` support for all radius and border radius tokens.
- **`const` `M3EdgeInsetsPatterns`**: All predefined padding patterns in `M3EdgeInsetsPatterns` are now `const`.

### 📚 Documentation

- **Complete `README.md` Overhaul**: The `README.md` has been rewritten from the ground up to be a comprehensive guide.
  - **"The Right Way" vs. "The Wrong Way"**: Clear guidance on the best practices for using the library.
  - **Quick Reference Tables**: Detailed tables for all design system classes, `const` tokens, and token enums.
  - **Performance vs. Compliance Matrix**: A new section to help users choose the right approach for their needs.
  - **Updated Examples**: All examples have been updated to use the new `const`-friendly APIs.

### 🔄 Refactor

- **`M3EdgeInsets`**: Rewritten to use `const` constructors and a new internal implementation that avoids `.value`.
- **`M3Radius` and `M3BorderRadius`**: Refactored for `const` correctness and improved code formatting.
- **`M3Elevation`**: Updated to conditionally apply shadows based on the `hasShadow` property.

### 🗑️ Deprecated

- **`M3Container`**: This widget is now deprecated in favor of using the standard `Container` with `const` `M3EdgeInsets` and `M3BoxDecoration`.

## 0.27.0

### Refactor

- **Elevation System Overhaul**: The elevation token system has been completely refactored for clarity, performance, and adherence to Material 3 principles.
  - The previous `M3ElevationToken` enum has been replaced by a more powerful and intuitive `M3Elevation` class system.
  - `M3Shadows` has been renamed to `M3ElevationShadows` to better reflect its purpose.
  - Introduced `M3ElevationDps` for direct access to elevation dp values as compile-time constants.

### Features

- **New Elevation API**:
  - `M3Elevation`: A new class-based system (`M3Elevation.level1`, `M3Elevation.level2`, etc.) that bundles `dp`, `shadows`, and `surfaceColor(context)` in a single, easy-to-use token.
  - `M3ElevationDps`: Provides direct `const double` values for each elevation level (e.g., `M3ElevationDps.level3` is `6.0`).
  - `M3ElevationShadows`: Provides direct `const List<BoxShadow>` values for each elevation level (e.g., `M3ElevationShadows.level3`).
- **Improved Type Safety**: The new API enhances type safety and reduces ambiguity between elevation values, shadows, and surface tints.

### Documentation

- **Complete README Overhaul**: The `README.md` has been rewritten from the ground up to be a comprehensive and easy-to-understand guide.
  - **Const vs. Non-Const**: Clear distinction and explanation of compile-time (`const`) vs. runtime tokens.
  - **Token Reference Tables**: Added detailed tables for all design tokens and utility classes, showing their purpose, class names, and usage examples.
  - **Practical Examples**: Updated and improved examples demonstrating correct usage, including "do's and don'ts".
  - **Philosophy & Hierarchy**: Refined explanations of the design system's philosophy and token hierarchy.
- **Updated In-Code Documentation**: All new and refactored classes (`M3Elevation`, `M3ElevationDps`, `M3ElevationShadows`) have been thoroughly documented.

### Fixes

- **Consistency**: Ensured all examples and internal usages throughout the package now use the new, consistent elevation API.
- Corrected various references in the documentation to point to the new elevation and shadow classes.

### Deprecated

- **`M3ElevationToken`**: This enum is now deprecated. Use the `M3Elevation` class or `M3ElevationDps` constants instead.
- **`M3Elevations`**: This class is now deprecated. Use `M3ElevationDps` instead.
- **`M3Shadows`**: This class is now deprecated. Use `M3ElevationShadows` instead.

## 0.26.2

### 🎨 Demo Application Enhancements and Documentation Improvements

This release focuses on improving the demo application user experience, enhancing documentation clarity, and better code organization. The changes provide clearer navigation, improved examples, and more consistent API usage patterns.

### ✨ Key Enhancements

- **Demo Application Improvements**:

  - **Page Organization**: Renamed demo pages for better semantic clarity:

    - `spacing_page.dart` → `spacing_tokens_page.dart`
    - `color_page.dart` → `color_tokens_page.dart`
    - `elevation_page.dart` → `elevation_tokens_page.dart`
    - Moved component pages to `widgets/` directory for better structure

  - **Navigation Enhancement**:

    - Updated navigation rail labels for consistency (e.g., "Z-Indexes" → "Z-Index", "Borders" → "Border")
    - Improved page titles to match token naming conventions
    - Better visual hierarchy in demo application structure

  - **LaunchURLText Integration**: Enhanced demo pages with consistent `LaunchURLText` usage for better documentation linking and improved accessibility

- **Documentation Enhancements**:

  - **README.md Updates**:

    - Improved token reference table with clearer column headers ("Class (const)" vs "Enum (not const)")
    - Added better code examples showing both const and non-const usage patterns
    - Enhanced API usage examples with more detailed explanations
    - Updated elevation and motion examples for better clarity

  - **Code Example Improvements**: Updated all examples to demonstrate proper const usage patterns and token access methods

- **User Experience Improvements**:

  - **Accessibility**: Better integration of LaunchURLText components across foundation and style pages
  - **Visual Consistency**: Standardized page layouts and component demonstrations
  - **Navigation Flow**: More intuitive page organization and naming conventions

### 🔧 Technical Improvements

- **Code Organization**: Better file structure with semantic naming conventions
- **Demo Consistency**: Standardized demo page implementations across all token categories
- **Documentation Links**: Improved external documentation integration through LaunchURLText components

### 📊 Impact

- **Developer Experience**: More intuitive demo application with clearer navigation and examples
- **Documentation Quality**: Better organized documentation with improved code examples
- **Learning Curve**: Easier onboarding for new developers using the design system

**Suggested Version Bump**: `0.26.2` - Minor version bump for demo application enhancements, documentation improvements, and better code organization without breaking API changes.

## 0.26.1

### 🎨 Code Quality and Documentation Improvements

This release focuses on code formatting consistency, documentation enhancements, and improved developer experience through better examples and clearer API guidance.

### ✨ Key Enhancements

- **Consistent Code Formatting**:

  - Applied consistent indentation and spacing across all Dart files
  - Standardized constructor formatting and parameter alignment
  - Improved code readability throughout the codebase

- **Enhanced Documentation**:

  - Updated README.md with improved token reference table structure
  - Added clear separation between Constants Class and Type Safe Enum columns
  - Fixed example code to use proper EdgeInsets pattern: `EdgeInsets.all(M3Spacings.space16)`
  - Updated package version references to 0.26.0 in documentation
  - Removed deprecated platform badge from README

- **Demo Application Improvements**:

  - Updated page titles to use consistent token naming (e.g., "M3Breakpoints", "M3Spacings")
  - Improved label descriptions in showcase pages for better clarity
  - Enhanced Z-Index demo with proper token usage patterns
  - Updated motion page with cleaner labeling format

- **CI/CD Optimization**:

  - Simplified GitHub workflow to trigger demo deployment on pull requests
  - Removed dependency on test completion for demo deployment

- **File Structure Improvements**:
  - Renamed token resolver files for better semantic clarity:
    - `border_side_resolver.dart` → `border_side.dart`
    - `radius_resolver.dart` → `radius.dart`

### 🔧 Technical Improvements

- **Type Safety Enhancements**: Better token type handling in demo pages
- **Constructor Consistency**: Aligned constructor formatting across all classes
- **Import Organization**: Cleaner import structure and organization

### 📊 Impact

- **Developer Experience**: More consistent codebase with better readability
- **Documentation Quality**: Clearer examples and improved reference materials
- **Maintainability**: Better organized code structure and naming conventions

**Suggested Version Bump**: `0.26.1` - Minor version bump for documentation improvements, code formatting enhancements, and non-breaking structural changes.

## 0.26.0

### 🚀 API Refinement and Semantic Improvements

This release introduces significant API refinements focused on improving developer experience, semantic clarity, and consistency across the token system. The changes make the library more intuitive and align it better with Dart conventions.

### ✨ Key Enhancements

- **Semantic `M3Border` API**:

  - Introduced named constructors like `M3Border.thin()`, `M3Border.thick()`, and `M3Border.extraThick()` for creating uniform borders with predefined widths.
  - Added `M3Border.all()` for creating borders with custom widths while maintaining token consistency.
  - The default constructor now supports individual side configuration (`top`, `right`, `bottom`, `left`).

- **Intuitive `M3Radius` Constructors**:

  - Renamed the private `_circular` constructor to a public `M3Radius.circular(M3CornerToken)` for direct and intuitive creation of radii from corner tokens.
  - Static constants like `M3Radius.small` now use a private constructor for internal consistency.

- **Simplified `M3Motion` Access**:

  - The `M3Motion` class now directly provides `duration` and `curve` properties, removing the need for intermediate getters and making animation code cleaner.
  - **Before**: `M3Motion.standard.curve` -> **After**: `M3Motion.standard.curve` (No change, but underlying implementation is simpler).

- **`M3ElevationToken` Clarity**:

  - Added a `dp` getter to `M3ElevationToken` to explicitly provide the elevation value as a `double`, improving clarity over the generic `value` property.

- **Improved `README.md` Documentation**:
  - Completely reorganized the "Complete Token Reference" section into two clear tables: **Design Tokens** and **Utility Classes**.
  - Added a 'Group' column to categorize tokens logically (e.g., Layout & Spacing, Motion & Animation, Shape & Border).
  - Updated all code examples to reflect the latest API improvements, providing a clearer and more professional guide.

### 🔧 Breaking Changes

- The internal constructor for `M3Radius` was changed. This is unlikely to affect most users who rely on the provided static constants.
- Some `M3Border` constructors were refined, which may require updates if you were using them directly.

### 📊 Impact

- **Developer Experience**: The API is now more semantic and self-documenting.
- **Code Clarity**: Refined class structures and documentation make the system easier to understand and use.
- **Consistency**: The changes bring greater consistency across different parts of the token library.

## 0.25.0-dev

### 🚀 Major Code Organization and Token System Improvements

This release focuses on completing the token system reorganization, improving code structure, and fixing critical API inconsistencies. It represents a significant step towards production readiness with enhanced developer experience and better alignment with Material Design 3 specifications.

### 🏗️ Token System Enhancements

- **Complete Tokens Directory Restructure**: All token-related files have been moved to a new `lib/src/m3/tokens/` directory structure for better organization:

  - `border/` → Border-related tokens (width, side resolver)
  - `elevation/` → Elevation and shadow tokens
  - `icon/` → Icon sizing tokens
  - `opacity/` → Opacity and state layer tokens
  - `responsive/` → Breakpoint and responsive tokens
  - `shape/` → Corner and radius tokens
  - `spacing/` → Spacing and layout tokens
  - `z_index/` → Z-index layering tokens

- **New M3CornerToken System**: Introduced a comprehensive corner token system with proper enum implementation
- **Typography System Overhaul**: Complete refactor of text styling system with better type safety:
  - Removed deprecated `M3TextStyleToken` enum
  - Enhanced `M3TextStyle` class with utility methods and extensions
  - Added `M3TypeScaleCategory` for better typography organization

### 🔧 API Improvements and Fixes

- **Fixed Extension Compilation Issues**: Resolved critical compilation errors in typography extensions
- **Motion System Polish**: Improved motion curves and duration tokens with proper constant usage
- **Box Shadow Optimization**: Streamlined M3BoxShadow implementation for better performance
- **Documentation Updates**: Enhanced inline documentation for all public APIs

### 📁 File Organization Improvements

- **Trash Directory**: Moved deprecated/unused files to `lib/src/m3/trash/` for future cleanup
- **Consistent Naming**: Standardized file and class naming conventions across the entire codebase
- **Better Part-of Directives**: Updated all part files with correct module references

### 🎨 Component Structure Refinements

- **Decoration Components**: Enhanced `M3BoxDecoration` and `M3ShapeDecoration` classes
- **Container Components**: Improved M3Container implementation
- **Utility Classes**: Better organization of accessibility, adaptive, and color utilities

### ⚠️ Breaking Changes

1. **File Imports Updated**: Many import paths have changed due to directory restructuring
2. **Typography API**: `M3TextStyleToken` has been completely removed - use `M3TextStyle` directly
3. **Token Organization**: Some token classes may have different import paths

### 🔄 Migration Guide

**Typography Migration:**

```dart
// Before (v0.24.0-dev)
style: M3TextStyleToken.headlineLarge.value

// After (v0.25.0-dev)
style: M3TextStyle.headlineLarge
```

**Import Path Updates:**

```dart
// Token imports now use the tokens/ directory
import 'package:material_design/material_design.dart';
// All tokens are still available through the main export
```

### 🛠️ Technical Improvements

- **Resolved Dart Analysis Issues**: Fixed critical compilation errors and warnings
- **Enhanced Type Safety**: Better generic type usage throughout token system
- **Performance Optimizations**: Removed runtime overhead in token usage
- **Code Quality**: Improved linting compliance and code consistency

### 📊 Impact Summary

- **Files Restructured**: 40+ files reorganized into logical directory structure
- **Code Quality**: Resolved all critical compilation issues
- **Developer Experience**: Cleaner, more intuitive API surface
- **Documentation**: Enhanced inline documentation coverage

**Recommended Version Bump: MINOR (0.24.0-dev → 0.25.0-dev)**

This release maintains backward compatibility where possible while providing a more robust foundation for future development.

## 0.24.0-dev

### 💥 BREAKING CHANGES: Massive Project Restructuring and API Refinement

This release introduces a massive architectural overhaul, reorganizing the entire project structure for improved clarity, maintainability, and scalability. The directory structure has been flattened, and many files and classes have been renamed to create a more intuitive and consistent developer experience.

### 🏗️ Architectural Overhaul

- **Flattened Directory Structure**: The deeply nested token, widget, and utility directories (`lib/src/m3/tokens/sys`, `lib/src/m3/widgets`, `lib/src/m3/utils`) have been consolidated into a flatter, more domain-centric structure under `lib/src/m3/`.
  - **Before**: `lib/src/m3/tokens/sys/geometry/m3_border_token.dart`
  - **After**: `lib/src/m3/border/m3_border_token.dart`
- **Domain-Driven Organization**: Files are now grouped by domain (e.g., `border`, `color`, `elevation`, `shape`, `spacing`) rather than by type (token, widget, util). This makes it easier to locate related files.
- **M3 Expressive Renaming**: The `m3_expressive` directory has been shortened to `m3e` for brevity.
  - `LoadingIndicator` is now `M3ELoadingIndicator`.
  - `material_shapes.dart` is now `e_shapes.dart`.

### 🎯 API Refinements

- **`M3CornersToken` -> `M3CornerToken`**: The enum for corner tokens has been renamed to the singular form for consistency.
- **`M3Border.all`**: The factory constructor is now private (`_all`), and static constants (`thin`, `thick`) should be used instead.

### 🔧 Migration Guide

**File Imports:**
Your `part of` directives and imports will need to be updated to reflect the new, flatter file structure.

**M3 Expressive Loading Indicator:**

```dart
// Before (v0.23.0-dev)
import 'package:material_design/src/m3_expressive/loading_indicator/loading_indicator.dart';
LoadingIndicator()

// After (v0.24.0)
import 'package:material_design/src/m3e/e_loading_indicator/e_loading_indicator.dart';
M3ELoadingIndicator()
```

**Corner Radius Tokens:**

```dart
// Before (v0.23.0-dev)
M3Radius.circular(M3CornersToken.small)

// After (v0.24.0)
M3Radius.circular(M3CornerToken.small)
```

**Borders:**

```dart
// Before (v0.23.0-dev)
const M3Border.all(M3BorderSide.thin)

// After (v0.24.0)
M3Border.thin
```

### 📊 Impact Summary

- **Files Modified**: Over 50 files moved, renamed, or updated.
- **Architectural Milestone**: A fundamental reorganization that sets the stage for future growth and scalability.
- **Improved Ergonomics**: The new structure is more logical and easier to navigate.

**Recommended Version Bump: MAJOR (0.23.0-dev → 0.24.0-dev)**

## 0.23.0-dev

### 💥 BREAKING CHANGES: Major Token System Refactoring and API Stabilization

This release marks a significant milestone in the library's evolution, introducing major breaking changes aimed at simplifying the API, improving type safety, and aligning more closely with Flutter's core conventions. The token system has been substantially refactored, removing the `Token` suffix from many classes and promoting direct class usage over enums.

### 🏗️ Architectural Refinements

- **Motion System Overhaul**:

  - **`M3MotionToken` -> `M3Motion`**: The composite motion token has been renamed.
  - **`M3MotionDurationToken` -> `M3MotionDuration`**: Now a class that extends `Duration`, providing direct access to duration constants (e.g., `M3MotionDuration.short2`).
  - **`M3MotionCurveToken` -> `M3MotionCurve`**: Now a class that extends `ThreePointCubic`, providing direct access to curve constants (e.g., `M3MotionCurve.standard`).
  - The `.value` accessor is no longer needed for motion durations and curves.

- **Visual Density System Refactoring**:

  - **`M3VisualDensityToken` -> `M3VisualDensity`**: The enum has been replaced with a class that extends `VisualDensity`, allowing for direct use in `ThemeData` without the `.value` accessor.
  - Provides static constants like `M3VisualDensity.compact` and `M3VisualDensity.comfortable`.

- **Elevation System Simplification**:

  - The `M3ElevationToken` API has been enhanced. The `surfaceColor(context)` and `shadows` getters are now part of the `IM3ElevationTokenVisuals` extension, providing a more unified way to get elevation effects.
  - `M3SurfaceColorToken` has been removed and its logic is now integrated directly into the elevation token.

- **Border System Unification**:

  - **`M3BorderToken` / `M3BorderSideToken` -> `M3Border` / `M3BorderSide`**: The token enums have been replaced by classes that extend `Border` and `BorderSide` respectively.
  - Border styles are now accessed via static constants like `M3Border.thin` and `M3BorderSide.thick`.

- **State Layer System Removal**:
  - `M3StateLayerToken.dart` has been deleted. State layer opacities should be handled using `M3StateLayerOpacities` combined with theme colors.

### 🎯 Developer Experience Improvements

- **Simplified API**: The removal of the `Token` suffix and the `.value` accessor for many tokens results in cleaner, more readable, and more intuitive code.
- **Improved Type Safety**: Using classes that extend core Flutter types (`Duration`, `Curve`, `VisualDensity`, `Border`) enhances type safety and integration with Flutter's widget system.
- **API Alignment**: The new API aligns more closely with standard Flutter conventions, making it easier for developers to adopt.

### 🔧 Migration Guide

**Motion:**

```dart
// Before (v0.22.0-dev)
AnimatedContainer(
  duration: M3MotionDurationToken.medium2.value,
  curve: M3MotionCurveToken.standard.value,
)

// After (v1.0.0)
AnimatedContainer(
  duration: M3MotionDuration.medium2,
  curve: M3MotionCurve.standard,
)
```

**Visual Density:**

```dart
// Before (v0.22.0-dev)
ThemeData(
  visualDensity: M3VisualDensityToken.compact.value,
)

// After (v1.0.0)
ThemeData(
  visualDensity: M3VisualDensity.compact,
)
```

**Elevation & Surface Color:**

```dart
// Before (v0.22.0-dev)
Container(
  decoration: ShapeDecoration(
    color: M3SurfaceColorToken.fromElevationToken(elevation).value(context),
    shadows: elevation.shadows,
  ),
)

// After (v1.0.0)
Container(
  decoration: M3ShapeDecoration(
    color: elevation.surfaceColor(context),
    shadows: elevation.shadows,
  ),
)
```

**Borders:**

```dart
// Before (v0.22.0-dev)
Container(
  decoration: BoxDecoration(
    border: M3BorderToken.thin.value,
  ),
)

// After (v1.0.0)
Container(
  decoration: BoxDecoration(
    border: M3Border.thin,
  ),
)
```

### 📊 Impact Summary

- **Files Modified**: 30+ files updated across the core library, demo, tests, and documentation.
- **Architectural Milestone**: Represents a major stabilization of the token API.
- **Improved Ergonomics**: The API is now significantly more ergonomic and aligned with Flutter's design principles.

**Recommended Version Bump: MAJOR (0.22.0-dev → 0.23.0-dev)**

This release introduces significant breaking changes that rationalize and simplify the entire token system, justifying a major version bump to `1.0.0`.

## 0.22.0-dev

### 🔄 BREAKING CHANGES: Class Name Standardization & API Consistency

This version introduces a comprehensive refactoring to standardize class naming conventions from plural to singular forms, improving API consistency and aligning with Dart naming conventions.

- **Class Name Standardization**: Major refactoring from plural to singular class names across the entire token system:
  - `M3Radii` → `M3Radius`: Individual corner radius token class renamed for better semantic clarity
  - `M3BorderRadii` → `M3BorderRadius`: Border radius token class renamed to follow singular naming convention
  - All references updated throughout the codebase, documentation, and examples

### 🏗️ API Consistency Improvements

- **Unified Naming Convention**: All token classes now follow consistent singular naming patterns
- **Enhanced Type Safety**: Maintained all existing type safety features while improving naming clarity
- **Semantic Clarity**: Class names now better reflect their purpose (individual radius values vs. collections)

### 📱 Complete Application Migration

- **Demo Application Updates**: All demo showcase pages updated to use new class names
  - Updated component examples, foundation pages, and utility demonstrations
  - All visual examples maintain functionality while using new API
- **Example Application Migration**: Complete refactoring of example applications
  - Theme configurations updated to use new class naming
  - Interactive components migrated to new API patterns
  - Maintained all existing functionality and visual consistency

### 📚 Documentation & Examples

- **README Updates**: All documentation examples updated to reflect new class names
- **Code Example Consistency**: All inline code examples throughout the library updated
- **Migration Path**: Clear migration from `M3Radii`/`M3BorderRadii` to `M3Radius`/`M3BorderRadius`

### 🔧 Migration Guide

**Radius and BorderRadius Classes:**

```dart
// Before (v0.21.0-dev)
Container(
  decoration: BoxDecoration(
    borderRadius: M3BorderRadii.medium,
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: M3Radii.large,
      topRight: M3Radii.large,
    ),
  ),
)

// After (v0.22.0)
Container(
  decoration: BoxDecoration(
    borderRadius: M3BorderRadius.medium,
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: M3Radius.large,
      topRight: M3Radius.large,
    ),
  ),
)
```

**Theme Configuration:**

```dart
// Before (v0.21.0-dev)
CardTheme(
  shape: RoundedRectangleBorder(
    borderRadius: M3BorderRadii.medium,
  ),
)

// After (v0.22.0)
CardTheme(
  shape: RoundedRectangleBorder(
    borderRadius: M3BorderRadius.medium,
  ),
)
```

### 📊 Impact Summary

- **Files Modified**: 25+ files updated across core library, demo, example applications, and documentation
- **API Standardization**: Comprehensive class name standardization following Dart conventions
- **Zero Functional Impact**: All token values and functionality remain identical - only class names changed
- **Improved Developer Experience**: More intuitive and consistent API with better semantic clarity

**Recommended Version Bump: MINOR (0.21.0-dev → 0.22.0-dev)**

This release introduces breaking changes in class naming for better API consistency and follows semantic versioning by incrementing to 0.22.0. The changes improve developer experience through standardized naming while maintaining all existing functionality and Material Design 3 compliance.

## 0.21.0-dev

### 💥 BREAKING CHANGES: Major Architectural Overhaul

This version introduces a major architectural refactoring of the token system to enhance type safety, simplify the API, and improve the overall developer experience. The token `enum` system has been replaced with direct `const` values and type-safe atomic wrapper classes.

- **Token API Overhaul**: All `M3...Token` enums (e.g., `M3ShapeToken`, `M3TextStyleToken`, `M3BorderRadiusToken`) have been removed from the public API or made private.
- **Direct `const` Access**: Token values are now accessed directly via `const` fields in new static classes (e.g., `M3Shapes.medium`, `M3TextStyle.bodyLarge`, `M3BorderRadii.small`). The `.value` accessor is no longer needed, resulting in cleaner and more performant code.
- **New Atomic Wrapper Classes**: Introduced new classes that extend Flutter's core layout classes to enforce the use of design tokens at the lowest level:
  - `M3TextStyle` extends `TextStyle`.
  - `M3Radius` extends `Radius`.
  - `M3BorderRadius` extends `BorderRadius`.
  - `M3BorderSide` extends `BorderSide`.
  - `M3RoundedRectangleBorder` extends `RoundedRectangleBorder`.
  - `M3BoxShadow` extends `BoxShadow`.
- **Class Renaming**: The `M3ShadowToken` enum has been replaced by the `M3Shadows` class, which provides direct access to shadow constants.

### 🏗️ Architectural Refinements

- **Atomic Design Principles**: The new atomic classes (`M3TextStyle`, `M3Radius`, etc.) enforce the design system at a more granular level, providing compile-time safety and preventing the use of arbitrary values.
- **API Simplification**: The API is now more intuitive and requires less boilerplate. Direct access to `const` values makes the code cleaner and more aligned with Flutter's core widgets.
- **Improved Type Safety**: The wrapper classes ensure that only valid Material Design tokens can be used, enhancing type safety and reducing potential runtime errors.

### 🎯 Developer Experience Improvements

- **Simplified API**: Code is significantly cleaner and more readable (e.g., `shape: M3Shapes.medium` instead of `shape: M3ShapeToken.medium.value`).
- **Enhanced IDE Support**: The use of `const` values and strongly-typed classes provides better autocompletion and more reliable compile-time error checking in IDEs.
- **Reduced Boilerplate**: The removal of the `.value` accessor and complex token chains reduces boilerplate and simplifies widget styling.

### 🔧 Migration Guide

**Shape Tokens:**
Update `M3ShapeToken.token.value` to the direct `M3Shapes.token` constant.

```dart
// Before
Card(shape: M3ShapeToken.large.value)

// After
Card(shape: M3Shapes.large)
```

**BorderRadius Tokens:**
Replace `M3BorderRadiusToken.token.value` with `M3BorderRadii.token`.

```dart
// Before
Container(
  decoration: BoxDecoration(
    borderRadius: M3BorderRadiusToken.large.value,
  ),
)

// After
Container(
  decoration: BoxDecoration(
    borderRadius: M3BorderRadii.large,
  ),
)
```

**TextStyle Tokens:**
Replace `M3TextStyleToken.token.value` with the direct `M3TextStyle.token` constant.

```dart
// Before
Text('Title', style: M3TextStyleToken.headlineMedium.value)

// After
Text('Title', style: M3TextStyle.headlineMedium)
```

**Elevation & Shadow Tokens:**
Update `M3ShadowToken.fromElevation(...)` to use the new `M3Shadows` class.

```dart
// Before
Container(
  decoration: BoxDecoration(
    boxShadow: M3ShadowToken.fromElevation(M3ElevationToken.level3.value),
  ),
)

// After
Container(
  decoration: BoxDecoration(
    boxShadow: M3Shadows.fromElevation(M3ElevationToken.level3.value),
  ),
)
```

### 📊 Impact Summary

- **Files Modified**: 30+ files updated across the core library, demo, tests, and documentation.
- **Architectural Refinement**: A fundamental shift from an enum-based token system to a more robust, type-safe, and const-based API.
- **API Simplification**: A major improvement in API ergonomics, making the library easier to use and integrate.

**Recommended Version Bump: MAJOR (0.20.2 → 0.21.0-dev)**

This release introduces significant breaking changes and a major architectural refactoring that stabilizes the token system API, justifying a major version bump to 1.0.0.

## 0.20.2

### 📚 Major Documentation Overhaul & API Refinement

- **Complete README.md Rewrite**: The project's `README.md` has been completely overhauled to serve as a comprehensive design system guide.
  - **Enhanced Onboarding**: Introduces foundational design system concepts like token hierarchy, style tokens, and design philosophy to improve developer onboarding.
  - **Improved Examples**: Features new, real-world examples for building consistent components and responsive layouts using the token system.
  - **Clearer Token Reference**: Re-structured the token reference tables for better readability and quick lookups.
  - **Design-Centric Language**: Adopts a more professional, design-system-oriented language to better bridge the gap between design and development.

### 🏗️ Architectural Refinements

- **Semantic API Improvement**: Refactored the core shape value definitions for better clarity and alignment with design terminology.
  - **`M3RadiusValues` -> `M3Corners`**: Renamed the internal `M3RadiusValues` class to `M3Corners` to more accurately describe its purpose (defining corner radius values).
  - **Updated Documentation**: All related inline documentation has been updated to reflect the new, more intuitive naming.
  - This is a non-breaking internal change that improves code maintainability and readability.

### 📊 Impact Summary

- **Documentation Quality**: A monumental improvement in documentation quality, transforming the README into a valuable learning resource.
- **Developer Experience**: Significantly improved developer onboarding and a clearer explanation of the package's philosophy and architecture.
- **Code Clarity**: Enhanced internal code clarity with more semantic naming for core shape tokens.

**Recommended Version Bump: MINOR (0.20.2 → 0.21.0)**

This release introduces a major documentation overhaul and internal API refinements that significantly enhance developer experience and code clarity without introducing breaking changes.

## 0.20.1

### 🔄 Example Application Migration

- **Complete Example Migration to Constants Classes**: Migrated entire example application from Enum Classes to Constants Classes for better consistency
  - **Spacing Tokens**: Updated all `M3SpacingToken` usage to `M3Spacings` constants
  - **Border Radius Tokens**: Migrated `M3BorderRadiusToken` to `M3BorderRadii` and `M3Radii` constants
  - **Breakpoint Tokens**: Updated `M3BreakpointToken` to `M3Breakpoints` constants
  - **Visual Density Tokens**: Migrated `M3VisualDensityToken` to `M3VisualDensities` constants
  - **State Layer Opacity**: Updated `M3StateLayerOpacityToken` to `M3StateLayerOpacities` constants
  - **Border Width Tokens**: Migrated `M3BorderWidthToken` to `M3BorderWidths` constants
  - **Layout Utilities**: Replaced `M3Gap` and `M3Padding.all` with standard Flutter `SizedBox` and `Padding` widgets using constant values
  - **EdgeInsets Migration**: Updated `M3EdgeInsets.all` to standard Flutter `EdgeInsets.all` with constant values
  - **Method Signature Updates**: Updated component methods to use `double` parameters instead of token types where appropriate
  - **Improved Example Consistency**: Example now follows the recommended Constants Class approach documented in README

## 0.20.0

### 🎯 Major Documentation & API Enhancement

- **Complete README.md Overhaul**: Comprehensive restructuring of project documentation with enhanced developer experience
  - **New Feature Comparison Table**: Added detailed comparison between Flutter defaults and material_design package benefits
  - **Enhanced API Examples**: Updated all code examples to showcase both constants and typed token approaches
  - **Improved Quick Start Guide**: Streamlined getting started section with clear API pattern recommendations
  - **Complete Token Reference Table**: Added comprehensive table documenting all token categories with descriptions
  - **Better Visual Hierarchy**: Restructured content organization with clearer sections and improved navigation
  - **Performance Documentation**: Added dedicated performance section highlighting zero runtime overhead and tree-shaking benefits
  - **Enhanced Migration Guide**: Updated examples showing migration from Flutter's built-in Material components

### 🏗️ Motion System Architecture Improvements

- **Enhanced Motion Token Implementation**: Significant improvements to motion token system architecture
  - **Dual Motion Scheme Classes**: Introduced both `M3MotionScheme` (with direct Duration/Curve) and `M3MotionSchemeToken` (with token references) for maximum flexibility
  - **Improved Constructor Patterns**: Updated all motion schemes to use named constructor parameters for better clarity
  - **Enhanced Animation Utilities**: Added `asTween` method to `M3MotionScheme` for convenient animation creation
  - **Consistent Token References**: All motion constants now reference the appropriate duration and curve constants directly
  - **Better Type Safety**: Improved type definitions and method signatures throughout the motion system

### 🎨 Design System Enhancements

- **Shadow Token System Enhancement**: Added utility method to `M3ShadowToken` for better developer experience

  - **New `getValue` Static Method**: Added convenient static method to retrieve constant values from shadow tokens
  - **Improved Token Mapping**: Enhanced mapping between enum tokens and their corresponding constant values
  - **Better API Consistency**: Unified access patterns across shadow token implementations

- **Documentation Formatting Improvements**: Enhanced code documentation throughout the system
  - **Border Token Documentation**: Improved comment formatting for better readability in border system
  - **Shape Token Documentation**: Enhanced getter documentation and method organization in shape tokens
  - **Consistent Code Style**: Applied consistent documentation formatting across all token files

### 📱 Enhanced Developer Experience

- **Improved API Guidance**: Better documentation of when to use different API approaches

  - **Clear Usage Patterns**: Enhanced guidance on choosing between constants, typed tokens, and .value patterns
  - **Real-World Examples**: Added practical implementation examples showing M3Card component usage
  - **Performance Considerations**: Added guidance on when to use const constructors vs. typed tokens
  - **Migration Assistance**: Comprehensive examples for migrating from Flutter's default Material components

- **Better Code Organization**: Improved internal organization and consistency
  - **Enhanced File Structure**: Better organization of motion token implementations
  - **Improved Import Patterns**: Cleaner export structure with better separation of concerns
  - **Consistent Naming**: Standardized naming patterns across all token implementations

### 🔧 Technical Improvements

- **Enhanced Type Safety**: Improved type definitions throughout the codebase

  - **Better Token Interfaces**: Enhanced token interface implementations for more robust type checking
  - **Improved Method Signatures**: Better parameter typing and return type definitions
  - **Consistent API Patterns**: Unified approach to token value access across all systems

- **Code Quality Enhancements**: General improvements to code organization and maintainability
  - **Better Documentation**: Enhanced inline documentation with clearer usage examples
  - **Improved Code Formatting**: Consistent formatting patterns applied throughout the codebase
  - **Enhanced Maintainability**: Better separation of concerns and cleaner internal APIs

### 📊 Impact Summary

- **Files Modified**: 7+ core files updated across documentation, motion system, and token implementations
- **Documentation Enhancement**: Major improvement in developer onboarding and API guidance
- **Motion System Refinement**: Enhanced flexibility and type safety in animation token usage
- **Developer Experience**: Significantly improved getting started experience and API clarity
- **Type Safety**: Enhanced compile-time safety and better IDE integration

**Recommended Version Bump: MINOR (0.19.0 → 0.20.0)**

This release introduces significant documentation improvements, motion system enhancements, and developer experience refinements while maintaining full backward compatibility and Material Design 3 compliance.

## 0.19.0

### 🏗️ Architectural Refinements

- **Motion Token System Overhaul**: Refactored the `M3MotionToken` system for improved consistency and expressiveness.
  - **New `M3MotionScheme`**: The `M3MotionScheme` now encapsulates `M3MotionDuration` and `M3MotionCurve` directly, providing a more unified and token-driven approach to defining motion.
  - **Simplified API**: The `M3MotionToken` API has been streamlined. The `duration` and `curve` getters now return the respective token enums, promoting a more consistent use of tokens throughout the animation system.
  - **Improved Tween Creation**: The `asTween` helper method in `M3MotionScheme` has been updated to correctly use the `.value` of the curve token.

### 🧹 Code Organization & Maintenance

- **Layout Utilities Relocated**: Moved layout utility files for better project structure.
  - `M3BorderRadius` and `M3EdgeInsets` have been relocated from `lib/src/m3/widgets/layout/` to `lib/src/m3/utils/layout/`, clarifying their role as utility classes rather than standalone widgets.

### 🎯 Demo & Documentation Updates

- **README Refresh**: Updated the `README.md` with improved examples that reflect the latest API enhancements.
- **Motion Showcase Update**: The motion showcase page in the demo application has been updated to use the new, refactored motion token API.

**Recommended Version Bump: MINOR (0.18.3 → 0.19.0)**

This release introduces a significant architectural improvement to the motion token system for better consistency and developer experience, along with better code organization.

## 0.18.3

### Refactoring

- **API Refinement**: Renamed `M3BoxShadowToken` to `M3ShadowToken` for a more concise and consistent naming within the elevation system.
- **Documentation**: Updated all documentation and examples to reflect the new `M3ShadowToken` name.

**Recommended Version Bump: PATCH (0.18.2 → 0.18.3)**

This release focuses on a minor API refinement for better consistency and clarity.

## 0.18.2

### 🏗️ Code Architecture & Organization

- **Enhanced Border System**: Completely refactored the border token system for better organization and semantic clarity

  - **New Structured Classes**: Introduced `M3BorderWidths`, `M3BorderSides`, and `M3Borders` as abstract final classes containing all border-related constants
  - **Improved Token Referencing**: All border token enums now reference the new structured classes instead of inline constants, improving maintainability and consistency
  - **Better Code Organization**: Moved border width, border side, and border constants into dedicated static classes for clearer architecture

- **Elevation System Refactoring**: Major improvements to the elevation token system architecture

  - **Enhanced Shadow Color Management**: Moved shadow color constant to private `_color` variable at the top of the file for better encapsulation
  - **Updated M3Shadows Class**: Made `M3Shadows` constructor private (`const M3Shadows._()`) and refactored all shadow definitions to use the private color constant
  - **Improved Token Documentation**: Enhanced elevation token documentation with comprehensive usage examples, visual characteristics, and typical use cases for all 6 elevation levels (level0-level5)
  - **Commented Shadow Color Getter**: Temporarily commented out the `shadowColor` getter in `M3BoxShadowToken` pending architectural review

- **Breakpoint System Enhancement**: Improved the responsive breakpoint system with better documentation and structure

  - **New M3Breakpoints Class**: Introduced comprehensive `M3Breakpoints` abstract final class with detailed documentation for all breakpoint values
  - **Enhanced Documentation**: Each breakpoint now includes device examples, design characteristics, and common use cases
  - **Improved Token References**: Updated `M3BreakpointToken` enum to reference the new `M3Breakpoints` class constants

- **Icon Size System Refactoring**: Complete overhaul of the icon size token system
  - **New M3IconSizes Class**: Introduced structured `M3IconSizes` abstract final class with comprehensive documentation for all icon sizes
  - **Enhanced Size Definitions**: Each icon size now includes detailed usage guidelines, ideal use cases, and semantic clarity
  - **Better Token Organization**: Updated `M3IconSizeToken` enum to reference the new structured class constants

### 🎨 Visual Design System Improvements

- **Enhanced Visual Density Documentation**: Significantly improved visual density token documentation with detailed explanations of each density level and their appropriate use cases

- **Typography System Enhancement**: Improved the typography token system with better documentation and clearer usage patterns

- **Motion System Documentation**: Enhanced motion token documentation with better explanations of duration and curve usage

- **Shape System Improvements**: Better organization of spacing tokens with enhanced documentation and usage guidelines

### 🔧 Developer Experience Enhancements

- **Improved Code Documentation**: Comprehensive documentation updates across all token systems with clear usage examples and best practices
- **Better IntelliSense Support**: Enhanced type definitions and documentation improve IDE support and developer productivity
- **Consistent Architecture**: All token systems now follow a consistent architectural pattern with dedicated constant classes and referencing enums

### 🧹 Code Quality & Maintenance

- **File Structure Cleanup**: Improved organization of token files with better separation of concerns
- **Enhanced Code Consistency**: Standardized patterns across all token systems for better maintainability
- **M3 Expressive Integration**: Improved integration and organization of M3 Expressive components within the design system
- **Layout Widget Enhancements**: Enhanced layout widgets (`M3EdgeInsets`, `M3Gap`, `M3Radius`, `M3ShapeDecoration`) with better token integration

### 📊 Impact Summary

- **Files Modified**: 15+ core token system files updated across elevation, geometry, interaction, motion, shape, spacing, state, and typography systems
- **Architectural Enhancement**: Major improvement in token system organization and consistency
- **Documentation Quality**: Comprehensive documentation improvements across all token systems
- **Developer Experience**: Enhanced IDE support and clearer usage patterns throughout the library

**Recommended Version Bump: MINOR (0.18.1 → 0.18.2)**

This release introduces significant architectural improvements to the token system, comprehensive documentation enhancements, and better code organization while maintaining full backward compatibility and Material Design 3 compliance.

## 0.18.1

### 🔧 Refactoring & Code Quality

- **API Refinement**: Renamed internal `_resolve` method to `resolve` in `M3SurfaceColorToken` and `IM3ContextualToken` for better public API clarity and consistency. This change makes the method public, allowing for easier extension and implementation by developers.
- **Code Cleanup**: Removed an unused constant `_kM3RadiusNoneValue` from the shape token system, contributing to a cleaner and more maintainable codebase.

### 📊 Impact Summary

- **Files Modified**: 3 files updated across the core token system.
- **Architectural Refinement**: Minor improvement in the token system architecture for better extensibility.
- **API Simplification**: Made the token resolution logic more accessible.

**Recommended Version Bump: PATCH (0.18.0 → 0.18.1)**

This release focuses on minor API refinements and code cleanup, improving the overall quality and developer experience without introducing breaking changes.

## 0.18.0

### 🔄 BREAKING CHANGES

- **Token System Overhaul**: Major architectural refactoring of the entire token system. Raw token values have been moved into dedicated `abstract final` classes (e.g., `M3Elevations`, `M3Spacings`, `M3Shapes`), and token `enum`s now reference these constants. This improves code organization, type safety, and maintainability but alters the internal structure.
- **`M3StateLayerToken` Deprecated**: The `M3StateLayerToken` enum and its corresponding file have been commented out and are no longer part of the public API. State layers should now be constructed manually using `M3StateLayerOpacities` and theme colors.
- **Removed Shape Helpers**: Static helper methods `M3ShapeToken.forComponentSize()` and `M3ShapeToken.forComponent()` have been removed.
- **Removed Shape Extensions**: The `M3ShapeExtensions` (`withShape`, `clipWithShape`) have been removed.
- **New `IM3ContextualToken` Interface**: Introduced `IM3ContextualToken` for tokens whose values depend on `BuildContext`. `M3SurfaceColorToken` now implements this interface, changing its `value` from a method to a getter that returns a `Color Function(BuildContext)`.

### 🏗️ Architectural Refinements

- **Centralized Token Constants**: Introduced dedicated classes to hold raw, `const` token values (`M3Elevations`, `M3Spacings`, `M3Shapes`, `M3Radii`, `M3BorderRadii`, `M3VisualDensities`, `M3MotionDurations`, `M3MotionCurves`, `M3Opacities`, `M3StateLayerOpacities`, `M3TextStyles`). This provides a single source of truth and allows for direct access to primitive values when needed.
- **Simplified Token Enums**: All token `enum`s (`M3ElevationToken`, `M3SpacingToken`, etc.) have been simplified to act as semantic wrappers around the new constant value classes.
- **Improved `M3VisualDensityToken`**: The implementation has been significantly streamlined. It now directly holds a `VisualDensity` object instead of separate `horizontal` and `vertical` properties, simplifying its API and improving its integration with Flutter's core density system.

### 🎯 Developer Experience Improvements

- **Enhanced API Consistency**: The refactoring provides a more consistent and predictable API. Developers can now access either the semantic token `enum` or the raw `const` value from the new static classes.
- **Improved Type Safety**: The new structure enhances type safety and reduces the chances of using "magic numbers" throughout the codebase.

### 🔧 Migration Guide

**`M3VisualDensityToken` Usage:**

The API for adaptive density is now a direct static getter.

```dart
// Before (v0.17.0)
VisualDensity adaptive = M3VisualDensityToken.adaptivePlatform.value;

// After (v0.18.0)
VisualDensity adaptive = M3VisualDensityToken.adaptivePlatformDensity;
```

**State Layer Creation:**

Since `M3StateLayerToken` is gone, state layers must be created manually using `M3StateLayerOpacities`.

```dart
// Before (v0.17.0)
Color hoverOverlay = M3StateLayerToken.hoverPrimary.withBaseColor(Theme.of(context).colorScheme.primary);

// After (v0.18.0)
Color hoverOverlay = Theme.of(context).colorScheme.primary.withOpacity(M3StateLayerOpacities.hover);
```

**`M3SurfaceColorToken` Usage:**

The public-facing usage remains the same, but the underlying interface has changed from a method `value(context)` to a getter `value` that returns a function.

```dart
// Usage remains the same, but be aware of the interface change if you were implementing it.
Color surfaceColor = M3SurfaceColorToken.level1.value(context);
```

### 📊 Impact Summary

- **Files Modified**: 20+ files updated across the core library and tests.
- **Architectural Refinement**: Major improvement in token system architecture for long-term maintainability.
- **API Simplification**: Removed several APIs (`M3StateLayerToken`, shape helpers) in favor of a more direct, foundational approach.

**Recommended Version Bump: MAJOR (0.17.0 → 0.18.0)**

This release introduces significant breaking changes and a major architectural refactoring of the token system, aimed at improving consistency, maintainability, and type safety.

## 0.17.0

### 🏗️ CI/CD Infrastructure & Quality Improvements

- **Temporary CI/CD Adjustment**: Disabled static analysis in GitHub Actions workflow to address immediate build pipeline concerns
  - **Flutter Analyze Disabled**: Commented out `flutter analyze --no-fatal-infos` command in `.github/workflows/tests.yml`
  - **Build Pipeline Stabilization**: Ensures continued CI/CD functionality while addressing underlying analysis issues
  - **Temporary Measure**: This change is intended as a short-term solution to maintain development workflow

### ✨ New Features & Token System Enhancements

- **New State Layer Token System**: Introduced comprehensive `M3StateLayerToken` for advanced interaction feedback
  - **Complete State Layer Implementation**: Added dedicated token for managing interactive element overlays
  - **Enhanced Documentation**: Comprehensive inline documentation with usage patterns and integration examples
  - **Consistent API**: Follows established token interface patterns for seamless integration

### 🔧 Code Quality & API Improvements

- **Enhanced Type Safety**: Improved type definitions and method signatures across multiple token systems

  - **Color Extension Methods**: Enhanced color utilities with robust `toARGB32()` method for consistent hex representation
  - **Elevation Token Reorganization**: Better organization of elevation-related properties and factory methods
  - **Border Token Enhancements**: Comprehensive documentation and improved API consistency for border-related tokens

- **Method Signature Improvements**: Enhanced parameter formatting and documentation consistency
  - **Visual Density Token**: Improved conditional logic formatting for better code readability
  - **Breakpoint Token**: Enhanced method signature formatting with proper line breaks and parameter alignment
  - **Icon Size & Z-Index Tokens**: Consistent documentation patterns and improved type safety

### 🧹 Code Organization & Architecture

- **Demo Application Cleanup**: Streamlined demo application with improved code organization

  - **Removed Unused Methods**: Eliminated redundant shape example methods (`_buildShapeExample`, `_buildSpacingDemo`)
  - **Cleaner Code Structure**: Improved readability by removing unused helper methods and commented code sections
  - **Import Optimization**: Removed unnecessary imports and improved dependency management

- **Enhanced Library Structure**: Better organization of token implementations and exports
  - **Improved Token Organization**: Enhanced internal organization of elevation, geometry, and state tokens
  - **Consistent Documentation**: Standardized inline documentation patterns across all token files
  - **Better Type Definitions**: Enhanced interface implementations and method signatures

### 🎨 Visual & Styling Improvements

- **Color Display Enhancement**: Improved color representation throughout demo and example applications

  - **Hex Color Display**: Updated color chips to use improved `toARGB32()` method for accurate hex representation
  - **Consistent Color Formatting**: Standardized color hex code display patterns across all components
  - **Better Color Utilities**: Enhanced color manipulation and display consistency

- **Elevation System Refinements**: Improved elevation token usage and surface color integration
  - **Surface Color Integration**: Better integration between elevation tokens and surface color calculations
  - **Shadow System**: Enhanced shadow token organization and factory method implementations
  - **Documentation Consistency**: Improved documentation patterns across elevation-related tokens

### 📱 Example & Demo Application Updates

- **M3 Expressive Cleanup**: Streamlined M3 Expressive demonstration components

  - **Simplified Examples**: Removed complex demonstration methods in favor of cleaner implementations
  - **Better Component Organization**: Improved separation of concerns in showcase components
  - **Enhanced User Experience**: Cleaner interface with reduced complexity in demonstration pages

- **Theme Integration**: Enhanced theme integration patterns across example applications
  - **Consistent Theme Usage**: Improved `Theme.of(context)` usage patterns throughout examples
  - **Better Color Scheme Access**: Enhanced color scheme integration in all demonstration components
  - **Improved Visual Consistency**: Standardized visual patterns across demo and example applications

### 🔧 Migration Guide

**Color Utilities:**

```dart
// Before (v0.16.1) - Using deprecated color.value
String hex = '#${color.value.toRadixString(16).substring(2).toUpperCase()}';

// After (v0.17.0) - Using enhanced color utilities
String hex = '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
```

**State Layer Integration:**

```dart
// New state layer token usage
Container(
  decoration: BoxDecoration(
    color: M3StateLayerToken.hover.value(context),
    borderRadius: M3BorderRadiusToken.medium.value,
  ),
)
```

### 📊 Impact Summary

- **Files Modified**: 35+ files updated across core library, demo, and example applications
- **CI/CD Stabilization**: Temporary workflow adjustments to maintain development pipeline
- **Enhanced Type Safety**: Improved type definitions and method signatures throughout the codebase
- **Code Organization**: Streamlined demo application and improved internal library structure
- **New Token System**: Introduction of comprehensive state layer token system

**Recommended Version Bump: MINOR (0.16.1 → 0.17.0)**

This release introduces new state layer token functionality, enhances code quality through improved type safety and organization, includes temporary CI/CD adjustments for build pipeline stability, and provides comprehensive cleanup of demo applications while maintaining full Material Design 3 compliance.

## 0.16.1

### 🏗️ CI/CD Infrastructure & Quality Improvements

- **Enhanced Testing Infrastructure**: Introduced comprehensive automated testing workflow

  - **New `tests.yml` Workflow**: Added dedicated GitHub Actions workflow for continuous testing
  - **Multi-Environment Testing**: Tests run on both root package and demo application
  - **Quality Gates**: Added code formatting checks and static analysis to CI pipeline
  - **Branch Protection**: Tests trigger on main and development branches, plus pull requests

- **Deployment Pipeline Optimization**: Improved demo deployment workflow for better reliability
  - **Sequential Workflow Execution**: Demo deployment now triggers only after successful test completion
  - **Enhanced Setup Steps**: Better job naming and clearer deployment process
  - **Reduced Redundancy**: Removed duplicate test execution from deployment workflow

### 📄 Project Metadata Updates

- **License Standardization**: Updated project license to reflect proper branding

- **CI Badge Alignment**: Updated README.md to reference correct GitHub Actions workflow
  - **Badge URL Update**: Tests badge now points to `tests.yml` instead of legacy `test.yml`
  - Ensures build status accuracy and proper CI/CD visibility

### 🔧 Developer Experience Enhancements

- **Improved Workflow Names**: Enhanced GitHub Actions workflow naming for better clarity

  - `Tests` workflow provides clear indication of testing process
  - Better integration with GitHub's status checks and branch protection rules

- **Build Process Optimization**: Streamlined CI/CD pipeline reduces redundant operations
  - Eliminates duplicate Flutter setup and dependency installation
  - Faster feedback loop for developers through optimized test execution

### 📊 Impact Summary

- **Files Modified**: 4 core infrastructure files updated
- **CI/CD Enhancement**: Separated testing and deployment concerns for better reliability
- **Quality Assurance**: Added automated code quality checks to development workflow
- **Branding Consistency**: Standardized project attribution across legal documents

**Recommended Version Bump: MINOR (0.16.0 → 0.16.1)**

This release focuses on infrastructure improvements, CI/CD pipeline enhancements, and project metadata standardization. While no new features are introduced, the improved testing infrastructure and deployment reliability significantly enhance the development experience and project quality assurance.

## 0.16.0

### 🔄 BREAKING CHANGES

- **Motion Token API Renaming**: Renamed motion easing tokens for better semantic clarity
  - **`M3MotionEasingToken` → `M3MotionCurve`**: All motion easing token references updated throughout the codebase
  - **Affected Properties**: All easing curve access patterns (emphasized, standard, standardDecelerate, standardAccelerate, linear, etc.)
  - **Documentation Updates**: Comprehensive updates to both English and Portuguese documentation reflecting new naming

### ✨ New Features - M3 Expressive

- **Loading Indicator Component**: Introduced new M3 Expressive loading indicator component

  - **`LoadingIndicator`**: Brand new loading indicator widget with Material Design 3 expressive styling
  - **`LoadingIndicator.contained()`**: Contained variant for different visual contexts
  - **`LoadingIndicatorTheme`**: Complete theming system for customization
  - Enhanced visual design following M3 Expressive guidelines

- **Material New Shapes System**: Added comprehensive new shapes library for M3 Expressive
  - **`MaterialShapes`**: Extensive collection of 35+ predefined shapes including:
    - Basic shapes: circle, square, triangle, diamond, oval
    - Advanced shapes: heart, clover, burst, flower, ghost-ish
    - Cookie variants: 4-sided through 12-sided cookies
    - Expressive shapes: sunny, boom, puffy, pixelCircle
  - **Shape Morphing**: Advanced shape morphing capabilities with smooth animations
  - **Interactive Showcase**: Complete demo implementation with animated shape transitions

### 🎯 Developer Experience Improvements

- **Enhanced Demo Application**: Added new M3 Expressive showcase section

  - **M3ExpressivePage**: Dedicated page showcasing new expressive components
  - **Loading Indicator Demo**: Interactive demonstrations of loading indicator variants
  - **Navigation Enhancement**: Added "Expressive" section to main navigation with dedicated icon
  - **Integrated Examples**: Seamless integration with existing demo architecture

- **API Consistency**: Updated motion token usage patterns throughout codebase
  - **README Updates**: All motion examples updated to use `M3MotionCurve`
  - **Demo Consistency**: All showcase pages migrated to new motion token naming
  - **Documentation Alignment**: Both English and Portuguese docs synchronized

### 📱 Enhanced Example Applications

- **Theme Integration**: Better theme integration patterns in examples
  - **Context-Aware Styling**: Enhanced usage of `Theme.of(context)` patterns throughout examples
  - **Color Scheme Integration**: Improved color scheme access patterns in README examples
  - **State Layer Updates**: Better state layer opacity usage with proper theme integration

### 🏗️ Library Architecture Enhancements

- **Export Structure**: Enhanced library exports for new M3 Expressive components
  - **Main Library**: Added exports for `LoadingIndicator` and `MaterialShapes`
  - **Modular Organization**: Better separation between core M3 and M3 Expressive features
  - **Theme Integration**: Proper theming integration for all new components

### 🔧 Migration Guide

**Motion Token Updates:**

```dart
// Before (v0.15.x)
AnimatedContainer(
  curve: M3MotionEasingToken.emphasized.value,
  duration: M3MotionDuration.medium2,
)

// After (v0.16.0)
AnimatedContainer(
  curve: M3MotionCurve.emphasized,
  duration: M3MotionDuration.medium2,
)
```

**New M3 Expressive Components:**

```dart
// Loading Indicator
LoadingIndicator() // Standard variant
LoadingIndicator.contained() // Contained variant

// Material Shapes (for advanced shape usage)
import 'package:material_design/material_design.dart';

// Access predefined shapes
final shape = MaterialShapes.heart;
final morphing = Morph(MaterialShapes.circle, MaterialShapes.heart);
```

**Theme Usage:**

```dart
// Enhanced theme integration patterns
Container(
  color: Theme.of(context).colorScheme.surface.withValues(
    alpha: M3StateLayerOpacityToken.hover.value,
  ),
)
```

### 📊 Impact Summary

- **Files Modified**: 20+ files updated across core library, demo, and documentation
- **API Enhancement**: Consistent motion token naming across entire library
- **New Components**: 2 major M3 Expressive components (LoadingIndicator, MaterialShapes)
- **Documentation**: Comprehensive updates in both English and Portuguese
- **Demo Enhancement**: New showcase section for M3 Expressive features

**Recommended Version Bump: MINOR (0.15.0 → 0.16.0)**

This release introduces significant new M3 Expressive features while maintaining backward compatibility, includes motion token API improvements for better semantic clarity, and provides enhanced developer experience through comprehensive documentation updates and interactive demos.

## 0.15.0

### 🔄 BREAKING CHANGES

- **Shape System Refactoring**: Introduced a comprehensive three-tiered shape token system for more granular control and better developer experience

  - **New Three-Tier System**: `M3ShapeToken` (high-level), `M3BorderRadiusToken` (mid-level), and `M3RadiusToken` (low-level)
  - **Enhanced Usage Patterns**: Each tier serves specific use cases for maximum flexibility and semantic clarity
  - **Improved API Ergonomics**: More intuitive property access patterns and better type safety

- **Elevation System API Improvements**: Major refactoring of elevation-related classes for better clarity and consistency
  - **`_M3ShadowToken` → `M3BoxShadowToken`**: Shadow token class is now public and properly named
  - **`_M3TonalColor` → `M3SurfaceTint`**: Tonal color utility renamed for better semantic clarity
  - **New `M3SurfaceColorToken`**: Dedicated token for surface color management with elevation integration
  - **Enhanced Elevation Integration**: Better integration between elevation, shadows, and surface colors

### 🏗️ Enhanced Widget System

- **New `M3Container` Widget**: Advanced container widget with built-in Material Design 3 token enforcement

  - Seamless integration with elevation and surface color systems
  - Enhanced type safety and consistent API patterns
  - Simplified common container styling workflows

- **Shape Token Architecture Enhancement**: Complete reorganization of shape-related tokens
  - **`M3ShapeToken`**: High-level shapes returning `RoundedRectangleBorder` for direct widget usage
  - **`M3BorderRadiusToken`**: Mid-level tokens returning `BorderRadius` for decoration usage
  - **`M3RadiusToken`**: Low-level tokens returning `Radius` for custom corner configurations

### 🎯 Developer Experience Improvements

- **Comprehensive Documentation Overhaul**: Extensive README.md updates with new API patterns

  - Detailed three-tier shape system explanation with usage guidelines
  - Enhanced elevation examples showing multiple implementation approaches
  - Clear decision matrix for choosing appropriate token levels
  - Updated spacing and layout examples with corrected API usage

- **Improved API Consistency**: Unified access patterns across all shape and elevation tokens
  - Consistent `.value` property access across all token types
  - Clear semantic separation between different abstraction levels
  - Enhanced IntelliSense support with better type definitions

### 📱 Complete Application Migration

- **Demo Application Overhaul**: Full migration to use new shape and elevation APIs

  - All showcase pages updated to demonstrate three-tier shape system
  - Enhanced elevation examples with new `M3SurfaceColorToken` integration
  - Improved visual consistency across all demo components

- **Example Application Updates**: Comprehensive refactoring of example applications
  - Theme configurations updated to use new shape token system
  - Interactive components migrated to new elevation API patterns
  - Enhanced accessibility examples with new token implementations

### 🧹 Code Organization & Architecture

- **Token File Restructuring**: Better organization of elevation and shape token files

  - Moved private implementation files to public API with proper naming
  - Enhanced file organization with clearer dependency relationships
  - Improved internal documentation and code structure

- **Enhanced Library Exports**: Streamlined export structure for better developer experience
  - Cleaner main library file with comprehensive token exposure
  - Better separation between public and internal APIs
  - Enhanced type definitions and interface contracts

### 🔧 Migration Guide

**Three-Tier Shape System:**

```dart
// Before (v0.14.x) - Single shape approach
Container(
  decoration: M3BoxDecoration(
    shape: M3ShapeToken.medium,
  ),
)

// After (v0.15.0) - Three-tier system
// High-level: For shape property of widgets
Card(shape: M3ShapeToken.large.value)

// Mid-level: For borderRadius in BoxDecoration
Container(
  decoration: BoxDecoration(
    borderRadius: M3BorderRadiusToken.large.value,
  ),
)

// Low-level: For custom corner configurations
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: M3RadiusToken.extraLarge.value,
      bottomRight: M3RadiusToken.small.value,
    ),
  ),
)
```

**Elevation System Updates:**

```dart
// Before (v0.14.x) - Private classes
final shadows = _M3ShadowToken.fromElevation(elevation);
final surfaceColor = _M3TonalColor.surfaceAt(context, elevation);

// After (v0.15.0) - Public API with better naming
final shadows = M3BoxShadowToken.fromElevation(elevation);
final surfaceColor = M3SurfaceTint.surfaceAt(context, elevation);
// or
final surfaceColor = M3SurfaceColorToken.fromElevation(elevation).value(context);
```

**Container Widget:**

```dart
// New M3Container widget for enhanced functionality
M3Container(
  elevation: M3ElevationToken.level3,
  // Automatically applies elevation, shadows, and surface colors
  child: content,
)
```

### 📊 Impact Summary

- **Files Modified**: 25+ files updated across core library, demo, and example applications
- **API Enhancement**: Three-tier shape system providing better granular control
- **Developer Experience**: Simplified common use cases while enabling advanced customization
- **Documentation**: Comprehensive updates with clear usage guidelines and decision matrices
- **Type Safety**: Enhanced type safety and better IntelliSense support throughout

**Recommended Version Bump: MINOR (0.14.0 → 0.15.0)**

This release introduces significant API improvements and architectural enhancements to the shape and elevation systems, comprehensive documentation updates, and enhanced developer experience through the new three-tier shape token architecture while maintaining Material Design 3 compliance.

## 0.14.0-dev

### 🔄 BREAKING CHANGES

- **API Unification and Simplification**: Major refactoring to unify the decoration and shape API for better consistency and developer experience
  - **`BoxDecoration` → `M3BoxDecoration`**: All `BoxDecoration` usage replaced with new `M3BoxDecoration` widget for token enforcement
    - **Before**: `BoxDecoration(borderRadius: M3ShapeToken.medium.borderRadius.value)`
    - **After**: `M3BoxDecoration(shape: M3ShapeToken.medium)`
  - **`BorderRadius` → `shape` property**: Simplified shape application through dedicated `shape` parameter
    - **Before**: `borderRadius: M3ShapeToken.large.borderRadius.value`
    - **After**: `shape: M3ShapeToken.large`
  - **`Border.all()` → `M3Border.all()`**: Unified border creation through `M3Border` utility
    - **Before**: `Border.all(width: M3BorderWidthToken.thin.value)`
    - **After**: `M3Border.all(width: M3BorderWidthToken.thin.value)`

### 🏗️ Enhanced Widget System

- **New `M3BoxDecoration` Widget**: Comprehensive replacement for `BoxDecoration` with built-in Material Design 3 token enforcement
  - Automatic shape token integration through `shape` parameter
  - Enhanced type safety and token validation
  - Simplified API for common decoration patterns
  - Backward compatible with standard `BoxDecoration` properties
- **Enhanced `M3Border` Utility**: Advanced border creation system with M3 token integration
  - Consistent API for all border types (`all`, `symmetric`, `only`)
  - Built-in token validation and type safety
  - Improved developer experience with clear method signatures

### 🎯 Developer Experience Improvements

- **Simplified Shape Application**: Streamlined the process of applying shapes to components
  - Direct token application without complex property chains
  - Consistent pattern across all shape-related widgets
  - Reduced boilerplate code for common styling patterns
- **Documentation Updates**: Comprehensive updates to all documentation reflecting the new API patterns
  - Updated README.md with new API examples
  - Refreshed implementation guides in both English and Portuguese
  - Enhanced inline code documentation throughout the library

### 📱 Complete Demo Migration

- **Demo Application Overhaul**: Full migration of demo application to use new API patterns
  - All showcase pages updated to demonstrate `M3BoxDecoration` usage
  - Enhanced examples showing simplified shape and decoration patterns
  - Improved visual consistency across demo components
- **Example Application Updates**: Complete refactoring of example app to use new decoration system
  - Theme examples updated to use `M3BoxDecoration`
  - Interactive components migrated to new shape API
  - Enhanced accessibility examples with new decoration patterns

### 🧹 Code Organization

- **Temporary Shape Utils Disabled**: Disabled `M3ShapeUtils` temporarily during refactoring process
  - Commented out in main export to prevent breaking changes
  - Will be re-enabled with enhanced functionality in upcoming patch releases
- **Enhanced Library Structure**: Improved organization of widget and utility classes
  - Better separation between layout and decoration utilities
  - Cleaner import structure with reduced complexity

### 🔧 Migration Guide

**BoxDecoration to M3BoxDecoration:**

```dart
// Before (v0.13.x)
Container(
  decoration: BoxDecoration(
    color: M3SysColor.surfaceContainer,
    borderRadius: M3ShapeToken.medium.borderRadius.value,
    border: Border.all(width: M3BorderWidthToken.thin.value),
  ),
)

// After (v0.14.0)
Container(
  decoration: M3BoxDecoration(
    color: M3SysColor.surfaceContainer,
    shape: M3ShapeToken.medium,
    border: M3Border.all(width: M3BorderWidthToken.thin.value),
  ),
)
```

**Shape Token Application:**

```dart
// Before (v0.13.x)
Card(
  shape: RoundedRectangleBorder(
    borderRadius: M3ShapeToken.large.borderRadius.value,
  ),
)

// After (v0.14.0)
Card(
  shape: RoundedRectangleBorder(
    shape: M3ShapeToken.large,
  ),
)
```

**Theme Configuration:**

```dart
// Before (v0.13.x)
ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: M3ShapeToken.medium.borderRadius.value,
  ),
)

// After (v0.14.0)
ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    shape: M3ShapeToken.medium,
  ),
)
```

### 📊 Impact Summary

- **Files Modified**: 30+ files updated across documentation, demo, and example applications
- **API Consistency**: Unified decoration and shape API across entire library
- **Developer Experience**: Simplified common styling patterns with reduced boilerplate
- **Documentation**: Comprehensive updates in both English and Portuguese
- **Backward Compatibility**: Maintained compatibility with existing token values while improving API ergonomics

**Recommended Version Bump: MINOR (0.13.0 → 0.14.0)**

This release contains significant API improvements and breaking changes to decoration and shape systems, extensive documentation updates, and enhanced developer experience through simplified APIs while maintaining full Material Design 3 compliance.

## 0.13.0-dev

### 🔄 BREAKING CHANGES

- **Shape Token API Refactoring**: Major changes to the shape token system requiring property chain updates
  - **Before**: `M3ShapeToken.medium.borderRadius` → **After**: `M3ShapeToken.medium.borderRadius.value`
  - **Before**: `M3ShapeToken.large.radius` → **After**: `M3ShapeToken.large.borderRadius.radius.value`
  - All shape token access now requires `.value` at the end for consistent API patterns
- **Border Token Renaming**: `M3BorderToken` has been renamed to `M3BorderWidthToken` for better semantic clarity
  - Update all `M3BorderToken.thin` → `M3BorderWidthToken.thin`
  - Affects all border width references throughout the codebase

### 🗂️ Library Architecture Overhaul

- **Consolidated Main Export**: Removed the separate `m3.dart` file and consolidated all exports into the main `material_design.dart` library file
  - All imports now use: `import 'package:material_design/material_design.dart'`
  - Improved library structure with comprehensive inline documentation for all token systems
- **Enhanced Widget System**: Added new layout widgets with Material Design 3 token enforcement
  - **`M3Border`**: Custom border widget that enforces M3 design tokens (465+ lines of implementation)
  - **`M3BorderRadius`**: Custom border radius utility with token validation
  - **`M3BoxDecoration`**: Token-enforced box decoration for consistent styling
  - **`M3ShapeDecoration`**: Advanced shape decoration with M3 compliance (591+ lines of implementation)

### 🏗️ Enhanced Shape System

- **Complete Shape Token Refactoring**: Redesigned the shape token system with 270+ lines of additional functionality
  - Added comprehensive internal constants for all radius values
  - Implemented wrapper classes for better type safety and API consistency
  - Enhanced border radius utilities with validation and helper methods
- **Improved Type Safety**: All shape-related tokens now have consistent access patterns and validation

### 🎨 Enhanced Layout Utilities

- **Improved M3EdgeInsets**: Significant enhancements to the EdgeInsets utility (179 lines updated)
- **Streamlined M3Padding**: Simplified and optimized padding implementation (183 lines reduced)
- **Enhanced Layout Widgets**: Better integration with the Material Design 3 token system

### 📱 Demo and Example Updates

- **Complete API Migration**: Updated entire demo application and examples to use the new token access patterns
- **Enhanced Examples**: All showcase pages now demonstrate the new API structure
- **Better Documentation**: Improved inline comments and examples throughout demo and example applications

### 🔧 Migration Guide

**Shape and Border Radius:**

```dart
// Before (v0.11.0)
Container(
  decoration: BoxDecoration(
    borderRadius: M3ShapeToken.medium.borderRadius,
  ),
)

// After (v0.12.0)
Container(
  decoration: BoxDecoration(
    borderRadius: M3ShapeToken.medium.borderRadius.value,
  ),
)
```

**Border Tokens:**

```dart
// Before (v0.11.0)
Border.all(width: M3BorderToken.thin.value)

// After (v0.12.0)
Border.all(width: M3BorderWidthToken.thin.value)
```

**Library Import:**

```dart
// Before (v0.11.0)
import 'package:material_design/src/m3/m3.dart';

// After (v0.12.0)
import 'package:material_design/material_design.dart';
```

**Recommended Version Bump: MINOR (0.11.0 → 0.12.0)**

This release contains significant breaking changes to the shape and border token APIs, extensive library architecture improvements, and new widget implementations that substantially enhance the Material Design 3 token system.

## 0.12.1

### Documentation

- **Radius Examples Updated**: Revised all radius `README.md` documentation, usage guides, and inline comments related to radius.

## 0.12.0

### 🚀 Major Features & Enhancements

- **New Spacing System**: Introduced a new, robust spacing system to enforce design system consistency and improve developer experience.
  - **`M3EdgeInsets`**: A new utility to create `EdgeInsets` exclusively from `M3SpacingToken` and `M3MarginToken`. This ensures all insets and margins adhere to the design system.
  - **`M3Padding` Widget**: A token-enforced padding widget that replaces the standard `Padding`. It provides convenient constructors (`.all`, `.symmetric`, `.only`) that accept `M3SpacingToken`.
  - **`M3Gap` Widget**: A token-based replacement for `SizedBox` to create consistent spacing in `Row`s and `Column`s using `M3SpacingToken`.
- **Simplified Token API**: The API for all spacing and margin tokens has been simplified. The `.value` accessor is no longer needed when using the new spacing widgets and utilities, making the code cleaner and more readable (e.g., `M3Padding.all(M3SpacingToken.space16)`).
- **Enhanced Breakpoint System**: The responsive breakpoint system has been refactored for clarity and consistency.
  - `M3WindowSizeClass` has been renamed to `M3ScreenSize`.
  - `getWindowSizeClassFromContext` has been renamed to `getScreenSizeFromContext`.
- **Improved Documentation**:
  - The main library file (`m3.dart`) has been completely overhauled with comprehensive documentation, serving as a complete guide to the package's features.
  - All core token classes (`M3ElevationToken`, `M3VisualDensityToken`, `IM3Token`, etc.) have received extensive inline documentation, explaining their purpose, architecture, and usage patterns.

### 🔄 Refactoring

- **Full Adoption of New Spacing System**: The entire demo application, examples, and internal library code have been refactored to use the new `M3EdgeInsets`, `M3Padding`, and `M3Gap` utilities. This removes direct dependencies on Flutter's `Padding` and `SizedBox`, ensuring strict adherence to the design system.
- **Adaptive Utilities Update**: The `M3Adaptive` helper class has been updated to use the new `M3ScreenSize` enum and `M3EdgeInsets` utility for responsive layouts.
- **Codebase Cleanup**: Removed unused files and cleaned up `.gitignore`.

### 🔧 Migration Guide

**Spacing and Padding:**

Update all `Padding` and `SizedBox` widgets used for spacing to the new `M3Padding` and `M3Gap` widgets.

**Before (v0.11.0):**

```dart
Padding(
  padding: EdgeInsets.all(M3SpacingToken.space16.value),
  child: Text('Hello'),
)

SizedBox(height: M3SpacingToken.space24.value)
```

**After (v0.12.0):**

```dart
M3Padding.all(
  M3SpacingToken.space16,
  child: Text('Hello'),
)

const M3Gap(M3SpacingToken.space24)
```

**Responsive Breakpoints:**

Update all references from `M3WindowSizeClass` to `M3ScreenSize`.

**Before (v0.11.0):**

```dart
final sizeClass = M3BreakpointToken.getWindowSizeClassFromContext(context);
if (sizeClass == M3WindowSizeClass.compact) {
  // ...
}
```

**After (v0.12.0):**

```dart
final screenSize = M3BreakpointToken.getScreenSizeFromContext(context);
if (screenSize == M3ScreenSize.compact) {
  // ...
}
```

## 0.11.0

### New Features

- **Introduced `M3Padding` Widget**: A new token-driven widget that replaces the standard `Padding` to enforce the use of `M3SpacingToken` for consistent padding across the application. It provides convenient constructors like `M3Padding.all`, `M3Padding.only`, and `M3Padding.symmetric`.
- **Introduced `M3Gap` Widget**: A direct, token-based replacement for `SizedBox` used for creating space between widgets. `M3Gap` simplifies creating consistent spacing in `Row`s and `Column`s by using `M3SpacingToken`.
- **Introduced `M3EdgeInsets` Utility**: A new utility class to create `EdgeInsets` exclusively from `M3SpacingToken`, ensuring all spacing values adhere to the Material Design system's defined scale.

### Refactoring

- **Adopted New Spacing Widgets**: Refactored the entire demo application, examples, and internal library widgets to use the new `M3Padding` and `M3Gap` widgets. This removes direct dependency on Flutter's `Padding` and `SizedBox` for spacing tasks, promoting design system consistency.
- **Simplified Token API**: Updated the API for spacing tokens. It's no longer necessary to call `.value` on tokens when using them with the new spacing widgets (e.g., `M3Padding.all(M3SpacingToken.space16)`).
- **Improved Code Organization**: Relocated core utility files from the `lib/src/m3/mt/` directory to a more semantically correct `lib/src/m3/utils/` directory, improving the project's structure.

### Documentation

- **Updated All Examples**: Revised all documentation, including `README.md`, implementation guides, and inline code comments, to reflect the new spacing widgets and strongly recommend their usage over standard Flutter widgets for spacing.

## 0.10.0

### 💥 BREAKING CHANGES

- **Major Token System Refactor**: The token system has been significantly refactored to improve consistency, remove redundancy, and align more closely with a unified design system architecture.
  - **Unified Shape Tokens**: `M3BorderRadiusToken` and `M3RadiusToken` are now internal (`_M3BorderRadiusToken`, `_M3RadiusToken`). All shape properties should be accessed directly through `M3ShapeToken`.
    - **Before**: `M3BorderRadiusToken.medium.value`
    - **After**: `M3ShapeToken.medium.borderRadius`
  - **Screen Size Enum Renamed**: `M3WindowSizeClass` has been renamed to `M3ScreenSize` for better clarity and to avoid conflicts with Flutter's own window size classes.
  - **Private Component/State Tokens**: `M3ComponentElevationToken` and `M3StateElevationToken` have been made private (`_M3ComponentElevationToken`, `_M3StateElevationToken`) as they are intended for internal use within the system.
  - **Simplified Motion API**: `M3MotionToken` now includes `duration` and `easing` getters, simplifying animation definitions.

### ✨ Enhancements

- **Improved API Consistency**: The token API is now more consistent and predictable. Accessing related values (like radius from a shape) is more intuitive.
- **Streamlined Architecture**: By removing redundant and reference-level tokens, the public API is smaller, cleaner, and easier to learn.
- **Enhanced Readability**: The new patterns (`M3ShapeToken.medium.borderRadius`) make the code more declarative and easier to read.

### 🗑️ Deprecations & Removals

- **Removed Reference Tokens**: The `M3Ref...` token files (`M3RefPalette`, `M3RefOpacity`, `M3RefTypeface`) have been removed from the public API. Their values are now integrated directly into the system tokens where needed.
- **Removed Component-Specific Button Tokens**: `M3CompButton` has been removed. Use standard Flutter `ButtonStyle` with system tokens for customization.
- **Removed `M3ColorSchemeToken`**: This has been removed as part of the color system simplification. Use `Theme.of(context).colorScheme` for semantic color access.
- **Removed Demo Component Showcase**: The `components_showcase_page.dart` file has been deleted from the demo application as part of a broader demo simplification effort.

### 🔧 Migration Guide

**Shape and Radius:**

Update all references to `M3BorderRadiusToken` to use the new `M3ShapeToken` accessors.

**Before (v0.9.2):**

```dart
Container(
  decoration: BoxDecoration(
    borderRadius: M3BorderRadiusToken.medium.value,
  ),
)
```

**After (v0.10.0):**

```dart
Container(
  decoration: BoxDecoration(
    borderRadius: M3ShapeToken.medium.borderRadius,
  ),
)
```

**Adaptive Layouts:**

Update all references from `M3WindowSizeClass` to the new `M3ScreenSize`.

**Before (v0.9.2):**

```dart
final sizeClass = M3BreakpointToken.getWindowSizeClassFromContext(context);
if (sizeClass == M3WindowSizeClass.compact) {
  // ...
}
```

**After (v0.10.0):**

```dart
final sizeClass = M3BreakpointToken.getWindowSizeClassFromContext(context);
if (sizeClass == M3ScreenSize.compact) {
  // ...
}
```

## 0.9.2

### 🔄 BREAKING CHANGES

- **Typography Token Naming**: Renamed `M3TypeScaleToken` to `M3TextStyleToken` throughout the entire codebase for better semantic clarity and consistency with Material Design 3 nomenclature
  - All references to `M3TypeScaleToken` in code, documentation, and examples have been updated to `M3TextStyleToken`
  - The class provides the same 15 `TextStyle` tokens (displayLarge to labelSmall) with identical functionality
  - Enhanced README examples showing `copyWith()` usage for customizing text styles

### ✨ Enhancements

- **Improved API Semantics**: The new `M3TextStyleToken` name better reflects that these are complete text style definitions rather than just type scale values
- **Enhanced Documentation**: Updated all documentation files (English and Portuguese) to use the new token naming convention
- **Better Code Examples**: Improved README with more comprehensive typography examples showing real-world usage patterns
- **Consistent Token Interface**: All typography-related utility methods (responsiveDisplay, enhancedReadability, monoVariant, highContrast) maintained under the new class name

### 📚 Documentation Updates

- **Comprehensive Naming Updates**: Updated all documentation files in both English (`en_US`) and Portuguese (`pt_BR`) directories
- **Implementation Guide Updates**: Refreshed implementation examples and component mappings with new token references
- **README Enhancement**: Added better typography examples showing advanced usage with `copyWith()` method
- **Demo Application Updates**: Updated showcase pages to demonstrate the new `M3TextStyleToken` API

### 🎯 Demo & Example Applications

- **Complete Demo Update**: All demo showcase pages updated to use `M3TextStyleToken`
- **Theme Integration**: Updated theme provider to use new typography token naming
- **Interactive Examples**: Enhanced typography page and utility examples with new token references

### 🔧 Migration Guide

**Before (v0.9.1):**

```dart
Text('Title', style: M3TypeScaleToken.headlineMedium.value)
textTheme: TextTheme(
  displayLarge: M3TypeScaleToken.displayLarge.value,
  bodyMedium: M3TypeScaleToken.bodyMedium.value,
)
```

**After (v0.9.2):**

```dart
Text('Title', style: M3TextStyleToken.headlineMedium.value)
textTheme: TextTheme(
  displayLarge: M3TextStyleToken.displayLarge.value,
  bodyMedium: M3TextStyleToken.bodyMedium.value,
)
```

### 🐛 Compatibility Notes

- **No Functional Changes**: All text style values and functionality remain identical - only the class name has changed
- **Same API Structure**: All properties (.value, .responsiveDisplay, .enhancedReadability, etc.) maintain the same interface
- **Import Structure Unchanged**: Main package imports continue to work as before

## 0.9.1

### 🐛 Bug Fixes

- **Visual Density Token**: Fixed critical StackOverflowError in `M3VisualDensityToken.adaptivePlatform` by removing recursive call and directly returning `VisualDensity.adaptivePlatformDensity`
- **Motion Tokens API**: Updated motion showcase to use direct token properties instead of `.value` accessor for better consistency
- **Shape Token References**: Updated all documentation and demo references from `M3Shape` to `M3ShapeToken` for consistency

### ✨ Enhancements

- **Enhanced Visual Density Documentation**: Improved inline documentation with clearer property descriptions and usage examples
- **Better Type Safety**: Enhanced visual density token implementation with proper typing and clearer API contracts
- **Motion Token Consistency**: Standardized motion token usage pattern across demo application

### 📚 Documentation Updates

- **Token Reference Updates**: Updated all documentation files to reflect correct `M3ShapeToken` naming
- **API Documentation**: Enhanced visual density token documentation with detailed property descriptions
- **Usage Examples**: Updated code examples throughout documentation to use correct token references

### 🔧 Code Quality

- **Gitignore Cleanup**: Updated `.gitignore` to use more generic trash directory pattern (`lib/src/trash` instead of `lib/src/m3/trash`)
- **Code Organization**: Improved visual density token file structure and removed redundant utility methods
- **Better Error Handling**: Eliminated potential runtime errors through proper token implementation

### Recommended Version Bump: **PATCH** (0.9.0 → 0.9.1)

This release contains bug fixes and documentation improvements without breaking changes to the public API.

## 0.9.0

### 🔄 BREAKING CHANGES

- **Token System Standardization**: Massive refactoring to standardize all token class names with "Token" suffix for better consistency and clarity

  - **Renamed Core Token Classes**:

    - `M3Spacing` → `M3SpacingToken`
    - `M3Elevation` → `M3ElevationToken`
    - `M3Shape` → `M3ShapeToken`
    - `M3Motion` → `M3MotionToken`
    - `M3MotionDuration` → `M3MotionDuration`
    - `M3MotionEasing` → `M3MotionEasingToken`
    - `M3Border` → `M3BorderToken`
    - `M3Breakpoint` → `M3BreakpointToken`
    - `M3IconSize` → `M3IconSizeToken`
    - `M3ZIndex` → `M3ZIndexToken`
    - `M3VisualDensity` → `M3VisualDensityToken`
    - `M3StateLayerOpacity` → `M3StateLayerOpacityToken`
    - `M3Opacity` → `M3OpacityToken`
    - `M3TypeScale` → `M3TypeScaleToken`

  - **Removed Legacy System Classes**:
    - `M3SysColor` → Replaced with `M3ColorSchemeToken`
    - `M3TypeScale` → Consolidated into `M3TypeScaleToken`
    - `M3VisualDensity` → Renamed to `M3VisualDensityToken`

### ✨ Enhanced Token Architecture

- **Improved Token Consistency**: All token classes now follow a unified naming convention with "Token" suffix
- **Better API Clarity**: The "Token" suffix makes it clear that these are design token classes rather than utility classes
- **Streamlined Color System**: Introduced `M3ColorSchemeToken` as a more organized approach to color tokens
- **Enhanced State System**: Added `M3OpacityToken` for general opacity values alongside the existing state layer opacities

### 📚 Documentation Updates

- **Comprehensive Documentation Refresh**: Updated all documentation files (both English and Portuguese) to reflect new token naming
- **Implementation Guide Updates**: All implementation examples now use the new token class names
- **Component Map Updates**: Updated component mapping documentation with new token references
- **README Updates**: Main README.md updated with new API examples and migration guidance

### 🎯 Demo & Example Applications

- **Complete Demo Application Update**: All demo showcase pages updated to use new token naming conventions
- **Enhanced Theme Integration**: Theme examples updated to demonstrate proper usage of renamed tokens
- **Interactive Examples**: All interactive widgets and examples updated with new token class names
- **Comprehensive Showcases**: Typography, spacing, motion, shape, and component showcases all updated

### 🔧 Migration Guide

**Before (v0.8.1):**

```dart
// Old token naming
Card(elevation: M3Elevation.level2.value)
Padding(padding: EdgeInsets.all(M3Spacing.space16.value))
AnimatedContainer(duration: M3MotionDuration.short2)
Text('Title', style: M3TypeScale.headlineMedium)
```

**After (v0.9.0):**

```dart
// New standardized naming with "Token" suffix
Card(elevation: M3ElevationToken.level2.value)
Padding(padding: EdgeInsets.all(M3SpacingToken.space16.value))
AnimatedContainer(duration: M3MotionDuration.short2)
Text('Title', style: M3TypeScaleToken.headlineMedium)
```

### 🏗️ File Structure Improvements

- **Token File Reorganization**: All token implementation files renamed to include "\_token" suffix for better organization
- **Cleaner Export Structure**: Main library exports updated to expose new token class names
- **Consistent Internal Structure**: Internal token files follow consistent naming patterns

### 🐛 Compatibility Notes

- **No Functional Changes**: All token values and functionality remain identical - only class names have changed
- **Import Structure Unchanged**: Main package imports (`import 'package:material_design/material_design.dart'`) remain the same
- **Enum Values Preserved**: All enum values and properties maintain their existing names and functionality

## 0.8.1

### 📚 Major Documentation System

- **Comprehensive Documentation Portal**: Added complete Obsidian-based documentation system with bilingual support (English/Portuguese)
  - **Structured Documentation**: Organized into Foundations, Styles, Components, and Implementation sections
  - **Interactive Navigation**: Component maps, token maps, and implementation guides with cross-references
  - **Bilingual Support**: Full documentation available in both English (`en_US`) and Portuguese (`pt_BR`)
  - **Visual Documentation**: Mermaid diagrams and structured navigation for better understanding

### 🗂️ Documentation Architecture

- **Foundations Section**:
  - Design Tokens hierarchical system (ref/sys/comp)
  - Accessibility guidelines and WCAG compliance
  - Adaptive design patterns and responsive utilities
- **Styles Section**:
  - Typography system (complete 15-level type scale)
  - Elevation system (6 levels with shadows)
  - Motion system (durations and easing curves)
  - Shape system (complete corner radius system)
- **Implementation Section**:
  - Flutter integration guides
  - Token structure documentation
  - Theme system implementation
  - Best practices and usage examples

### ✨ Enhanced Developer Experience

- **Interactive Maps**: Component map, token map, and implementation map for visual navigation
- **Status Indicators**: Clear marking of implemented vs. planned features
- **External Links**: Comprehensive links to official Material Design 3 resources
- **Code Examples**: Practical implementation examples throughout documentation

### 🧹 Code Organization

- **Cleaned Documentation**: Removed `ENHANCED_FEATURES.md` file to consolidate documentation structure
- **Updated README**: Restructured README.md with better organization and clearer API migration guides
- **Gitignore Updates**: Removed documentation folder from gitignore to include new documentation system

### 🔧 Configuration Updates

- **Obsidian Integration**: Added complete Obsidian vault configuration for seamless documentation editing
- **Workspace Setup**: Pre-configured workspace with proper graph view and navigation settings
- **Core Plugins**: Enabled essential plugins for documentation workflow (file explorer, search, graph, backlinks)

## 0.8.0

### 🔄 BREAKING CHANGES

- **Elevation System Overhaul**: Complete refactor of the elevation token system with improved type safety and API consistency
  - **Removed `M3TonalColor` class**: Replaced with internal `_M3TonalColor` implementation accessed through elevation tokens
  - **Removed `M3Shadow` class**: Replaced with internal `_M3ShadowToken` implementation accessed through elevation tokens
  - **New Unified API**: All elevation-related functionality now accessed through `M3ElevationToken.levelX.shadows` and `M3ElevationToken.levelX.surfaceColor(context)`

### ✨ Major Features

- **New Token Interface System**: Introduced `IM3Token<T>` interface for consistent token architecture across the library
- **Enhanced Elevation Tokens**:
  - Added `M3ElevationToken` enum with 6 predefined levels (level0-level5)
  - Added `M3ComponentElevationToken` enum for component-specific elevations (card, button, fab, appBar, etc.)
  - Added `M3StateElevationToken` enum for interactive state elevations (hover, pressed, focus, etc.)
- **Improved Type Safety**: All elevation tokens now implement `IM3ElevationToken` interface with consistent `value` and `hasShadow` properties
- **Advanced Extension Methods**: Added `IM3ElevationTokenVisuals` and `IM3ElevationTokenComparison` extensions for enhanced functionality

### 🎯 Enhanced Developer Experience

- **Simplified API**: Unified access pattern for shadows and surface colors through elevation tokens
- **Better Documentation**: Comprehensive inline documentation with Material 3 specification references
- **Component-Specific Tokens**: Predefined elevation values for all major Material 3 components
- **State-Aware Elevations**: Built-in support for interactive states (hover, pressed, focus, drag)

### 🏗️ Architectural Improvements

- **Modular Design**: Elevation system split into focused modules (`_m3_shadow_token.dart`, `_m3_tonal_color.dart`)
- **Consistent Naming**: All elevation-related classes follow unified naming conventions
- **Better Abstraction**: Internal implementation details hidden behind clean public APIs
- **Enhanced Performance**: Optimized shadow and surface color calculations

### 🐛 Bug Fixes

- **Demo Application**: Fixed incorrect elevation token usage in demo surface cards
- **Documentation**: Corrected widget references and improved code examples
- **Code Quality**: Updated analysis configuration to use `very_good_analysis` for stricter linting

### 📚 Documentation Updates

- **README.md**: Updated examples to use new elevation token API
- **ENHANCED_FEATURES.md**: Refreshed elevation examples with current API patterns
- **Inline Documentation**: Added comprehensive documentation throughout the elevation system
- **Example Applications**: Updated demo and example apps to showcase new elevation capabilities

### 🔧 Migration Guide

**Before (v0.7.5):**

```dart
// Old API - no longer available
Container(
  decoration: BoxDecoration(
    color: M3TonalColor.surface3(context),
    boxShadow: M3ShadowToken.fromElevation(4.5),
  ),
)
```

**After (v0.8.0):**

```dart
// New unified API
Container(
  decoration: BoxDecoration(
    color: M3ElevationToken.level3.surfaceColor(context),
    boxShadow: M3ElevationToken.level3.shadows,
  ),
)

// Or for custom elevation values
final elevation = M3ElevationToken.fromValue(4.5);
Container(
  decoration: BoxDecoration(
    color: elevation.surfaceColor(context),
    boxShadow: elevation.shadows,
  ),
)
```

### 🎨 Component Usage Examples

```dart
// Component-specific elevations
Card(
  elevation: M3ComponentElevationToken.card.value,
  surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
)

// State-aware elevations
AnimatedContainer(
  decoration: BoxDecoration(
    color: isHovered
      ? M3StateElevationToken.cardHover.surfaceColor(context)
      : M3ComponentElevationToken.card.surfaceColor(context),
    boxShadow: isHovered
      ? M3StateElevationToken.cardHover.shadows
      : M3ComponentElevationToken.card.shadows,
  ),
)
```


## 0.7.5

### Enhanced Demo Experience

- **Live Demo Integration**: Added prominent live demo section to README.md with direct link to interactive showcase
  - Featured interactive demo at `https://fluttely.github.io/material_design/` with comprehensive token visualization
  - Reorganized README structure with dedicated demo section for better user onboarding
  - Added links to additional resources including Material Design 3 guidelines and Flutter M3 documentation

### Major Demo Application Improvements

- **Comprehensive Documentation**: Added extensive inline documentation throughout the demo application

  - Complete component and class documentation with detailed feature descriptions
  - Enhanced code comments explaining Material Design 3 implementation patterns
  - Improved developer experience with clear architectural explanations

- **Enhanced Navigation Experience**:

  - Custom NavigationRail implementation with Material Design 3 hover animations and state layer effects
  - Improved mobile navigation with floating hamburger menu and proper M3 specifications
  - Better visual hierarchy with organized Foundation, Styles, and Components sections
  - Fixed bottom controls layout with proper spacing and alignment

- **Material Design 3 Compliance**:
  - Updated `WindowSizeClass` references to use `M3WindowSizeClass` for proper M3 alignment
  - Enhanced theme implementation with proper Material 3 color schemes and component theming
  - Added `useMaterial3: true` flag to theme configurations for full M3 compliance
  - Improved adaptive layouts following M3 responsive navigation patterns

### Example Application Enhancements

- **Advanced Theme System**: Enhanced example application with sophisticated theming capabilities

  - Added smooth theme transition animations with AnimationController
  - Comprehensive Material 3 component theme implementations for both light and dark modes
  - Enhanced AppBar, Card, and Button theming with proper M3 specifications
  - Improved color scheme generation with dynamic seed color support

- **Better Code Organization**: Restructured example application with improved architecture
  - Enhanced documentation with detailed class and method descriptions
  - Better separation of concerns with dedicated theme building methods
  - Improved code readability and maintenance

### User Experience Improvements

- **Updated Application Titles**: Changed demo app title to "Material Design 3 Token Showcase" for better clarity
- **Enhanced Visual Design**: Improved navigation item styling with proper M3 indicators and hover effects
- **Better Resource Links**: Updated and reorganized links to Material Design documentation and resources
- **Improved Accessibility**: Enhanced touch targets and navigation patterns following M3 accessibility guidelines

### Development Experience

- **Code Quality**: Extensive code documentation and architectural improvements
- **Better Examples**: Enhanced example implementations demonstrating proper M3 patterns
- **Maintainability**: Improved code organization and separation of concerns


## 0.7.4

### CI/CD & Deployment

- **GitHub Actions Workflow**: Added automated deployment workflow for demo application
  - Introduced `.github/workflows/deploy-demo.yml` with GitHub Pages deployment
  - Supports both push-to-main and manual workflow dispatch triggers
  - Automated Flutter web build with proper base href configuration
- **Custom Domain Setup**: Added CNAME file for custom domain deployment at `material-design.fluttely.com`
- **Local Deployment Script**: Created `demo/deploy.sh` script for manual deployment workflows
- **Deploy Status Badge**: Added GitHub Actions deploy status badge to README.md

### Bug Fixes

- **Color Display Enhancement**: Fixed color picker button styling in example application
  - Added outline border to color circles for better visibility
  - Improved color hex code display with robust string formatting
  - Replaced dynamic spacing token with fixed spacing value for stability

### Documentation

- **README Updates**: Updated package version references from `0.7.3` to `0.7.4` across documentation
- **Version Consistency**: Synchronized version numbers across all package files and dependencies

### Development

- **Dependency Updates**: Updated pubspec.lock files in both demo and example applications
- **Version Alignment**: Maintained consistent versioning across the project structure


## 0.7.3

### Features

- **New Simplified Demo Application**: Added a complete new `demo/` directory containing a streamlined, single-file demonstration of the Material Design library
  - Consolidated all key library features into one scrollable page for easier user onboarding
  - Features comprehensive showcase of foundations (spacing, visual density, opacity, borders), styles (colors, typography, shapes, elevation), and components (buttons, cards, chips)
  - Interactive theme controls with dark/light mode toggle and seed color picker with 8 preset colors
  - Live breakpoint detection and adaptive layout behavior
  - Fully localized in English for global accessibility
  - Cross-platform support (Android, iOS, Web, Windows, macOS, Linux)

### Enhanced Developer Experience

- **Improved Example Navigation**: The original complex example application has been refined with better navigation structure
- **Better Library Accessibility**: Users now have two options:
  - `demo/` - Simple, single-file showcase for quick library evaluation and testing
  - `example/` - Comprehensive, detailed showcase for in-depth exploration of advanced features
- **Reduced Complexity**: New developers can now easily understand and test the library features without navigating through complex multi-page structures

### Documentation

- **Updated README.md**: Enhanced documentation to reflect the new demo structure and improved library presentation
- **Analysis Configuration**: Updated `analysis_options.yaml` for better code quality and consistency

### Migration Guide

For users upgrading from v0.7.2:

- No breaking changes to the core library APIs
- The original `example/` app remains fully functional with all existing features
- The new `demo/` app provides an alternative, simplified entry point for library evaluation
- All existing code using the library tokens and utilities will continue to work without modification

### Development

- **Multi-Platform Support**: Both demo and example applications support all Flutter target platforms
- **Dependency Management**: Proper dependency isolation between demo and example applications
- **Build Configuration**: Complete build configurations for all supported platforms in the new demo app


## 0.7.2

### Features

- **Enhanced Documentation**: Completely revamped README.md with improved structure, clearer value proposition, and comprehensive feature highlights
- **Professional Presentation**: Added visual emoji indicators, popularity badge, and enhanced package description for better discoverability
- **Better Developer Experience**: Improved code examples with proper formatting, better context, and clearer inline documentation
- **Resource Organization**: Added dedicated sections for additional resources, contributing guidelines, and license information
- **Elevation System Enhancement**: Improved elevation token interface with clearer property naming and better shadow interpolation

### Refactor

- **Token Organization**: Major reorganization of the token system for better structure and maintainability:
  - Moved button component tokens to `lib/src/m3/tokens/comp/button/` for better component organization
  - Relocated shadow tokens to `lib/src/m3/tokens/sys/elevation/` to align with elevation system
  - Moved geometry tokens (`border`, `breakpoint`, `icon_size`, `z_index`) to `lib/src/m3/tokens/sys/geometry/` for better categorization
  - Relocated visual density token to `lib/src/m3/tokens/sys/interaction/` to align with interaction patterns
- **Import Structure**: Updated main export file (`m3.dart`) to reflect new token organization and maintain backward compatibility
- **Elevation Token Improvements**:
  - Renamed `dp` property to `value` across all elevation tokens for consistency with other token patterns
  - Enhanced shadow interpolation algorithm for smoother transitions between elevation levels
  - Improved elevation interface documentation and method signatures

### Documentation

- **README Improvements**:
  - Added compelling tagline and clear value proposition
  - Introduced comprehensive "Key Features" section highlighting type safety, completeness, and production readiness
  - Enhanced code examples with better formatting and clearer explanations
  - Fixed inconsistent example formatting and corrected token usage patterns
  - Added proper installation instructions and usage examples
  - Included dedicated sections for additional resources and community contributions
  - Updated migration guide with more comprehensive examples showing the evolution from v0.6.1 to v0.7.0+

### Fix

- **Example App Updates**:
  - Fixed elevation token usage throughout example app to use new `.value` property
  - Updated accessibility showcase to use correct elevation values
  - Improved code formatting and consistency across showcase pages
  - Removed obsolete commented code and examples for cleaner codebase

### Chore

- **Example Dependencies**: Updated example app's pubspec.lock to reflect new version
- **Code Cleanup**: Removed unused example code and improved formatting consistency


## 0.7.1

### Fix

- Corrected state layer opacity values to align with the latest Material Design 3 guidelines.
- Adjusted border token values for better consistency.

### Docs

- Updated `README.md` with minor corrections.

### Chore

- Removed duplicated and unused files from the example application.

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).


## 0.7.0

### BREAKING CHANGES

- **Tokens:** The Material 3 token system has been completely refactored for better organization and clarity.
  - System tokens are now organized under `lib/src/m3/tokens/sys/`. This includes `Color`, `Elevation`, `Motion`, `Shape`, `Spacing`, and `Typography`.
  - Many token files have been moved, renamed, or consolidated. Please refer to the updated documentation for the new token structure.
  - The `M3Theme` class has been removed as part of this refactoring.

### Features

- **Components:** Added a new Material 3 Button component (`M3CompButton`).
- **Tokens:** Introduced new system tokens for `Elevation`, `Motion`, `Shape`, `Spacing`, and `StateLayerOpacity`.

### Refactor

- Refactored the entire token system to align more closely with the official Material Design 3 specifications.
- Renamed and moved several internal utilities and classes to a new `mt` (Material Toolkit) namespace for better internal structure.
- Updated the example application to reflect all the latest changes and new APIs.
- Renamed the "Density" showcase page to "Visual Density" for clarity.

### Chores

- Updated `.gitignore` to exclude new generated files.
- Updated `README.md` with the latest information.


## 0.6.2

### Major Refactoring: Token System Overhaul

- **Shape System**: Replaced `BoxDecoration` with `ShapeDecoration` across the example app for better semantics. Introduced `M3BorderRadius` and converted `M3Radius` from `double` to `Radius` constants, providing a more robust and type-safe way to define shapes.
- **Motion Tokens**: Consolidated motion-related tokens. `M3MotionDuration` and `M3MotionEasing` have been merged into a single, more organized `m3_motion.dart` file under the `sys` directory, improving clarity and discoverability.
- **File Structure**: Reorganized the token file structure to better align with the Material Design 3 system. Legacy and unused token files like `M3ColorRoles`, `m3_radius.dart` (the old `double` based one), and `m3_examples.dart` have been removed to streamline the package.

### Breaking Changes

- **Removed `M3ColorRoles`**: The static `M3ColorRoles` class has been removed. Please use the color scheme provided by the `M3Theme` or `Theme.of(context).colorScheme` for semantic color access.
- **Removed `M3Radius` (as `double`)**: The `M3Radius` class that provided `double` values has been replaced by `M3BorderRadius` (which provides `BorderRadius` objects) and a new `M3Radius` class that provides `Radius` objects.
- **Consolidated Motion Tokens**: `M3MotionDuration` and `M3MotionEasing` are no longer separate files. Import `package:material_design/material_design.dart` and use the `M3MotionDuration` and `M3MotionEasing` classes directly.

### Enhancements & Fixes

- **Code Cleanup**: Performed a general code cleanup, removing obsolete files and refactoring the example app for better readability and consistency.
- **Shape Implementation**: Consistently replaced `BorderRadius.circular()` with the new `M3BorderRadius` constants throughout the example app.
- **New `md` Module**: Introduced a new `md` module for future development, starting with a new barrel file `md.dart`.


## 0.6.1

### Refinements and Internationalization

- **Refactored README**: Simplified the documentation to focus on core features and improve clarity.
- **Internationalized Example App**: All user-facing strings in the accessibility showcase are now in English, making the example more accessible to a global audience.
- **Code Cleanup**: Minor code cleanup and refactoring in the example app for better readability and maintenance.


## 0.6.0

### New Features

- **Complete M3 Theme System**: Introduced `M3Theme`, an integrated theme builder that generates a complete `ThemeData` from a seed color, with full support for light, dark, and high-contrast modes.
- **Comprehensive Accessibility Utilities**: Added the `M3Accessibility` class, providing a suite of tools for building WCAG-compliant UIs, including accessible form fields, focus indicators, contrast checking, and touch target enforcement.
- **Adaptive Design System**: Implemented the `M3Adaptive` class with helpers for responsive layouts (`M3Adaptive.responsiveLayout`), adaptive navigation (`M3AdaptiveScaffold`), and adaptive components that adjust to different screen sizes and platforms.
- **Advanced Token Utilities**: Added new utility classes for enhanced token functionality:
  - `M3TypeScale`: Responsive and accessible typography helpers.
  - `M3ColorUtils`: Color manipulation and contrast validation.
  - `M3ShapeUtils`: Responsive and brand-specific shape generation.
  - `M3MotionUtils`: Contextual animation patterns (fade, slide, scale).

### Breaking Changes

- **Token Architecture Refactor**: The entire token system has been restructured to follow the official Material Design 3 hierarchy:
  - **Reference Tokens (Ref)**: Foundational values (e.g., `M3RefPalette`, `M3RefDuration`).
  - **System Tokens (Sys)**: Semantic roles (e.g., `M3SysColor`).
  - **Component Tokens (Comp)**: Component-specific values (e.g., `M3CompButton`).
- The old token structure is now considered legacy and will be deprecated in a future version.

### Enhancements & Fixes

- **Example App Overhaul**: The example app has been completely reorganized into `Foundations`, `Styles`, and `Components` sections to provide a comprehensive showcase of all new features and the new token architecture.
- **Documentation**: Massively updated `README.md` and added `ENHANCED_FEATURES.md` to document the new capabilities.
- **Code Quality**: Refactored numerous widgets and classes for better organization, consistency, and adherence to M3 specifications.


## 0.5.1

- **BREAKING**: Renamed `M3Margins` to `M3Margin` and `M3Spacers` to `M3Spacer` for better naming consistency.
- **DOCS**: Updated `README.md` to reflect the new class names and provide clearer examples.
- **CHORE**: Updated the example app to use the new `M3Margin` and `M3Spacer` classes.


## 0.5.0

- **BREAKING**: Token classes are now `abstract class` instead of `abstract final class` to allow for extension.
- **BREAKING**: Change dart version from `3.8.1` to `>=2.17.0 <4.0.0` to allow for extension.
- **BREAKING**: The `equatable` dependency has been removed.
- **FEAT**: Added `M3Margins` and `M3Spacers` classes for more semantic layout spacing.
- **FEAT**: Added new radius and shape tokens (`largeIncreased`, `extraLargeIncreased`, `extraExtraLarge`).
- **FEAT**: The example app has been revamped to better demonstrate the updated tokens, including a new `LaunchURLText` widget.
- **CHORE**: Lowered the minimum Dart SDK requirement from `3.8.1` to `2.17.0` for wider project compatibility.
- **CHORE**: As restrições do SDK do Flutter e do Dart foram atualizadas.
- **CHORE**: `very_good_analysis` has been commented out in `analysis_options.yaml`.
- **DOCS**: `README.md` has been updated with the latest changes.


## 0.4.1

- **BREAKING**: Renamed `M3Opacity` to `M3StateLayerOpacity` to better reflect its purpose.
- **feat**: Added `LaunchURLText` widget to the example app for styled URL links.
- **feat**: Added `M3StateLayerOpacityButtonExample` to demonstrate state layer opacity on a custom button.
- **refactor**: Updated the example app to consistently use `Theme.of(context).textTheme` for typography.
- **docs**: Updated `README.md` with the latest changes and examples.


## 0.4.0

- **BREAKING**: `M3Motion` has been refactored into `M3MotionDuration` and `M3MotionEasing` to better align with the Material Design 3 specifications.
- **BREAKING**: `M3Density` has been removed and replaced with `M3VisualDensity`, which uses Flutter's native `VisualDensity` class.
- **FEAT**: Added new icon sizes: `dense`, `medium`, `large`, and `extraLarge` to `M3IconSize`.
- **FEAT**: The `M3Shadow` implementation has been revised, including a new `fromElevation` method.
- **FEAT**: Added the `url_launcher` dependency for opening URLs.
- **FIX**: The Z-Index section on the example page has been reworked for a better visual demonstration.
- **CHORE**: Various formatting and code cleanup improvements in the example app.


## 0.3.0

- **Breaking Change:** Renamed all tokens from `Material*` to `M3*` (e.g., `MaterialTonalColor` to `M3TonalColor`) to align with Material Design 3 naming conventions and avoid conflicts with Flutter's `Material` class.
- **Breaking Change:** Reorganized the file structure by moving all token files to `lib/src/m3/tokens/` and renaming them with the `m3_` prefix (e.g., `motion.dart` to `m3_motion.dart`). This improves clarity and consistency.
- **Feat:** Implemented a responsive layout in the example app using `NavigationRail` and `NavigationDrawer` to showcase the `M3Breakpoint` token.
- **Fix:** Updated the copyright year in the `LICENSE` file.
- **Chore:** Updated `pubspec.yaml` by removing the `homepage` field and adding `issue_tracker`.


## 0.2.6

- **Feat:** Added `MaterialDensity` token to control UI density.
- **Refactor:** Replaced `MaterialColorScheme.create` with `ColorScheme.fromSeed` to align with Flutter's core API.
- **Refactor:** Refined motion tokens by separating them into `MotionEasing` and `MotionDuration` for more granular control.
- **Example:** Added a new `DensityPage` to the example app to showcase the `MaterialDensity` token.
- **Example:** Updated the example app to use the new motion tokens and `ColorScheme.fromSeed`.


## 0.2.5

- **Refactor:** The `MaterialMotionToken` has been renamed to `MotionScheme` to better align with the Material Design 3 specifications.
- **Feature:** Introduced `MotionDurations` and `MotionEasings` classes to provide more granular control over animation durations and easing curves.
- **Example:** Simplified the elevation page logic and updated the motion page to use the new `MotionScheme`.


## 0.2.4

- **Refactor:** Renamed `MaterialSurface` to `MaterialTonalColor` and its method `getTintedColor` to `fromElevation` for better alignment with Material Design 3 terminology, where tonal colors are applied based on surface elevation.
- **Refactor:** Renamed `MaterialColorSchemes` to `MaterialColorScheme` to maintain consistency with Flutter's `ColorScheme`.
- **Feat:** Added detailed comments to `MaterialBreakpoint` explaining the different breakpoint values based on the Material Design 3 guidelines.
- **Feat:** Added `allLevels` to `MaterialElevation`, providing a convenient list of all elevation levels.
- **Fix:** Ignored `.vscode/` and `.env` files in `.gitignore` to avoid committing editor-specific settings and environment variables.
- **Example:** Updated the example app to use `MaterialTonalColor.fromElevation` and other related changes.


## 0.2.3

- **Docs:** Added detailed examples to `README.md` for `MaterialBorder`, `MaterialOpacity`, `MaterialBreakpoint`, `MaterialIconSize`, and `MaterialZIndex`.
- **Example:** Added a new `MotionPage` to the example app to showcase all `MaterialMotion` tokens.
- **Example:** Updated the `OtherTokensPage` in the example app to include showcases for `MaterialBreakpoint`, `MaterialIconSize`, and `MaterialZIndex`.
- **Refactor:** Renamed `MotionToken` to `MaterialMotionToken` for better clarity and consistency.
- **Fix:** Removed `MaterialBorder.none` as it was redundant (equivalent to `0`).


## 0.2.2

### Changed

- **Improved** `README.md` with clearer instructions and updated usage examples.


## 0.2.1

### Changed

- **Renamed** `MaterialColorSchemes` to `MaterialColorScheme`.
- **Removed** static schemes `lightScheme` and `darkScheme`; use the `create()` method instead.


## 0.2.0

### Added

- **`MaterialSurface` Utility**: Introduced a new utility class with a `getTintedColor()` method to easily apply Material 3 surface tint based on elevation. This encapsulates the `ElevationOverlay` logic into a clean, reusable token.


## 0.1.0

### Added

- **Complete Material 3 Token System**:

  - `MaterialColorSchemes`: Light and dark color schemes generated from a seed color.
  - `MaterialTypeScale`: Full set of 15 M3 text styles (Display, Headline, Title, Body, Label).
  - `MaterialShape`: `ShapeBorder` tokens for all M3 corner radius levels.
  - `MaterialShadow`: `BoxShadow` tokens aligned with the 6 elevation levels of M3.
  - `MaterialBorder`: Tokens for border widths.

- **Style Guide Example**: The example app was completely rewritten to serve as a visual style guide for all tokens.
- **Barrel Files**: Added barrel files for easy token import by category (`color`, `typography`, `geometry`, etc.).

### Changed

- **Refactored `MaterialOpacity`**: Aligned with M3 state layer values (Hover, Focus, Press, Drag) and disabled opacities.
- **Refactored `MaterialRadius`**: Values adjusted to match the M3 corner radius token scale.
- **Refactored `MaterialIconSize`**: Simplified to focus on the default 24dp size, with guidance for contextual usage.
- **Refactored `motion.dart`**: Fixed `asTween` return type to `Animatable<T>` to ensure proper typing.


## 0.0.1

### Added

- Introduced `MaterialElevation` tokens for consistent elevation styling.
