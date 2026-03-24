{ config, pkgs, ... }:

{
  programs.zsh.shellAliases = {
    # Очистка
    gc    = "sudo nix-collect-garbage --delete-older-than 1d && sudo nix-store --optimize";
    gcgen = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && sudo nix-collect-garbage -d && sudo nix-store --optimize";

    # Утилиты
    ll      = "ls -la --group-directories-first";
    fetch   = "fastfetch";
    sysinfo = "mission-center";
  };
}
