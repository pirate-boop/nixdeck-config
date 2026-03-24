{ pkgs, ... }:
with pkgs; [
  virt-manager # Desktop user interface for managing virtual machines
  distrobox    # Wrapper around podman or docker to create and start containers
  qemu         # Generic and open source machine emulator and virtualizer
]
