#!/usr/bin/env bash
set -euo pipefail
swaymsg -t get_version >/dev/null 2>&1 || exit 2
exit 0
