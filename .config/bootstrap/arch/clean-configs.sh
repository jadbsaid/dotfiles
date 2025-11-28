#!/usr/bin/env bash
set -euo pipefail

cd "$HOME"

# Remove untracked files (e.g omarchy defaults)
git clean -fd -- \
    .config/hypr \
    .config/uwsm \
    .config/nvim \
    .config/kitty \
    .config/ghostty \
    .config/microsoft-edge-dev
