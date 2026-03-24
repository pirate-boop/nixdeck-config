#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#
#****************************************************************#
{ config, pkgs, inputs, ... }:
#****************************************************************#

{
  imports = [
    ./hardware-configuration.nix   # Железо (генерится системой)
    
    
    ./modules/jovian-deck.nix      # Steam, Gamescope, OLED фиксы
    ./modules/decky.nix            # Decky Loader, PowerTools, права
    
    ./modules/waydroid.nix         # Waydroid
    ./modules/niri-custom.nix      # Noctalia сервис

    
    
    
    

    # исключенные из выбора
    # ./modules/system_apps.nix      # Софт, браузеры, терминалы
    # ./modules/aliases.nix          # Handbook и сокращения
    # ./modules/system-base.nix      # Сеть, локали, юзер, ядро
    # ./home.nix подключается через flake.nix (home-manager.users.kori)

    # --- EMERGENCY BACKUP SECTION (Keep commented) ---
    # ./modules/backups/old-configuration01/backup(old-configuration)-01.nix 
  ];
}
#****************************************************************#
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#
