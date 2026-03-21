#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#
#****************************************************************#
{ config, pkgs, inputs, ... }:
#****************************************************************#

{
  imports = [
    ./hardware-configuration.nix   # Железо (генерится системой)
    ./modules/system-base.nix      # Сеть, локали, юзер, ядро
    ./modules/system_apps.nix      # Софт, Noctalia, Tabby
    ./modules/jovian-deck.nix      # Steam, Gamescope, OLED фиксы
    ./modules/decky.nix           # Decky Loader, PowerTools, права
    ./modules/aliases.nix         # Handbook и сокращения
    ./modules/waydroid.nix        # Waydroid
    ./modules/niri-custom.nix     # user.conf.kdl
  ];

  # Здесь можно оставить только то, что лень выносить в модули
  # или глобальные настройки, которые не вписались в категории.
}
#****************************************************************#
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#
