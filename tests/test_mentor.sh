#!/usr/bin/env bash
set -u

repo_root=$(cd "$(dirname "$0")/.." && pwd)
meta_skill="$repo_root/skills/using-agent-thor/SKILL.md"
readme="$repo_root/README.md"
fail=0

if ! rg -Fq '14 specialized domain experts, one cross-cutting mentor, and one orchestrator skill' "$meta_skill"; then
  echo "Meta-skill does not describe the complete Agent Thor composition"
  fail=1
fi

if ! rg -Fq '**Cross-Cutting Guidance:**' "$meta_skill"; then
  echo "Meta-skill is missing the Cross-Cutting Guidance taxonomy"
  fail=1
fi

if ! rg -Fq '`ios-senior-mentor` - Constructive coaching' "$meta_skill"; then
  echo "Meta-skill does not route coaching work to ios-senior-mentor"
  fail=1
fi

if ! rg -q '^\| \*\*Cross-Cutting Guidance\*\* \| `ios-senior-mentor` \|$' "$readme"; then
  echo "README does not classify ios-senior-mentor as cross-cutting guidance"
  fail=1
fi

if rg -q '^\| \*\*DevOps & Tooling\*\* \|.*ios-senior-mentor' "$readme"; then
  echo "README still classifies ios-senior-mentor as DevOps tooling"
  fail=1
fi

exit "$fail"
