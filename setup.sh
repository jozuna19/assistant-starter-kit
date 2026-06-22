#!/bin/bash
# setup.sh — Wire the brain vault hook to your workspace
# Run this from your Bob Builder workspace directory (not this repo).
#
# Usage:
#   cd ~/your-bob-workspace
#   bash ~/path/to/this-repo/setup.sh

set -e

WORKSPACE="$(pwd)"
BRAIN_HOT="$WORKSPACE/brain/_HOT.md"
SETTINGS="$WORKSPACE/.claude/settings.json"

if [ ! -f "$BRAIN_HOT" ]; then
  echo "Error: brain/_HOT.md not found in $WORKSPACE"
  echo "Make sure you copied the brain/ folder into your workspace first."
  exit 1
fi

mkdir -p "$WORKSPACE/.claude"

cat > "$SETTINGS" << EOF
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "cat \"$BRAIN_HOT\""
          }
        ]
      }
    ],
    "UserPromptSubmit": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "cat \"$BRAIN_HOT\""
          }
        ]
      }
    ]
  }
}
EOF

echo ""
echo "Done. Brain hook wired to:"
echo "  $BRAIN_HOT"
echo ""
echo "Restart your Claude Code session to activate."
echo ""
