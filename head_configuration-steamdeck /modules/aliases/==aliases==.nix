{ config, pkgs, ... }:

{
  imports = [
    ./nix-management.nix
    ./system-util.nix
    ./info-panel.nix
  ];
}
