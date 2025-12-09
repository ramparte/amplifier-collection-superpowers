# Superpowers → Amplifier Adapter

This document explains how superpowers skills are adapted for Amplifier.

## Core Concept: Import via @mention

This collection uses Amplifier's @mention system to reference superpowers skills directly:

```markdown
## Core Behavior
@superpowers/skills/brainstorming/SKILL.md
```

When Amplifier loads an agent, the @mention automatically loads the referenced superpowers skill content. **No duplication needed.**

---

## Skill → Agent Mapping

| Superpowers Skill | Amplifier Agent | Wrapper Size |
|-------------------|-----------------|--------------|
| brainstorming | design-refiner | ~30 lines |
| writing-plans | plan-writer | ~30 lines |
| test-driven-development | tdd-enforcer | ~40 lines |
| subagent-driven-development | subagent-orchestrator | ~50 lines |
| executing-plans | plan-executor | ~30 lines |
| requesting-code-review | code-reviewer | ~30 lines |
| finishing-a-development-branch | branch-finalizer | ~30 lines |
| systematic-debugging | debugger | ~30 lines |
| using-git-worktrees | worktree-manager | ~30 lines |

**Total:** ~300 lines of wrapper code vs ~20,000+ lines if duplicated

---

## Tool Adaptation

Superpowers skills assume certain capabilities. Here's how they map to Amplifier tools:

### File Operations

**Superpowers assumption:** Direct file access  
**Amplifier adaptation:** Use `read_file` and `write_file` tools

```yaml
# Example adaptation in agent
## Adaptation for Amplifier
- Use read_file to examine files
- Use write_file to create/update files
- Save designs to docs/plans/YYYY-MM-DD-<topic>-design.md
```

### Command Execution

**Superpowers assumption:** Shell access  
**Amplifier adaptation:** Use `bash` tool

```yaml
# Example adaptation in agent
## Adaptation for Amplifier
- Use bash tool for git operations
- Use bash tool for running tests
- Use bash tool for project-specific commands
```

### Subagent Delegation

**Superpowers assumption:** Spawn subagents with instructions  
**Amplifier adaptation:** Use `task` tool

```yaml
# Example adaptation in agent
## Adaptation for Amplifier
- Use task tool to spawn subagents
- Pass full task context and instructions
- Specify which agent to use (general-purpose or specialized)
```

### Task Tracking

**Superpowers assumption:** Manual tracking  
**Amplifier adaptation:** Use `todo` tool

```yaml
# Example adaptation in agent
## Adaptation for Amplifier
- Use todo tool to create task list from plan
- Mark tasks in_progress/completed as work progresses
- Provides visibility to user
```

---

## File Path Conventions

Superpowers uses specific file paths. Here's how they're adapted for Amplifier:

### Design Documents

**Superpowers:** `docs/plans/YYYY-MM-DD-<topic>-design.md`  
**Amplifier:** Same - no change needed

### Implementation Plans

**Superpowers:** `docs/plans/YYYY-MM-DD-<feature>.md`  
**Amplifier:** Same - no change needed

### Worktrees

**Superpowers:** Dedicated worktree per feature  
**Amplifier:** Same - use bash tool for git worktree commands

---

## Delegation Patterns

### Design → Plan → Implement

```
User request
  ↓
design-refiner (brainstorming)
  ↓ (after approval)
plan-writer (writing-plans)
  ↓ (after plan created)
plan-executor OR subagent-orchestrator
  ↓ (during implementation)
tdd-enforcer (test-driven-development)
  ↓ (between tasks)
code-reviewer (requesting-code-review)
  ↓ (after completion)
branch-finalizer (finishing-a-development-branch)
```

### Subagent Spawning

When an agent needs to spawn a subagent:

```yaml
Use task tool:
  agent: "general-purpose" or specific agent
  instruction: |
    Complete and detailed instructions
    Including all context needed
    With verification steps
```

Example from plan-executor:
```yaml
For each task in plan:
  1. Mark task as in_progress (todo tool)
  2. Execute task steps
  3. Run verification
  4. Mark task as completed (todo tool)
```

Example from subagent-orchestrator:
```yaml
For each task in plan:
  1. Spawn fresh subagent (task tool)
  2. Wait for subagent completion
  3. Review subagent's work
  4. Continue to next task
```

---

## @mention Reference Patterns

### Basic Reference

```markdown
## Core Behavior
@superpowers/skills/skill-name/SKILL.md
```

This loads the superpowers skill directly into the agent's context.

### Multiple References

```markdown
## Core Behavior
@superpowers/skills/primary-skill/SKILL.md

## Related Guidance
@superpowers/skills/related-skill/SKILL.md

## Context
@superpowers/context/adapter.md
```

### Conditional References

Sometimes skills reference other skills. The @mention system resolves these automatically:

```markdown
# In superpowers skill
> **REQUIRED SUB-SKILL:** Use superpowers:executing-plans
```

The agent knows to delegate to that agent when needed.

---

## Integration with Amplifier Agents

Superpowers agents can coordinate with Amplifier's foundation agents:

### With zen-architect

```yaml
# After design-refiner creates design
design-refiner can delegate to:
  - superpowers:plan-writer (detailed implementation plan)
  - foundation:zen-architect (architectural review)
```

### With bug-hunter

```yaml
# When issues arise during implementation
Any agent can delegate to:
  - foundation:bug-hunter (systematic debugging)
  - superpowers:debugger (superpowers debugging methodology)
```

### With modular-builder

```yaml
# For module implementation
plan-executor can delegate to:
  - foundation:modular-builder (module implementation)
  - superpowers:tdd-enforcer (TDD enforcement)
```

---

## Verification Patterns

Superpowers emphasizes verification at each step. In Amplifier:

### Test Verification

```bash
# Use bash tool
bash: "pytest tests/ -v"
bash: "npm test"
bash: "cargo test"
```

### Git Status Verification

```bash
# Use bash tool
bash: "git status"
bash: "git diff"
bash: "git log -1"
```

### Structure Verification

```bash
# Use read_file tool
read_file: "path/to/file"  # Verify file exists and has expected content
```

---

## Error Handling

When superpowers skills encounter errors:

**Superpowers approach:** Stop and report  
**Amplifier adaptation:** Same - report to user, don't continue

```yaml
# Example in agent
If test fails:
  - Report failure clearly
  - Show test output
  - Wait for user guidance
  - DO NOT continue to next task
```

---

## Example: Complete Agent Wrapper

Here's a complete example of how an agent wraps a superpowers skill:

```yaml
---
name: design-refiner
description: Interactive design refinement using Socratic method before writing code
---

# Design Refiner Agent

## Role
Transform rough ideas into validated designs through Socratic questioning.

## Core Behavior
@superpowers/skills/brainstorming/SKILL.md

## Adaptation for Amplifier

When using this skill in Amplifier:

1. **File Operations**: Use read_file/write_file tools instead of assuming file access
2. **Design Storage**: Save validated designs to `docs/plans/YYYY-MM-DD-<topic>-design.md`
3. **Git Operations**: Use bash tool for any git commands
4. **Next Steps**: After design approval, delegate to:
   - superpowers:plan-writer for implementation plan
   - foundation:zen-architect for additional architectural review

## Integration Points

**Coordinates with:**
- superpowers:plan-writer (takes design, creates plan)
- foundation:zen-architect (optional architectural review)

**Uses tools:**
- read_file (examine current project state)
- write_file (save design documents)
- bash (check git status, commits)

## Context
@superpowers/context/adapter.md
```

This wrapper is ~30 lines but provides full integration with superpowers' brainstorming skill.

---

## Summary

**Key principles:**
1. Import via @mention, don't duplicate
2. Adapt file operations to Amplifier tools
3. Use task tool for subagent delegation
4. Use todo tool for task tracking
5. Keep wrappers thin (~30 lines)
6. Trust @mention system to load superpowers content
7. Coordinate with Amplifier foundation agents when appropriate

This approach provides complete superpowers functionality with minimal maintenance overhead.
