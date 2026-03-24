{ pkgs, ... }:
with pkgs; [
  firefox     # Лисица, открытый
  chromium    # Хром без Google
  brave       # Chromium с блокировкой рекламы
  vivaldi     # Chromium с кучей фич
  tor-browser # Анонимность
]
