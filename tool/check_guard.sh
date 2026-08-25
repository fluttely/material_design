#!/usr/bin/env bash
#
# Tests that .claude/hooks/guard-git.sh still refuses what it is supposed to.
#
# A gate that silently stops gating is worse than no gate: the rule looks
# enforced, nobody checks it by hand any more, and the first thing anyone
# notices is the mistake it was supposed to prevent. The guard is a pair of
# regexes, which is exactly the kind of thing that keeps working right up until
# someone adjusts one — so it gets the same treatment as the rest of the
# repository's rules and is checked by a machine.
#
# Both directions matter. A guard that blocks everything would pass a
# refuse-the-bad-case test and make the repository unusable, so half of these
# cases assert that ordinary git still goes through.
#
# Note for anyone reading this file inside an agent session: it contains the
# banned strings as test fixtures, which is why it is a file rather than a
# command. Typing these payloads into a shell would trip the very hook under
# test — as it should.

set -uo pipefail
cd "$(dirname "$0")/.."

HOOK=.claude/hooks/guard-git.sh
pass=0
failed=()

# expect: 2 = the call must be blocked, 0 = it must be allowed through.
expect() {
  local name="$1" want="$2" payload="$3" rc
  printf '%s' "$payload" | "$HOOK" >/dev/null 2>&1
  rc=$?
  if [[ "$rc" == "$want" ]]; then
    pass=$((pass + 1))
    printf '  \033[32m✓\033[0m %-38s\n' "$name"
  else
    failed+=("$name (exit $rc, expected $want)")
    printf '  \033[31m✗\033[0m %-38s exit %s, expected %s\n' "$name" "$rc" "$want"
  fi
}

bash_call() { printf '{"tool_name":"Bash","tool_input":{"command":"%s"}}' "$1"; }

printf '\n  must be refused\n'
expect "git add -A"          2 "$(bash_call 'git add -A')"
expect "git add ."           2 "$(bash_call 'git add .')"
expect "git add --all"       2 "$(bash_call 'git add --all')"
expect "git add -A after &&" 2 "$(bash_call 'git status && git add -A')"
expect "git commit -a"       2 "$(bash_call 'git commit -a -m x')"
expect "git commit -am"      2 "$(bash_call 'git commit -am x')"
expect "Claude co-author"    2 "$(bash_call 'git commit -m msg\n\nCo-Authored-By: Claude <n@a.com>')"
expect "generated-with line" 2 "$(bash_call 'gh pr create --body body 🤖 Generated with Claude Code')"

printf '\n  must be allowed\n'
expect "git add explicit paths" 0 "$(bash_call 'git add lib/src/a.dart test/src/a_test.dart')"
expect "git add ./lib"          0 "$(bash_call 'git add ./lib')"
expect "git add .pubignore"     0 "$(bash_call 'git add .pubignore')"
expect "git commit -m"          0 "$(bash_call 'git commit -m feat: add the icon weight scale')"
expect "git commit --amend"     0 "$(bash_call 'git commit --amend --no-edit')"
expect "git status"             0 "$(bash_call 'git status --short')"
expect "flutter test"           0 "$(bash_call 'flutter test')"
expect "non-Bash tool"          0 '{"tool_name":"Edit","tool_input":{"file_path":"a.dart"}}'

printf '\n'
if [[ ${#failed[@]} -eq 0 ]]; then
  printf '\033[32m✓ guard-git.sh holds — %d cases.\033[0m\n' "$pass"
  exit 0
fi

printf '\033[31m✗ guard-git.sh has %d broken case(s):\033[0m\n' "${#failed[@]}"
for name in "${failed[@]}"; do
  printf '  • %s\n' "$name"
done
printf '\nThe hook is the only thing standing between these calls and the\n'
printf 'repository. Fix the hook, not this file.\n'
exit 1
