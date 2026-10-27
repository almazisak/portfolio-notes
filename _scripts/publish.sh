#!/usr/bin/env bash
# Commit and push all changes to main. A push rebuilds the site, so this publishes.
#
#   _scripts/publish.sh                 interactive: shows changes, asks, commits, pushes
#   _scripts/publish.sh "post: qaryz"   same, with your own commit message
#   _scripts/publish.sh -y              skip the confirmation
#   _scripts/publish.sh -n              dry run: show what would be published and stop
set -euo pipefail

# Always act on the repo this script lives in, wherever it is called from (e.g. via an alias)
cd "$(dirname "${BASH_SOURCE[0]}")/.."

yes=0; dry=0; message=""
for arg in "$@"; do
  case "$arg" in
    -y|--yes) yes=1 ;;
    -n|--dry-run) dry=1 ;;
    -h|--help) sed -n '2,8p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) message="$arg" ;;
  esac
done

branch="$(git branch --show-current)"
if [ "$branch" != "main" ]; then
  echo "You are on '$branch'. Only 'main' is published; switch with: git switch main" >&2
  exit 1
fi

if [ -z "$(git status --porcelain)" ]; then
  echo "Nothing to publish: no changes."
  exit 0
fi

echo "Changes to publish:"
git status --short
echo

if [ "$dry" -eq 1 ]; then
  echo "Dry run: nothing committed or pushed."
  exit 0
fi

if [ "$yes" -ne 1 ]; then
  read -r -p "Commit and push to main (this rebuilds the public site)? [y/N] " answer
  case "$answer" in y|Y|yes) ;; *) echo "Cancelled."; exit 1 ;; esac
fi

git add -A
# The pre-commit hook runs here; if it blocks, the changes stay staged and nothing is pushed.
git commit -q -m "${message:-notes: update}"
git push
echo
echo "Pushed. The site rebuilds in about a minute: https://almaz.design/notes"
