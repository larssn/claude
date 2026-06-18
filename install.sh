#!/usr/bin/env bash
# Installs this personal Claude Code config into ~/.claude (macOS / Linux).
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="$HOME/.claude"

mkdir -p "$DEST/skills"

if [ -f "$DEST/CLAUDE.md" ]; then
  backup="$DEST/CLAUDE.md.$(date +%Y%m%d%H%M%S).bak"
  cp "$DEST/CLAUDE.md" "$backup"
  echo "Backed up existing CLAUDE.md -> $backup"
fi

cp "$SRC/CLAUDE.md" "$DEST/CLAUDE.md"
cp -R "$SRC/.claude/skills/." "$DEST/skills/"

echo "Installed to $DEST"
