---
bundle:
  name: superpowers-minimal
  version: 1.0.0
  description: "Minimal superpowers profile with just TDD and code review"
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
      max_tokens: 100000

agents:
  include:
    - superpowers:tdd-enforcer
    - superpowers:code-reviewer
---

@superpowers:context/adapter.md
@superpowers:context/philosophy-bridge.md

# Superpowers Minimal Bundle

Lightweight superpowers bundle focused on TDD discipline and code review.

## Available Agents

- **tdd-enforcer**: Enforce test-driven development discipline
- **code-reviewer**: Review code using superpowers methodology

Simple, focused, effective.
