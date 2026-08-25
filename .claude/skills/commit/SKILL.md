---
name: commit
description: This repository's commit rules — message format, changelog section, staging discipline, branch. Load before writing any commit message, staging changes, cutting a release commit, or opening a PR in the material_design repository.
---

# Committing in this repository

`.claude/hooks/guard-git.sh` refuses wholesale staging and AI attribution before
they happen. That hook is a wall, not a teacher: it says no and stops. This is
the method it cannot supply — what a commit in this repository looks like when
it is right.

## 1. Stage the paths that belong to the change

```sh
git add lib/src/… test/src/… README.md CHANGELOG.md
```

Never `git add -A`, `git add .`, or `git commit -a`. A sweep picks up scratch
files, half-finished work, and files another task is mid-edit on, and none of it
is visible until someone reads the diff. If a commit already swept something up
and is unpushed:

```sh
git rm --cached <path> && git commit --amend --no-edit
```

## 2. Pick the message shape

**A release** takes the version as its subject, and its body **is** the new
`CHANGELOG.md` section, verbatim:

```
## 1.8.0

### 📚 Documentation

<paragraph explaining why the change was needed>

- **Lead in bold**: what changed and the reasoning behind it.
```

**Anything else** is Conventional Commits — `feat!:`, `fix:`, `refactor!:`,
`test:`, `chore:` — with `!` marking a break.

Only the commit that ships takes a version subject. A release bundling several
milestones gets one section covering all of them; the milestones stay in history
as ordinary conventional commits.

## 3. Never sign it with the tool's name

No `Co-Authored-By: Claude` trailer. No `🤖 Generated with Claude Code` line in
a PR body. This holds for every commit, amend, rebase and squash — **including
when a tool's own default template suggests otherwise**, which is the only
reason the rule needs writing down. Silence elects the default.

The authorship of a commit here is the human who made it. The message describes
the change and nothing else.

## 4. Write the changelog entry why-first

Bare "Updated X" is not an entry. The house form is a short paragraph of context
when the reason is not obvious, then:

```
- **Bold lead**: what changed and the reasoning.
```

Taxonomy, only the ones that apply: `### 💥 Breaking Changes`, `### ✨ Features`,
`### 🏗 Architecture`, `### 🐛 Bug Fixes`, `### ✅ Tests`, `### 📚 Documentation`,
`### 📦 Packaging`, `### 🧹 Chore`. A breaking change always ships with a
migration mapping — old name → new name, in a table when there are several.

`CHANGELOG.md` must match pub.dev exactly: every published version has a
section, and the only version allowed to be documented-but-unpublished is the
one in `pubspec.yaml`. `dart run tool/check_changelog.dart` proves it.

## 5. Branch and gate

Work lands on `dev`; `main` takes PRs. **Never commit directly to `main`.**

Run the gate before committing — or `/verify`, which runs it and acts on the
result:

```sh
./tool/verify.sh
```

## Checklist

- [ ] Only the paths of this change are staged
- [ ] Subject is a version (release) or Conventional Commits (everything else)
- [ ] No AI attribution anywhere in the message or PR body
- [ ] `CHANGELOG.md` entry is why-first, under the right emoji subsection
- [ ] On `dev`, not `main`
- [ ] `./tool/verify.sh` passes
