#!/usr/bin/env bash
#
# The whole pre-commit gate, in one command.
#
#   ./tool/verify.sh              # everything
#   ./tool/verify.sh --fast       # skip the demo (the slow half)
#   ./tool/verify.sh --offline    # skip the pub.dev round trip
#
# CLAUDE.md used to list these steps as prose for a human to remember. Prose
# does not fail CI, and steps that must be remembered are steps that get
# skipped. Running them is now one command, and .github/workflows/tests.yml
# runs the same one.
#
# Every step prints ✓ or ✗ and the script keeps going, so one run tells you
# everything that is wrong rather than only the first thing.

set -uo pipefail
cd "$(dirname "$0")/.."

FAST=0
OFFLINE=""
for arg in "$@"; do
  case "$arg" in
    --fast) FAST=1 ;;
    --offline) OFFLINE="--offline" ;;
    *) echo "unknown flag: $arg" && exit 2 ;;
  esac
done

FAILED=()

step() {
  local name="$1"
  shift
  printf '\n\033[1m▸ %s\033[0m\n' "$name"
  if "$@"; then
    printf '\033[32m✓ %s\033[0m\n' "$name"
  else
    printf '\033[31m✗ %s\033[0m\n' "$name"
    FAILED+=("$name")
  fi
}

# Formatting is checked, never applied: a gate that rewrites your files cannot
# tell you whether they were already correct.
step "dart format"          dart format --set-exit-if-changed --output=none .
step "flutter analyze"      flutter analyze
step "flutter test"         flutter test
step "triad README↔example↔demo" dart run tool/check_triad.dart
step "changelog ↔ pub.dev"  dart run tool/check_changelog.dart $OFFLINE
step "example compiles"     bash -c 'cd example && flutter analyze'

if [[ $FAST -eq 0 ]]; then
  step "demo analyzes"      bash -c 'cd demo && flutter analyze'
  step "demo renders every page" bash -c 'cd demo && flutter test'
else
  printf '\n\033[33m⚠ skipped the demo (--fast)\033[0m\n'
fi

printf '\n────────────────────────────────────────\n'
if [[ ${#FAILED[@]} -eq 0 ]]; then
  printf '\033[32mAll gates passed.\033[0m\n'
  exit 0
fi

printf '\033[31m%d gate(s) failed:\033[0m\n' "${#FAILED[@]}"
for name in "${FAILED[@]}"; do
  printf '  • %s\n' "$name"
done
exit 1
