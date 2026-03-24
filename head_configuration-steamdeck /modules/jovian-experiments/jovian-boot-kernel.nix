#****************************************************************#
# |============================================================| #
# | BOOTLOADER & KERNEL                                        | #
# |============================================================| #
#****************************************************************#
{ pkgs, ... }: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_jovian;
  boot.kernel.sysctl."fs.inotify.max_user_watches" = 524288;

  # Фикс отвала Qualcomm ath11k при переходе в сон
  powerManagement.enable = true;
  powerManagement.powerDownCommands = "${pkgs.kmod}/bin/modprobe -r ath11k_pci || true";
  powerManagement.resumeCommands = "${pkgs.kmod}/bin/modprobe ath11k_pci || true";

  # JOVIAN HARDWARE SUPPORT
  jovian.devices.steamdeck.enable = true;
  jovian.devices.steamdeck.enableVendorDrivers = true;

  # AMD GPU Твики
  jovian.hardware.has.amd.gpu = true;
  jovian.hardware.amd.gpu.enableBacklightControl = true;
  jovian.hardware.amd.gpu.enableEarlyModesetting = true;
}
