#!/bin/bash
# setup.sh — Wire the brain hook to this workspace
# Run once after copying templates and filling them in.

set -e

WORKSPACE="$(cd "$(dirname "$0")" && pwd)"
BRAIN_HOT="$WORKSPACE/brain/_HOT.md"
SETTINGS="$WORKSPACE/.claude/settings.json"

echo ""
echo "Wiring brain hook..."
echo "Workspace: $WORKSPACE"
echo ""

# Create .claude directory if it doesn't exist
mkdir -p "$WORKSPACE/.claude"

# Write settings.json with the real brain/_HOT.md path
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

echo "Hook wired to: $BRAIN_HOT"

# Create sequence counter
if [ ! -f "$WORKSPACE/_sequence.md" ]; then
  cat > "$WORKSPACE/_sequence.md" << 'EOF'
# Sequence Counter
_Resets daily. Global across all capture types._

## YYYY-MM-DD
- Q: 000
- D: 000
- T: 000
- C: 000
- X: 000
EOF
  echo "Sequence counter created"
fi

echo ""
echo "Done. Start your first session with:"
echo "  claude"
echo ""
echo "Then say: 'Wake up. Read your boot files and tell me what you see.'"
echo ""
echo "See day-one-walkthrough.md if you want to know what to expect."
echo ""
