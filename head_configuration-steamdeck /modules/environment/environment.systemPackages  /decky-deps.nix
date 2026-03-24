{ pkgs, inputs, ... }:
with pkgs; [
  ffmpeg
  bc
  jq
  curl
  unzip
  nodejs
  coreutils
  ryzenadj
  pulseaudio
  sudo-wrapper
]
