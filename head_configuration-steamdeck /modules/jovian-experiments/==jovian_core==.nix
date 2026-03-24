{ config, pkgs, lib, ... }:

{
  imports = [
    ./jovian-boot-kernel.nix
    ./jovian-steamos-ui.nix
    ./jovian-optimization.nix
    ./decky-loader.nix
  ];
}
