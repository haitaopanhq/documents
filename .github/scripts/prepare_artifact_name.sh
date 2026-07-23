#!/usr/bin/env bash
set -euo pipefail

if [ -z "${PROJECT:-}" ]; then
  echo "Error: PROJECT environment variable is not set" >&2
  exit 1
fi

PROJ_NAME="${PROJECT%.md}"
ARTIFACT_NAME="${PROJ_NAME//\//-}-docs"
echo "ARTIFACT_NAME=$ARTIFACT_NAME" >> "$GITHUB_ENV"
echo "Prepared ARTIFACT_NAME=$ARTIFACT_NAME"
