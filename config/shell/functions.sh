# Funções utilitárias

mkcd() {
  [ -z "$1" ] && { echo "uso: mkcd <diretório>"; return 1; }
  mkdir -p "$1" && cd "$1"
}

psg() {
  ps aux | grep -i "$1" | grep -v grep
}

catall() {
    local f
    {
        for f in *; do
            [ -f "$f" ] || continue
            printf '\n===== %s =====\n\n' "$f"
            cat "$f"
        done
    } | less
}
