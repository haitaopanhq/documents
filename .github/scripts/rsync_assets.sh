#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob

if [ "${SSH_CONFIGURED:-false}" != "true" ]; then
  echo "::warning ::SSH is not configured. Skipping rsync to remote host."
  exit 0
fi

if [ -z "${REMOTE_VERSION_DIR:-}" ] || [ -z "${RSYNC_SSH_USER:-}" ] || [ -z "${VPS_HOST:-}" ]; then
  echo "::warning ::Missing remote destination configuration. Skipping rsync."
  exit 0
fi

if [ -z "${PROJECT:-}" ]; then
  echo "Error: PROJECT environment variable is not set" >&2
  exit 1
fi

ssh -i ~/.ssh/id_rsa "${RSYNC_SSH_USER}@${VPS_HOST}" "mkdir -p '${REMOTE_VERSION_DIR}'"
echo "Rsync -> ${VPS_HOST}:${REMOTE_VERSION_DIR}/"

files=( "$PROJECT"/*.pdf "$PROJECT"/*.html )
if [ ${#files[@]} -eq 0 ]; then
  echo "No PDF or HTML artifacts to sync for ${PROJECT}"
else
  rsync -av -e "ssh -i ~/.ssh/id_rsa" \
    "${files[@]}" \
    "${RSYNC_SSH_USER}@${VPS_HOST}:${REMOTE_VERSION_DIR}/"
fi
