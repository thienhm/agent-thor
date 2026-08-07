#!/usr/bin/env bash
set -u

repo_root=$(cd "$(dirname "$0")/.." && pwd)
fail=0
expected_skills=(
  figma-to-swiftui
  ios-accessibility-pro
  ios-api-design
  ios-app-store-changelog
  ios-architecture
  ios-concurrency-expert
  ios-core-data-expert
  ios-performance-audit
  ios-security-expert
  ios-senior-mentor
  ios-simulator
  ios-swiftdata-pro
  ios-swiftui-pro
  ios-testing-pro
  ios-writing-for-interfaces
  using-agent-thor
)

for skill in "${expected_skills[@]}"; do
  if [ ! -f "$repo_root/skills/$skill/SKILL.md" ]; then
    echo "Missing skill definition: $skill/SKILL.md"
    fail=1
  fi
done

actual_count=$(find "$repo_root/skills" -mindepth 2 -maxdepth 2 -name SKILL.md | wc -l | tr -d '[:space:]')
if [ "$actual_count" -ne "${#expected_skills[@]}" ]; then
  echo "Expected ${#expected_skills[@]} skill definitions, found $actual_count"
  fail=1
fi

exit "$fail"
