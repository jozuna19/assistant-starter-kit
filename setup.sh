#!/bin/bash
# setup.sh — AI Assistant Workspace Setup
# Run this once after unzipping, from inside the folder.

set -e

WORKSPACE="$(cd "$(dirname "$0")" && pwd)"
BRAIN_HOT="$WORKSPACE/brain/_HOT.md"
SETTINGS="$WORKSPACE/.claude/settings.json"

echo ""
echo "Setting up your AI assistant workspace..."
echo "Workspace: $WORKSPACE"
echo ""

# Patch the settings.json with the real brain/_HOT.md path
sed -i '' "s|BRAIN_HOT_PATH|$BRAIN_HOT|g" "$SETTINGS"
echo "✓ Hooks wired to $BRAIN_HOT"

# Create placeholder files so empty dirs aren't invisible
touch "$WORKSPACE/captures/questions/.keep"
touch "$WORKSPACE/captures/decisions/.keep"
touch "$WORKSPACE/captures/tasks/.keep"
touch "$WORKSPACE/captures/commitments/.keep"
touch "$WORKSPACE/captures/context/.keep"
touch "$WORKSPACE/projects/.keep"
touch "$WORKSPACE/people/clients/.keep"
touch "$WORKSPACE/people/internal/.keep"

# Create the sequence counter file
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
echo "✓ Sequence counter created"

echo ""
echo "Done! Next steps:"
echo ""
echo "  1. Open SOUL.md — fill in your assistant's name and personality"
echo "  2. Open USER.md — fill in your name, email, role, and key contacts"
echo "  3. Open MEMORY.md — add your team's terminology if you know it now"
echo "  4. Run 'claude' in this folder to start your first session"
echo ""
echo "On first run, tell your assistant:"
echo "  'Read all the setup files and introduce yourself.'"
echo ""
