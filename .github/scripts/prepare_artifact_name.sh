#!/usr/bin/env bash
set -euo pipefail

if [ -z "${PROJECT:-}" ]; then
  echo "Error: PROJECT environment variable is not set" >&2
  exit 1
fi

ARTIFACT_NAME="${PROJECT//\//-}-docs"
echo "ARTIFACT_NAME=$ARTIFACT_NAME" >> "$GITHUB_ENV"
echo "Prepared ARTIFACT_NAME=$ARTIFACT_NAME"
