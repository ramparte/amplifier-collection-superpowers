---
profile:
  name: superpowers-tdd-only
  version: 1.0.0
  description: Pure TDD enforcement profile

session:
  orchestrator:
    module: loop-streaming
    source: git+https://github.com/microsoft/amplifier-module-loop-streaming@main
  context:
    module: context-persistent
    source: git+https://github.com/microsoft/amplifier-module-context-persistent@main
    config:
      max_tokens: 50000

providers:
  - module: provider-anthropic
    source: git+https://github.com/microsoft/amplifier-module-provider-anthropic@main
    config:
      default_model: claude-sonnet-4-5

tools:
  - module: tool-filesystem
  - module: tool-bash

hooks:
  - module: hooks-logging

agents:
  - tdd-enforcer

context:
  - context/adapter.md
---

# Superpowers TDD-Only Profile

Pure test-driven development enforcement.

**Test first, code second, refactor third.**
