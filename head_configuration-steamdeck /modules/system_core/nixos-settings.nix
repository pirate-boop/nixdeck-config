{ inputs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.overlays = [ inputs.nur.overlays.default ];
  system.stateVersion = "25.11";
}
