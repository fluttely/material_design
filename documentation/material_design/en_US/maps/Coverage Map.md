# Coverage Map — spec area × delivery surface

One row per M3 spec area. A row is ✅ only when **lib + tests + README + example +
demo** all cover it (the triad rule in `CLAUDE.md` — lib and tests are implied by
"shipped"). Audit date: 2026-08-15 (v1.7.0). Shipped rows carry the version.

| M3 area | lib | README | example | demo page | Gaps / notes |
| :--- | :-: | :-: | :-: | :-: | :--- |
| Spacing / layout grid | ✅ | ✅ | ✅ | ✅ Spacing | — |
| Shape scale | ✅ | ✅ | ✅ | ⚠️ Shape | demo names `M3Corners`/`M3Radius` in strings but never renders the corner scale itself |
| Border widths | ✅ | ✅ | ✅ | ⚠️ Border | demo shows only none/thin; add thick/extraThick + named ctors |
| Typography (baseline 15) | ✅ | ✅ | ✅ | ✅ Typography | `M3TypeScale.values` added in 1.6.0 |
| Typography (emphasized) | ✅ 1.6.0 | ✅ | ✅ | ✅ Typography | all 15 pairs shown with the numeric proof that the swap is layout-safe |
| Elevation | ✅ | ✅ | ✅ | ✅ Elevation | — |
| Color: tonal palettes | ✅ | ✅ | ✅ | ✅ Tonal | `M3CorePalette` + `fromSeed` still not in the Tonal page |
| Color: schemes/variants/contrast | ✅ 1.6.0 | ✅ | ✅ | ✅ Schemes | all nine variants + the four contrast levels with measured ratios |
| Color: harmonization | ✅ 1.6.0 | ✅ | ✅ | ✅ Schemes | `harmonious` removed in 1.6.0; `harmonize` is the spec's HCT `Blend.harmonize` |
| Color: extended (custom) colors | ✅ 1.6.0 | ✅ | ✅ | ✅ Schemes | `M3ExtendedColor(s)` as a `ThemeExtension` |
| Opacity / state layers | ✅ | ✅ | ✅ | ✅ Opacity + Interaction | — |
| Motion (classic) | ✅ | ✅ | ✅ | ⚠️ Motion | demo uses only static aliases; enum values, duration/curve scales, `durationFor`/`curveFor` unshown |
| Motion (Expressive springs) | ✅ 1.6.0 | ✅ | ✅ | ✅ Springs | full token table + a velocity hand-off demo |
| Interaction states | ✅ | ✅ | ✅ | ✅ Interaction | — |
| Focus indicator | ✅ | ✅ | ✅ | ✅ Interaction/A11y | — |
| Visual density | ✅ | ✅ | ✅ | ✅ Density | — |
| Window size classes | ✅ | ✅ | ✅ | ✅ Breakpoints | — |
| Responsive widgets | ✅ | ✅ | ✅ | ✅ Responsive | demo page added in 1.0.1 |
| Adaptive helpers (`M3Adaptive`) | ✅ | ⚠️ | ✅ | ✅ Adaptive | README names the family but not the individual statics |
| Accessibility helpers | ✅ | ✅ | ✅ | ✅ A11y | the A11y page calls `M3Accessibility` instead of hand-rolling (1.0.1) |
| Contract escape hatch | ✅ | ✅ | ✅ | ✅ Utils | `M3Contract` showcase added in 1.0.1; `M3Contract.contrastLevel` joined in 1.6.0 |
| Icon sizes | ✅ | ✅ | ✅ | ✅ Icons | — |
| Icon axes (`wght`/`GRAD`/`FILL`/`opsz`) | ✅ 1.7.0 | ✅ | ✅ | ✅ Icons | `M3IconStyle` types a whole `IconTheme`; axes need the variable font |
| Z-index | ✅ | ✅ | ✅ | ✅ Z-Index | z-index is a pragmatic extra, not an M3 spec token |
| Expressive: shape library | ✅ | ✅ | ✅ | ✅ Expressive | the 35-shape morphing preview is enabled (1.0.1); names prefixed `M3E*` (1.6.0) |
| Expressive: shape border / morph | ✅ 1.6.0 | ✅ | ✅ | ✅ Expressive | `M3EShapeBorder` showcase + morph demo; `M3EShapeMorph` itself is only exercised in the demo |
| Expressive: loading indicator | ✅ | ✅ | ✅ | ✅ Expressive | overflow fixed in 1.0.1 |
| Expressive: new components (button groups, split button, FAB menu, toolbar) | ❌ | — | — | — | never shipping here — deliberate wait on Flutter, recorded as a decision in 1.6.0 (Roadmap 6.3) |
| Canonical layouts / panes | ✅ 1.6.0 | ✅ 1.6.0 | ✅ 1.6.0 | ✅ 1.6.0 Layouts | all three layouts + `M3CanonicalLayout`/`M3PaneRole`/`M3PaneDisplayMode`; the demo page runs them live at the current window size |
| Component tokens (comp layer) | ✅ 1.6.0 | ✅ | ✅ 1.6.0 | ✅ Component Tokens | gap caught by this map and closed in 1.6.0: `example/lib/main.dart` now has an `8b. Component measurements` section, which flags the below-touch-target heights by comparing against the real `M3Accessibility.minTouchTargetMobile` instead of a hardcoded 48 |

Tests: **160 → 251** across 1.6.0–1.6.0.

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

Still open:

- The demo still lints with `flutter_lints` while the package uses `very_good_analysis`.
- The demo still bypasses parts of the contract it showcases (raw
  `BorderRadius.circular(…)`, literal alphas, magic sizes) — it should model the
  "no raw primitives" principle.
- Page-level gaps remain on Shape, Border, Motion and Tonal (see the table above).

Related: [[Token Map]] · [[../Roadmap|Roadmap]]
