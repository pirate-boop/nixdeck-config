{ pkgs, ... }:
let
  sudo-wrapper = pkgs.writeShellScriptBin "sudo" ''
    exec /run/wrappers/bin/sudo "$@"
  '';
  decky-deps = with pkgs; [
    ffmpeg bc jq curl unzip nodejs coreutils ryzenadj pulseaudio sudo-wrapper
  ];
in {
  jovian.decky-loader = {
    enable = true;
    user = "kori";
    stateDir = "/var/lib/decky-loader";
    extraPackages = decky-deps;
  };

  # Воссоздаем структуру SteamOS для плагинов (Animation/Audio Changer)
  system.activationScripts.decky-compat-fixes = {
    text = ''
      mkdir -p /usr/bin
      ln -sfn /run/wrappers/bin/ryzenadj /usr/bin/ryzenadj
      mkdir -p /home/kori/.local/share/Steam/config/uioverrides/movies
      mkdir -p /home/kori/.local/share/Steam/steamui/overrides/sounds
      chown -R kori:users /home/kori/.local/share/Steam/config/uioverrides || true
      chown -R kori:users /home/kori/.local/share/Steam/steamui/overrides || true
    '';
  };
}
