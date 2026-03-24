{ config, pkgs, inputs, ... }:

{
  imports = [
    # # Одной строкой подключаем всё ядро системы
    ./modules/core/==system_core==.nix
    # ...

    # Блок ассоциаций приложений (XDG)
    ./head_configuration-steamdeck/modules/environment/environment.variables/defaultApplications/==defaultApplications==.nix # Приложения по умолчанию

    # Остальной софт и настройки
    ./modules/environment/environment.systemPackages/==systemPackages==.nix                                                  # Софт, браузеры, терминалы 
    ./modules/environment/environment.variables/aliases/==aliases==.nix                                                      # Handbook и сокращения
  ];
}
