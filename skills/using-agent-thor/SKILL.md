---
name: using-agent-thor
description: The entrypoint and orchestrator meta-skill for the Agent Thor framework. Must be invoked at the start of any new feature implementation, architectural change, or cross-domain bug fix.
---

# Using Agent Thor Skills (Meta-Skill)

> **Philosophy:** Deep expertise lies in knowing *who* to ask, not in knowing everything yourself. This skill transforms the primary agent into a Lead Architect that orchestrates a "Panel of Experts" sub-agent workflow. Rather than guessing at accessibility rules or security constraints, the primary agent dispatches specialized sub-agents to read the domain-specific `SKILL.md` files, report back constraints, and then synthesizes a unified implementation plan.

Use this skill whenever a user requests a new feature, a complex bug fix, or an architectural refactor that touches multiple domains within iOS development.

## The iOS Expert Taxonomy

The `agent-thor` bundle contains 14 specialized domain experts. When given a task, your first job is to identify which experts are needed.

*   **UI/UX Layer:**
    *   `figma-to-swiftui` - Converting designs, colors, fonts, and responsive layouts.
    *   `ios-swiftui-pro` - Proper SwiftUI state management, view structures, rendering efficiency.
    *   `ios-writing-for-interfaces` - UI copy, localization strings, button text best practices.
    *   `ios-accessibility-pro` - VoiceOver, Dynamic Type, Contrast, and Accessibility Traits.
*   **Architecture & Data Layer:**
    *   `ios-architecture` - App navigation, module structure, and logical separation (Clean, TCA, MVVM).
    *   `ios-api-design` - Structuring Swift APIs, naming conventions, module interfaces.
    *   `ios-core-data-expert` - Core Data models, threading, migrations, context saving.
    *   `ios-swiftdata-pro` - Modern SwiftData queries, predicates, CloudKit sync.
*   **Systems & Safety Layer:**
    *   `ios-security-expert` - Keychain, CryptoKit, secure storage, biometrics.
    *   `ios-concurrency-expert` - Actors, async/await, Sendable, avoiding retain cycles in tasks.
    *   `ios-performance-audit` - Diagnosing hangs, memory leaks, battery drain.
*   **DevOps & Tooling Layer:**
    *   `ios-testing-pro` - Unit tests, XCTest vs Swift Testing.
    *   `ios-app-store-changelog` - Writing release notes.
    *   `ios-simulator` - Reading the simulator state visually, capturing logs, automating interactions.

## The "Panel of Experts" Workflow

Do **not** try to remember the rules of the domains above from your baseline training data. You must follow this strict 3-step delegation protocol:

### Step 1: Identify
Analyze the user's request. Select exactly which domains apply. For example, a request to "Build a secure offline login screen" requires `ios-swiftui-pro`, `ios-security-expert`, `ios-architecture`, and `ios-accessibility-pro`.

### Step 2: Dispatch Sub-Agents
For **each** identified domain, spawn a parallel sub-agent. You must provide each sub-agent with the original task description and the following strict prompt:

> **Sub-Agent Prompt Template:**
> "You are the Lead Expert in `[Domain Name]`. Your strict job is to act as a consultant for a new feature. 
> 1. Read the `skills/[domain]/SKILL.md` file and any referenced documentation.
> 2. Analyze the following task: `[Insert User Task]`.
> 3. Return a concise markdown report detailing exactly which constraints, code patterns, and anti-patterns must be followed for this task according to your domain's documentation. Do not write the final code, only provide the architectural constraints and examples."

*(Wait for all dispatched sub-agents to return their reports before proceeding).*

### Step 3: Unify and Plan
Once all experts have reported back, you (the Lead Architect) must synthesize their findings. Look for conflicting constraints (e.g., Performance vs Accessibility) and resolve them logically.

## Output Format: The Unified Execution Plan

You must now present the comprehensive plan to the user for approval. Do not write the source code yet. Output a highly structured markdown plan exactly matching this format:

```markdown
# Implementation Plan: [Task Name]

## 1. Domain Constraints Synthesized
*Summarize the specific rules returned by your sub-agents.*
*   **Security:** (e.g., Must use Keychain with `AfterFirstUnlock`, no `@AppStorage` for tokens).
*   **SwiftUI:** (e.g., Must use isolated `@Observable` stores, no `@State` for network logic).
*   **Accessibility:** (e.g., Must define explicit `accessibilityLabel` for the custom toggle).

## 2. File Modification Strategy
*List every file that needs to be created or modified, grouped by component.*

### `[Component/Layer Name]`
#### `[NEW]` `path/to/new/File.swift`
- Describe what this file does.
- Describe which domain constraints apply here (e.g., "Applies the Security rules for keychain").

#### `[MODIFY]` `path/to/existing/File.swift`
- Describe the exact modifications.

## 3. Open Questions (If Any)
*List any design ambiguities or conflicts you could not resolve that require the user's input.*
```

**CRITICAL RULE:** Once you present this plan to the user, you must **STOP** and wait for their explicit approval. Once approved, use the normal coding tools to execute the plan strictly following the synthesized constraints.
