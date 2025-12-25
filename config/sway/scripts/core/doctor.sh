#!/usr/bin/env bash
set -euo pipefail

# =========================================
# SWAY DOCTOR
# Diagnóstico mínimo do ambiente
# Não corrige. Apenas informa.
# =========================================

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
RESET="\033[0m"

failures=0

check() {
    local label="$1"
    local cmd="$2"

    printf "%-30s" "$label"

    if eval "$cmd" >/dev/null 2>&1; then
        echo -e "${GREEN}OK${RESET}"
    else
        echo -e "${RED}FAIL${RESET}"
        failures=$((failures + 1))
    fi
}

echo "== SWAY DOCTOR =="
echo "Diagnóstico rápido do ambiente"
echo

# --- Comandos essenciais ---
check "sway disponível"        "command -v sway"
check "swaymsg disponível"     "command -v swaymsg"
check "bash disponível"        "command -v bash"
check "grep disponível"        "command -v grep"
check "sed disponível"         "command -v sed"

# --- Ambiente gráfico ---
check "WAYLAND_DISPLAY"        "[ -n \"\${WAYLAND_DISPLAY:-}\" ]"
check "SWAYSOCK"               "[ -n \"\${SWAYSOCK:-}\" ]"

# --- Dependências declaradas ---
check "foot (terminal)"        "command -v foot"
check "rofi (launcher)"        "command -v rofi"
check "grim (screenshot)"      "command -v grim"
check "slurp (selection)"      "command -v slurp"

# --- Scripts críticos ---
check "reading.sh existe"      "[ -x \"$HOME/.config/sway/scripts/modes/reading.sh\" ]"
check "safe-mode-toggle.sh"    "[ -x \"$HOME/.config/sway/scripts/system/safe-mode-toggle.sh\" ]"

# --- Comunicação com o sway ---
check "sway responde"          "swaymsg -t get_version"

echo
if [ "$failures" -eq 0 ]; then
    echo -e "${GREEN}Ambiente saudável.${RESET}"
    exit 0
else
    echo -e "${YELLOW}Problemas detectados: $failures${RESET}"
    echo "Não recarregue o Sway."
    echo "Ative safe mode se necessário."
    exit 1
fi
