---
bundle:
  name: superpowers-minimal
  version: 1.0.0
  description: "Minimal bundle with core capabilities only"
  author: "Amplifier Team"
  license: MIT
  repository: https://github.com/ramparte/amplifier-bundle-superpowers

includes:
  - bundle: git+https://github.com/microsoft/amplifier-foundation@main
---

# Superpowers Minimal Bundle

Lightweight bundle with essential capabilities only.

## What This Provides

- Core filesystem operations
- Basic bash access
- Essential search tools

## Usage

```bash
amplifier run --bundle superpowers-minimal "Quick task..."
```
