{ config, pkgs, ... }:

{
  xdg.mime.enable = true;
  xdg.mime.defaultApplications = {
    # Самые ходовые архивы
    "application/zip" = [ "org.kde.ark.desktop" ];
    "application/x-7z-compressed" = [ "org.kde.ark.desktop" ];
    "application/x-rar" = [ "org.kde.ark.desktop" ];
    "application/x-tar" = [ "org.kde.ark.desktop" ];
    
    # Сжатые Linux-архивы
    "application/x-gzip" = [ "org.kde.ark.desktop" ];
    "application/x-bzip2" = [ "org.kde.ark.desktop" ];
    "application/x-xz" = [ "org.kde.ark.desktop" ];
    
    # Образы и прочее
    "application/x-iso9660-image" = [ "org.kde.ark.desktop" ];
  };
}
