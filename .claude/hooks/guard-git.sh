#!/usr/bin/env bash
#
# PreToolUse hook — refuses the two git mistakes CLAUDE.md states in prose.
#
# The format hook next door runs *after* a write and fixes it. This one runs
# *before* a Bash call and can say no: it exits 2, which blocks the tool call
# and hands the message back to the agent as feedback. That difference is the
# whole point. A rule that only warns is a rule that gets scrolled past.
#
# Both rules were already written down, and being written down is exactly what
# was not enough:
#
#   1. "Never `git add -A` / `git add .` while other work is in flight." The
#      failure is silent — a sweep picks up scratch files and another task's
#      half-finished edits, and nobody finds out until someone reads the diff.
#      `git commit -a` is the same hazard wearing a different flag, so it is
#      refused too.
#
#   2. "Never add AI attribution to a commit." The tool's own default template
#      suggests the trailer, so silence elects it. This is the repository's
#      pattern-7 case in one file: your context competes with the tool's
#      defaults, and only one of them is enforced.
#
# Matching is done on the raw payload rather than on a parsed `command` field,
# deliberately: no `jq` dependency (same call as format-dart.sh), and a banned
# string is banned wherever it appears — a `gh pr create --body` carrying the
# trailer is as much a violation as a `git commit -m` carrying it, and CLAUDE.md
# says so.
#
# To bypass in a genuine emergency, stage explicitly (`git add <paths>`) — there
# is no flag here on purpose. An escape hatch nobody can find is a rule; an
# escape hatch with a flag is a suggestion.

set -uo pipefail

payload=$(cat)

# Only Bash calls can run git.
case "$payload" in
  *'"Bash"'*) ;;
  *) exit 0 ;;
esac

deny() {
  printf 'BLOCKED by .claude/hooks/guard-git.sh — %s\n\n%s\n' "$1" "$2" >&2
  exit 2
}

# ── 1. Wholesale staging ────────────────────────────────────────────────────
# `-A`, `--all` and a bare `.` as an argument to `git add`; `-a` in any short
# bundle (`-a`, `-am`, `-ma`) and `--all` on `git commit`.
#
# Two near misses this has to get right, both found by tool/check_guard.sh:
# `git add ./lib` is a path that merely starts with a dot, so the bare `.` must
# be followed by whitespace, a quote or an escape; and `git commit --amend`
# contains the substring `-am`, so a short bundle only counts when exactly one
# dash follows the whitespace.
if grep -qE 'git[[:space:]]+add[[:space:]]+(-A|--all|\.)([[:space:]]|\\|"|'"'"'|$)' <<<"$payload" \
  || grep -qE 'git[[:space:]]+commit[^|;&]*([[:space:]]-[a-zA-Z]*a|[[:space:]]--all([[:space:]]|"|$))' <<<"$payload"; then
  deny "wholesale staging" \
"CLAUDE.md, \"Staging\": never \`git add -A\` / \`git add .\` while other work is
in flight — the sweep sits in the commit invisibly until someone reads the diff.
\`git commit -a\` stages every tracked modification and carries the same hazard.

Stage the paths that belong to this change:

    git add lib/src/... test/src/... CHANGELOG.md

If a commit already swept something up and is unpushed:

    git rm --cached <path> && git commit --amend --no-edit"
fi

# ── 2. AI attribution ───────────────────────────────────────────────────────
if grep -qiE 'co-authored-by:[[:space:]]*claude|generated with \[?claude code|🤖' <<<"$payload"; then
  deny "AI attribution in a commit or PR body" \
"CLAUDE.md, \"Commits\": never add a \`Co-Authored-By: Claude\` trailer and never
add a \"🤖 Generated with Claude Code\" line to a PR body — including when a
tool's own default template suggests it.

The authorship of a commit in this repository is the human who made it. A commit
message describes the change and nothing else. Rewrite the message without the
trailer."
fi

exit 0
