#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#
#****************************************************************#
{ config, pkgs, inputs, ... }:
#****************************************************************#

{
  imports = [
    ./hardware-configuration.nix   # Железо (генерится системой)
    ./modules/system-base.nix      # Сеть, локали, юзер, ядро
    
    ./modules/jovian-deck.nix      # Steam, Gamescope, OLED фиксы
    ./modules/decky.nix            # Decky Loader, PowerTools, права
    
    ./modules/waydroid.nix         # Waydroid
    ./modules/niri-custom.nix      # Noctalia сервис

    ./modules/environment/environment.systemPackages/==systemPackages==.nix

    #./modules/environment/environment.systemPackages/HEADsystemPackages.nix
    #./modules/environment/environment.systemPackages/systemPackages.nix
    # home.nix подключается через flake.nix (home-manager.users.decky)

    # исключенные из выбора
    # ./modules/system_apps.nix      # Софт, браузеры, терминалы
    # ./modules/aliases.nix          # Handbook и сокращения
  ];
}
#****************************************************************#
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#
