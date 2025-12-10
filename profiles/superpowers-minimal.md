---
profile:
  name: superpowers-minimal
  version: 1.0.0
  description: Minimal superpowers profile with just TDD enforcement and code review

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

A lightweight superpowers profile focused on TDD discipline and code review.

## Available Agents

1. **tdd-enforcer**: Enforce test-driven development principles
2. **code-reviewer**: Review code using superpowers methodology

## Philosophy

This profile provides the essential superpowers capabilities:
- **TDD Discipline**: Tests first, always
- **Code Quality**: Structured review process

## When to Use

Use this profile when you want:
- Lightweight superpowers integration
- Focus on TDD and review only
- Minimal overhead
- Fast iteration cycles

## Workflow

1. Use **tdd-enforcer** during implementation to maintain TDD discipline
2. Use **code-reviewer** before merging to ensure quality

Simple, focused, effective.
