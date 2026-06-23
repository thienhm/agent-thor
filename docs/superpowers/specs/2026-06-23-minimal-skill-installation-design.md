# Minimal Agent Thor Skill Installation

## Goal

Make Agent Thor installation easy to understand without adding an installer, maintaining client-specific commands, or modifying a user's project instruction files.

## User Experience

The README gives users a short explanation of Agent Thor followed by one prompt they can give their coding agent. That prompt asks the agent to copy every skill directory from Agent Thor's `skills/` directory into the appropriate skills directory supported by the current agent.

After installation, users invoke `using-agent-thor` as the general entry point for iOS and Apple-platform work. The meta-skill remains responsible for selecting the relevant specialist skills.

## Documentation Changes

### `README.md`

- Keep the product description concise.
- Replace the global clone and symlink flow with an agent-directed copy prompt.
- Explain that `using-agent-thor` is the normal entry point.
- Retain a compact summary of the included skill areas.

### `INSTALL.md`

- Instruct the user's agent to select an appropriate user-level or project-level skills directory using that agent's supported conventions.
- Copy all directories under Agent Thor's `skills/` directory into the selected destination.
- Do not symlink or replace `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, or equivalent project instruction files.
- Verify that `using-agent-thor/SKILL.md` is present and discoverable.
- Explain that updates are performed by repeating the copy operation with the latest Agent Thor source.
- Explain that uninstalling consists of removing only the copied Agent Thor skill directories.

## Scope

This change updates documentation only. It does not introduce a CLI, package-manager integration, installation script, runtime configuration, or client-specific path registry.

## Acceptance Criteria

- A user can understand what Agent Thor is from the opening section of the README.
- The primary installation path asks the user's agent to choose its correct skills directory and copy the complete skill bundle there.
- Neither guide tells users to replace or symlink project instruction files.
- Both installation and usage consistently identify `using-agent-thor` as the general entry point.
- The documented verification checks skill discovery rather than symlink state.
