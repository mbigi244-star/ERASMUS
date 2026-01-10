#!/bin/bash
# ERASMUS - Autonomous KA210 Application Writer
# Usage: ./erasmus.sh [max_iterations]

set -e

MAX_ITERATIONS=${1:-15}
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WNIOSEK_FILE="$SCRIPT_DIR/wniosek.json"
PROGRESS_FILE="$SCRIPT_DIR/postep.txt"
ARCHIVE_DIR="$SCRIPT_DIR/archive"
LAST_PROJECT_FILE="$SCRIPT_DIR/.last-project"

# Archive previous run if project changed
if [ -f "$WNIOSEK_FILE" ] && [ -f "$LAST_PROJECT_FILE" ]; then
  CURRENT_PROJECT=$(jq -r '.projekt.akronim // empty' "$WNIOSEK_FILE" 2>/dev/null || echo "")
  LAST_PROJECT=$(cat "$LAST_PROJECT_FILE" 2>/dev/null || echo "")

  if [ -n "$CURRENT_PROJECT" ] && [ -n "$LAST_PROJECT" ] && [ "$CURRENT_PROJECT" != "$LAST_PROJECT" ]; then
    # Archive the previous run
    DATE=$(date +%Y-%m-%d)
    ARCHIVE_FOLDER="$ARCHIVE_DIR/$DATE-$LAST_PROJECT"

    echo "Archiving previous project: $LAST_PROJECT"
    mkdir -p "$ARCHIVE_FOLDER"
    [ -f "$WNIOSEK_FILE" ] && cp "$WNIOSEK_FILE" "$ARCHIVE_FOLDER/"
    [ -f "$PROGRESS_FILE" ] && cp "$PROGRESS_FILE" "$ARCHIVE_FOLDER/"
    echo "   Archived to: $ARCHIVE_FOLDER"

    # Reset progress file for new project
    echo "# ERASMUS Progress Log" > "$PROGRESS_FILE"
    echo "Project: $CURRENT_PROJECT" >> "$PROGRESS_FILE"
    echo "Started: $(date)" >> "$PROGRESS_FILE"
    echo "---" >> "$PROGRESS_FILE"
    echo "" >> "$PROGRESS_FILE"
    echo "## Codebase Patterns" >> "$PROGRESS_FILE"
    echo "- Always fill 90-95% of character limits" >> "$PROGRESS_FILE"
    echo "- Use concrete target groups (names, not generic)" >> "$PROGRESS_FILE"
    echo "- Cite sources: Eurostat, OECD, national reports" >> "$PROGRESS_FILE"
    echo "- Address all 4 horizontal aspects in B2.6" >> "$PROGRESS_FILE"
    echo "---" >> "$PROGRESS_FILE"
  fi
fi

# Track current project
if [ -f "$WNIOSEK_FILE" ]; then
  CURRENT_PROJECT=$(jq -r '.projekt.akronim // empty' "$WNIOSEK_FILE" 2>/dev/null || echo "")
  if [ -n "$CURRENT_PROJECT" ]; then
    echo "$CURRENT_PROJECT" > "$LAST_PROJECT_FILE"
  fi
fi

# Initialize progress file if it doesn't exist
if [ ! -f "$PROGRESS_FILE" ]; then
  echo "# ERASMUS Progress Log" > "$PROGRESS_FILE"
  echo "Started: $(date)" >> "$PROGRESS_FILE"
  echo "---" >> "$PROGRESS_FILE"
  echo "" >> "$PROGRESS_FILE"
  echo "## Codebase Patterns" >> "$PROGRESS_FILE"
  echo "- Always fill 90-95% of character limits" >> "$PROGRESS_FILE"
  echo "- Use concrete target groups (names, not generic)" >> "$PROGRESS_FILE"
  echo "- Cite sources: Eurostat, OECD, national reports" >> "$PROGRESS_FILE"
  echo "- Address all 4 horizontal aspects in B2.6" >> "$PROGRESS_FILE"
  echo "---" >> "$PROGRESS_FILE"
fi

echo ""
echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║  ERASMUS - Autonomous KA210 Application Writer                ║"
echo "║  Target: 90-100 points (not minimum 60!)                      ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo ""
echo "Starting ERASMUS - Max iterations: $MAX_ITERATIONS"
echo ""

# Show current status
if [ -f "$WNIOSEK_FILE" ]; then
  TOTAL=$(jq '.sekcje | length' "$WNIOSEK_FILE" 2>/dev/null || echo "0")
  DONE=$(jq '[.sekcje[] | select(.ukonczona == true)] | length' "$WNIOSEK_FILE" 2>/dev/null || echo "0")
  echo "Progress: $DONE/$TOTAL sections complete"
  echo ""
fi

for i in $(seq 1 $MAX_ITERATIONS); do
  echo ""
  echo "═══════════════════════════════════════════════════════════════"
  echo "  ERASMUS Iteration $i of $MAX_ITERATIONS"
  echo "═══════════════════════════════════════════════════════════════"

  # Show next section to work on
  if [ -f "$WNIOSEK_FILE" ]; then
    NEXT=$(jq -r '[.sekcje[] | select(.ukonczona == false)] | sort_by(.priorytet) | .[0] | "\(.id): \(.tytul)"' "$WNIOSEK_FILE" 2>/dev/null || echo "unknown")
    echo "  Next section: $NEXT"
    echo ""
  fi

  # Run amp with the erasmus prompt
  OUTPUT=$(cat "$SCRIPT_DIR/prompt.md" | amp --dangerously-allow-all 2>&1 | tee /dev/stderr) || true

  # Check for completion signal
  if echo "$OUTPUT" | grep -q "<promise>COMPLETE</promise>"; then
    echo ""
    echo "╔═══════════════════════════════════════════════════════════════╗"
    echo "║  ERASMUS completed all sections!                              ║"
    echo "║  Application ready for review.                                ║"
    echo "╚═══════════════════════════════════════════════════════════════╝"
    echo ""
    echo "Completed at iteration $i of $MAX_ITERATIONS"
    echo ""
    echo "Next steps:"
    echo "  1. Review generated content in wniosek.json"
    echo "  2. Run self-evaluation (Part D of workflow)"
    echo "  3. Search for partners (Part E of workflow)"
    echo "  4. Generate final package (Part G of workflow)"
    exit 0
  fi

  # Show updated progress
  if [ -f "$WNIOSEK_FILE" ]; then
    DONE=$(jq '[.sekcje[] | select(.ukonczona == true)] | length' "$WNIOSEK_FILE" 2>/dev/null || echo "0")
    echo ""
    echo "Progress after iteration $i: $DONE/$TOTAL sections complete"
  fi

  echo "Iteration $i complete. Continuing..."
  sleep 2
done

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "  ERASMUS reached max iterations ($MAX_ITERATIONS)"
echo "  Not all sections completed."
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "Check progress:"
echo "  cat wniosek.json | jq '.sekcje[] | {id, tytul, ukonczona}'"
echo "  cat postep.txt"
exit 1
