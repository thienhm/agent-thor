# Installing Agent Thor

Agent Thor is installed by copying its skill directories into a skills directory supported by your coding agent. Let the agent choose the correct destination for its own conventions.

## Prerequisites

- Git
- An AI coding agent that supports Agent Skills

## Installation

### Recommended: ask your agent

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

Confirm that the selected destination contains:

```text
using-agent-thor/SKILL.md
```

Then ask your coding agent to list or use the `using-agent-thor` skill. If the skill is not discoverable, restart the agent and confirm that the chosen destination is one of its supported skills directories.

## Use

Use `using-agent-thor` as the normal entry point for general iOS and Apple-platform work:

> Use `using-agent-thor` to help me implement this feature.

The meta-skill selects the specialist Agent Thor skills relevant to the task. Individual specialist skills can still be invoked directly.

## Updating

Obtain the latest Agent Thor repository contents and repeat the copy operation. Allow overwriting the previously copied Agent Thor skill directories while leaving unrelated skills untouched.

## Uninstalling

Remove only the Agent Thor skill directories that were copied into the selected skills destination. Do not remove the parent skills directory or unrelated skills.

## What Gets Installed

```text
your-agent-skills-directory/
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
