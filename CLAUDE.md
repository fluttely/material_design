# CLAUDE.md

Guidance for Claude Code when working in this repository. These rules override any
default tool behavior. When a rule here conflicts with a tool's default template,
this file wins.

> **This file is tracked in git as of 1.8.0.** It used to be gitignored alongside
> `documentation/`, on the reasoning that it was personal working notes. It is not —
> it is the repository's own account of why its API decisions are what they are, and
> keeping the reasoning out of the repository put it exactly where nobody could find
> it. Edit it in a commit like any other file. It stays out of the published archive
> via `.pubignore`: consumers install a package, not a contributor's rulebook.

## What this package is

`material_design` is a **Material Design 3 design contract** for Flutter, published on
pub.dev. It is not a component library and not a loose bag of constants: it expresses
the official M3 scales (spacing, shape, type, motion, elevation, opacity, …) as Dart
**types**, so that an app consuming it adheres to the M3 spec by construction.

Three principles define every API decision:

1. **Primitive replacement.** Public APIs accept M3 extension types
   (`M3SpacingValue`, `M3CornerValue`, `M3BorderWidthValue`, `M3OpacityValue`,
   `M3IconSizeValue`, `M3BreakpointValue`, `M3ElevationDpValue`, `M3ZIndexValue`,
   `M3ToneValue`) instead of bare `double`/`int`. No scale may quietly accept a raw
   number.
2. **No token that must be unwrapped to be used.** Scalar tokens are `static const`
   values used directly (`M3Spacings.s16`), never enums with a `.value` getter —
   the unwrap costs `const`-ness. Enums remain correct for **composite tokens**
   (`M3Motion`, `M3Elevation` — you read two fields together) and **selectors**
   (`M3ScreenSize`, `M3InteractionState` — they name a situation, not a value).
3. **Deviation is deliberate and greppable.** Extension types are erased at runtime;
   a cast always defeats them. The single sanctioned escape hatch is `M3Contract.*`
   (`M3Contract.spacing(18)` etc.). Never add a second way to smuggle an off-scale
   value in, and never use `M3Contract` inside the package itself.

Any new API must state which M3 spec section it implements (link to the
https://m3.material.io/ page in its doc comment) and use only spec values.

## Scope boundary (decided, not up for re-litigation)

**This package does not ship Material Design 3 components.** Flutter's Material
library owns `FilledButton`, `NavigationBar`, `Menu`, and the rest. A second
implementation here becomes migration debt for every consumer the day Flutter changes
its own. What the package ships is the contract those components are built from —
tokens, scales, wrappers, and the per-component *measurements* (`M3ButtonHeights` and
friends in the component token layer).

The single exception: an M3 Expressive widget Flutter does not have yet
(`M3ELoadingIndicator` today). Each such widget is a stopgap, marked `@experimental`,
and is removed once Flutter ships the real one. Do **not** implement the 2025
Expressive components (button groups, split button, FAB menu, toolbars) while
flutter/flutter#168813 is in flight — re-evaluate each release instead.

Before adding any widget, ask: does Flutter already have this, or is it about to? If
either answer is yes, ship the tokens and stop.

## Repository layout

| Path | Role | Tracked? |
| :--- | :--- | :--- |
| `lib/` | The package. `material_design.dart` is a pure export barrel over `lib/src/*.dart` module barrels. | git + pub |
| `test/` | Package tests, mirroring `lib/src/` structure. | git, not pub |
| `example/` | **Single-file** consumer example (`example/lib/main.dart`). Rendered by pub.dev. Intentionally one file so a reader can copy-paste it whole. Never split it into multiple files. | git; pub keeps only `lib/` + `pubspec.yaml` |
| `demo/` | Full Flutter web app — the live, interactive showcase deployed to GitHub Pages (https://fluttely.github.io/material_design/). Every destination has two pages: the token family rendered (`showcase_pages/`) and the code that produces it (`recipe_pages/`). | git, not pub |
| `documentation/material_design/` | Obsidian vault: design notes, M3 reference docs, roadmap/plan. Bilingual: `en_US/` is the source of truth, `pt_BR/` mirrors it. | git, not pub |
| `CLAUDE.md` | This file — the reasoning behind the API decisions and the working rules. | git, not pub |
| `tool/` | The verification gate. `verify.sh` runs everything; `check_triad.dart` and `check_changelog.dart` enforce the rules below that no compiler can. | git, not pub |
| `.claude/` | Agent-facing context: the format-on-write hook, and `/new-scale`, `/release`, `/verify`. Tracked — it is shared project context, not personal config. Only `settings.local.json` stays local. | git, not pub |
| `.github/workflows/` | CI: `tests.yml` (runs `./tool/verify.sh` on PRs to `main`), `deploy-demo.yml` (builds `demo/` web to gh-pages). | git |

### Module architecture

Nine modules with a one-directional dependency graph:

```text
tokens ──┬─> shape ──┬─> interaction
         ├─> layout ─┤
         ├─> color ──┴─> adaptive
         └─> typography
motion  ─────────────────> interaction, adaptive
expressive (standalone)
```

- Never introduce a dependency that runs against this graph.
- The token layer is deliberately **one Dart library** (`lib/src/tokens.dart` with its
  files): the type-safe wrappers rely on library-private constructors to keep
  off-scale values out. Splitting it would force those constructors public.
- Every other module boundary is real: internals stay internal, cross-module access
  goes through the module barrel.
- `lib/src/m3e/` (expressive) is the experimental M3 Expressive area; mark its public
  surface `@experimental`.

## The documentation triad (README ↔ example ↔ demo)

These three artifacts must never drift apart. Any PR that changes the public API must
update all three in the same PR:

- **README.md** — the reference: every public API family appears, clear and direct,
  with short copy-pasteable snippets. The large showcase snippet in the README is
  compiled verbatim by `test/readme_showcase_test.dart`; if you edit one, edit the
  other in the same commit, character for character.
- **example/lib/main.dart** — one runnable file demonstrating the same API families
  in the same order as the README sections. It exists for copy-paste; keep it a
  single file, keep it compiling, prefer `const`, no third-party dependencies.
- **demo/** — the live proof, in two readings of the same subject. Every token family
  and widget the package exports has a **showcase page** (what it looks like) and a
  **code page** (what you type to get it), reached by one `Visual / Code` switch. New
  API ⇒ both, in the matching section (Expressive / Foundations / Styles / Utilities
  — see "Demo conventions").

Checklist for an API change: `lib/` + tests + README + `readme_showcase_test.dart` +
`example/lib/main.dart` + `demo/` showcase page + `demo/` code recipe +
`CHANGELOG.md` entry + (if concepts changed) `documentation/material_design/` notes in
both languages. Use `/new-scale` — it is this checklist as a command.

**This rule is enforced, not remembered.** `dart run tool/check_triad.dart` fails when
a scale is missing from any of the three, when the section orders disagree, or when a
UI string names an API that no longer exists in `lib/`. It was written after the rule
had been prose for six releases and the triad had drifted anyway: nine scales were
undocumented in at least one artifact, the README was missing two whole sections, and
a demo caption advertised a class called `M3EShapeBorders` that never existed. If you
find yourself about to *silence* the checker, you are about to recreate that.

### The canonical section order

README ("API tour"), `example/lib/main.dart`, and the demo all present the API in the
same order — when adding a family, slot it consistently in all three:

1. Spacing & layout · 2. Shape & borders · 3. Elevation & surfaces · 4. Typography ·
4b. Icons · 5. Color · 5b. Schemes & contrast · 6. Interaction states & focus ·
7. Motion · 8. Adaptive & responsive · 8b. Component measurements · 9. Accessibility ·
10. M3 Expressive · 11. `M3Contract`

The machine-readable copy of that list is `canonicalSections` in
`tool/check_triad.dart`, and it is the source of truth — this paragraph is the
explanation, not the definition. Change the list there when the tour genuinely gains
a section.

A family added to an existing area gets a `b` suffix rather than renumbering
everything after it — renumbering churns three files and every cross-reference for no
reader benefit.

### Demo conventions

- Navigation sections, in rail order: **Expressive / Foundations / Styles / Utilities**.
  Expressive leads on purpose — it is the newest part of the spec and the part a
  visitor is least likely to know exists, so it gets the position that costs no
  scrolling. The machine-readable copy is `canonicalDemoSections` in
  `tool/check_triad.dart`; change both together.
- **Adding a page is one edit.** `demo/lib/showcase/showcase_destinations.dart` pairs
  every destination with **both** of its pages and groups them into sections; the rail
  (`showcase_rail.dart`), the drawer (`showcase_drawer.dart`) and the shell
  (`showcase_shell.dart`) all derive from that list. Never reintroduce a parallel
  page list addressed by index arithmetic — that was the 1.6.0 `main.dart`.
- `demo/test/showcase_navigation_test.dart` renders every page in the list — both
  modes — so a page that throws on build fails CI rather than the deploy. It is
  written to be **order-independent**: it reads the selected destination off
  `showcaseDestinations` rather than naming it, scrolls the rail before tapping, and
  pumps bounded frames instead of `pumpAndSettle` (several pages animate forever).
  Reordering the rail must never fail a test about state layers — keep it that way.

#### The two modes

Every destination has two pages, selected by `ShowcaseMode` in the shell:

| Mode | Page | Lives in |
| :--- | :--- | :--- |
| `visual` | the token family, rendered | `demo/lib/showcase_pages/` |
| `code` | the same family as the calls that produce it | `demo/lib/recipe_pages/` |

- **A new destination ships both.** `ShowcaseDestination.codePage` is required, and
  two model tests enforce that the 23 pairs are distinct — a code page reused across
  two destinations looks completely correct in the rail.
- **A code page is a list, not a layout.** It is `RecipePage(title:, summary:,
  groups:)` over `RecipeGroup`/`CodeRecipe`, and nothing else; the card, the preview
  surface, the highlighting and the import line are decided once in
  `demo/lib/recipes/`. Keep recipes short — three to six per page, a dozen lines of
  code each. A recipe that needs more is two recipes, or belongs on the Visual page.
- **The page title is the destination label**, rendered as `<label> · Code`, and the
  render test asserts it. That is what tells a reader who switched modes that they
  are still in the same place.
- **Groups mirror the Visual page's sections**, in the same order, so switching modes
  never reshuffles the subject.
- **Snippets are strings, so the dead-name check reads them.** That is deliberate:
  `tool/check_triad.dart` scans demo string literals for `M3*` identifiers that no
  longer exist, which is the only thing standing between a renamed API and a snippet
  that teaches the old name. It earned its keep on the first run over these pages.
- Syntax colours come from the ambient `ColorScheme` (`recipes/dart_syntax.dart`), not
  from a vendored theme — the demo restyles with the seed, and so must its code.
- The demo must *model* the contract it showcases: no raw `BorderRadius.circular`,
  literal opacities, or magic sizes in demo code — use the package's own tokens
  (deviations only via `M3Contract`, visibly).
- Never render a removed API name in a UI string (pre-1.0 the headings advertised
  deleted `M3*Token` enums for months because no compiler checks strings).
- Deploys happen only via `.github/workflows/deploy-demo.yml`; there is no manual
  deploy script.

## Commits

**Never add AI attribution to a commit.** Do not append a `Co-Authored-By: Claude ...`
trailer, and do not add a `🤖 Generated with Claude Code` line to pull request bodies.
This applies to every commit, amend, rebase and squash, without exception — including
when a tool's own default output template suggests otherwise.

The authorship of a commit in this repository is the human who made it. Commit messages
should describe the change and nothing else.

### Message format

Release commits use the version as the subject, matching the `CHANGELOG.md` section they
introduce — the commit body **is** the new changelog section, verbatim:

```
## 1.0.0-dev.33

### 📚 Documentation

<paragraph explaining why the change was needed>

- **Lead in bold**: what changed and the reasoning behind it.
```

Other commits follow Conventional Commits (`feat!:`, `refactor!:`, `test:`, `chore:`),
with `!` marking a breaking change.

### Branching

Day-to-day work happens on `dev`; `main` receives PRs and is what CI gates and the
demo deploy run against. Never commit directly to `main`.

### Staging

**Never `git add -A` / `git add .` while other work is in flight.** Stage the paths
that belong to the change. A release commit that sweeps the whole tree picks up
scratch files, half-finished work, and files another task is mid-edit on — and the
mistake is invisible until someone reads the diff. If a commit did sweep something up
and is unpushed, `git rm --cached <path>` + `git commit --amend --no-edit` is the fix.

## Changelog

`CHANGELOG.md` follows Keep a Changelog + SemVer, with this house style:

- One `## <version>` section per release, newest first.
- Subsections use this fixed emoji taxonomy (only include the ones that apply):
  `### 💥 Breaking Changes`, `### ✨ Features`, `### 🏗 Architecture`,
  `### 🐛 Bug Fixes`, `### ✅ Tests`, `### 📚 Documentation`, `### 📦 Packaging`,
  `### 🧹 Chore`.
- Entries are **why-first**: a short paragraph of context when the reason isn't
  obvious, then bullets in the form `- **Bold lead**: what changed and the reasoning.`
  Never a bare "Updated X".
- Breaking changes always come with a migration mapping (old name → new name), in a
  table when there are several.

### The changelog must match pub.dev exactly

Every version published to pub.dev has a section, and no section exists for a version
that was not published. Both directions have been violated before: `0.0.1`–`0.8.0` and
`0.29.0-dev`–`1.0.0-dev.10` shipped without ever being documented, while
`1.0.0-dev.34`/`.35` had sections for builds nobody could install. Verify with:

```sh
dart run tool/check_changelog.dart            # add --offline to skip the network
```

It checks all four things at once: that `pubspec.yaml` and the top section name the
same version, that sections run newest-first, that none is duplicated, and that the
set of sections matches what pub.dev actually serves. It used to be a Python snippet
pasted into this file — a checker you have to copy out of a doc before running is a
checker that does not run.

The only version allowed to be documented-but-unpublished is the one you are about to
publish. A release
that bundles several development milestones gets **one** section covering all of them
— not one section per milestone. The milestones live in git history as ordinary
Conventional Commits; only the commit that ships takes a version subject.

## Versioning & releases

- SemVer. Pre-releases use the `-dev.N` series (`1.6.0-dev.1`, `-dev.2`, …) and are
  collapsed into one narrative section when the stable version ships.
- `pubspec.yaml` `version:`, the top `CHANGELOG.md` section, and the release commit
  subject must always agree.
- **Post-1.0 breaking policy (as of 2026-08: decided by the owner):** `1.0.0` has no
  external users yet, so breaking changes are still acceptable and ship **without
  deprecation shims** — remove the old API outright and document the migration in the
  changelog. Do not add `@Deprecated` anything. Revisit this policy once the package
  has real adopters.
- **Breaking changes take a minor bump while that policy holds.** `1.6.0` shipped
  breaking renames deliberately. The reasoning: `0.28.1` went straight to `1.0.0`, so
  nobody is on `1.x`, and spending `2.0.0` on cleanup that no one has to migrate
  through would misstate the package's maturity permanently. Once there are real
  adopters, breaking changes take a major. Say so in the release notes whenever a
  minor carries a break, so the choice reads as deliberate.
- **Never write a changelog section for a version that was not published.** The
  `1.0.0-dev.*` series was never released — `0.28.1` went directly to `1.0.0` — so
  those sections were folded into `1.0.0` rather than left implying releases that
  never existed. A changelog documents what shipped, not the path taken to it.
- SDK floor: Flutter `>=3.27.0` / Dart `>=3.6.0` (needs `Color.withValues`, `Color.a`,
  `toARGB32`, extension types). Do not raise it without a changelog entry explaining
  which API forces the bump; never lower it below what the code uses.
- Packaging: `.pubignore` keeps the published archive small (~134 KB) — `demo/`,
  `documentation/`, and native runners under `example/` never ship to pub. If you add
  a new top-level directory, decide its `.pubignore` fate in the same commit.

## Code style

- Lints: `very_good_analysis` (see `analysis_options.yaml`). CI enforces
  `dart format --set-exit-if-changed .` — run `dart format .` before committing.
- `const` everywhere it is possible; the contract's value proposition includes
  compile-time allocation. A change that breaks `const`-ness of an existing API is a
  breaking change.
- Public API names are prefixed `M3` (stable spec) or `M3E` (expressive/experimental).
- Every public symbol has a doc comment; non-obvious ones cite the M3 spec URL and the
  dp/ms/percentage values they encode.
- Token classes follow the pattern: `abstract final class M3Xs` (plural) holding
  `static const` values typed as the `M3XValue` extension type, plus a
  `static const List<M3XValue> values` list for galleries and property tests.
- Tests mirror `lib/src/` paths under `test/src/`. New token scales get: spec-value
  assertions, ordering assertions, and inclusion in the `values` list test.

## Verification before any commit

```sh
./tool/verify.sh              # everything; --fast skips the demo, --offline skips pub.dev
```

Or `/verify`, which runs it and acts on the result. It is one script rather than a
list of commands because `.github/workflows/tests.yml` runs **the same script** — CI
and local cannot disagree about what the gate is. The steps, in order:

| Gate | What it protects |
| :--- | :--- |
| `dart format --set-exit-if-changed` | CI fails on unformatted code. The `.claude/` hook also formats every Dart file on write, so this should never be what fails. |
| `flutter analyze` | Zero issues, tree-wide. No longer disabled in CI — do not disable it again. |
| `flutter test` | Package tests, including `readme_showcase_test.dart`, which compiles the README's showcase snippet verbatim. |
| `tool/check_triad.dart` | README ↔ example ↔ demo: section order, scale coverage, dead API names in UI strings. |
| `tool/check_changelog.dart` | `CHANGELOG.md` ↔ `pubspec.yaml` ↔ pub.dev. |
| `cd example && flutter analyze` | The single-file example must always compile. |
| `cd demo && flutter analyze && flutter test` | Every showcase page renders; a page that throws fails here, not in the deploy. |

Nothing in this table is a judgement call. That is deliberate — the rules that need
judgement are in the sections above, and the rules that do not should not be costing
anyone attention.

## documentation/material_design (Obsidian vault)

- Structure: `en_US/` and `pt_BR/` mirror each other file-for-file; write English
  first, then translate. Internal links use Obsidian `[[wikilinks]]`.
- The vault holds three kinds of content: **reference** (M3 concepts mapped to package
  API), **maps** (`maps/Token Map.md`, `maps/Coverage Map.md`), and **plan**
  (`Roadmap.md` — the living gap analysis against https://m3.material.io/ and the
  phased action plan; API-hygiene debt lives in its Phase 0).
- Layout per locale: `Material Design 3.md` (home) + `Roadmap.md` at the root;
  `foundations/` (Foundations, Design Tokens, Accessibility, Adaptive Design,
  Interaction States); `styles/` (Styles, Color, Typography, Shape, Elevation,
  Motion); `expressive/M3 Expressive.md`; `maps/`; `implementation/Implementation.md`.
- When implementing a roadmap item, update its status in the plan in the same session,
  and keep the coverage maps in sync with the real exported API — the maps must use
  current API names (post-1.0 style: `M3Spacings.s16`, never `M3SpacingToken.space16`).
- **The vault is tracked in git as of 1.8.0** and belongs in the commit that changes
  what it describes, like any other documentation. It is still excluded from the pub
  archive by `.pubignore` — it is contributor material, not consumer material.
  `.obsidian/workspace.json` stays ignored: it is per-machine editor layout that
  changes every time the vault is opened.
