#!/usr/bin/env bash
#
# PostToolUse hook — formats every Dart file the moment it is written.
#
# CI runs `dart format --set-exit-if-changed .`, so an unformatted file is a
# failed build. Asking a human (or an agent) to remember `dart format .` before
# committing is a rule that will eventually be forgotten; running it on write
# is a rule that cannot be. This is the same idea as the package itself —
# make the correct thing structural rather than remembered.
#
# Reads the tool payload on stdin; deliberately no `jq` dependency.

set -uo pipefail

file=$(sed -n 's/.*"file_path"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -1)

[[ "$file" == *.dart ]] || exit 0
[[ -f "$file" ]] || exit 0

dart format "$file" >/dev/null 2>&1 || true
exit 0
