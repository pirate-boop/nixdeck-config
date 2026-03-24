{ config, pkgs, ... }:

{
  xdg.mime.enable = true;
  xdg.mime.defaultApplications = {
    # Основные видео-контейнеры
    "video/mp4" = [ "vlc.desktop" ];
    "video/x-matroska" = [ "vlc.desktop" ];
    "video/webm" = [ "vlc.desktop" ];
    "video/x-flv" = [ "vlc.desktop" ];
    "video/quicktime" = [ "vlc.desktop" ]; # .mov файлы
    
    # Стриминговые и прочие форматы
    "video/mpeg" = [ "vlc.desktop" ];
    "video/ogg" = [ "vlc.desktop" ];
    "video/x-msvideo" = [ "vlc.desktop" ]; # .avi файлы
    "video/x-flic" = [ "vlc.desktop" ];
  };
}
