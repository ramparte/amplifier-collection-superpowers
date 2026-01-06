---
bundle:
  name: superpowers-dev
  version: 1.0.0
  description: "Full-featured development bundle with all capabilities"
  author: "Amplifier Team"
  license: MIT
  repository: https://github.com/ramparte/amplifier-bundle-superpowers

includes:
  - bundle: git+https://github.com/microsoft/amplifier-foundation@main
---

# Superpowers Dev Bundle

Full-featured development environment with all capabilities enabled.

## What This Provides

- All foundation tools (filesystem, bash, web, search)
- All foundation agents (zen-architect, modular-builder, bug-hunter, etc.)
- Enhanced development workflows
- Full debugging and testing support

## Usage

```bash
amplifier run --bundle superpowers-dev "Build a new feature..."
```
