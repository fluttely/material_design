# Roadmap — closing the gap with m3.material.io

**Status:** living plan. Last full revision: 2026-08-14, against `material_design` 1.6.0.

This is the action plan for making the package a *complete* Material Design 3 contract.
It is the result of auditing the entire official spec (https://m3.material.io/ —
Foundations, Styles, Components, and the 2025 M3 Expressive update) against the real
exported API. Each item states what the spec defines, what the package has today, and
what to build.

Phases 0–5 shipped as `1.6.0`–`1.6.0`; each closed item carries the version that
shipped it. Phase 6 is closed too, but as a **recorded decision** rather than code —
see below.

Rules that govern every item here:

- Post-1.0 breaking changes ship **without deprecations** (owner decision, 2026-08 —
  no external users yet; see `CLAUDE.md`). Rename outright, document in the changelog
  migration table.
- Every new API lands with: tests, README section, `example/lib/main.dart` coverage,
  a demo page, and an update to [[maps/Token Map|Token Map]] +
  [[maps/Coverage Map|Coverage Map]] in both vault locales.
- New scales follow the house pattern: `extension type M3XValue._(…)` +
  `abstract final class M3Xs` with `static const` members and a `values` list, plus an
  `M3Contract.x(…)` escape hatch when the scale is open-ended.

Legend: ✅ done · 🔨 planned, this phase · 🔭 later / needs decision.

---

## Phase 0 — API hygiene (breaking) — ✅ shipped in `1.6.0`

The 1.0.0 audit surfaced namespace and consistency debt. Fixing it was cheap then and
expensive forever after; it was paid off in one breaking release, with no shims.

| # | Item | Why |
| :- | :--- | :--- |
| 0.1 ✅ `1.6.0` | **Stop leaking unprefixed geometry into the root namespace.** The whole engine is prefixed: `M3EPoint`, `M3ECubic`, `M3ECornerRounding`, `M3EFeature`, `M3EEdgeFeature`, `M3ECornerFeature`, `M3ERoundedPolygon`, `M3EMorph`, `M3EPointTransformer`, `M3ERoundedPolygonToPath`, `M3EMorphToPath`. Every helper it used to export (`lerp`, `distance`, `square`, `convex`, `interpolate`, `Measurer`, `MeasuredPolygon`, `DoubleMapper`, `ProgressableFeature`, `twoPi`, `distanceEpsilon`, …) is library-private now. | Namespace safety |
| 0.2 ✅ `1.6.0` | **`MaterialShapes` → `M3EShapes`** — the last token-like class without an `M3` prefix. | Naming consistency |
| 0.3 ✅ `1.6.0` | **`LoadingIndicatorTheme` → `M3ELoadingIndicatorTheme`**; `InputMethodType` → `M3InputMethodType`. | Prefix rule: `M3` spec / `M3E` expressive |
| 0.4 ✅ `1.6.0` | **The whole `m3e` surface is `@experimental`.** Consumers opt in visibly (`ignore_for_file: experimental_member_use`) instead of inferring stability from a doc comment. | Signals stability tiers |
| 0.5 ✅ `1.6.0` | `values` lists added to `M3Margins`, `M3Spacers`, `M3Opacities`, `M3StateLayerOpacities`, `M3LayoutWidths`; `M3Border.none` is `const`. | Scale-class uniformity |
| 0.6 ✅ `1.6.0` + `1.6.0` | Doc-comment pass: spec URLs on the token classes (`1.6.0`), then 19 missing API docs written across `m3e` when it came under the analyzer (`1.6.0`). | Spec traceability |

> **Decision recorded:** prefixing won over the alternative of moving the engine to an
> opt-in `expressive_shapes.dart` library, because `M3ELoadingIndicator`'s own API
> takes an `M3ERoundedPolygon` — a split would have forced two imports for one widget.
> The two `@internal` members (`Cubic.fromPoints`, `RoundedPolygon.fromFeatures`)
> became genuinely private rather than merely documented as off-limits.

## Phase 1 — Color system completion — ✅ shipped in `1.6.0`

Spec: https://m3.material.io/styles/color — the package had real HCT tonal palettes
(`M3TonalPalette`, `M3CorePalette`, `M3Tones`) but stopped short of *schemes*.

| # | Item | Spec reference |
| :- | :--- | :--- |
| 1.1 ✅ `1.6.0` | **`M3ColorSchemes`** — `fromSeed(seedColor:, variant:, brightness:, contrastLevel:)`, plus `light`, `dark`, and `fromContext` (which reads platform brightness *and* the user's contrast setting). **`M3SchemeVariant`** carries the nine spec variants and resolves to Flutter's `DynamicSchemeVariant`. | Color / dynamic color schemes |
| 1.2 ✅ `1.6.0` | **`M3ContrastLevels`** — `reduced` (−1.0), `standard` (0.0), `medium` (0.5), `high` (1.0), as `M3ContrastLevelValue`, with `M3ContrastLevels.of(context)` and `M3Contract.contrastLevel` as the escape hatch. | Color / contrast |
| 1.3 ✅ `1.6.0` + `1.6.0` | **Color harmonization**: `harmonious()` (HSL wheel arithmetic, five colors, an operation Material does not define) was removed in `1.6.0`; `M3ColorUtils.harmonize(designColor, sourceColor)` — the spec's HCT `Blend.harmonize`, a bounded ≤15° hue shift — replaced it in `1.6.0`. | Color / custom & extended colors |
| 1.4 ✅ `1.6.0` | **Extended color support**: `M3ExtendedColor` (the four spec roles at the fixed tone stops per brightness, with a `.harmonized` factory) carried through the theme by `M3ExtendedColors`, a `ThemeExtension`. | Color / extended colors |
| 1.5 🔭 | Platform dynamic color (Android 12+ wallpaper extraction) stays **out of scope** — that is `dynamic_color`'s job; document the integration instead of wrapping it. | — |

> **Decision recorded:** `M3ColorSchemes` deliberately **wraps** Flutter's
> `ColorScheme.fromSeed` rather than reimplementing the Material pipeline. The SDK
> already runs `material_color_utilities` end to end and is kept in step with the
> spec, so a second pipeline here would only drift from it. The package's contribution
> is the typed contract — a variant token and a contrast token instead of a `double`
> that silently accepts `2.7` — not a second pipeline.

## Phase 2 — Motion physics system — ✅ shipped in `1.6.0`

Spec: https://m3.material.io/styles/motion — M3 Expressive made **springs** the
primary motion model alongside duration+easing pairs. The package had the classic
system (`M3MotionDuration`, `M3MotionCurve`, `M3Motion`) and nothing physics-based.

| # | Item | Notes |
| :- | :--- | :--- |
| 2.1 ✅ `1.6.0` | **`M3ESpring`** — the twelve published tokens as a composite enum carrying `damping` and `stiffness`, with `description` → `SpringDescription` and `simulation(start:, end:, velocity:)` → `SpringSimulation`. Values in [[maps/Token Map\|Token Map]]. | Spatial springs move things; effects springs fade/tint them |
| 2.2 ✅ `1.6.0` | **`M3MotionScheme`** (`standard`/`expressive`) selecting by intent through `spatial(speed)`, `effects(speed)`, `spring(kind, speed)`, `springs`, with **`M3MotionSpeed`** (slow/standard/fast) and **`M3MotionSpringKind`** (spatial/effects) as the accompanying selectors. | Mirror of `M3Motion.durationFor/curveFor` |
| 2.3 🔭 | **Transition pattern presets** built on the tokens: container transform, shared axis (x/y/z), fade through, fade — as `PageTransitionsBuilder`s / `AnimatedSwitcher` configs. | Motion / transitions |
| 2.4 🔭 | `M3Accessibility.shouldReduceMotion` integration: every motion preset gains a reduced-motion fallback (shorter duration, no bounce). | Accessibility × Motion |

> **Decisions recorded:** both schemes ship the *same* effects springs (damping 1.0 at
> stiffness 800/1600/3800) — expression belongs to movement, not to color, and a test
> asserts it. Two side effects of the phase are worth remembering: `analysis_options.yaml`
> had excluded `lib/src/m3e/**` since the module landed, so a third of the package was
> never linted — the exclusion is gone; and that blind spot is exactly how
> `M3EPoint.angleDegrees` shipped computing `angleRadians * pi / 180`, the
> degrees-to-radians factor applied to a value already in radians. Fixed, with a
> regression test.

## Phase 3 — Typography completion — ✅ shipped in `1.6.0`

Spec: https://m3.material.io/styles/typography — 15 baseline styles ✅ (`M3TypeScale`).

| # | Item | Notes |
| :- | :--- | :--- |
| 3.1 ✅ `1.6.0` | **`M3EmphasizedTypeScale`** — the 15 roles one weight step heavier, each keeping its baseline's size and line height so a swap never reflows a layout. `M3EmphasizedTypeScale.of(style)` maps a baseline style to its counterpart and returns anything else unchanged. `M3TypeScale.values` landed alongside it, index-aligned. | Expressive type |
| 3.2 🔭 | **Variable font axes guidance**: document `wght`/`GRAD`/`wdth`/`ROND` usage with Roboto Flex; a `M3FontAxes` helper only if it can stay spec-true in pure Flutter. | Typography / fonts |

> **Spec fact recorded:** `titleSmall` and `labelLarge` are metrically identical
> (14sp / 20 line height / 0.1 tracking / weight 500), so the 15 roles collapse to 14
> distinct `TextStyle` values. That makes `of()` a lookup **by value, not by role** —
> harmless, because the pair's emphasized forms are identical too, but now asserted
> and documented rather than discovered by whoever hits it next.

## Phase 4 — Shape & component tokens — ✅ shipped in `1.6.0`

Spec: https://m3.material.io/styles/shape + per-component token tables.

| # | Item | Notes |
| :- | :--- | :--- |
| 4.1 ✅ `1.6.0` | **`M3EShapeBorder`** — an `OutlinedBorder` wrapping any `M3ERoundedPolygon`, so the 35-shape library drops into `Card(shape:)`, `Material(shape:)`, `ShapeDecoration`, and clips an `InkWell` ripple. The polygon is fitted to the layout rect by its own bounds. | Expressive shape library |
| 4.2 ✅ `1.6.0` | **Morphing comes for free**, then **`M3EShapeMorph`** on top of it: `lerpFrom`/`lerpTo` run the real `M3EMorph` algorithm rather than crossfading two outlines, so *any* implicit animation that lerps the shape morphs it. `M3EShapeMorph` is the wrapper for when the shape is the only thing animating. | Shape morphing |
| 4.3 ✅ `1.6.0` | **Component token layer**: `M3ButtonHeights` (the five Expressive size classes), `M3FabSizes`, `M3AppBarHeights`, `M3NavigationSizes`, `M3ListItemHeights` — all typed `M3SpacingValue`, all asserted on the 4dp grid. Contract only, *no widget implementations*. | Components / specs |
| 4.4 ✅ `1.6.0` | Decided and documented on the component token layer itself: this package **does not ship M3 components** (buttons, menus, toolbars). Expressive *widgets* are the single exception (`M3ELoadingIndicator` today) because Flutter does not provide them yet; each one gets removed if/when Flutter ships the real thing (track flutter/flutter#168813). | Scope boundary |

> **Caveat recorded:** `M3ButtonHeights.extraSmall` (32dp) and `.small` (40dp) are
> **visual** heights below the 48dp mobile touch minimum. That is the spec — a control
> at those heights must expand its *tap area*, not its box (Flutter's own buttons do
> this with `MaterialTapTargetSize.padded`). Stated in the doc comment and asserted in
> a test, so nobody "fixes" the numbers.
>
> Mid-morph frames are fitted to the *union* of the two endpoints' bounds rather than
> to each frame's own bounds, which would make the shape breathe as the morph ran; a
> test pins that. Endpoints settle back to plain borders so a finished animation stops
> paying for morph setup on every paint.

## Phase 5 — Adaptive & canonical layouts — ✅ shipped in `1.6.0`

Spec: https://m3.material.io/foundations/layout — window classes were already ✅; the
panes and the three canonical layouts landed here.

| # | Item | Notes |
| :- | :--- | :--- |
| 5.1 ✅ `1.6.0` | **Canonical layout scaffolds**: `M3ListDetailLayout` (list + detail, `onNavigateBack`, `placeholder`), `M3SupportingPaneLayout` (`primary` + `supporting`, `supportingFirst`), `M3FeedLayout` (`itemColumns` per window class, class-derived gutter and page margin) — thin compositions over the existing responsive primitives. | Layout / canonical layouts |
| 5.2 ✅ `1.6.0` | **Pane model**: `M3PaneRole` (primary/secondary), `M3PaneDisplayMode` (single/dual), and `M3CanonicalLayout` — `displayModeFor(size)`, `displayModeOf(context)`, `paneWidthFor(role, size)`. Secondary is fixed at `M3LayoutWidths.pane` (360dp); primary is `unbounded` and takes what is left. | Layout / panes |
| 5.3 ✅ `1.6.0` | `M3ResponsiveNavigation.getRailWidth` returns an `M3SpacingValue` from `M3NavigationSizes` instead of the inlined `80.0`/`256.0` — closed early, because the comp token layer landed in Phase 4. The 256dp extended width was verified against Flutter's `NavigationRail.minExtendedWidth` default rather than taken from memory. | |

> **Decision recorded:** two panes require **expanded (840dp) or wider**, not medium —
> at medium a 360dp support pane leaves the primary content narrower than a phone, so
> the split costs more than it buys.
>
> The three layouts deliberately collapse **differently** on compact, and that is the
> whole reason they are three named widgets instead of one: list-detail **replaces**
> the list with the detail (with `onNavigateBack` wired through `PopScope`, so the
> system back gesture works); supporting pane **stacks** the support below the primary
> content; feed **reflows** to fewer columns. Hiding supporting content behind
> navigation is the common bug here — it is part of the same task, not a destination,
> and a user who has to navigate away to reach it has lost the task's context.

## Phase 6 — Expressive component widgets — ✅ closed as a recorded decision (`1.6.0`)

Phase 6 was closed by **writing the decision down, not by writing code**. Per the 4.4
scope rule, the package ships **no M3 components**: Flutter's Material library owns
them, and duplicating one creates migration debt the day Flutter changes its own. The
sole exception is an Expressive widget Flutter lacks, and each one is a marked stopgap
that gets removed when Flutter ships the real thing. This is now stated in the package
README under "What this package deliberately does not ship".

| # | Decision |
| :- | :--- |
| 6.1 ✅ | `M3ELoadingIndicator` (shipped) — the exception that proves the rule; keep tracking Flutter's native one and delete this when it lands. |
| 6.2 ✅ `1.6.0` | `M3EShapeMorph`-based FAB/press feedback: **decided — demo only**, never lib. Unblocked by 4.1–4.2; a morphing FAB is an application of the shape border, not a component the package owes anyone. |
| 6.3 ✅ `1.6.0` | Button groups / split button / FAB menu / toolbar: **decided — deliberate wait** on flutter/flutter#168813. Not an open question re-litigated every release: the answer is no until Flutter ships, and then the answer is "use Flutter's". |

## Continuous — documentation & quality gates

- The triad rule (README ↔ example ↔ demo) from `CLAUDE.md` applies to every phase item.
- Demo gets a page per new token family; the Coverage Map row flips to ✅ only when
  lib + tests + README + example + demo are all done.
- Property tests for every new scale (grid adherence, ordering, `values` completeness).
- Keep `test/readme_showcase_test.dart` compiling the README showcase verbatim.
- Suite growth across the six releases: **160 → 251 tests** (182 after Phase 0, 182→199
  Phase 2, 199→210 Phase 3, 210→238 Phase 4, 238→251 Phase 5).

## Release train — what actually shipped

| Release | Contents |
| :--- | :--- |
| `1.6.0` | Phase 0 entirely (breaking; migration table in the changelog) |
| `1.6.0` | Phase 1 — 1.1–1.4 |
| `1.6.0` | Phase 2 — 2.1–2.2, plus the `m3e` analyzer exclusion and the `angleDegrees` fix |
| `1.6.0` | Phase 3 — 3.1 |
| `1.6.0` | Phase 4 — 4.1–4.4, plus 5.3 closed early |
| `1.6.0` | Phase 5 — 5.1–5.2 (canonical layouts + pane model); Phase 6 closed as a recorded decision; the component-token triad gap from 1.6.0 closed in `example/lib/main.dart` |
| later | 1.5 (docs), 2.3–2.4, 3.2 |

> SemVer note: the plan allowed a breaking `1.6.0` under the documented pre-adopter
> exception. It was not used — Phase 0 shipped as a real `1.6.0` with a full migration
> table instead, which is what the note's escape clause asked for.

Related: [[Material Design 3]] · [[maps/Coverage Map|Coverage Map]] · [[maps/Token Map|Token Map]]
