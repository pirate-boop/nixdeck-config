{ config, pkgs, ... }:

{
  programs.zsh.shellAliases = {
    alisa = "echo -e '\n\e[1;32m=== ALISA HANDBOOK (by Decky) ===\e[0m\n\e[1;34mNix Configuration:\e[0m\nrebuild        \t- Apply flake configuration\nnixos_rebuild  \t- Pull from GitHub and rebuild\nnconf          \t- Edit config in Kate (sudo)\nbnconf         \t- Create config backup (.bak)\ntodlnconf      \t- Copy config to Downloads\nfromdlnconf    \t- Restore config from Downloads\ngc             \t- Garbage collect & optimize store\ngcgen          \t- Radical cleanup (remove old generations)\n\n\e[1;34mSystem & Utils:\e[0m\nll             \t- Detailed file list (folders first)\nfetch          \t- Show system info (fastfetch)\nsysinfo        \t- Open Task Manager (Mission Center)\n\e[1;32m=================================\e[0m\n'";
  };
}
