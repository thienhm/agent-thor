#!/usr/bin/env bash
set -u

repo_root=$(cd "$(dirname "$0")/.." && pwd)
readme="$repo_root/README.md"
fail=0

if [ ! -f "$readme" ]; then
  echo "Missing README.md"
  exit 1
fi

if ! rg -Fq 'Agent Thor is a collection of 16 skills' "$readme"; then
  echo "README does not state the 16-skill inventory"
  fail=1
fi

if ! rg -q '^\| \*\*Cross-Cutting Guidance\*\* \|' "$readme"; then
  echo "README is missing the Cross-Cutting Guidance row"
  fail=1
fi

if ! rg -q '^\| \*\*Orchestration\*\* \|' "$readme"; then
  echo "README is missing the Orchestration row"
  fail=1
fi

exit "$fail"
