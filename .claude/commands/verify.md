---
description: Run the full pre-commit gate and fix whatever it reports
argument-hint: "[--fast] [--offline]"
allowed-tools: Bash(./tool/verify.sh:*), Bash(dart:*), Bash(flutter:*), Read, Edit, Grep, Glob
---

Run the gate:

```sh
./tool/verify.sh $ARGUMENTS
```

Then act on the result.

- **Everything passed** — say so in one line and stop. Do not re-run individual
  steps to "double check"; the gate already ran them.
- **Something failed** — fix the cause, not the symptom, and re-run. Specifically:
  - `dart format` — run `dart format .` and move on. Never hand-reflow code to
    satisfy it.
  - `triad README↔example↔demo` — the failure text names the missing artifact.
    A new scale needs a README line, an `example/lib/main.dart` section **and** a
    demo page; adding a name to only one of them is what caused the drift the
    checker exists to catch. The canonical section order lives in
    `tool/check_triad.dart`, which is the source of truth — change it only when
    the API tour genuinely gains a section.
  - `changelog ↔ pub.dev` — never "fix" this by deleting a changelog section for
    a version that shipped. If a published version is undocumented, write its
    section. The only version allowed to be documented-but-unpublished is the
    one in `pubspec.yaml`.
  - `demo renders every page` — a page that throws on build fails here rather
    than during the gh-pages deploy. That is the point; fix the page.

Report only what changed and what still fails. A warning (⚠) is information,
not a failure — mention it once, do not act on it unless asked.
