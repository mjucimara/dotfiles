#!/usr/bin/env bash
set -euo pipefail

FILE="$HOME/.local/state/sway/safe_mode"
mkdir -p "$(dirname "$FILE")"

[[ -f "$FILE" ]] || echo 0 > "$FILE"

if [[ "$(cat "$FILE")" == "0" ]]; then
  echo 1 > "$FILE"
  notify-send "Safe Mode" "Ativado"
else
  echo 0 > "$FILE"
  notify-send "Safe Mode" "Desativado"
fi

swaymsg reload
