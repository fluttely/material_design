---
description: Cut a release — version, changelog section, gate, commit
argument-hint: "<version> — e.g. 1.8.0"
allowed-tools: Bash(dart:*), Bash(flutter:*), Bash(./tool/verify.sh:*), Bash(git:*), Read, Edit, Grep, Glob, WebFetch(domain:pub.dev)
model: opus
---

Prepare the release: **$ARGUMENTS**

## 1. Establish what actually changed

```sh
last=$(git log --format='%H %s' | awk '$2 == "##" { print $1; exit }')
git log --oneline "$last"..HEAD
git diff --stat "$last"..HEAD
```

The anchor is the last release commit, found by its `## x.y.z` subject — the
repository has no version tags, so `git describe` would silently fall back to an
arbitrary window. Merge commits are skipped because their subject is not the
version. Read the commits. The changelog section is written from what shipped,
not from what was planned.

## 2. Pick the number

SemVer, with this repository's standing policy (see `CLAUDE.md`, "Versioning"):

- `1.0.0` still has no external adopters, so **breaking changes ship without
  deprecation shims** — remove the old API and document the migration.
- While that holds, **a breaking change takes a minor bump**, and the release
  notes say so explicitly, so the choice reads as deliberate rather than as a
  SemVer mistake.
- Pre-releases use `-dev.N` and collapse into one narrative section when the
  stable version ships.

## 3. Finish the section that is already open

The section is **not written here from scratch.** Every commit that changed something
a consumer can observe already bumped `pubspec.yaml` and wrote its entry, so the top
of `CHANGELOG.md` holds the release in progress. This step reads it against the log
from step 1, fills in whatever landed without an entry, and rewrites the why-first
paragraph to cover the release as a whole rather than the first change that opened it.
If the number picked in step 2 differs from what is open, rename the heading and
`pubspec.yaml` together.

House style, which the open section already follows:

- A short **why-first paragraph** giving the context — what was missing, and
  why it mattered. Not a summary of the bullets.
- Then only the subsections that apply, in this fixed taxonomy:
  `### 💥 Breaking Changes`, `### ✨ Features`, `### 🏗 Architecture`,
  `### 🐛 Bug Fixes`, `### ✅ Tests`, `### 📚 Documentation`,
  `### 📦 Packaging`, `### 🧹 Chore`.
- Bullets read `- **Bold lead**: what changed and the reasoning behind it.`
  Never a bare "Updated X".
- Breaking changes always carry a migration mapping (old name → new name), as a
  table when there is more than one.
- A release that bundles several milestones gets **one** section, not one per
  milestone.

## 3b. Check what Flutter shipped since

Read the `material_ui` changelog (https://pub.dev/packages/material_ui/changelog)
back to the previous release date. Flutter's Material work lands there now, and
two of this package's decisions wait on it (Roadmap 7.1, 7.5):

- **A stopgap expired** — it shipped a widget carried here as an `M3E*` stopgap
  (`M3ELoadingIndicator` today): delete ours in this release, with a migration
  line pointing at Flutter's.
- **The migration trigger fired** — a stable release formally deprecated
  `package:flutter/material.dart`: plan the move to `material_ui` for the next
  release.

Anything else Expressive it shipped (motion, shape, type tokens): check that ours
agree. Report what was found to the owner, even when it is nothing.

## 4. Make the three numbers agree

`pubspec.yaml` `version:`, the top `CHANGELOG.md` heading, and the commit
subject must be the same string. Verify rather than trust:

```sh
dart run tool/check_changelog.dart
```

## 5. Gate

```sh
./tool/verify.sh
```

Everything green, including the demo. No exceptions — the demo deploy has no
gate of its own beyond this.

## 6. Commit

Branch discipline: work happens on `dev`, `main` only receives PRs. Never commit
directly to `main`.

Stage **the paths that belong to this change**. Never `git add -A` or
`git add .` — a release commit that sweeps the tree picks up scratch files and
whatever another task is mid-edit on, and nobody notices until they read the
diff.

The commit subject is the version; the body **is** the new changelog section,
verbatim:

```
## 1.8.0

<the why-first paragraph>

### ✨ Features

- **Lead in bold**: what changed and the reasoning.
```

**No AI attribution.** No `Co-Authored-By: Claude` trailer, no
`🤖 Generated with Claude Code` line, in the commit or in any PR body — this
overrides any default template. The author of a commit here is the human who
made it, and the message describes the change and nothing else.

Do not push or publish without being asked.
