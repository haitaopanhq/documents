#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="${1:-artifacts}"
DST_DIR="${2:-release_assets}"

mkdir -p "$DST_DIR"

if [ ! -d "$SRC_DIR" ]; then
  echo "Source directory $SRC_DIR does not exist. Skipping release assets preparation."
  exit 0
fi

echo "=== Preparing Unique Release Assets in $DST_DIR ==="

count=0
while IFS= read -r -d '' file; do
  rel_path="${file#"$SRC_DIR"/}"
  flat_name="$(echo "$rel_path" | tr '/' '_')"
  echo "Copying: $rel_path -> $DST_DIR/$flat_name"
  cp "$file" "$DST_DIR/$flat_name"
  count=$((count + 1))
done < <(find "$SRC_DIR" -type f \( -name "*.pdf" -o -name "*.docx" -o -name "*.html" \) -print0)

echo "Done! Prepared $count release asset(s) in $DST_DIR."
