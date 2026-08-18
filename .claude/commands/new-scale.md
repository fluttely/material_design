---
description: Add an M3 token scale across all nine artifacts it has to touch
argument-hint: "<scale name> — e.g. \"M3IconWeights, the Material Symbols wght axis\""
allowed-tools: Bash(dart:*), Bash(flutter:*), Bash(./tool/verify.sh:*), Read, Edit, Write, Grep, Glob
---

Add the scale: **$ARGUMENTS**

A token scale in this package is never one file. It is nine artifacts, and a
scale that lands in fewer is a scale nobody can find — that is exactly the drift
`tool/check_triad.dart` was written to catch. Work through all nine.

## Before writing anything

1. **Name the spec section.** Find the page on https://m3.material.io/ that
   defines this scale and the exact values it prescribes. If you cannot find
   one, stop and say so: this package ships the spec, not inventions.
2. **Check the scope boundary.** If the answer is a *component*, stop — Flutter's
   Material library owns components. Ship the measurements, not the widget. See
   `CLAUDE.md`, "Scope boundary".
3. **Read a neighbour.** `lib/src/m3/tokens/icon/icon_axis_token.dart` is the
   most recent example of the house pattern. Match it rather than inventing a
   shape.

## The nine artifacts

1. **`lib/`** — in the right module, respecting the one-directional dependency
   graph. The pattern is fixed:
   ```dart
   extension type const M3XValue._(double dp) implements double {}

   abstract final class M3Xs {
     /// <what this stop means, with its dp/ms/% value and the spec URL>
     static const M3XValue small = M3XValue._(4);
     …
     /// Every stop, in ascending order.
     static const List<M3XValue> values = <M3XValue>[small, …];
   }
   ```
   The constructor is library-private so off-scale values cannot be built. Add
   an `M3Contract.x(…)` factory **only** if the scale is genuinely open-ended.
   Every public member gets a doc comment naming its value and citing the spec.
2. **`test/src/…`** — mirroring the `lib/src/` path. Three assertions minimum:
   the spec values, the ordering, and that `values` holds every declared stop.
3. **`README.md`** — a line or short block in the section this scale belongs to,
   in the canonical order. New area ⇒ a `b`-suffixed section (`8b`), never a
   renumbering of everything after it, and then update `canonicalSections` in
   `tool/check_triad.dart`.
4. **`example/lib/main.dart`** — the same section, same order. One file, always;
   never split it. Prefer `const`, no third-party dependencies.
5. **`demo/lib/showcase_pages/`** — a showcase page, or an extension of the
   existing page for that family: the scale *rendered*. Demo code models the
   contract it shows: no raw `BorderRadius.circular`, no literal opacities, no
   magic sizes. Deviations go through `M3Contract` and stay visible.
6. **`demo/lib/recipe_pages/`** — the Code half of the same destination: two to
   four `CodeRecipe`s showing what a consumer actually types, each with a live
   preview and a snippet under a dozen lines. Groups mirror the showcase page's
   sections in the same order. Snippets are plain strings, so the dead-name
   check reads them — which is the point.
7. **`demo/lib/showcase/showcase_destinations.dart`** — a new destination is
   *one* edit here, carrying **both** pages (`page:` and `codePage:`). The rail,
   the drawer and the shell all derive from this list. Never add a parallel list
   addressed by index arithmetic.
8. **`CHANGELOG.md`** — an entry under the pending version, why-first:
   `- **Bold lead**: what changed and the reasoning.` Never a bare "Added X".
9. **`documentation/material_design/`** — the vault, **both locales**
   (`en_US/` first, then `pt_BR/`), plus the row in `maps/Token Map.md` and
   `maps/Coverage Map.md`. If a `Roadmap.md` item covers this scale, mark it
   shipped in the same pass.

## Finish

```sh
./tool/verify.sh
```

The triad check will tell you which of README / example / demo you missed. Do
not add the scale to `demoCoverageExemptions` to silence it — that list is for
scales that deliberately have no page, and a brand-new scale is not one.
