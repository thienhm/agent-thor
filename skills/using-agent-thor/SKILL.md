---
name: using-agent-thor
description: Use when an iOS or Apple-platform feature, architectural change, review, or bug fix spans multiple specialist domains, or when the user explicitly requests Agent Thor.
---

# Using Agent Thor Skills (Meta-Skill)

Coordinate relevant Apple-platform specialists for work spanning multiple domains. For a focused task, read and follow the relevant specialist directly; for example, release notes use `app-store-changelog` without an expert panel.

## The iOS Expert Taxonomy

The `agent-thor` bundle contains 14 specialized domain experts, one cross-cutting mentor, and one orchestrator skill. When given a task, your first job is to identify which experts and cross-cutting guidance are needed.

*   **UI/UX Layer:**
    *   `figma-to-swiftui` - Converting designs, colors, fonts, and responsive layouts.
    *   `swiftui-pro` - Proper SwiftUI state management, view structures, rendering efficiency.
    *   `writing-for-interfaces` - UI copy, localization strings, button text best practices.
    *   `ios-accessibility` - VoiceOver, Dynamic Type, Contrast, and Accessibility Traits.
*   **Architecture & Data Layer:**
    *   `swift-architecture-skill` - App navigation, module structure, and logical separation (Clean, TCA, MVVM).
    *   `swift-api-design-guidelines-skill` - Structuring Swift APIs, naming conventions, module interfaces.
    *   `core-data-expert` - Core Data models, threading, migrations, context saving.
    *   `swiftdata-pro` - Modern SwiftData queries, predicates, CloudKit sync.
*   **Systems & Safety Layer:**
    *   `swift-security-expert` - Keychain, CryptoKit, secure storage, biometrics.
    *   `swift-concurrency-pro` - Actors, async/await, Sendable, avoiding retain cycles in tasks.
    *   `swiftui-performance-audit` - Diagnosing hangs, memory leaks, battery drain.
*   **DevOps & Tooling Layer:**
    *   `swift-testing-pro` - Unit tests, XCTest vs Swift Testing.
    *   `app-store-changelog` - Writing release notes.
    *   `ios-simulator-skill` - Reading the simulator state visually, capturing logs, automating interactions.
*   **Cross-Cutting Guidance:**
    *   `ios-senior-mentor` - Constructive coaching, clear technical explanations, and explicit architecture and performance trade-offs across all domains.

## Skill Names and Manual Copy Paths

The taxonomy uses the frontmatter names selected by `npx skills --skill` and exposed in skill catalogs. CLI installations use these names for installed directories. Manual copies retain the source directory names below. Match the catalog by published name first; use the source directory only as a filesystem fallback.

| Published skill name | Source directory under `skills/` |
|---|---|
| `figma-to-swiftui` | `figma-to-swiftui` |
| `ios-accessibility` | `ios-accessibility-pro` |
| `swift-api-design-guidelines-skill` | `ios-api-design` |
| `app-store-changelog` | `ios-app-store-changelog` |
| `swift-architecture-skill` | `ios-architecture` |
| `swift-concurrency-pro` | `ios-concurrency-expert` |
| `core-data-expert` | `ios-core-data-expert` |
| `swiftui-performance-audit` | `ios-performance-audit` |
| `swift-security-expert` | `ios-security-expert` |
| `ios-senior-mentor` | `ios-senior-mentor` |
| `ios-simulator-skill` | `ios-simulator` |
| `swiftdata-pro` | `ios-swiftdata-pro` |
| `swiftui-pro` | `ios-swiftui-pro` |
| `swift-testing-pro` | `ios-testing-pro` |
| `writing-for-interfaces` | `ios-writing-for-interfaces` |

## Resolve the Required Experts

1. Select only the experts needed for the task using the taxonomy above.
2. Resolve each selected skill by name from the agent's available-skills catalog or skill discovery tool. Read its `SKILL.md` at the location supplied by that catalog. Use the provider's reader for non-filesystem skills.
3. For a filesystem installation without a catalog entry, inspect sibling `<published-name>/SKILL.md` and then `<source-directory>/SKILL.md` from the table above beside this skill's installed directory. Read the frontmatter to confirm the skill identity. Resolve the actual directory first if this skill is a symlink. The source checkout's `skills/` layout is not a path relative to the user's project. Never assume a fixed home directory or agent-specific installation directory.
4. Resolve each expert's references and scripts relative to that expert's own directory, preserving any access method supplied by its provider.

If a required expert cannot be found, report its name and offer a targeted installation command, for example:

```bash
npx skills add thienhm/agent-thor --skill swift-architecture-skill ios-accessibility
```

Use the actual missing names; add `-g` if the user wants a global installation or `-a <agent>` to target a particular agent. Selecting `using-agent-thor` alone does not install the specialists. Follow the session's existing authorization for installations; otherwise offer the command without running it. Continue independent work with available experts. If the missing guidance is needed to make a decision, ask whether to install it or proceed with the available guidance. State any resulting coverage gaps; never claim an absent expert was consulted.

## Choose the Workflow

### Focused work

Read the selected specialist and follow its instructions directly. Complete the requested explanation, review, artifact, or authorized change. An expert panel and unified implementation plan are unnecessary for a single-domain task.

### Work spanning multiple domains

Read the selected expert instructions and gather the constraints relevant to the task. Delegate independent consultations in parallel when subagents are available and permitted by the session. Give each consultant the task, the resolved skill location and access method, and this assignment:

> Read the selected expert skill and relevant supporting files. Return the constraints, recommended patterns, and pitfalls that affect this task, with concrete examples where useful. Act as a consultant; do not modify files.

When delegation is unavailable or disallowed, read the selected skills yourself and synthesize their guidance. Do not dispatch an agent merely to satisfy a fixed panel size. Wait for any delegated consultations before using their findings.

Resolve conflicts between expert recommendations using the project's architecture and the user's requirements. Scale the result to the request:

- **Explanation or review:** Deliver the answer or findings directly, identifying evidence and any coverage gaps.
- **Small, authorized change:** Briefly state the approach, implement it, and verify the affected behavior.
- **Substantial implementation:** Present a unified plan covering relevant domain constraints, files to change, validation, and unresolved decisions. If the user has already approved a plan covering this work, execute it. Otherwise obtain approval before implementation.

Respect existing user authorization and project approval requirements. Do not add another approval gate for work already approved.
