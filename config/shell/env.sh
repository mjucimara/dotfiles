# Variáveis de ambiente globais

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups:erasedups
export HISTIGNORE="ls:ll:la:pwd:clear:history:exit"
export HISTTIMEFORMAT="%F %T "

shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"

