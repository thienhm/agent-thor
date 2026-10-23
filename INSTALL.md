# Installing Agent Thor

Agent Thor contains 16 independently installable skills. Use the skills CLI to choose skills and target agents, or copy the skill directories manually.

## Prerequisites

- Node.js 22.20 or later for `npx skills`
- Git for repository installation
- An AI coding agent that supports Agent Skills

## Installation

### Recommended: npx skills

```bash
# Preview the available skills without installing
npx skills add thienhm/agent-thor --list

# Choose skills and target agents interactively
npx skills add thienhm/agent-thor

# Install one specialist
npx skills add thienhm/agent-thor --skill swift-concurrency-pro

# Install the complete collection for Codex
npx skills add thienhm/agent-thor --skill '*' -a codex

# Install the complete collection globally for Claude Code
npx skills add thienhm/agent-thor --skill '*' -a claude-code -g
```

Installation is project-level by default. Add `-g` for user-level availability across projects, `-y` to skip CLI confirmations, or `--copy` to use copies instead of symlinks. Quote `'*'` so the shell does not expand it.

`using-agent-thor` coordinates separately installed specialists; the CLI does not automatically install those specialists when you select the orchestrator alone. Install the complete collection for general orchestration, or install only the specialists you need for focused work. If an expert is missing, the orchestrator reports it and provides a targeted install command.

See the [skills CLI reference](https://github.com/vercel-labs/skills/blob/main/docs/commands.md) for agent identifiers and options. The CLI manages skill directories; the optional `agents/agent-thor.md` definition is not installed by these commands.

### Alternative: ask your agent to copy the collection

Give this prompt to the coding agent where you want to use Agent Thor:

> Install the Agent Thor skills from https://github.com/thienhm/agent-thor. Copy every directory under `skills/` into the appropriate skills directory for this agent. Use a user-level skills directory unless I ask for a project-only installation. Preserve each skill directory and all of its referenced files. Do not replace or symlink my `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, or other project instruction files. Verify that the `using-agent-thor` skill is discoverable when finished.

The agent should:

1. Obtain the latest Agent Thor repository contents by cloning, downloading, or using an existing checkout.
2. Choose a supported user-level skills directory by default, or a project-level directory when requested.
3. Copy every directory under Agent Thor's `skills/` directory into that destination.
4. Preserve the directory structure and supporting `references/` and `scripts/` files inside each skill.
5. Leave existing project instruction files unchanged.
6. Restart or reload the agent if it requires that step to discover newly installed skills.

### Manual fallback

If you already know your agent's skills directory, copy the bundle directly:

```bash
cp -R /path/to/agent-thor/skills/. /path/to/your-agent/skills/
```

Use the destination documented by your coding agent. Do not copy the repository's `agents/agent-thor.md` over an existing project instruction file.

## Verify

For a CLI installation, list the installed skills in the matching scope:

```bash
npx skills list
npx skills list -g
```

Confirm that each selected skill includes its `SKILL.md` and supporting files. For a full installation, confirm all 16 skills listed below are present, including:

```text
using-agent-thor/SKILL.md
```

Then ask your coding agent to list or use the `using-agent-thor` skill. If the skill is not discoverable, restart the agent and confirm that the chosen destination is one of its supported skills directories.

## Use

Use `using-agent-thor` for iOS and Apple-platform work spanning multiple domains:

> Use `using-agent-thor` to help me implement this feature.

The meta-skill selects the relevant installed specialists. Invoke individual specialists directly for focused work; for example, use `app-store-changelog` for release notes. Only relevant skill instructions and references need to be loaded.

## Updating

For CLI installations:

```bash
npx skills check
npx skills update swift-concurrency-pro
```

Use `npx skills update` to update all CLI-managed skills; this can include skills from other repositories. For manual installations, obtain the latest Agent Thor repository contents and repeat the copy operation, leaving unrelated skills untouched.

## Uninstalling

For CLI installations, select installed Agent Thor skills to remove:

```bash
npx skills remove
# For a global installation
npx skills remove -g
```

For manual installations, remove only the Agent Thor skill directories that were copied into the selected destination. Do not remove the parent skills directory or unrelated skills.

## What Gets Installed

For manual copies, directory names match the source layout below. The CLI names installed directories after each skill's frontmatter `name`, which can differ (for example, `swift-concurrency-pro` rather than `ios-concurrency-expert`). Use `npx skills add thienhm/agent-thor --list` to see selectable names.

```text
your-agent-skills-directory/          # Full collection; partial installs contain only selected skills
├── using-agent-thor/                # General Agent Thor entry point
├── ios-swiftui-pro/
├── ios-architecture/
├── ios-security-expert/
├── ios-concurrency-expert/
├── ios-testing-pro/
├── ios-performance-audit/
├── ios-core-data-expert/
├── ios-swiftdata-pro/
├── ios-api-design/
├── ios-accessibility-pro/
├── figma-to-swiftui/
├── ios-writing-for-interfaces/
├── ios-app-store-changelog/
├── ios-simulator/
└── ios-senior-mentor/
```
