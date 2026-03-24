{ config, pkgs, ... }:

{
  programs.zsh.shellAliases = {
    nixos_rebuild = "sudo git -C /etc/nixos/flake config core.editor nano && sudo git config --global --add safe.directory /etc/nixos/flake && cd /etc/nixos/flake && sudo git pull && sudo nixos-rebuild switch --flake /etc/nixos/flake#NIXDECK";
    rebuild       = "sudo nixos-rebuild switch --flake /etc/nixos/flake#NIXDECK";
    nconf         = "sudo kate /etc/nixos/flake/configuration.nix";
    bnconf        = "sudo cp /etc/nixos/flake/configuration.nix /etc/nixos/flake/configuration.nix.bak";
    todlnconf     = "cp /etc/nixos/flake/configuration.nix $HOME/Downloads/configuration.nix";
    fromdlnconf   = "sudo cp $HOME/Downloads/configuration.nix /etc/nixos/flake/configuration.nix";
  };
}
