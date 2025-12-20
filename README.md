# dotfiles

Dotfiles pessoais para Linux, focados em reprodutibilidade, organização XDG
e workflows com toolbox/podman.

Este repositório existe para tornar reinstalações entediantes e previsíveis.

## Principais características
- Organização XDG limpa (~/.config)
- Shell modular (bash e zsh)
- Integração transparente host ↔ toolbox
- Scripts utilitários versionados (bin/)
- Documentação separada do código
- Templates de projetos desacoplados do ambiente

## Estrutura
bin/        # comandos no PATH
config/     # configurações versionadas
docs/       # documentação e manuais
scripts/    # manutenção e automação

## Filosofia
- Prefira soluções simples e previsíveis
- Separe código, configuração e documentação
- Evite abstrações “espertas”
- Facilite rollback e auditoria

## Requisitos
- Linux
- bash ou zsh
- git
- podman/toolbox (opcional)

## Licença
MIT
