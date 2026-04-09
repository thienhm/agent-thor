# Updating Agent Thor Skills

This guide outlines the process for keeping the 14 upstream skills in the Agent Thor framework up-to-date with their original source repositories. 

> Note: The `using-agent-thor` and `ios-senior-mentor` skills are first-party and maintained directly in this repository. Ensure you consult the [Skills Registry](skills-registry.md) for the exact upstream URLs.

## The Ingestion Rule: Dependency-Traced Copy

When updating a skill from its upstream repository, you must **not** copy the entire upstream repository into our `skills/` directory.

We strictly follow a "Dependency-Traced Copy" architecture to prevent accumulating dead weight, CI/CD pipelines, or broken references.

For each skill, you must only copy:
1. The definition: `SKILL.md`
2. The runtime references: `references/*.md` (only if linked in the `SKILL.md!`)
3. The automations: `scripts/*` (only if executed via bash inside the `SKILL.md`)

## Step-by-Step Update Process

When an upstream fix or improvement is released (or tracked), follow these steps to sync it into Agent Thor:

### 1. Clone the Upstream Repository
Clone the source repository into a temporary directory so you can inspect it.
```bash
git clone https://github.com/twostraws/SwiftUI-Agent-Skill.git /tmp/skill_update
```

### 2. Copy the Core SKILL.md
Locate the specific skill folder within the upstream repository (as defined in `skills-registry.md`) and copy the `SKILL.md` file, overwriting our local version.
```bash
cp /tmp/skill_update/swiftui-pro/SKILL.md skills/ios-swiftui-pro/SKILL.md
```

### 3. Parse and Copy Dependencies
Read the newly copied `SKILL.md` and look for any internal relative paths (e.g., `[Reference](references/state-management.md)` or `<tool>./scripts/run_lint.sh</tool>`).

Manually copy only those explicitly referenced files into our local folder structure:
```bash
cp /tmp/skill_update/swiftui-pro/references/state-management.md skills/ios-swiftui-pro/references/
```
*Do not copy files like `.github/`, `agents/`, or `assets/`.*

### 4. Verify Internal Integrity
After copying, verify that no broken links exist. The framework assumes that if `SKILL.md` links to a file, that file exists in our repository.
```bash
# Example verification: look for referenced markdown files and ensure they exist locally
grep -oP 'references/[a-zA-Z0-9_-]+\.md' skills/ios-swiftui-pro/SKILL.md | while read -r line; do 
  ls -l "skills/ios-swiftui-pro/$line" || echo "WARNING: Broken reference $line"
done
```

### 5. Commit Atomically
Create a single atomic commit for the update. This allows easy rollbacks if the upstream skill introduces hallucinatory instructions.
```bash
git add skills/ios-swiftui-pro/
git commit -m "chore(skills): sync ios-swiftui-pro from upstream

- Updated SKILL.md with new iOS 18 state management rules
- Pulled latest references/state-management.md"
```

### 6. Clean Up
```bash
rm -rf /tmp/skill_update
```

## Automating the Process

For future maintenance, consider writing a bash or python script (`scripts/update_skill.sh`) that automates Steps 2-4 using regex parsing. Until then, use the manual dependency-traced copy method to ensure the Agent Thor framework remains clean and highly optimized.
