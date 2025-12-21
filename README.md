# dotfiles

Dotfiles pessoais para Linux, focados em reprodutibilidade, organização XDG
e workflows previsíveis com toolbox/podman.

Este repositório existe para tornar reinstalações **entediantes, repetíveis e auditáveis**.

## Características
- Organização XDG limpa (`~/.config`)
- Shell modular (bash e zsh)
- Integração transparente host ↔ toolbox
- Comandos utilitários versionados (`bin/`)
- Documentação separada de configuração
- Templates de projetos mantidos fora do controle de versão

## Estrutura do repositório

| Caminho     | Descrição |
|------------|-----------|
| `bin/`     | Comandos pessoais no PATH |
| `config/`  | Configurações versionadas (`~/.config`) |
| `docs/`    | Documentação, decisões e filosofia |
| `scripts/` | Bootstrap, manutenção e automação |
| `archives/`| Snapshots locais (não versionados) |
| `templates/` | Workspace de templates (não versionado) |

## O que NÃO é versionado
- Templates de projetos em evolução
- Snapshots locais e históricos
- Cache, logs e arquivos temporários
- Segredos ou credenciais

Esses itens são explicitamente ignorados via `.gitignore`.

## Uso básico

```bash
git clone <repo> ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
