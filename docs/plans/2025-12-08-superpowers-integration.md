# Superpowers → Amplifier Integration Implementation Plan

**Date:** 2025-12-08  
**Goal:** Create amplifier-collection-superpowers that imports obra/superpowers and adapts it for Amplifier  
**Architecture:** Thin adapter layer using git submodule - wrapper agents reference superpowers skills via @mention system  
**Repository:** ramparte/amplifier-collection-superpowers

---

## Overview

This plan implements an **import-based integration** where we:
1. Import superpowers via git submodule (not duplicate)
2. Create thin wrapper agents (~30 lines each) that reference superpowers skills
3. Provide Amplifier-specific adaptation layer
4. Enable users to stay synchronized with superpowers updates

**Total implementation:** ~500 lines of wrapper code vs 20,000+ if duplicated

---

## Git Infrastructure ✓ COMPLETE

The following has been completed:
- ✓ Created amplifier-collection-superpowers repository
- ✓ Added obra/superpowers as git submodule (v3.6.2)
- ✓ Created directory structure (agents/, profiles/, context/, scripts/, docs/plans/)
- ✓ Submodule initialized and working

---

## Phase 1: Core Infrastructure

### Task 1.1: Create collection.yaml manifest
**Status:** TODO  
**File:** `collection.yaml`

Create the collection manifest with:
- Collection metadata (name, version, description, author, license)
- Upstream dependency info (superpowers git submodule)
- Agent list (9 agents)
- Profile list (3 profiles)
- Context files (3 files)
- Dependencies (amplifier >=0.1.0)

**Verification:**
- File exists and is valid YAML
- All referenced agents, profiles, context listed

---

### Task 1.2: Create README.md
**Status:** TODO  
**File:** `README.md`

Create comprehensive README with:
- What this collection does (import-based adapter)
- Installation: `amplifier collection add git+https://github.com/ramparte/amplifier-collection-superpowers`
- Quick start guide
- Agent mapping table (superpowers skill → amplifier agent)
- How to update superpowers: `git submodule update --remote superpowers`
- Architecture diagram

**Verification:**
- README clear and complete
- Installation tested
- All agents documented

---

### Task 1.3: Create .gitignore
**Status:** TODO  
**File:** `.gitignore`

Create .gitignore for:
- Python (__pycache__, *.pyc)
- Virtual environments (venv/, env/)
- IDEs (.vscode/, .idea/, *.swp)
- OS (.DS_Store, Thumbs.db)
- Logs (*.log)

**Verification:**
- File exists

---

### Task 1.4: Create LICENSE
**Status:** TODO  
**File:** `LICENSE`

MIT license with attribution to:
- Jesse Vincent (obra) for superpowers
- Ramparte for Amplifier integration

**Verification:**
- License exists
- Attribution correct

---

## Phase 2: Context Files

### Task 2.1: Create context/adapter.md
**Status:** TODO  
**File:** `context/adapter.md`

Document:
- How @mention system works (@superpowers/skills/skill-name/SKILL.md)
- Skill → Agent mapping table
- Tool usage: read_file, write_file, bash, task
- Subagent delegation via task tool
- File path conventions

**Verification:**
- All mappings documented
- Examples clear

---

### Task 2.2: Create context/philosophy-bridge.md
**Status:** TODO  
**File:** `context/philosophy-bridge.md`

Document philosophical alignment:
- Both value simplicity (YAGNI, KISS)
- Both use modular design ("bricks and studs")
- Both emphasize TDD (write test, watch fail, implement, watch pass)
- Both use subagent patterns
- How concepts map

**Verification:**
- Philosophy clear
- No contradictions

---

### Task 2.3: Create context/workflow-integration.md
**Status:** TODO  
**File:** `context/workflow-integration.md`

Document complete workflow:
1. Design refinement (brainstorming → design-refiner)
2. Plan creation (writing-plans → plan-writer)
3. TDD execution (test-driven-development → tdd-enforcer)
4. Implementation (subagent-driven-development or executing-plans)
5. Code review (requesting-code-review → code-reviewer)
6. Branch finalization (finishing-a-development-branch → branch-finalizer)

**Verification:**
- All steps documented
- Examples provided

---

## Phase 3: Core Workflow Agents (Priority 1)

### Task 3.1: Create design-refiner agent
**Status:** TODO  
**File:** `agents/design-refiner/AGENT.md`

Thin wrapper that:
- References @superpowers/skills/brainstorming/SKILL.md for core behavior
- Adapts for Amplifier: use read_file/write_file, save to docs/plans/
- Delegates to superpowers:plan-writer after approval

**Verification:**
- Agent file exists (~30 lines)
- @mention reference works

---

### Task 3.2: Create plan-writer agent
**Status:** TODO  
**File:** `agents/plan-writer/AGENT.md`

Thin wrapper that:
- References @superpowers/skills/writing-plans/SKILL.md
- Adapts: save to docs/plans/, use task tool for subagents
- Includes plan header format

**Verification:**
- Agent file exists (~30 lines)
- @mention reference works

---

### Task 3.3: Create tdd-enforcer agent
**Status:** TODO  
**File:** `agents/tdd-enforcer/AGENT.md`

Thin wrapper that:
- References @superpowers/skills/test-driven-development/SKILL.md
- Adapts: use bash for tests, enforce RED-GREEN-REFACTOR
- Implements Iron Law: NO CODE WITHOUT FAILING TEST FIRST

**Verification:**
- Agent file exists (~40 lines)
- @mention reference works

---

## Phase 4: Orchestration Agents (Priority 2)

### Task 4.1: Create subagent-orchestrator agent
**Status:** TODO  
**File:** `agents/subagent-orchestrator/AGENT.md`

Thin wrapper that:
- References @superpowers/skills/subagent-driven-development/SKILL.md
- Adapts: use task tool to spawn subagents, todo tool for tracking
- Reviews work between tasks

**Verification:**
- Agent file exists (~50 lines)
- @mention reference works

---

### Task 4.2: Create plan-executor agent
**Status:** TODO  
**File:** `agents/plan-executor/AGENT.md`

Thin wrapper that:
- References @superpowers/skills/executing-plans/SKILL.md
- Adapts: use todo tool, execute in batches (default 3)
- Report after each batch

**Verification:**
- Agent file exists (~30 lines)
- @mention reference works

---

## Phase 5: Review & Finalization Agents (Priority 3)

### Task 5.1: Create code-reviewer agent
**Status:** TODO  
**File:** `agents/code-reviewer/AGENT.md`

Thin wrapper that:
- References @superpowers/skills/requesting-code-review/SKILL.md
- Adapts: use read_file for changed files, bash for git diff

**Verification:**
- Agent file exists (~30 lines)
- @mention reference works

---

### Task 5.2: Create branch-finalizer agent
**Status:** TODO  
**File:** `agents/branch-finalizer/AGENT.md`

Thin wrapper that:
- References @superpowers/skills/finishing-a-development-branch/SKILL.md
- Adapts: use bash for git, run tests, present options

**Verification:**
- Agent file exists (~30 lines)
- @mention reference works

---

## Phase 6: Supporting Agents (Priority 4)

### Task 6.1: Create debugger agent
**Status:** TODO  
**File:** `agents/debugger/AGENT.md`

Thin wrapper that:
- References @superpowers/skills/systematic-debugging/SKILL.md
- Adapts for Amplifier tools

**Verification:**
- Agent file exists (~30 lines)
- @mention reference works

---

### Task 6.2: Create worktree-manager agent
**Status:** TODO  
**File:** `agents/worktree-manager/AGENT.md`

Thin wrapper that:
- References @superpowers/skills/using-git-worktrees/SKILL.md
- Adapts: use bash for git worktree commands

**Verification:**
- Agent file exists (~30 lines)
- @mention reference works

---

## Phase 7: Profiles

### Task 7.1: Create superpowers-dev profile
**Status:** TODO  
**File:** `profiles/superpowers-dev.yaml`

Full workflow profile:
- Extends foundation:dev
- All 9 agents
- All 3 context files

**Verification:**
- Profile file exists (~20 lines)
- Valid YAML

---

### Task 7.2: Create superpowers-minimal profile
**Status:** TODO  
**File:** `profiles/superpowers-minimal.yaml`

Minimal profile:
- Extends foundation:base
- 3 agents: design-refiner, plan-writer, tdd-enforcer
- 1 context: adapter.md

**Verification:**
- Profile file exists (~15 lines)
- Valid YAML

---

### Task 7.3: Create superpowers-tdd-only profile
**Status:** TODO  
**File:** `profiles/superpowers-tdd-only.yaml`

TDD-only profile:
- Extends foundation:base
- 1 agent: tdd-enforcer
- 1 context: adapter.md

**Verification:**
- Profile file exists (~10 lines)
- Valid YAML

---

## Phase 8: Scripts & Automation

### Task 8.1: Create sync-superpowers.sh
**Status:** TODO  
**File:** `scripts/sync-superpowers.sh`

Script to update submodule:
```bash
#!/bin/bash
git submodule update --remote superpowers
cd superpowers && git describe --tags
```

**Verification:**
- Script exists
- Executable (chmod +x)

---

### Task 8.2: Create verify-structure.sh
**Status:** TODO  
**File:** `scripts/verify-structure.sh`

Script to verify collection structure:
- Check all required files exist
- Check submodule initialized
- Check all agents exist
- Check all profiles exist

**Verification:**
- Script exists
- Executable (chmod +x)
- All checks work

---

## Phase 9: Documentation & Examples

### Task 9.1: Create CONTRIBUTING.md
**Status:** TODO  
**File:** `CONTRIBUTING.md`

Guide for contributors:
- How to contribute wrapper agents
- How to report issues
- How to update submodule
- How to test changes
- PR guidelines

**Verification:**
- File exists
- Clear instructions

---

### Task 9.2: Create examples/
**Status:** TODO  
**Files:** 
- `examples/simple-feature-workflow.md`
- `examples/tdd-enforcement.md`
- `examples/design-to-implementation.md`

Show complete workflows with examples

**Verification:**
- All examples exist
- Clear and runnable

---

## Phase 10: Repository Finalization

### Task 10.1: Initial commit
**Status:** TODO  
**Command:** `git add . && git commit -m "Initial import-based superpowers integration"`

Commit everything:
- All files
- Submodule reference
- Directory structure

**Verification:**
- Clean working tree
- Submodule committed

---

### Task 10.2: Create GitHub repository
**Status:** TODO  
**Action:** Create ramparte/amplifier-collection-superpowers

**Verification:**
- Repository created
- Public

---

### Task 10.3: Push to GitHub
**Status:** TODO  
**Commands:**
```bash
git remote add origin https://github.com/ramparte/amplifier-collection-superpowers.git
git branch -M main
git push -u origin main
git push --recurse-submodules=on-demand
```

**Verification:**
- Repository pushed
- Submodule visible

---

### Task 10.4: Configure repository
**Status:** TODO  
**Actions:**
- Enable issues
- Add topics: amplifier, superpowers, ai-development, tdd
- Set description
- Add homepage URL

**Verification:**
- Settings configured

---

## Success Criteria

✓ Git infrastructure complete
☐ All 9 agents created
☐ All 3 profiles created
☐ All 3 context files created
☐ Documentation complete
☐ Scripts functional
☐ Repository pushed

---

## Estimated Effort

- **Already complete:** Git infrastructure (Phase 0)
- **Remaining:** ~8-10 hours
- **Total code:** ~500 lines (thin wrappers)
- **Maintenance:** ~30 min per superpowers update

---

## Next Steps

1. Start with Phase 1 (Infrastructure files)
2. Then Phase 2 (Context files)
3. Then Phase 3 (Core agents)
4. Continue through phases sequentially
5. Test at each phase
6. Finalize and push to GitHub
