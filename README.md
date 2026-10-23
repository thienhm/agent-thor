# Agent Thor

Agent Thor is a collection of 16 skills that gives AI coding agents focused guidance for iOS and Apple-platform development. It covers SwiftUI, architecture, data, security, concurrency, testing, performance, accessibility, and developer tooling.

## What It Does

Use `using-agent-thor` for features and reviews that span multiple domains. Invoke an individual specialist directly for focused tasks such as release notes or a concurrency review. All 16 skills are independently selectable.

## Install

Install with [Vercel's skills CLI](https://github.com/vercel-labs/skills) (Node.js 22.20 or later):

```bash
# Choose skills and agents interactively (project installation)
npx skills add thienhm/agent-thor

# Install one specialist
npx skills add thienhm/agent-thor --skill swift-concurrency-pro

# Install the full collection for Codex
npx skills add thienhm/agent-thor --skill '*' -a codex
```

Add `-g` for a user-level installation. Installing only `using-agent-thor` does not install its specialists; install the full collection for the complete orchestration workflow.

See [INSTALL.md](INSTALL.md) for verification, updates, and manual installation.

## Use

For general iOS or Apple-platform work, ask your coding agent to use `using-agent-thor`:

> Use `using-agent-thor` to help me implement this feature.

You can also invoke an individual specialist skill directly when you already know which domain you need.

## Skills Included

| Layer | Skills |
|-------|--------|
| **UI/UX** | `swiftui-pro`, `figma-to-swiftui`, `ios-accessibility`, `writing-for-interfaces` |
| **Architecture & Data** | `swift-architecture-skill`, `swift-api-design-guidelines-skill`, `core-data-expert`, `swiftdata-pro` |
| **Systems & Safety** | `swift-security-expert`, `swift-concurrency-pro`, `swiftui-performance-audit` |
| **DevOps & Tooling** | `swift-testing-pro`, `app-store-changelog`, `ios-simulator-skill` |
| **Cross-Cutting Guidance** | `ios-senior-mentor` |
| **Orchestration** | `using-agent-thor` (meta-skill that coordinates all others) |

## License

MIT
