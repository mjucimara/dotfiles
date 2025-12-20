#!/usr/bin/env bash
set -euo pipefail

echo "▶ Bootstrap .dotfiles (host)"

# -----------------------------
# Flatpak + Flathub
# -----------------------------
echo "▶ Verificando Flathub"
if ! flatpak remote-list | grep -q flathub; then
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

# -----------------------------
# VS Code (Flatpak)
# -----------------------------
echo "▶ Verificando VS Code"
if ! flatpak list | grep -q com.visualstudio.code; then
  flatpak install -y flathub com.visualstudio.code
fi

flatpak override --user \
  --filesystem=home \
  --filesystem=/run/user/$(id -u)/podman \
  com.visualstudio.code

# -----------------------------
# Podman rootless
# -----------------------------
echo "▶ Ativando Podman socket"
systemctl --user enable --now podman.socket

# -----------------------------
# Toolboxes (com timeout)
# -----------------------------
BASE_IMAGE="registry.fedoraproject.org/fedora-toolbox:latest"
TOOLBOX_TIMEOUT="5m"

for tb in toolbox-automation toolbox-api toolbox-data; do
  if toolbox list | grep -q "$tb"; then
    echo "✔ Toolbox já existe: $tb"
  else
    echo "▶ Criando toolbox: $tb (timeout: $TOOLBOX_TIMEOUT)"
    if ! timeout "$TOOLBOX_TIMEOUT" toolbox create --image "$BASE_IMAGE" "$tb"; then
      echo "❌ Timeout ao criar toolbox: $tb"
      echo "   Verifique rede, registry ou estado do Podman."
      exit 1
    fi
  fi
done

echo "✅ Bootstrap concluído"
