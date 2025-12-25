#!/usr/bin/env bash
set -euo pipefail

LOG="$HOME/.cache/sway-reading.log"

echo "$(date '+%F %T') :: $*" >> "$LOG"

case "${1:-}" in
  --enable)
    swaymsg gaps inner 20
    swaymsg gaps outer 10
    ;;
  --disable)
    swaymsg gaps inner 8
    swaymsg gaps outer 2
    ;;
  *)
    echo "reading mode: --enable | --disable" >> "$LOG"
    ;;
esac
