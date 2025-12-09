# Contributing to amplifier-collection-superpowers

Thank you for your interest in contributing to this collection!

## Overview

This collection is a thin adapter layer that imports obra/superpowers via git submodule. Our goal is to keep the wrapper code minimal (~500 lines total) while providing full integration with Amplifier.

## What We Maintain

### Thin Wrapper Agents (~30 lines each)
- Agent definitions in `agents/*/AGENT.md`
- These reference superpowers skills via @mention
- Minimal Amplifier-specific adaptations

### Context Documentation
- `context/adapter.md` - How superpowers maps to Amplifier
- `context/philosophy-bridge.md` - Philosophical alignment
- `context/workflow-integration.md` - Complete workflow description

### Profiles
- `profiles/superpowers-dev.yaml` - Full workflow
- `profiles/superpowers-minimal.yaml` - Core only
- `profiles/superpowers-tdd-only.yaml` - TDD enforcement only

### Scripts
- `scripts/sync-superpowers.sh` - Update submodule
- `scripts/verify-structure.sh` - Validate collection

### Documentation
- `README.md` - User-facing documentation
- `CONTRIBUTING.md` - This file
- `examples/` - Usage examples

## What We Don't Maintain

**Superpowers content:** All superpowers skills live in obra/superpowers repository. We don't duplicate or modify them.

**If you find issues with superpowers skills:** Report them to https://github.com/obra/superpowers/issues

## How to Contribute

### Reporting Issues

**For integration issues:** Open issue in this repository
- Wrapper agents not working correctly
- @mention references broken
- Amplifier tool adaptation problems
- Profile loading issues

**For superpowers skill issues:** Report to obra/superpowers
- Skill content errors
- Workflow problems in superpowers itself
- Superpowers documentation issues

### Improving Wrapper Agents

If you want to improve an agent wrapper:

1. **Keep it thin** - Agents should be ~30-40 lines
2. **Reference, don't duplicate** - Use @mention to load superpowers content
3. **Adapt, don't rewrite** - Only add Amplifier-specific guidance
4. **Test thoroughly** - Ensure @mention references work

Example structure:
```markdown
---
name: agent-name
description: Brief description
---

# Agent Name

## Role
One sentence role description

## Core Behavior
@superpowers/skills/skill-name/SKILL.md

## Adaptation for Amplifier
- Use read_file/write_file tools
- Use bash tool for commands
- Use task tool for subagents

## Integration Points
**Coordinates with:** Other agents
**Uses tools:** Tool list

## Context
@superpowers/context/adapter.md
```

### Updating Superpowers Submodule

When superpowers releases a new version:

1. Run update script:
   ```bash
   ./scripts/sync-superpowers.sh
   ```

2. Test all agents still work:
   ```bash
   ./scripts/verify-structure.sh
   ```

3. Update version in `collection.yaml`:
   ```yaml
   upstream:
     version: v3.7.0  # Update this
   ```

4. Submit PR with:
   - Updated submodule reference
   - Updated version in collection.yaml
   - Test results confirming agents work

### Adding New Agents

If superpowers adds a new skill you want to wrap:

1. Check if skill fits collection purpose
2. Create agent directory: `agents/new-agent/`
3. Create thin wrapper: `agents/new-agent/AGENT.md`
4. Add to `collection.yaml` agent list
5. Add to appropriate profile(s)
6. Update README.md with agent mapping
7. Test with `./scripts/verify-structure.sh`

### Improving Documentation

Documentation improvements welcome:
- Clearer examples
- Better usage instructions
- More complete agent descriptions
- Fixing typos or errors

### Testing Your Changes

Before submitting a PR:

1. **Run verification:**
   ```bash
   ./scripts/verify-structure.sh
   ```

2. **Test agent loading:**
   ```bash
   amplifier --profile superpowers:superpowers-minimal
   ```

3. **Verify @mention references resolve:**
   - Load an agent
   - Check that superpowers content appears
   - Verify no broken references

4. **Test complete workflow if possible:**
   - Run through design → plan → implement cycle
   - Verify agents work together correctly

## Pull Request Process

1. **Fork the repository**

2. **Create a branch:**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes:**
   - Follow existing patterns
   - Keep wrappers thin
   - Update documentation

4. **Test thoroughly:**
   ```bash
   ./scripts/verify-structure.sh
   ```

5. **Commit with clear messages:**
   ```bash
   git commit -m "Add: Brief description of change"
   ```

6. **Push to your fork:**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **Open Pull Request:**
   - Clear title
   - Description of changes
   - Test results
   - Why change is needed

## Code Style

### Markdown
- Use GitHub-flavored markdown
- Clear headings and structure
- Code blocks with language tags
- Examples for clarity

### YAML
- 2-space indentation
- Clear key names
- Comments where helpful
- Consistent formatting

### Bash Scripts
- Use `set -e` for error handling
- Clear echo messages
- Comments for complex logic
- Test scripts work

## Philosophy

When contributing, remember our core principles:

**Import, don't duplicate:**
- Reference superpowers via @mention
- Keep wrapper layer thin
- Stay synchronized with upstream

**Simplicity over complexity:**
- Minimal code
- Clear structure
- No unnecessary abstractions
- YAGNI, KISS, DRY

**Preserve upstream wisdom:**
- Don't rewrite superpowers skills
- Trust obra's approach
- Adapt, don't replace

## Communication

**Questions:** Open a GitHub discussion
**Bugs:** Open an issue
**Features:** Open an issue first to discuss
**Urgent:** Mention in issue or PR

## License

By contributing, you agree that your contributions will be licensed under the MIT License, with attribution to:
- Jesse Vincent (obra) for superpowers
- Ramparte for Amplifier integration

## Recognition

Contributors will be recognized in:
- GitHub contributors list
- Release notes (for significant contributions)
- README (for major features)

## Getting Help

**Stuck?** Open a GitHub discussion
**Need clarification?** Comment on issue/PR
**Found a bug?** Open an issue with details

## Thank You!

Your contributions help make superpowers available to the Amplifier community. Every improvement, bug fix, and documentation update is appreciated!

---

**Remember:**
- Keep it simple
- Keep it thin
- Test thoroughly
- Document clearly
