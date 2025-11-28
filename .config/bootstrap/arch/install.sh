#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ensure we are in the home directory
if [ "$PWD" != "$HOME" ]; then
    cd "$HOME"
fi

# Delete any default/untracked configs
if [ -f "$SCRIPT_DIR/clean-configs.sh" ]; then
    echo "[bootstrap] Cleaning config directories..."
    bash "$SCRIPT_DIR/clean-configs.sh"
fi

# Install paru - AUR helper
echo "[bootstrap] Ensuring paru is installed..."
bash "$SCRIPT_DIR/paru.sh"

# Install packages
echo "[bootstrap] Installing packages..."

INSTALLERS=(
    "brave.sh"
    "fish.sh"
    "ghostty.sh"
    "nvim.sh"
    "tmux.sh"
)

for installer in "${INSTALLERS[@]}"; do
    if [ -f "$SCRIPT_DIR/$installer" ]; then
        echo "[bootstrap] Running $installer..."
        bash "$SCRIPT_DIR/$installer"
    else
        echo "[bootstrap] Installer $installer not found, skipping..."
    fi
done

echo "[bootstrap] Setup complete."
