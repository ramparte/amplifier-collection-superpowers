---
profile:
  name: superpowers-dev
  version: 1.0.0
  description: Complete superpowers workflow with TDD discipline and full agent suite

session:
  orchestrator:
    module: loop-streaming
    source: git+https://github.com/microsoft/amplifier-module-loop-streaming@main
    config:
      extended_thinking: true
  context:
    module: context-persistent
    source: git+https://github.com/microsoft/amplifier-module-context-persistent@main
    config:
      max_tokens: 200000
      compact_threshold: 0.9
      auto_compact: true

providers:
  - module: provider-anthropic
    source: git+https://github.com/microsoft/amplifier-module-provider-anthropic@main
    config:
      default_model: claude-sonnet-4-5

tools:
  - module: tool-filesystem
  - module: tool-bash
  - module: tool-grep
  - module: tool-task

hooks:
  - module: hooks-logging

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

### Core Workflow Agents

1. **design-refiner**: Refine requirements and designs using superpowers brainstorming methodology
2. **plan-writer**: Write comprehensive implementation plans following superpowers plan-writing discipline
3. **tdd-enforcer**: Enforce test-driven development principles from superpowers methodology

### Orchestration Agents

4. **subagent-orchestrator**: Dispatch and coordinate parallel subagents using superpowers patterns
5. **plan-executor**: Execute plans step-by-step following superpowers execution methodology

### Quality Assurance Agents

6. **code-reviewer**: Review code using superpowers requesting/receiving code review methodology
7. **branch-finalizer**: Finalize development branches following superpowers completion checklist

### Support Agents

8. **debugger**: Systematic debugging using superpowers root-cause-tracing methodology
9. **worktree-manager**: Manage git worktrees using superpowers git-worktree patterns

## Superpowers Philosophy

This profile embodies the superpowers approach to software development:

- **Test-Driven Development**: Tests first, always
- **Subagent-Driven Development**: Break complex work into coordinated subagents
- **Defense-in-Depth**: Multiple layers of error handling
- **Verification Before Completion**: Always verify work meets requirements
- **Systematic Debugging**: Hypothesis-driven, methodical bug fixing
- **Plan-Execute-Review Cycle**: Plan thoroughly, execute carefully, review rigorously

## When to Use Each Agent

### design-refiner
Use when: Starting new features, refining requirements, brainstorming approaches
Delegates to: superpowers brainstorming skill

### plan-writer
Use when: After design is refined, before implementation starts
Delegates to: superpowers writing-plans skill
Output: Comprehensive plan ready for execution

### tdd-enforcer
Use when: During implementation to ensure TDD discipline
Delegates to: superpowers test-driven-development skill
Enforces: Test first, implementation second

### subagent-orchestrator
Use when: Complex tasks need parallel execution
Delegates to: superpowers dispatching-parallel-agents skill
Coordinates: Multiple subagents working in parallel

### plan-executor
Use when: Executing an existing plan
Delegates to: superpowers executing-plans skill
Follows: Step-by-step execution with verification

### code-reviewer
Use when: Code review needed before merge
Delegates to: superpowers requesting-code-review skill
Provides: Structured review against requirements

### branch-finalizer
Use when: Ready to complete development branch
Delegates to: superpowers finishing-a-development-branch skill
Ensures: All checklist items complete

### debugger
Use when: Bugs need systematic investigation
Delegates to: superpowers systematic-debugging skill
Approach: Hypothesis-driven debugging

### worktree-manager
Use when: Need parallel work streams
Delegates to: superpowers using-git-worktrees skill
Enables: Multiple branches worked simultaneously

## Integration with Superpowers Skills

All agents reference the embedded superpowers skills at `superpowers/skills/`.
The context files bridge Amplifier and superpowers philosophies.

## Recommended Workflow

1. **Design Phase**: Use design-refiner to brainstorm and refine
2. **Planning Phase**: Use plan-writer to create comprehensive plan
3. **Implementation Phase**: 
   - Use tdd-enforcer to maintain discipline
   - Use subagent-orchestrator for complex parallel work
   - Use plan-executor for step-by-step execution
4. **Review Phase**: Use code-reviewer before merge
5. **Completion Phase**: Use branch-finalizer to wrap up
6. **Debug As Needed**: Use debugger for systematic bug fixing

## Remember

- **TDD is non-negotiable**: Tests before code, always
- **Subagents are powerful**: Use them for parallelization
- **Defense-in-depth**: Multiple validation layers
- **Verify everything**: Don't assume, verify
- **Plan thoroughly**: Time spent planning saves debugging time
