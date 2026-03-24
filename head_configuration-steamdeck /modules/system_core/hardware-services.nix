{ pkgs, lib, ... }: {
  services.pipewire.wireplumber.package = lib.mkForce pkgs.wireplumber-jupiter;
  security.rtkit.enable = true;
  services.pipewire.jack.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.seatd.enable = true;
  services.inputplumber.enable = true;
  hardware.steam-hardware.enable = true;
  services.acpid.enable = true;
}
