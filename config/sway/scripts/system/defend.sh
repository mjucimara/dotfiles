#!/usr/bin/env bash
set -euo pipefail

CRITICAL=(
  00-philosophy.conf
  05-contract.conf
  10-contexts.conf
)

for f in "${CRITICAL[@]}"; do
  grep -q "^# ======" "$HOME/.config/sway/config.d/$f" || exit 1
done
