{ pkgs, ... }:
decky-deps = with pkgs; [
    ffmpeg
    bc
    jq
    curl
    unzip
    nodejs
    coreutils
    ryzenadj
    pulseaudio
  ];
