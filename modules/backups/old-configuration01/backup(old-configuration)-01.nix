{ config, pkgs, inputs, ... }:

{
  imports = [
    # Пути ведут в папку nixdeck-config/modules, которая лежит рядом
    ./nixdeck-config/modules/system_apps.nix
    ./nixdeck-config/modules/aliases.nix
    # Добавь сюда остальные старые файлы из той папки, если они нужны
  ];
}
