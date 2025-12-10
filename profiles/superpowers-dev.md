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
      default_provider: provider-openai
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
      debug: true
      raw_debug: true
      priority: 100
      default_model: claude-sonnet-4-5
  - module: provider-openai
    source: git+https://github.com/microsoft/amplifier-module-provider-openai@main
    config:
      debug: true
      raw_debug: true
      priority: 200

ui:
  show_thinking_stream: true
  show_tool_lines: 5

tools:
  - module: tool-web
    source: git+https://github.com/microsoft/amplifier-module-tool-web@main
  - module: tool-search
    source: git+https://github.com/microsoft/amplifier-module-tool-search@main
  - module: tool-task
    source: git+https://github.com/microsoft/amplifier-module-tool-task@main
  - module: tool-todo
    source: git+https://github.com/microsoft/amplifier-module-tool-todo@main
  - module: tool-filesystem
    source: git+https://github.com/microsoft/amplifier-module-tool-filesystem@main
  - module: tool-bash
    source: git+https://github.com/microsoft/amplifier-module-tool-bash@main
  - module: tool-grep
    source: git+https://github.com/microsoft/amplifier-module-tool-grep@main

hooks:
  - module: hooks-status-context
    source: git+https://github.com/microsoft/amplifier-module-hooks-status-context@main
    config:
      include_git: true
      git_include_status: true
      git_include_commits: 5
      git_include_branch: true
      git_include_main_branch: true
      include_datetime: true
      datetime_include_timezone: false
  - module: hooks-redaction
    source: git+https://github.com/microsoft/amplifier-module-hooks-redaction@main
    config:
      allowlist:
        - session_id
        - turn_id
        - span_id
        - parent_span_id
  - module: hooks-logging
    source: git+https://github.com/microsoft/amplifier-module-hooks-logging@main
    config:
      mode: session-only
      session_log_template: ~/.amplifier/projects/{project}/sessions/{session_id}/events.jsonl
  - module: hooks-todo-reminder
    source: git+https://github.com/microsoft/amplifier-module-hooks-todo-reminder@main
    config:
      inject_role: user
      priority: 10
  - module: hooks-streaming-ui
    source: git+https://github.com/microsoft/amplifier-module-hooks-streaming-ui@main

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
---

# Core Instructions

@foundation:context/shared/common-profile-base.md

---

# Superpowers Development Profile

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
