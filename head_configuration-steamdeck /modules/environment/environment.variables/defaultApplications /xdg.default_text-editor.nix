{ config, pkgs, ... }:

{
  xdg.mime.enable = true;
  xdg.mime.defaultApplications = {
    # Текстовые файлы и логи
    "text/plain" = [ "org.kde.kate.desktop" ];
    "text/markdown" = [ "org.kde.kate.desktop" ];
    
    # Конфиги и код (чтобы не ждать запуска Codium ради одной строки)
    "text/x-nix" = [ "org.kde.kate.desktop" ];
    "text/x-shellscript" = [ "org.kde.kate.desktop" ];
    "application/x-yaml" = [ "org.kde.kate.desktop" ];
    "application/json" = [ "org.kde.kate.desktop" ];
    
    # Системные и пустые файлы
    "application/x-zerosize" = [ "org.kde.kate.desktop" ];
  };
}
