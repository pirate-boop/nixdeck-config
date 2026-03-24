{ pkgs, inputs, ... }:
let
  # ВАЖНО: Пути должны в точности совпадать с именами файлов в папке environment.systemPackages
  decky-deps    = import ./decky-deps.nix    { inherit pkgs inputs; };
  terminal-apps = import ./terminal-app.nix  { inherit pkgs inputs; };
  browser-apps  = import ./browser-apps.nix  { inherit pkgs inputs; };
  social-apps   = import ./social-apps.nix   { inherit pkgs inputs; };
  media-apps    = import ./media-apps.nix    { inherit pkgs inputs; };
  kde-tools     = import ./kde-tools.nix     { inherit pkgs inputs; };
  gaming-apps   = import ./gaming-apps.nix   { inherit pkgs inputs; };
  virt-tools    = import ./virt-tools.nix    { inherit pkgs inputs; };
  system-tools  = import ./system-tools.nix  { inherit pkgs inputs; };
  system-DE     = import ./system-DE.nix     { inherit pkgs inputs; };
in
{
  environment.systemPackages = 
    decky-deps ++ 
    terminal-apps ++ 
    browser-apps ++ 
    social-apps ++ 
    media-apps ++ 
    kde-tools ++ 
    gaming-apps ++ 
    virt-tools ++ 
    system-tools ++ 
    system-DE;
}
