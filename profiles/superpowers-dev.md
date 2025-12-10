---
profile:
  name: superpowers-dev
  version: 1.0.0
  description: Complete superpowers workflow with TDD discipline and full agent suite
  extends: developer-expertise:profiles/dev.md

session:
  context:
    module: context-persistent
    source: git+https://github.com/microsoft/amplifier-module-context-persistent@main
    config:
      max_tokens: 200000
      compact_threshold: 0.9
      auto_compact: true

agents:
  - design-refiner
  - plan-writer
  - tdd-enforcer
  - subagent-orchestrator
  - plan-executor
  - code-reviewer
  - branch-finalizer
  - debugger
  - worktree-manager

context:
  - context/adapter.md
  - context/philosophy-bridge.md
  - context/workflow-integration.md
---

# Superpowers Development Profile

You have access to the complete superpowers workflow for TDD-driven software development.

## Available Agents

1. **design-refiner**: Refine requirements and designs using superpowers brainstorming
2. **plan-writer**: Write comprehensive implementation plans
3. **tdd-enforcer**: Enforce test-driven development discipline
4. **subagent-orchestrator**: Coordinate parallel subagents
5. **plan-executor**: Execute plans step-by-step
6. **code-reviewer**: Structured code review
7. **branch-finalizer**: Finalize development branches
8. **debugger**: Systematic debugging
9. **worktree-manager**: Manage git worktrees

## Superpowers Philosophy

- **Test-Driven Development**: Tests first, always
- **Subagent-Driven Development**: Break complex work into coordinated subagents
- **Defense-in-Depth**: Multiple layers of error handling
- **Verification Before Completion**: Always verify work meets requirements
- **Systematic Debugging**: Hypothesis-driven, methodical bug fixing
- **Plan-Execute-Review Cycle**: Plan thoroughly, execute carefully, review rigorously
