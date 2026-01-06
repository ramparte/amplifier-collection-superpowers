---
bundle:
  name: superpowers-tdd-only
  version: 1.0.0
  description: "Pure TDD enforcement profile"
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
      max_tokens: 50000

agents:
  include:
    - superpowers:tdd-enforcer
---

@superpowers:context/adapter.md

# Superpowers TDD-Only Bundle

Pure test-driven development enforcement.

**Test first, code second, refactor third.**

## Available Agent

- **tdd-enforcer**: Enforces strict TDD discipline - no code without tests
