{ pkgs, inputs, ... }:
with pkgs; [
  wget
  git
  htop
  fastfetch
  mission-center
  # --- Терминалы ---
  vscodium
  nur.repos.nakido.tabby
  # ghostty
  # alacritty
  # kitty
  wezterm
  # foot
  # tilix
  # terminator
]
