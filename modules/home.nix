#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#
#****************************************************************#
# HOME MANAGER CONFIG (user: decky)
# АКТИВНЫЙ COMPOSITOR: Niri + Noctalia
# РЕЗЕРВ: Hyprland (закомментирован внизу)
#****************************************************************#
{ config, pkgs, inputs, ... }:

{
  home.username = "decky";
  home.homeDirectory = "/home/decky";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  #****************************************************************#
  # |============================================================| #
  # | ОБОИ (wallpapers из папки репозитория)                     | #
  # |============================================================| #
  # Положи обои в папку wallpapers/ рядом с flake.nix            #
  # Они скопируются в ~/Pictures/wallpapers автоматически         #
  #****************************************************************#
  home.file."Pictures/Wallpapers" = {
    source = ../Wallpapers;
    recursive = true;
  };

  #****************************************************************#
  # |============================================================| #
  # | NIRI CONFIG (config.kdl) — АКТИВНЫЙ                       | #
  # |============================================================| #
  # Терминал: Mod+T → vscodium                                    #
  # Reload shell: Ctrl+Super+Alt+R                                 #
  #****************************************************************#
  xdg.configFile."niri/config.kdl".text = ''
    input {
        keyboard {
            xkb {
                layout "us,ru"
                options "grp:win_space_toggle"
            }
            numlock
        }
        touchpad {
            tap
            natural-scroll
        }
        mouse {
        }
        focus-follows-mouse max-scroll-amount="0%"
    }

    layout {
        gaps 16
        center-focused-column "never"
        preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
        }
        default-column-width { proportion 1.0; }
        focus-ring {
            width 4
            active-color "#7fc8ff"
            inactive-color "#505050"
        }
        border {
            off
            width 4
            active-color "#ffc87f"
            inactive-color "#505050"
            urgent-color "#9b0000"
        }
        shadow {
            softness 30
            spread 5
            offset x=0 y=5
            color "#0007"
        }
        struts {
        }
    }

    hotkey-overlay {
    }

    screenshot-path "~/Pictures/Screenshots/from %Y-%m-%d %H-%M-%S.png"

    animations {
    }

    window-rule {
        match app-id=r#"firefox$"# title="^Picture-in-Picture$"
        open-floating true
    }

    // Steam Deck экран
    output "Valve Corporation ANX7530 U 0x00000001" {
        mode "1280x800@90.004"
        scale 1.0
        position x=0 y=0
    }

    spawn-at-startup "bash" "-c" "while true; do quickshell -p /etc/xdg/quickshell/noctalia-shell/shell.qml; sleep 2; done"

    binds {
        Mod+Shift+Slash { show-hotkey-overlay; }

        // === ТЕРМИНАЛ ===
        Mod+T hotkey-overlay-title="Open Terminal: vscodium" { spawn "codium"; }

        // === ПРИЛОЖЕНИЯ ===
        Mod+B { spawn "firefox"; }
        Mod+E { spawn "dolphin"; }
        Mod+D { spawn "vesktop"; }
        Mod+Z { spawn "ayugram-desktop"; }
        Mod+S { spawn-sh "quickshell ipc -p /etc/xdg/quickshell/noctalia-shell call launcher toggle"; }

        // === SHELL ===
        Mod+Shift+Escape { spawn-sh "quickshell ipc -p /etc/xdg/quickshell/noctalia-shell call sessionMenu toggle"; }

        // === RELOAD SHELL (аналог Hyprland Ctrl+Super+R) ===
        Ctrl+Mod+Alt+R { spawn-sh "pkill -f noctalia-shell; sleep 0.5; quickshell -p /etc/xdg/quickshell/noctalia-shell/shell.qml &"; }

        // === СКРИНШОТЫ ===
        Print { screenshot; }
        Ctrl+Print { screenshot-screen; }
        Alt+Print { screenshot-window; }

        // === ЗВУК ===
        XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"; }
        XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; }
        XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
        XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }

        // === МЕДИА ===
        XF86AudioPlay allow-when-locked=true { spawn-sh "playerctl play-pause"; }
        XF86AudioStop allow-when-locked=true { spawn-sh "playerctl stop"; }
        XF86AudioPrev allow-when-locked=true { spawn-sh "playerctl previous"; }
        XF86AudioNext allow-when-locked=true { spawn-sh "playerctl next"; }

        // === ЯРКОСТЬ ===
        XF86MonBrightnessUp   allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "+10%"; }
        XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "10%-"; }

        // === УПРАВЛЕНИЕ ОКНАМИ ===
        Mod+Q repeat=false { close-window; }
        Mod+F       { maximize-column; }
        Mod+Shift+F { fullscreen-window; }
        Mod+V       { toggle-window-floating; }
        Mod+Shift+V { switch-focus-between-floating-and-tiling; }
        Mod+C       { center-column; }
        Mod+Ctrl+C  { center-visible-columns; }
        Mod+Ctrl+F  { expand-column-to-available-width; }

        // === ФОКУС ===
        Mod+Left  { focus-column-left; }
        Mod+Right { focus-column-right; }
        Mod+Up    { focus-workspace-up; }
        Mod+Down  { focus-workspace-down; }
        Mod+H     { focus-column-left; }
        Mod+L     { focus-column-right; }
        Mod+J     { focus-window-down; }
        Mod+K     { focus-window-up; }

        // === ПЕРЕМЕЩЕНИЕ ===
        Mod+Ctrl+Left  { move-column-left; }
        Mod+Ctrl+Right { move-column-right; }
        Mod+Ctrl+Up    { move-window-up; }
        Mod+Ctrl+Down  { move-window-down; }
        Mod+Ctrl+H     { move-column-left; }
        Mod+Ctrl+L     { move-column-right; }
        Mod+Ctrl+J     { move-window-down; }
        Mod+Ctrl+K     { move-window-up; }

        // === РАЗМЕР ===
        Mod+Minus       { set-column-width "-10%"; }
        Mod+Equal       { set-column-width "+10%"; }
        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }
        Mod+R           { switch-preset-column-width; }
        Mod+Shift+R     { switch-preset-window-height; }
        Mod+Ctrl+R      { reset-window-height; }

        // === ВОРКСПЕЙСЫ ===
        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+Ctrl+1 { move-column-to-workspace 1; }
        Mod+Ctrl+2 { move-column-to-workspace 2; }
        Mod+Ctrl+3 { move-column-to-workspace 3; }
        Mod+Ctrl+4 { move-column-to-workspace 4; }
        Mod+Ctrl+5 { move-column-to-workspace 5; }

        Mod+U { focus-workspace-down; }
        Mod+I { focus-workspace-up; }
        Mod+Ctrl+U { move-column-to-workspace-down; }
        Mod+Ctrl+I { move-column-to-workspace-up; }

        // === OVERVIEW ===
        Mod+X repeat=false { toggle-overview; }
        Mod+O repeat=false { toggle-overview; }

        // === БЛОКИРОВКА ===
        Super+Alt+L { spawn "swaylock"; }

        // === WAYDROID ===
        Mod+A { spawn-sh "~/.local/bin/toggle-waydroid.sh"; }

        // === ВЫХОД ===
        Mod+Shift+E { quit; }
        Ctrl+Alt+Delete { quit; }
        Mod+Shift+P { power-off-monitors; }
        Mod+Space { switch-layout "next"; }

        // === СКРОЛЛ МЫШЬЮ ===
        Mod+WheelScrollDown      cooldown-ms=150 { focus-column-right; }
        Mod+WheelScrollUp        cooldown-ms=150 { focus-column-left; }
        Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
        Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

        Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }
    }
  '';

  # ================================================================
  # РЕЗЕРВ: HYPRLAND (не удалять!)
  # Чтобы переключиться на Hyprland:
  # 1. Закомментируй xdg.configFile."niri/config.kdl" выше
  # 2. Раскомментируй wayland.windowManager.hyprland ниже
  # 3. В system_base.nix: закомментируй programs.niri.enable
  #    раскомментируй programs.hyprland.enable
  # 4. В flake.nix: раскомментируй inputs.hyprland.nixosModules.default
  # ================================================================
  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   ... (конфиг Hyprland)
  # };
}
#****************************************************************#
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#
