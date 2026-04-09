# Installing Agent Thor

Clone the framework once globally, then symlink it into any iOS project you work on. The AI tool discovers skills within your project scope via symlinks.

## Prerequisites

- Git

## Installation

### Step 1: Clone the repository (once)

```bash
git clone https://github.com/thienhm/agent-thor.git ~/.agent-thor
```

This only needs to be done once. All projects share the same global clone.

### Step 2: Activate in your project

From your iOS project root directory, symlink the `skills/` directory and the agent config into the project so the AI tool can discover them within its workspace scope.

What to symlink:
- `~/.agent-thor/skills` → into the project (so skills are discoverable)
- `~/.agent-thor/agents/agent-thor.md` → into the project's tool-specific config file

**Examples:**
```bash
# Symlink skills into project
ln -sf ~/.agent-thor/skills ./skills

# Symlink agent config (adapt the target filename to your tool's convention)
ln -sf ~/.agent-thor/agents/agent-thor.md ./CLAUDE.md       # Claude Code
ln -sf ~/.agent-thor/agents/agent-thor.md ./GEMINI.md       # Antigravity / Gemini CLI
ln -sf ~/.agent-thor/agents/agent-thor.md ./AGENTS.md       # Codex
```

### Step 3: Add symlinks to .gitignore

```bash
echo "skills" >> .gitignore
echo "CLAUDE.md" >> .gitignore    # if using Claude Code
echo "GEMINI.md" >> .gitignore    # if using Antigravity
```

### Step 4: Restart your AI tool

Quit and relaunch your AI coding tool to discover the new skills and agent.

## Verify

```bash
# Check the global clone
ls ~/.agent-thor/skills/

# Check project symlinks
ls -la ./skills
ls -la ./CLAUDE.md        # or ./GEMINI.md
```

You should see symlinks pointing back to `~/.agent-thor/`.

## Updating

```bash
cd ~/.agent-thor && git pull
```

All projects receive the update instantly through their symlinks.

## Uninstalling

1. **Remove project symlinks** (from each project):
   ```bash
   rm -f ./skills ./CLAUDE.md ./GEMINI.md ./.github/copilot-instructions.md
   ```

2. **Optionally delete the global clone:**
   ```bash
   rm -rf ~/.agent-thor
   ```

## What Gets Installed

```
~/.agent-thor/                           # Global clone (shared by all projects)
├── skills/                              # 16 domain-specific iOS skills
│   ├── using-agent-thor/                # Meta-skill: orchestrates all others
│   ├── ios-swiftui-pro/                 # SwiftUI patterns & state management
│   ├── ios-architecture/                # App architecture (TCA, MVVM, Clean)
│   ├── ios-security-expert/             # Keychain, CryptoKit, biometrics
│   ├── ios-concurrency-expert/          # async/await, Actors, Sendable
│   ├── ios-testing-pro/                 # XCTest, Swift Testing
│   ├── ios-performance-audit/           # Memory, CPU, battery profiling
│   ├── ios-core-data-expert/            # Core Data models & migrations
│   ├── ios-swiftdata-pro/               # SwiftData, predicates, CloudKit
│   ├── ios-api-design/                  # Swift API design & naming
│   ├── ios-accessibility-pro/           # VoiceOver, Dynamic Type
│   ├── figma-to-swiftui/                # Design-to-code conversion
│   ├── ios-writing-for-interfaces/      # UI copy & localization
│   ├── ios-app-store-changelog/         # Release notes
│   ├── ios-simulator/                   # Simulator automation
│   └── ios-senior-mentor/               # Mentorship & code review
├── agents/
│   └── agent-thor.md                    # Agent definition
└── README.md                            # Documentation

your-ios-project/                        # Any iOS project
├── skills → ~/.agent-thor/skills        # Symlink (gitignored)
├── CLAUDE.md → ~/.agent-thor/...        # Symlink (gitignored)
└── ...your project files
```
