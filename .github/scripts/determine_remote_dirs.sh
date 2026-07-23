#!/usr/bin/env bash
set -euo pipefail

if [ -z "${PROJECT:-}" ]; then
  echo "Error: PROJECT environment variable is not set" >&2
  exit 1
fi

DOC_NAME="${PROJECT%%/*}"
if [[ "$PROJECT" == "$DOC_NAME" ]]; then
  LANG_SEGMENT="EN"
else
  LANG_SEGMENT="${PROJECT#*/}"
  LANG_SEGMENT="${LANG_SEGMENT%%/*}"
fi
LANG_SEGMENT="${LANG_SEGMENT^^}"
VERSION_TAG="v${GITHUB_RUN_NUMBER:-0}-${GITHUB_RUN_ID:-0}"
REMOTE_DOC_DIR="${REMOTE_ROOT:-/var/www}/${DOC_NAME}"
REMOTE_VERSION_DIR="${REMOTE_DOC_DIR}/${LANG_SEGMENT}-${VERSION_TAG}"

{
  echo "REMOTE_DOC_DIR=${REMOTE_DOC_DIR}"
  echo "REMOTE_VERSION_DIR=${REMOTE_VERSION_DIR}"
} >> "$GITHUB_ENV"

echo "Document directory: ${REMOTE_DOC_DIR}"
echo "Version directory: ${REMOTE_VERSION_DIR}"
