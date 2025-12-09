#!/bin/bash
# Verify collection structure is valid

set -e

echo "Verifying collection structure..."
echo ""

# Check required files
required_files=(
  "collection.yaml"
  "README.md"
  "LICENSE"
  ".gitignore"
  "context/adapter.md"
  "context/philosophy-bridge.md"
  "context/workflow-integration.md"
)

for file in "${required_files[@]}"; do
  if [ ! -f "$file" ]; then
    echo "✗ ERROR: Missing required file: $file"
    exit 1
  fi
  echo "✓ $file"
done

# Check superpowers submodule
if [ ! -e "superpowers/.git" ]; then
  echo "✗ ERROR: superpowers submodule not initialized"
  exit 1
fi
echo "✓ superpowers submodule"

# Check agents
agent_dirs=(
  "agents/design-refiner"
  "agents/plan-writer"
  "agents/tdd-enforcer"
  "agents/subagent-orchestrator"
  "agents/plan-executor"
  "agents/code-reviewer"
  "agents/branch-finalizer"
  "agents/debugger"
  "agents/worktree-manager"
)

for dir in "${agent_dirs[@]}"; do
  if [ ! -f "$dir/AGENT.md" ]; then
    echo "✗ ERROR: Missing agent file: $dir/AGENT.md"
    exit 1
  fi
  echo "✓ $dir/AGENT.md"
done

# Check profiles
profile_files=(
  "profiles/superpowers-dev.yaml"
  "profiles/superpowers-minimal.yaml"
  "profiles/superpowers-tdd-only.yaml"
)

for file in "${profile_files[@]}"; do
  if [ ! -f "$file" ]; then
    echo "✗ ERROR: Missing profile: $file"
    exit 1
  fi
  echo "✓ $file"
done

# Check scripts
if [ ! -x "scripts/sync-superpowers.sh" ]; then
  echo "✗ ERROR: scripts/sync-superpowers.sh not executable"
  exit 1
fi
echo "✓ scripts/sync-superpowers.sh (executable)"

echo ""
echo "✓ All structure verification passed!"
