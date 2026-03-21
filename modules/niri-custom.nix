#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#
#****************************************************************#
{ config, pkgs, inputs, ... }:
#****************************************************************#

{
  # 1. БЕССМЕРТНЫЙ СЕРВИС NOCTALIA
  systemd.user.services.noctalia-shell = {
    unitConfig = {
      Description = "Noctalia UI Shell Watchdog";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };

    serviceConfig = {
      ExecStart = "${inputs.noctalia.packages.${pkgs.system}.default}/bin/noctalia-shell";
      Restart = "always";
      RestartSec = "1";
      StartLimitIntervalSec = 10;
      StartLimitBurst = 5;
    };

    installConfig = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  # 2. КОНФИГ NIRI — управляется через home-manager (modules/home.nix)
  # xdg.configFile."niri/config.kdl" задан там
}
#****************************************************************#
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#
