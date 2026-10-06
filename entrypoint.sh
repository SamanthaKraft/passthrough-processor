#!/bin/bash
set -e

INPUT_DIR="${INPUT_DIR:-/data/input}"
OUTPUT_DIR="${OUTPUT_DIR:-/data/output}"

echo "Passthrough processor: copying input to output"
echo "Input:  $INPUT_DIR"
echo "Output: $OUTPUT_DIR"

# Find the actual content directory — step into a single wrapper folder if present
content_dir="$INPUT_DIR"
entries=("$INPUT_DIR"/*)
if [ ${#entries[@]} -eq 1 ] && [ -d "${entries[0]}" ]; then
  content_dir="${entries[0]}"
  echo "Stepping into single subdirectory: $(basename "$content_dir")"
fi

# Copy contents (not the folder itself) to output
cp -r "$content_dir"/* "$OUTPUT_DIR"/

echo "Done. Files copied:"
ls -R "$OUTPUT_DIR" | head -50
