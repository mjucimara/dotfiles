# Funções utilitárias

mkcd() {
  mkdir -p "$1" && cd "$1" || return
}

psg() {
  ps aux | grep -i "$1" | grep -v grep
}

catdir () {
  for f in "${1:-.}"/*; do
    [ -f "$f" ] && grep -Iq . "$f" && {
      echo
      echo "===== $f ====="
      cat "$f"
    }
  done | less
}
