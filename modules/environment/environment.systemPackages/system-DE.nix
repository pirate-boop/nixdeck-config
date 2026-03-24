{ pkgs, inputs, ... }:
with pkgs; [
  inputs.noctalia.packages.${system}.default
  # Сюда пиши остальные DE-пакеты, если есть
]
