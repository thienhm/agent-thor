# Agent Thor (iOS Expert Framework)

A suite of 16 AI skills that transform your AI coding assistant into an elite Senior iOS Developer (Agent Thor). Works with Claude Code, Antigravity (Gemini CLI), GitHub Copilot, and Codex.

## What It Does

When installed, your AI assistant gains access to a **Panel of Experts** — 16 domain-specific iOS skills covering SwiftUI, architecture, security, concurrency, testing, performance, and more. Instead of relying on generic training data, Agent Thor reads expert-curated skill files to produce architecturally sound, production-quality iOS code.

## Quick Install

```bash
# Clone once (globally)
git clone https://github.com/thienhm/agent-thor.git ~/.agent-thor
```

Then tell your AI coding tool:

> Install Agent Thor from `~/.agent-thor`. Follow the instructions in `INSTALL.md`.

Or see [INSTALL.md](INSTALL.md) for detailed manual setup.

## Skills Included

| Layer | Skills |
|-------|--------|
| **UI/UX** | `ios-swiftui-pro`, `figma-to-swiftui`, `ios-accessibility-pro`, `ios-writing-for-interfaces` |
| **Architecture & Data** | `ios-architecture`, `ios-api-design`, `ios-core-data-expert`, `ios-swiftdata-pro` |
| **Systems & Safety** | `ios-security-expert`, `ios-concurrency-expert`, `ios-performance-audit` |
| **DevOps & Tooling** | `ios-testing-pro`, `ios-app-store-changelog`, `ios-simulator`, `ios-senior-mentor` |
| **Orchestration** | `using-agent-thor` (meta-skill that coordinates all others) |

## How It Works

1. You describe a task (e.g., "Build a secure offline login screen")
2. The agent identifies which domain experts are needed
3. It dispatches sub-agents to read each expert's skill file
4. It synthesizes their constraints into a unified implementation plan
5. You approve the plan, then the agent executes it

## License

MIT
