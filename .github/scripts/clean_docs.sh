#!/usr/bin/env bash
set -euo pipefail

# Remove previously generated site files before rebuilding the Pages artifact.
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$PROJECT_DIR"

mkdir -p docs
find docs -mindepth 1 -maxdepth 1 ! -name ".gitkeep" ! -name "README.md" -exec rm -rf {} +

echo "Previous generated documentation removed from docs/."
