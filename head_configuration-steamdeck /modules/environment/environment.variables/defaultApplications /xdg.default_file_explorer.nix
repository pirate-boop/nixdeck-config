{ config, pkgs, ... }:

{
  xdg.mime.enable = true;
  xdg.mime.defaultApplications = {
    # Основной запуск папок
    "inode/directory" = [ "thunar.desktop" ];
    
    # Обработка поиска и специфических путей
    "x-scheme-handler/file" = [ "thunar.desktop" ];
    "x-scheme-handler/trash" = [ "thunar.desktop" ];
  };
}
