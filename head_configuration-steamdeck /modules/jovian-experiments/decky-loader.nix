{ pkgs, lib, ... }:
let
  sudo-wrapper = pkgs.writeShellScriptBin "sudo" ''
    exec /run/wrappers/bin/sudo "$@"
  '';
  decky-deps = with pkgs; [
    ffmpeg bc jq curl unzip nodejs coreutils ryzenadj pulseaudio sudo-wrapper
  ];
in {
  # ЯДРО DECKY
  jovian.decky-loader = {
    enable = true;
    user = "kori";
    stateDir = "/var/lib/decky-loader";
    extraPackages = decky-deps;
    extraPythonPackages = ps: with ps; [ aiohttp ];
  };

  # СИСТЕМНЫЕ ФИКСЫ (Лимиты и сеть)
  systemd.services.decky-loader.serviceConfig = {
    LimitNOFILE = 524288;
  };
  systemd.services.decky-loader.after = lib.mkForce [ "network-online.target" "systemd-resolved.service" ];
  systemd.services.decky-loader.wants = lib.mkForce [ "network-online.target" ];

  # Права на звук для Audio Loader
  users.groups.audio.members = [ "decky" ];

  # POWERTOOLS (Врапперы)
  security.wrappers.ryzenadj = {
    source = "${pkgs.ryzenadj}/bin/ryzenadj";
    capabilities = "cap_sys_admin+ep";
    owner = "root";
    group = "root";
  };

  # ПРАВИЛА SUDO ДЛЯ ПЛАГИНОВ
  security.sudo.extraRules = [{
    users = [ "decky" ];
    commands = [
      { command = "/run/wrappers/bin/ryzenadj"; options = [ "NOPASSWD" ]; }
      { command = "/usr/bin/ryzenadj"; options = [ "NOPASSWD" ]; }
      { command = "/var/lib/decky-loader/plugins/decky-clipboard/bin/xclip"; options = [ "NOPASSWD" ]; }
    ];
  }];

  # ПАПКИ ДЛЯ АНИМАЦИЙ И ЗВУКОВ
  system.activationScripts.decky-compat-fixes = {
    text = ''
      mkdir -p /usr/bin
      ln -sfn /run/wrappers/bin/ryzenadj /usr/bin/ryzenadj
      mkdir -p /home/decky/.local/share/Steam/config/uioverrides/movies
      mkdir -p /home/decky/.local/share/Steam/steamui/overrides/sounds
      chown -R decky:users /home/decky/.local/share/Steam/config/uioverrides || true
      chown -R decky:users /home/decky/.local/share/Steam/steamui/overrides || true
    '';
  };
}
