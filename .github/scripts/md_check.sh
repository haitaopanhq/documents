#!/usr/bin/env bash
set -euo pipefail

echo "=== Starting Markdown Check Stage ==="

projects=(
  "Personal"
  "LandingZone"
  "Keycloak"
  "TechExploration"
  "Observability/CN"
  "Linux-K8S-OPS/CN"
  "interview-qa/CN"
  "interview-qa/EN"
  "The-IndieDeveloper-Fullstack-Roadmap/CN"
  "The-IndieDeveloper-Fullstack-Roadmap/EN"
  "Solutions/CN"
  "Solutions/EN"
  "AI-Platform/CN"
  "AI-Platform/EN"
)

errors=0
total_files=0

for proj in "${projects[@]}"; do
  if [ ! -d "$proj" ]; then
    echo "::warning ::Project directory $proj does not exist!"
    errors=$((errors + 1))
    continue
  fi

  md_count=$(find "$proj" -name "*.md" | wc -l | tr -d ' ')
  if [ "$md_count" -eq 0 ]; then
    echo "::warning ::No markdown files found in $proj"
    errors=$((errors + 1))
  else
    echo "✓ $proj ($md_count markdown files found)"
    total_files=$((total_files + md_count))
  fi

  # Check for empty markdown files
  while IFS= read -r -d '' file; do
    if [ ! -s "$file" ]; then
      echo "::error file=$file::Markdown file is empty"
      errors=$((errors + 1))
    fi
  done < <(find "$proj" -name "*.md" -print0)
done

echo "=== Markdown Check Summary ==="
echo "Total Markdown files validated: $total_files"

if [ "$errors" -gt 0 ]; then
  echo "Markdown check completed with $errors error(s) / warning(s)."
  exit 1
else
  echo "All Markdown files validated successfully!"
fi
