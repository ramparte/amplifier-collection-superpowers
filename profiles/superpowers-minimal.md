---
profile:
  name: superpowers-minimal
  version: 1.0.0
  description: Minimal superpowers profile with just TDD and code review

session:
  orchestrator:
    module: loop-streaming
    source: git+https://github.com/microsoft/amplifier-module-loop-streaming@main
  context:
    module: context-persistent
    source: git+https://github.com/microsoft/amplifier-module-context-persistent@main
    config:
      max_tokens: 100000

providers:
  - module: provider-anthropic
    source: git+https://github.com/microsoft/amplifier-module-provider-anthropic@main
    config:
      default_model: claude-sonnet-4-5

tools:
  - module: tool-filesystem
  - module: tool-bash
  - module: tool-grep

hooks:
  - module: hooks-logging

agents:
  - tdd-enforcer
  - code-reviewer

context:
  - context/adapter.md
  - context/philosophy-bridge.md
---

# Superpowers Minimal Profile

Lightweight superpowers profile focused on TDD discipline and code review.

Simple, focused, effective.
