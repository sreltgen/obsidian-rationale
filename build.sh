#!/bin/bash
#
# Build script for Rationale Obsidian Theme
# Concatenates all CSS modules from src/ into theme.css
#
# Usage:
#   ./build.sh           Build theme.css only
#   ./build.sh --install Build and install to Obsidian vault
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/src"
OUTPUT="$SCRIPT_DIR/theme.css"
VAULT_THEME_DIR="$HOME/Documents/obsidian/my-vault/.obsidian/themes/Rationale"

echo "Building theme.css..."

# Concatenate in order
cat \
    "$SRC_DIR/00-settings.css" \
    "$SRC_DIR/01-fonts.css" \
    "$SRC_DIR/02-base-variables.css" \
    "$SRC_DIR/schemes/base-light.css" \
    "$SRC_DIR/schemes/base-dark.css" \
    "$SRC_DIR/schemes/anthropic-light.css" \
    "$SRC_DIR/schemes/anthropic-dark.css" \
    "$SRC_DIR/schemes/nordic-light.css" \
    "$SRC_DIR/schemes/nordic-dark.css" \
    "$SRC_DIR/schemes/academic-light.css" \
    "$SRC_DIR/schemes/academic-dark.css" \
    "$SRC_DIR/schemes/oldmoney-light.css" \
    "$SRC_DIR/schemes/oldmoney-dark.css" \
    "$SRC_DIR/components/base.css" \
    "$SRC_DIR/components/sidebar.css" \
    "$SRC_DIR/components/checkboxes.css" \
    "$SRC_DIR/components/callouts.css" \
    "$SRC_DIR/components/tables.css" \
    "$SRC_DIR/components/images.css" \
    "$SRC_DIR/features/focus-mode.css" \
    "$SRC_DIR/features/cards.css" \
    "$SRC_DIR/features/oled.css" \
    "$SRC_DIR/components/tags.css" \
    "$SRC_DIR/components/embeds.css" \
    "$SRC_DIR/components/tabs.css" \
    "$SRC_DIR/features/hide-top-tab-bar.css" \
    "$SRC_DIR/features/justified-text.css" \
    "$SRC_DIR/features/justified-list-items.css" \
    "$SRC_DIR/features/floating-toolbar.css" \
    "$SRC_DIR/features/footlinks.css" \
    "$SRC_DIR/features/file-icons.css" \
    "$SRC_DIR/plugins/full-calendar.css" \
    "$SRC_DIR/plugins/task-genius.css" \
    "$SRC_DIR/overrides/scheme-tabs.css" \
    "$SRC_DIR/overrides/view-header.css" \
    "$SRC_DIR/mobile.css" \
    > "$OUTPUT"

echo "Done! Output: $OUTPUT"
echo "Size: $(wc -c < "$OUTPUT") bytes, $(wc -l < "$OUTPUT") lines"

# Install to vault if --install flag is passed
if [[ "$1" == "--install" ]]; then
    echo ""
    echo "Installing to vault..."
    mkdir -p "$VAULT_THEME_DIR"
    cp "$OUTPUT" "$VAULT_THEME_DIR/theme.css"
    cp "$SCRIPT_DIR/manifest.json" "$VAULT_THEME_DIR/manifest.json"
    echo "Installed to: $VAULT_THEME_DIR"
fi
