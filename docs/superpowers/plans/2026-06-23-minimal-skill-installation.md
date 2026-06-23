# Minimal Agent Thor Skill Installation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace Agent Thor's clone-and-symlink installation flow with concise instructions that let the user's coding agent copy the complete skill bundle into its supported skills directory.

**Architecture:** This is a documentation-only change. `README.md` provides the short product introduction, agent-directed installation prompt, and normal `using-agent-thor` usage; `INSTALL.md` defines the complete copy, verification, update, and uninstall contract without maintaining client-specific paths.

**Tech Stack:** Markdown, Git

---

### Task 1: Replace the installation and usage documentation

**Files:**
- Modify: `README.md`
- Modify: `INSTALL.md`

- [x] **Step 1: Rewrite `README.md` around the minimal user journey**

Keep a concise description of Agent Thor, retain the compact skill-area table, and replace the current clone-first quick install with this agent-directed prompt:

```text
Install the Agent Thor skills from https://github.com/thienhm/agent-thor. Copy every directory under `skills/` into the appropriate skills directory for this agent. Use a user-level skills directory unless I ask for a project-only installation. Do not replace or symlink my `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, or other project instruction files. Verify that the `using-agent-thor` skill is discoverable when finished.
```

Add a short usage section that tells users to ask their agent to use `using-agent-thor` for general iOS or Apple-platform work. Remove the detailed orchestration sequence from the README because the meta-skill owns that behavior.

- [x] **Step 2: Rewrite `INSTALL.md` as the agent-facing copy contract**

Document these exact requirements:

1. Obtain the latest repository contents by cloning, downloading, or using an existing checkout.
2. Let the active coding agent choose its supported user-level or project-level skills directory.
3. Copy every directory under the repository's `skills/` directory into that destination, preserving each skill's directory structure and referenced files.
4. Do not replace or symlink project instruction files.
5. Verify that `using-agent-thor/SKILL.md` exists in the selected destination and that the agent can discover `using-agent-thor`.
6. Use `using-agent-thor` as the normal entry point.
7. Update by repeating the copy with the latest repository contents.
8. Uninstall by removing only the copied Agent Thor skill directories.

Include a manual fallback example using generic placeholders rather than client-specific paths:

```bash
cp -R /path/to/agent-thor/skills/. /path/to/your-agent/skills/
```

- [x] **Step 3: Verify documentation consistency**

Run:

```bash
rtk rg -n "symlink|AGENTS.md|CLAUDE.md|GEMINI.md|using-agent-thor|copy|cp -R" README.md INSTALL.md
rtk git diff --check
```

Expected: symlinks appear only in explicit warnings not to use them; both files identify `using-agent-thor` as the normal entry point; `git diff --check` produces no errors.

- [x] **Step 4: Commit the documentation update**

```bash
rtk git add README.md INSTALL.md docs/superpowers/plans/2026-06-23-minimal-skill-installation.md
rtk git commit -m "docs: simplify Agent Thor skill installation"
```
