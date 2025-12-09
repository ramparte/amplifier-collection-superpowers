# Amplifier Collection: Superpowers

**Import-based integration of [obra/superpowers](https://github.com/obra/superpowers) for Amplifier**

This collection provides a complete software development workflow with TDD discipline by importing superpowers as a git submodule and wrapping its skills as Amplifier agents.

## What is This?

**obra/superpowers** is a complete software development workflow built on composable "skills" (markdown-based process documentation) that enforce best practices like TDD, design-first thinking, and subagent-driven development.

**This collection** creates thin wrapper agents (~30 lines each) that:
- Reference superpowers skills via Amplifier's @mention system
- Adapt superpowers for Amplifier's tools (read_file, write_file, bash, task)
- Enable you to stay synchronized with superpowers updates automatically

**Key principle:** We import and adapt, we don't duplicate. Total wrapper code: ~500 lines vs 20,000+ if we duplicated everything.

---

## Installation

### Prerequisites
- Amplifier installed
- Git with submodule support

### Install Collection

```bash
amplifier collection add git+https://github.com/ramparte/amplifier-collection-superpowers
```

Or clone and use locally:

```bash
git clone --recursive https://github.com/ramparte/amplifier-collection-superpowers
amplifier collection add /path/to/amplifier-collection-superpowers
```

---

## Quick Start

### Load a Profile

**Full workflow:**
```bash
amplifier --profile superpowers:superpowers-dev
```

**Minimal (design + planning + TDD):**
```bash
amplifier --profile superpowers:superpowers-minimal
```

**TDD only:**
```bash
amplifier --profile superpowers:superpowers-tdd-only
```

### Use the Workflow

1. **Design refinement:** Invoke `superpowers:design-refiner` or ask Amplifier to help design a feature
2. **Plan creation:** The design-refiner will delegate to `superpowers:plan-writer` after approval
3. **TDD execution:** Plans enforce TDD via `superpowers:tdd-enforcer`
4. **Implementation:** Use `superpowers:plan-executor` or `superpowers:subagent-orchestrator`
5. **Code review:** `superpowers:code-reviewer` reviews work between tasks
6. **Finalization:** `superpowers:branch-finalizer` completes the work

---

## Agent Mapping

| Superpowers Skill | Amplifier Agent | Purpose |
|-------------------|-----------------|---------|
| brainstorming | `superpowers:design-refiner` | Interactive design refinement using Socratic method |
| writing-plans | `superpowers:plan-writer` | Create detailed implementation plans with bite-sized tasks |
| test-driven-development | `superpowers:tdd-enforcer` | Enforce RED-GREEN-REFACTOR cycle, no code without failing test |
| subagent-driven-development | `superpowers:subagent-orchestrator` | Execute plans with fresh subagent per task |
| executing-plans | `superpowers:plan-executor` | Execute plans in batches with review checkpoints |
| requesting-code-review | `superpowers:code-reviewer` | Systematic code review focusing on correctness & philosophy |
| finishing-a-development-branch | `superpowers:branch-finalizer` | Verify tests, present merge/PR options, execute choice |
| systematic-debugging | `superpowers:debugger` | Hypothesis-driven debugging methodology |
| using-git-worktrees | `superpowers:worktree-manager` | Manage isolated git worktrees for parallel work |

---

## Architecture

### Import-Based Design

```
amplifier-collection-superpowers/
├── superpowers/              # Git submodule (obra/superpowers)
│   └── skills/               # Original superpowers skills
├── agents/                   # Thin wrappers (~30 lines each)
│   ├── design-refiner/
│   │   └── AGENT.md         # References @superpowers/skills/brainstorming/SKILL.md
│   └── ...
├── profiles/                 # Profile compositions
├── context/                  # Adaptation layer documentation
└── collection.yaml          # Collection manifest
```

### Why Import Instead of Duplicate?

1. **Single source of truth:** Superpowers content stays in obra/superpowers
2. **Zero duplication:** ~500 lines of wrapper code vs 20,000+ if duplicated
3. **Automatic updates:** `git submodule update --remote superpowers` pulls latest
4. **Minimal maintenance:** Thin wrappers rarely need changes
5. **Community benefit:** Improvements to superpowers flow through automatically

---

## Updating Superpowers

To update to the latest version of superpowers:

```bash
cd /path/to/amplifier-collection-superpowers
./scripts/sync-superpowers.sh
```

Or manually:

```bash
git submodule update --remote superpowers
cd superpowers && git describe --tags  # Check version
```

---

## Profiles

### superpowers-dev (Full Workflow)

Complete superpowers workflow with all 9 agents:
- Design refinement
- Plan creation
- TDD enforcement
- Subagent orchestration
- Plan execution
- Code review
- Branch finalization
- Debugging support
- Git worktree management

**Use when:** Building features from scratch with full workflow discipline

### superpowers-minimal (Core Only)

Minimal setup with 3 core agents:
- Design refinement
- Plan creation
- TDD enforcement

**Use when:** You want design+planning+TDD without full orchestration

### superpowers-tdd-only (TDD Enforcement)

Just TDD enforcement:
- TDD enforcer agent only

**Use when:** You want TDD discipline without other workflow elements

---

## Philosophy

Both Amplifier and superpowers share core values:

- **Simplicity:** YAGNI, KISS, ruthless simplicity
- **Modular design:** "Bricks and studs" - self-contained, composable modules
- **TDD discipline:** Write test, watch fail, write code, watch pass
- **Subagent patterns:** Fresh contexts for focused work
- **Emergence over planning:** Good architecture emerges from simple components

This philosophical alignment makes the integration natural and clean.

---

## Examples

See `examples/` directory for:
- `simple-feature-workflow.md` - Complete design → plan → implement → review → merge flow
- `tdd-enforcement.md` - How TDD enforcement works in practice
- `design-to-implementation.md` - Design refinement process

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for:
- How to contribute wrapper agents
- How to report issues
- How to test changes
- PR guidelines

---

## Upstream

**Superpowers:** https://github.com/obra/superpowers  
**Author:** Jesse Vincent ([@obra](https://github.com/obra))  
**License:** MIT

**Amplifier Integration:** https://github.com/ramparte/amplifier-collection-superpowers  
**Adapter:** Ramparte  
**License:** MIT

---

## Support

- **Collection issues:** https://github.com/ramparte/amplifier-collection-superpowers/issues
- **Superpowers issues:** https://github.com/obra/superpowers/issues
- **Amplifier issues:** https://github.com/microsoft/amplifier/issues

---

## License

MIT License - See [LICENSE](LICENSE) file

Attribution to:
- Jesse Vincent (obra) for superpowers
- Ramparte for Amplifier integration
