#!/bin/bash
# Sync superpowers submodule to latest version

set -e

echo "Syncing superpowers submodule..."
git submodule update --remote superpowers

echo ""
echo "Current superpowers version:"
cd superpowers && git describe --tags

echo ""
echo "✓ Sync complete!"
