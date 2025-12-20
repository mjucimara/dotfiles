_add_path() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$1:$PATH" ;;
  esac
}

_add_path "$HOME/.dotfiles/bin"
_add_path "$HOME/.local/bin"
_add_path "$HOME/bin"

export PATH
