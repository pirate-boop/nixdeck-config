{ config, pkgs, inputs, ... }:

{
  imports = [
    ./networking.nix        # Хостнейм и сеть 
    ./localization.nix      # Часовой пояс и локали
    ./nixos-settings.nix    # Флейки, NUR и stateVersion
    ./hardware-services.nix # Звук, графика, ввод
    ./users.nix             # Юзер kori и группы
    ./shell.nix             # Конфиг ZSH
    ./programs.nix          # Steam и Niri
    ./virtualization.nix    # Libvirtd
  ];
}
