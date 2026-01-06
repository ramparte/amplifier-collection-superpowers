---
bundle:
  name: superpowers-tdd
  version: 1.0.0
  description: "Test-driven development focused bundle"
  author: "Amplifier Team"
  license: MIT
  repository: https://github.com/ramparte/amplifier-bundle-superpowers

includes:
  - bundle: git+https://github.com/microsoft/amplifier-foundation@main
---

# Superpowers TDD Bundle

Test-driven development workflow with testing focus.

## What This Provides

- TDD workflow guidance
- Test-first development patterns
- Red-green-refactor cycle support
- Test coverage analysis

## Usage

```bash
amplifier run --bundle superpowers-tdd "TDD this feature..."
```
