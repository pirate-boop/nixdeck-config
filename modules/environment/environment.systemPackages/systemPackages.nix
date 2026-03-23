{ pkgs, ... }:
let
  # Импортируем списки прямо тут, иначе environment.systemPackages их не увидит
  decky-deps     = import ./decky-deps.nix     { inherit pkgs; };
  terminal-apps  = import ./terminals.nix      { inherit pkgs; };
  browser-apps   = import ./browsers.nix       { inherit pkgs; };
  social-apps    = import ./social.nix         { inherit pkgs; };
  media-apps     = import ./media.nix          { inherit pkgs; };
  kde-tools      = import ./kde-tools.nix      { inherit pkgs; };
  gaming-apps    = import ./gaming.nix         { inherit pkgs; };
  virt-tools     = import ./virt.nix           { inherit pkgs; };
  system-tools   = import ./system-tools.nix   { inherit pkgs; };
  system-DE      = import ./system-DE.nix      { inherit pkgs; };
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
