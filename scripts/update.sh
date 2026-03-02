#!/usr/bin/env bash
# craft/scripts/update.sh
# Update craft files in current repo to latest version

set -euo pipefail

CRAFT_REPO="https://raw.githubusercontent.com/aramiworks/craft/main"

if [[ ! -f .craft.json ]]; then
  echo "❌ .craft.json not found. Run install.sh first."
  exit 1
fi

TYPE=$(python3 -c "import json; print(json.load(open('.craft.json'))['type'])")
echo "🔄 Updating craft context (type: $TYPE)..."

# Re-run install
curl -sSL "$CRAFT_REPO/scripts/install.sh" | bash -s -- --type "$TYPE"

echo "✅ Update complete"
