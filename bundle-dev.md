---
bundle:
  name: superpowers-dev
  version: 1.0.0
  description: "Complete superpowers workflow with TDD discipline and full agent suite"
  author: "Jesse Vincent (obra) - Adapted by ramparte"
  license: MIT
  repository: https://github.com/ramparte/amplifier-bundle-superpowers

includes:
  - foundation:dev

session:
  context:
    module: context-persistent
    source: git+https://github.com/microsoft/amplifier-module-context-persistent@main
    config:
      max_tokens: 200000
      compact_threshold: 0.9
      auto_compact: true

agents:
  include:
    - superpowers:design-refiner
    - superpowers:plan-writer
    - superpowers:tdd-enforcer
    - superpowers:subagent-orchestrator
    - superpowers:plan-executor
    - superpowers:code-reviewer
    - superpowers:branch-finalizer
    - superpowers:debugger
    - superpowers:worktree-manager
---

# Superpowers Development Bundle

You have access to the complete superpowers workflow for TDD-driven software development.

## Available Agents

1. **design-refiner**: Refine requirements and designs using Socratic method before writing code
2. **plan-writer**: Write comprehensive implementation plans following superpowers methodology
3. **tdd-enforcer**: Enforce test-driven development discipline
4. **subagent-orchestrator**: Dispatch and coordinate parallel subagents using superpowers patterns
5. **plan-executor**: Execute plans step-by-step following superpowers execution methodology
6. **code-reviewer**: Review code using superpowers requesting/receiving code review methodology
7. **branch-finalizer**: Finalize development branches following superpowers completion checklist
8. **debugger**: Systematic debugging using superpowers root-cause-tracing methodology
9. **worktree-manager**: Manage git worktrees using superpowers git-worktree patterns

## Superpowers Philosophy

- **Test-Driven Development**: Tests first, always
- **Subagent-Driven Development**: Break complex work into coordinated subagents
- **Defense-in-Depth**: Multiple layers of error handling
- **Verification Before Completion**: Always verify work meets requirements
- **Systematic Debugging**: Hypothesis-driven, methodical bug fixing
- **Plan-Execute-Review Cycle**: Plan thoroughly, execute carefully, review rigorously

## Upstream Source

This bundle adapts patterns from [obra/superpowers](https://github.com/obra/superpowers) for the Amplifier ecosystem.
