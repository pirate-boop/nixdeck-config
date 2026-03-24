{ inputs, ... }: {
  nixpkgs.config.allowUnfree = true; [cite: 56]
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; [cite: 56]
  nixpkgs.overlays = [ inputs.nur.overlays.default ]; [cite: 57]
  system.stateVersion = "25.11";
}
