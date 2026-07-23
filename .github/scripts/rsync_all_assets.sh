#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob

if [ "${SSH_CONFIGURED:-false}" != "true" ]; then
  echo "::warning ::SSH is not configured. Skipping rsync to remote host."
  exit 0
fi

if [ -z "${RSYNC_SSH_USER:-}" ] || [ -z "${VPS_HOST:-}" ]; then
  echo "::warning ::Missing remote VPS configuration. Skipping rsync."
  exit 0
fi

ARTIFACT_DIR="${1:-artifacts}"
if [ ! -d "$ARTIFACT_DIR" ]; then
  echo "No artifacts directory found at $ARTIFACT_DIR. Skipping rsync."
  exit 0
fi

echo "=== Syncing All Release Assets to Remote Host ($VPS_HOST) ==="

for dir in "$ARTIFACT_DIR"/*; do
  if [ -d "$dir" ]; then
    dirname=$(basename "$dir")
    echo "Processing artifact folder: $dirname"
    files=( "$dir"/**/*.pdf "$dir"/**/*.docx "$dir"/**/*.html "$dir"/*.pdf "$dir"/*.docx "$dir"/*.html )
    if [ ${#files[@]} -gt 0 ]; then
      REMOTE_DEST="${REMOTE_ROOT:-/var/www/documents}/${dirname}"
      ssh -i ~/.ssh/id_rsa "${RSYNC_SSH_USER}@${VPS_HOST}" "mkdir -p '${REMOTE_DEST}'"
      echo "Rsyncing assets for $dirname -> ${VPS_HOST}:${REMOTE_DEST}/"
      rsync -av -e "ssh -i ~/.ssh/id_rsa" \
        "${files[@]}" \
        "${RSYNC_SSH_USER}@${VPS_HOST}:${REMOTE_DEST}/"
    fi
  fi
done

echo "Rsync completed successfully!"
