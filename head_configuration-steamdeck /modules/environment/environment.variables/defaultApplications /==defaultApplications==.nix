{ config, pkgs, ... }:

{
  imports = [
    ./xdg.default_archive.nix      # Ark для архивов [cite: 47]
    ./xdg.default_file_explorer.nix # Thunar для папок [cite: 51]
    ./xdg.default_pictures.nix      # Loupe для фото 
    ./xdg.default_text-editor.nix   # Kate для текста 
    ./xdg.default_video.nix         # VLC для видео 
    ./xdg.default_browser.nix       # Пустой шаблон под Opera
  ];
}
