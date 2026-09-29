# Coverage Map — spec area × delivery surface

One row per M3 spec area. A row is ✅ only when **lib + tests + README + example +
demo** all cover it (the triad rule in `CLAUDE.md` — lib and tests are implied by
"shipped"). Audit date: 2026-09-29 (v1.8.1 plus `Unreleased`). Shipped rows carry the version; `Unreleased` marks what is not on pub.dev yet. Every
demo page has a Code half since 1.8.0; the column counts both.

| M3 area | lib | README | example | demo page | Gaps / notes |
| :--- | :-: | :-: | :-: | :-: | :--- |
| Spacing / layout grid | ✅ | ✅ | ✅ | ✅ Spacing | — |
| Shape scale | ✅ | ✅ | ✅ | ✅ Shape | each level of the scale shows its `M3Corners` radius, read off the token (Unreleased) |
| Border widths | ✅ | ✅ | ✅ | ✅ Border | all four widths plus `M3Border.all`/`.fromBorderSide` (closed by 1.8.0) |
| Typography (baseline 15) | ✅ | ✅ | ✅ | ✅ Typography | `M3TypeScale.values` added in 1.6.0 |
| Typography (emphasized) | ✅ 1.6.0 | ✅ | ✅ | ✅ Typography | all 15 pairs shown with the numeric proof that the swap is layout-safe |
| Typography: variable fonts (`wght`) | ✅ Unreleased | ✅ | ✅ | ✅ Typography (Code) | `withWeightAxis` / `textThemeWithWeightAxis`; only the weight has a spec value — `GRAD`/`wdth`/`ROND`/`opsz` documented, not encoded (Roadmap 3.2). Code page only: the demo runs on Flutter 3.41+, where the Visual page would show no difference |
| Elevation | ✅ | ✅ | ✅ | ✅ Elevation | — |
| Color: tonal palettes | ✅ | ✅ | ✅ | ✅ Tonal | `M3CorePalette.fromSeed` rendered as its six key palettes (Unreleased) |
| Color: schemes/variants/contrast | ✅ 1.6.0 | ✅ | ✅ | ✅ Schemes | all nine variants + the four contrast levels with measured ratios |
| Color: harmonization | ✅ 1.6.0 | ✅ | ✅ | ✅ Schemes | `harmonious` removed in 1.6.0; `harmonize` is the spec's HCT `Blend.harmonize` |
| Color: extended (custom) colors | ✅ 1.6.0 | ✅ | ✅ | ✅ Schemes | `M3ExtendedColor(s)` as a `ThemeExtension` |
| Opacity / state layers | ✅ | ✅ | ✅ | ✅ Opacity + Interaction | — |
| Motion (classic) | ✅ | ✅ | ✅ | ✅ Motion | the full duration scale from `M3MotionDuration.values`, and what `durationFor`/`curveFor` resolve to (Unreleased) |
| Motion (Expressive springs) | ✅ 1.6.0 | ✅ | ✅ | ✅ Springs | full token table + a velocity hand-off demo; each token's `reduced` counterpart (Unreleased) |
| Motion: reduced motion | ✅ Unreleased | ✅ | ✅ | ✅ Springs + A11y | `M3ESpring.reduced` / `M3Accessibility.adaptiveSpring`; the spec changes the kind of motion, so there is no duration helper |
| Motion: transition patterns | — | ✅ Unreleased | — | — | decided: `package:animations` ships them; the README shows the wiring (Roadmap 7.4) |
| Interaction states | ✅ | ✅ | ✅ | ✅ Interaction | — |
| Focus indicator | ✅ | ✅ | ✅ | ✅ Interaction/A11y | — |
| Visual density | ✅ | ✅ | ✅ | ✅ Density | — |
| Window size classes | ✅ | ✅ | ✅ | ✅ Breakpoints | — |
| Responsive widgets | ✅ | ✅ | ✅ | ✅ Responsive | demo page added in 1.0.1 |
| Adaptive helpers (`M3Adaptive`) | ✅ | ✅ | ✅ | ✅ Adaptive | README names the main statics (layout, padding, navigation, dialog, sheet, button) |
| Accessibility helpers | ✅ | ✅ | ✅ | ✅ A11y | the A11y page calls `M3Accessibility` instead of hand-rolling (1.0.1) |
| Contract escape hatch | ✅ | ✅ | ✅ | ✅ Utils | `M3Contract` showcase added in 1.0.1; `M3Contract.contrastLevel` joined in 1.6.0 |
| Icon sizes | ✅ | ✅ | ✅ | ✅ Icons | — |
| Icon axes (`wght`/`GRAD`/`FILL`/`opsz`) | ✅ 1.7.0 | ✅ | ✅ | ✅ Icons | `M3IconStyle` types a whole `IconTheme`; axes need the variable font |
| Z-index | ✅ | ✅ | ✅ | ✅ Z-Index | z-index is a pragmatic extra, not an M3 spec token |
| Expressive: shape library | ✅ | ✅ | ✅ | ✅ Expressive | the 35-shape morphing preview is enabled (1.0.1); names prefixed `M3E*` (1.6.0) |
| Expressive: shape border / morph | ✅ 1.6.0 | ✅ | ✅ | ✅ Expressive | `M3EShapeBorder` showcase + morph demo; `M3EShapeMorph` itself is only exercised in the demo |
| Expressive: loading indicator | ✅ | ✅ | ✅ | ✅ Expressive | overflow fixed in 1.0.1 |
| Expressive: new components (button groups, split button, FAB menu, toolbar) | ❌ | — | — | — | never shipping here — Flutter's, now landing in `material_ui` (Roadmap 6.3, 7.5) |
| Living next to `material_ui` | — | ✅ Unreleased | — | — | what compiles unchanged in a `material_ui` app and what needs a workaround, verified against 1.5.0 (Roadmap 7.2) |
| Canonical layouts / panes | ✅ 1.6.0 | ✅ 1.6.0 | ✅ 1.6.0 | ✅ 1.6.0 Layouts | all three layouts + `M3CanonicalLayout`/`M3PaneRole`/`M3PaneDisplayMode`; the demo page runs them live at the current window size |
| Component tokens (comp layer) | ✅ 1.6.0 | ✅ | ✅ 1.6.0 | ✅ Component Tokens | gap caught by this map and closed in 1.6.0: `example/lib/main.dart` now has an `8b. Component measurements` section, which flags the below-touch-target heights by comparing against the real `M3Accessibility.minTouchTargetMobile` instead of a hardcoded 48 |

Tests: **160 → 251** across the six milestones that became 1.6.0; **290** package tests at this audit (282 before Roadmap 3.2).

## Demo-specific debt

Most of the 2026-08-13 audit's demo debt was cleared in **1.0.1**:

- ✅ Stale `M3*Token` heading strings removed from the eight pages that advertised
  deleted enum types.
- ✅ Dead code deleted: `enhanced_theme_page.dart`, the fully-commented
  `m3_expressive/new_shapes/main.dart`, and the commented blocks referencing removed
  APIs on the elevation, utils, and expressive pages.
- ✅ `demo/README.md`, `web/index.html` and the pubspec floor (Dart ≥3.6 /
  Flutter ≥3.27, matching the package) are real now; the broken `deploy.sh` is gone —
  deploys go through `.github/workflows/deploy-demo.yml`.
- ✅ The Expressive page was rebuilt: loading indicators no longer overflow, and the
  35-shape morphing preview is enabled and themed to the ambient color scheme.
- ✅ New pages since: **Responsive**, **Accessibility** and **M3Contract** (1.0.1),
  **Schemes** (1.6.0), **Springs** (1.6.0), **Component Tokens** (1.6.0),
  **Layouts** (1.6.0, under Foundations).

Closed since:

- ✅ Raw primitives out of the demo (1.7.0) — remaining deviations go through
  `M3Contract`, visibly.
- ✅ The demo lints with `very_good_analysis`, like the package (Unreleased).
- ✅ Page-level gaps on Shape, Border, Motion and Tonal (1.8.0 onward).

Nothing on this list is open.

Related: [[Token Map]] · [[../Roadmap|Roadmap]]
