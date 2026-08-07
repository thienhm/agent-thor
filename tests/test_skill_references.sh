#!/usr/bin/env bash
set -u

repo_root=$(cd "$(dirname "$0")/.." && pwd)
fail=0

for skill_file in "$repo_root"/skills/*/SKILL.md; do
  skill_dir=$(dirname "$skill_file")
  skill_name=$(basename "$skill_dir")

  while IFS= read -r dependency; do
    [ -z "$dependency" ] && continue
    if [ ! -e "$skill_dir/$dependency" ]; then
      echo "Missing dependency for $skill_name: $dependency"
      fail=1
    fi
  done < <(rg -o 'references/[A-Za-z0-9._/-]+\.md|scripts/[A-Za-z0-9._/-]+' "$skill_file" | sort -u)
done

registry="$repo_root/docs/skills-registry.md"
if ! rg -Fq '`ios-simulator-skill/skills/ios-simulator-skill/`' "$registry"; then
  echo "Registry has a stale ios-simulator upstream folder"
  fail=1
fi

exit "$fail"
