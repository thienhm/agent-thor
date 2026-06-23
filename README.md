# Agent Thor

Agent Thor is a collection of 16 skills that gives AI coding agents focused guidance for iOS and Apple-platform development. It covers SwiftUI, architecture, data, security, concurrency, testing, performance, accessibility, and developer tooling.

## What It Does

The `using-agent-thor` skill is the general entry point. It identifies the specialist skills relevant to a task and coordinates their guidance.

## Install

Give this prompt to your coding agent:

> Install the Agent Thor skills from https://github.com/thienhm/agent-thor. Copy every directory under `skills/` into the appropriate skills directory for this agent. Use a user-level skills directory unless I ask for a project-only installation. Do not replace or symlink my `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, or other project instruction files. Verify that the `using-agent-thor` skill is discoverable when finished.

See [INSTALL.md](INSTALL.md) for the complete copy and verification instructions.

## Use

For general iOS or Apple-platform work, ask your coding agent to use `using-agent-thor`:

> Use `using-agent-thor` to help me implement this feature.

You can also invoke an individual specialist skill directly when you already know which domain you need.

## Skills Included

| Layer | Skills |
|-------|--------|
| **UI/UX** | `ios-swiftui-pro`, `figma-to-swiftui`, `ios-accessibility-pro`, `ios-writing-for-interfaces` |
| **Architecture & Data** | `ios-architecture`, `ios-api-design`, `ios-core-data-expert`, `ios-swiftdata-pro` |
| **Systems & Safety** | `ios-security-expert`, `ios-concurrency-expert`, `ios-performance-audit` |
| **DevOps & Tooling** | `ios-testing-pro`, `ios-app-store-changelog`, `ios-simulator`, `ios-senior-mentor` |
| **Orchestration** | `using-agent-thor` (meta-skill that coordinates all others) |

## License

MIT
