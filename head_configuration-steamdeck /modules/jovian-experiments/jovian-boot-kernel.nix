#****************************************************************#
# |============================================================| #
# | BOOTLOADER & KERNEL                                        | #
# |============================================================| #
#****************************************************************#
{ pkgs, ... }: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Специальное ядро Jovian с патчами от Valve
  boot.kernelPackages = pkgs.linuxPackages_jovian; 
  
  # Твик для Inotify (чтобы игры не вылетали при нехватке лимитов на файлы)
  boot.kernel.sysctl."fs.inotify.max_user_watches" = 524288;
  
  # Фикс отвала Wi-Fi на OLED при пробуждении
  powerManagement.enable = true;
}
