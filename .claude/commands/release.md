---
description: Cut a release — version, changelog section, gate, commit
argument-hint: "<version> — e.g. 1.8.0"
allowed-tools: Bash(dart:*), Bash(flutter:*), Bash(./tool/verify.sh:*), Bash(git:*), Read, Edit, Grep, Glob
---

Prepare the release: **$ARGUMENTS**

## 1. Establish what actually changed

```sh
git log --oneline "$(git describe --tags --abbrev=0 2>/dev/null || echo HEAD~20)"..HEAD
git diff --stat
```

Read the commits. The changelog section is written from what shipped, not from
what was planned.

## 2. Pick the number

SemVer, with this repository's standing policy (see `CLAUDE.md`, "Versioning"):

- `1.0.0` still has no external adopters, so **breaking changes ship without
  deprecation shims** — remove the old API and document the migration.
- While that holds, **a breaking change takes a minor bump**, and the release
  notes say so explicitly, so the choice reads as deliberate rather than as a
  SemVer mistake.
- Pre-releases use `-dev.N` and collapse into one narrative section when the
  stable version ships.

## 3. Write the section

Top of `CHANGELOG.md`, newest first. House style:

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
