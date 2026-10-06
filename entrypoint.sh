#!/bin/sh
set -e

INPUT_DIR="${INPUT_DIR:-/data/input}"
OUTPUT_DIR="${OUTPUT_DIR:-/data/output}"

echo "Passthrough processor: copying input to output"
echo "Input:  $INPUT_DIR"
echo "Output: $OUTPUT_DIR"

# Find the actual content directory — step into a single wrapper folder if present
content_dir="$INPUT_DIR"
entry_count=$(ls -1 "$INPUT_DIR" | wc -l)
if [ "$entry_count" -eq 1 ]; then
  single=$(ls -1 "$INPUT_DIR")
  if [ -d "$INPUT_DIR/$single" ]; then
    content_dir="$INPUT_DIR/$single"
    echo "Stepping into single subdirectory: $single"
  fi
fi

# Copy contents (not the folder itself) to output
cp -r "$content_dir"/* "$OUTPUT_DIR"/

echo "Done. Files copied:"
ls -R "$OUTPUT_DIR" | head -50
