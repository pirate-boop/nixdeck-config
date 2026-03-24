{ ... }: {
  programs.steam = {
    enable = true;
    extest.enable = true;
  };
  
  programs.niri.enable = true;
  
  # Если решишь оживить Hyprland, он тоже пойдет сюда
  # programs.hyprland.enable = true;
}
