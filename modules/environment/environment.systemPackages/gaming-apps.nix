{ pkgs, inputs, ... }:
with pkgs; [
  # steam                  # Digital distribution platform
  lutris                   # Open Source gaming platform for GNU/Linux
  heroic                   # Native GOG, Epic, and Amazon Games Launcher for Linux, Windows and Mac
  mangohud                 # Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more
  protonup-qt              # Install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris with this graphical user interface
  bottles                  # Easy-to-use wineprefix manager
  wineWow64Packages.stable # Open Source implementation of the Windows API on top of X, OpenGL, and Unix
  protontricks             # Simple wrapper for running Winetricks commands for Proton-enabled games
]
