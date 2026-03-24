{ pkgs, inputs, ... }:
with pkgs; [
  wget
  git
  htop
  fastfetch
  mission-center
  # --- Терминалы ---
  vscodium
  inputs.nur.legacyPackages.${pkgs.system}.repos.nakido.tabby
  # ghostty
  # alacritty
  # kitty
  wezterm
  # foot
  # tilix
  # terminator
]
