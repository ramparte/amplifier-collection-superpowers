---
meta:
  name: superpowers-tdd-only
  description: "Pure TDD enforcement profile from superpowers"

providers:
  - module: provider-anthropic
    source: git+https://github.com/microsoft/amplifier-module-provider-anthropic@main
    config:
      model: claude-sonnet-4-5

tools:
  - module: tool-filesystem
  - module: tool-bash

hooks:
  - module: hooks-logging

agents:
  include:
    - tdd-enforcer

context:
  include:
    - context/adapter.md
---

# Superpowers TDD-Only Profile

Pure test-driven development enforcement from superpowers methodology.

## Available Agent

**tdd-enforcer**: Enforce test-driven development principles from superpowers

## Philosophy

This profile is laser-focused on one thing: **TDD discipline**.

From superpowers test-driven-development skill:
- Write tests first, always
- Red-Green-Refactor cycle
- No code without tests
- Test coverage is non-negotiable

## When to Use

Use this profile when you want:
- Pure TDD enforcement
- No distractions, just TDD
- Learning TDD discipline
- Ensuring test-first approach

## Workflow

Simple: **Test first, code second, refactor third.**

The tdd-enforcer agent will guide you through the Red-Green-Refactor cycle.
