#!/usr/bin/env bash
set -e

echo "=== NixDeck Setup ==="

# Интернет
echo "Настраиваем сеть..."
nmtui

# Клонируем конфиг
echo "Клонируем конфиг..."
sudo git clone https://github.com/pirate-boop/nixdeck-config /etc/nixos/flake

# Копируем железо
echo "Копируем hardware-configuration..."
sudo cp /etc/nixos/hardware-configuration.nix /etc/nixos/flake/hardware-configuration.nix

# Rebuild
echo "Собираем систему..."
sudo nixos-rebuild switch --flake /etc/nixos/flake#nixos

echo "Готово! Перезагружаемся..."
sudo reboot
