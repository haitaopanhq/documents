#!/usr/bin/env bash
set -euo pipefail

if [ -z "${PROJECT:-}" ]; then
  echo "Error: PROJECT environment variable is not set" >&2
  exit 1
fi

if make -C "$PROJECT" -n all >/dev/null 2>&1; then
  echo "Building 'all' target for $PROJECT"
  make -C "$PROJECT" all
else
  echo "Building default target for $PROJECT"
  make -C "$PROJECT"
fi
