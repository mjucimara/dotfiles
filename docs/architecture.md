# Arquitetura

Este repositório segue princípios simples e explícitos.

## Separação de responsabilidades
- bin/: comandos executáveis
- config/: comportamento do sistema
- docs/: decisões e uso
- scripts/: manutenção

## Shell
O shell é camada de orquestração. Configuração customizada vive em ~/.config/shell.

## Host vs Toolbox
Scripts são conscientes do ambiente:
- host
- flatpak
- toolbox

## Objetivo
- Reinstalações triviais
- Ambiente compreensível
- Mudanças rastreáveis via Git
