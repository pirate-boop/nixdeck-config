#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#
#****************************************************************#
{ config, pkgs, lib, ... }:
#****************************************************************#

{
  # 1. ОСНОВНОЙ СЕРВИС
  virtualisation.waydroid.enable = true;

  # 2. ТУЛЗЫ (Добавляем сам скрипт)
  environment.systemPackages = with pkgs; [
    pkgs.waydroid-script
  ];

  # 3. СЕТЕВОЙ МОСТ
  networking.firewall.trustedInterfaces = [ "waydroid0" ];

  # 4. АЛИАСЫ ДЛЯ УПРАВЛЕНИЯ И МОДДИНГА
  programs.zsh.shellAliases = {
    # Шпаргалка по установке
    waydroid-setup = ''
      echo -e "\n\e[1;34m[ WAYDROID FIRST RUN ]\e[0m"
      echo -e "1. \e[32msudo waydroid init\e[0m — Скачать образы"
      echo -e "2. \e[32msudo systemctl start waydroid-container\e[0m — Запустить движок"
      echo -e "3. \e[32mwaydroid-mods\e[0m — Посмотреть список модификаций (DRM, GApps, ARM)\n"
    '';

    # Шпаргалка по параметрам скрипта (DRM, GApps, Magisk)
    waydroid-mods = ''
      echo -e "\n\e[1;35m[ WAYDROID MODIFICATION PARAMETERS ]\e[0m"
      echo -e "\e[1;31mUsage:\e[0m sudo waydroid-script install [parameter]"
      echo -e "----------------------------------------------------"
      echo -e "\e[32mwidevine\e[0m  — \e[1;33mFIX DRM\e[0m (Netflix, Disney+, Кинопоиск)"
      echo -e "\e[32mlibndk\e[0m    — ARM-трансляция (нужна для 99% игр)"
      echo -e "\e[32mgapps\e[0m     — Google Services & Play Store"
      echo -e "\e[32mmagisk\e[0m    — Root-права (через Magisk Delta)"
      echo -e "\e[32m- - - - - - - - - - - - - - - - - - - - - - - - - - \e[0m"
      echo -e "\e[1;34mПример:\e[0m sudo waydroid-script install widevine\n"
    '';
  };
}
   #****************************************************************#
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#
