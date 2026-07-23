#!/usr/bin/env bash
set -euo pipefail

if [ -z "${RSYNC_SSH_KEY:-}" ] || [ -z "${VPS_HOST:-}" ]; then
  echo "::warning ::RSYNC_SSH_KEY or VPS_HOST secret is missing or empty. Remote rsync steps will be skipped."
  echo "SSH_CONFIGURED=false" >> "$GITHUB_ENV"
  exit 0
fi

mkdir -p ~/.ssh
printf '%s\n' "$RSYNC_SSH_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
ssh-keyscan -H "$VPS_HOST" >> ~/.ssh/known_hosts

echo "SSH_CONFIGURED=true" >> "$GITHUB_ENV"
echo "SSH initialized successfully for host $VPS_HOST"
