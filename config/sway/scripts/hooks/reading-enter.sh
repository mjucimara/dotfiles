#!/usr/bin/env bash
command -v brightnessctl >/dev/null && brightnessctl set 30% || true
command -v makoctl >/dev/null && makoctl set-mode do-not-disturb || true
