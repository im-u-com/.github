#!/bin/bash
# Sets up the im-u development workspace
# Clones all repos as siblings under a common parent directory
#
# Usage:
#   ./setup-workspace.sh [workspace_dir]
#
# If workspace_dir is not provided, defaults to ./imu in the current directory.
# The .github repo itself should be cloned inside the workspace directory.
#
# Expected result:
#   workspace_dir/
#     .github/       <-- this repo (org-level CLAUDE.md, templates, profile)
#     agent/
#     website/
#     iac/
#     kb/

set -euo pipefail

ORG="im-u-com"
REPOS=(".github" "agent" "website" "iac" "kb")

WORKSPACE_DIR="${1:-$(pwd)/imu}"
mkdir -p "$WORKSPACE_DIR"

for repo in "${REPOS[@]}"; do
  if [ ! -d "$WORKSPACE_DIR/$repo" ]; then
    echo "Cloning $repo..."
    git clone "git@github.com:${ORG}/${repo}.git" "$WORKSPACE_DIR/$repo"
  else
    echo "$repo already exists, skipping"
  fi
done

echo ""
echo "Workspace ready at: $WORKSPACE_DIR"
echo "Open Claude Code from any repo - org conventions load automatically via @import"
