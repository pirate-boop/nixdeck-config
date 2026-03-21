{ config, pkgs, ... }:

{
  programs.zsh.shellAliases = {
    # ============================================================
    # ALISA'S HANDBOOK (Информационная панель)
    # ============================================================
    alisa = "echo -e '\n\e[1;32m=== ALISA HANDBOOK (by Decky) ===\e[0m\n\e[1;34mNix Configuration:\e[0m\nrebuild        \t- Apply flake configuration\nnixos_rebuild  \t- Pull from GitHub and rebuild\nnconf          \t- Edit config in Kate (sudo)\nbnconf         \t- Create config backup (.bak)\ntodlnconf      \t- Copy config to Downloads\nfromdlnconf    \t- Restore config from Downloads\ngc             \t- Garbage collect & optimize store\ngcgen          \t- Radical cleanup (remove old generations)\n\n\e[1;34mSystem & Utils:\e[0m\nll             \t- Detailed file list (folders first)\nfetch          \t- Show system info (fastfetch)\nsysinfo        \t- Open Task Manager (Mission Center)\n\e[1;32m=================================\e[0m\n'";

    # ============================================================#
    # РАБОТА С ФАЙЛАМИ NIX (Пути под Flake) GITHUB                #
    # ============================================================#
    nixos_rebuild = "cd /etc/nixos/flake && sudo git pull && sudo nixos-rebuild switch --flake /etc/nixos/flake#nixos";
    # ============================================================
    # РАБОТА С ФАЙЛАМИ NIX (Пути под Flake)
    # ============================================================
    rebuild = "sudo nixos-rebuild switch --flake /etc/nixos/flake#nixos";
    nconf   = "sudo kate /etc/nixos/flake/configuration.nix";
    bnconf  = "sudo cp /etc/nixos/flake/configuration.nix /etc/nixos/flake/configuration.nix.bak";

    # Резервное копирование в Downloads (используем $HOME для универсальности)
    todlnconf   = "cp /etc/nixos/flake/configuration.nix $HOME/Downloads/configuration.nix";
    fromdlnconf = "sudo cp $HOME/Downloads/configuration.nix /etc/nixos/flake/configuration.nix";

    # ============================================================
    # ОЧИСТКА СИСТЕМЫ
    # ============================================================
    # Обычная чистка (1 день)
    gc = "sudo nix-collect-garbage --delete-older-than 1d && sudo nix-store --optimize";

    # Радикальная очистка (удаляет всё старое из меню загрузки)
    gcgen = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && sudo nix-collect-garbage -d && sudo nix-store --optimize";

    # ============================================================
    # УТИЛИТЫ
    # ============================================================
    ll      = "ls -la --group-directories-first";
    fetch   = "fastfetch";
    sysinfo = "mission-center";
  };
}
