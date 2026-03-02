#!/usr/bin/env bash
# craft/scripts/install.sh
# Install Aramiworks AI context files into current repo
# Usage: bash install.sh --type product|agent|library|infra

set -euo pipefail

CRAFT_REPO="https://raw.githubusercontent.com/aramiworks/craft/main"
TYPE="product"

# Parse args
while [[ $# -gt 0 ]]; do
  case $1 in
    --type) TYPE="$2"; shift 2 ;;
    *) echo "Unknown arg: $1"; exit 1 ;;
  esac
done

VALID_TYPES="product agent library infra"
if ! echo "$VALID_TYPES" | grep -qw "$TYPE"; then
  echo "❌ Invalid type: $TYPE. Must be one of: $VALID_TYPES"
  exit 1
fi

echo "🔧 Installing craft context (type: $TYPE)..."

# Download base files
download() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  curl -sSL "$CRAFT_REPO/$src" -o "$dest"
  echo "  ✅ $dest"
}

# Base files (all repos)
download "base/CLAUDE.md" "CLAUDE.md"
download "base/AGENTS.md" "AGENTS.md"
download "base/llms.txt" "llms.txt"
download "base/.cursor/rules/core.mdc" ".cursor/rules/core.mdc"
download "base/.cursor/rules/security.mdc" ".cursor/rules/security.mdc"
download "base/.github/copilot-instructions.md" ".github/copilot-instructions.md"

# Type-specific override (append to CLAUDE.md)
echo "" >> CLAUDE.md
echo "---" >> CLAUDE.md
curl -sSL "$CRAFT_REPO/overrides/$TYPE/CLAUDE.md" >> CLAUDE.md
echo "  ✅ CLAUDE.md (+ $TYPE override)"

# Write craft metadata
cat > .craft.json << EOF
{
  "type": "$TYPE",
  "installed": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "source": "aramiworks/craft"
}
EOF
echo "  ✅ .craft.json"

echo ""
echo "✨ Done! Files installed:"
echo "  CLAUDE.md, AGENTS.md, llms.txt"
echo "  .cursor/rules/core.mdc, .cursor/rules/security.mdc"
echo "  .github/copilot-instructions.md"
echo "  .craft.json"
echo ""
echo "📝 Next: customize CLAUDE.md with project-specific context"
