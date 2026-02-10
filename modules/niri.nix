{
  config,
  pkgs,
  lib,
  # vars,
  # inputs,
  ...
}: let
  isCenturia = true;
  layoutConfig = "us";

  standardBezier = {
    curve = "cubic-bezier";
    duration-ms = 324;
    curve-args = [
      0.20
      1.0
      0.20
      1.0
    ];
  };
in {
  programs.niri = {
    settings = {
      input = {
        keyboard = {
          xkb = {
            layout = layoutConfig;
            options = "caps:swapescape";
          };
          repeat-delay = 600;
          repeat-rate = 25;
          track-layout = "global";
          numlock = true;
        };

        touchpad = {
          tap = true;
          dwt = true;
          natural-scroll = true;
          accel-speed = 0.1;
          accel-profile = "adaptive";
          scroll-method = "two-finger";
        };

        mouse = {
          accel-speed = -0.5;
        };

        warp-mouse-to-focus.enable = true;
        workspace-auto-back-and-forth = true;

        mod-key = "Super";
        mod-key-nested = "Alt";
      };

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      prefer-no-csd = true;
      overview = {
        workspace-shadow = {
          softness = 30;
          spread = 30;
        };
      };

      outputs = {
        "Virtual-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.0;
          };
          scale = 1.5;
          position = {
            x = 0;
            y = 0;
          };
          transform = {
            rotation = 0;
            flipped = false;
          };
        };
      };

      layout = {
        gaps = 12;

        shadow = {
          enable = true;
          spread = 3;
          softness = 3;
        };

        border = {
          enable = true;
          width = 4;
          active.color = "#4040A0";
          # active.color = "#404040";
          inactive.color = "#242424";
        };

        focus-ring.enable = false;

        default-column-width = {
          proportion = 0.5;
        };

        preset-column-widths = [
          {proportion = 0.25;}
          {proportion = 0.5;}
          {proportion = 0.75;}
        ];

        center-focused-column = "never";
      };

      environment = {
        "NIXOS_OZONE_WL" = "1";
        "DISPLAY" = ":0";
      };

      hotkey-overlay.skip-at-startup = true;

      binds = let
        dms = args: {
          action.spawn =
            [
              "dms"
              "ipc"
              "call"
            ]
            ++ args;
        };
        sh = cmd: {action.spawn-sh = cmd;};
      in
        {
          "Ctrl+Alt+A" = dms [
            "dash"
            "toggle"
            "overview"
          ];
          "Ctrl+Alt+C" = dms [
            "control-center"
            "toggle"
          ];
          "Ctrl+Alt+D" = dms [
            "dash"
            "toggle"
            "media"
          ];
          "Ctrl+Alt+L" = dms [
            "wallpaper"
            "next"
          ];
          "Ctrl+Alt+S" = dms [
            "powermenu"
            "toggle"
          ];
          "Ctrl+Alt+W" = dms [
            "dankdash"
            "wallpaper"
          ];

          "Mod+0".action.focus-workspace = 10;
          "Mod+1".action.focus-workspace = 1;
          "Mod+2".action.focus-workspace = 2;
          "Mod+3".action.focus-workspace = 3;
          "Mod+4".action.focus-workspace = 4;
          "Mod+5".action.focus-workspace = 5;
          "Mod+6".action.focus-workspace = 6;
          "Mod+7".action.focus-workspace = 7;
          "Mod+8".action.focus-workspace = 8;
          "Mod+9".action.focus-workspace = 9;

          "Mod+B" = sh "foot -e ~/Music/music.sh";
          "Mod+BracketLeft".action.consume-or-expel-window-left = [];
          "Mod+BracketRight".action.consume-or-expel-window-right = [];
          "Mod+C".action.center-column = [];
          "Mod+F".action.maximize-column = [];
          "Mod+Left".action.focus-column-left = [];
          "Mod+H".action.focus-column-left = [];
          "Mod+Down".action.focus-window-or-workspace-down = [];
          "Mod+J".action.focus-window-or-workspace-down = [];
          "Mod+Up".action.focus-window-or-workspace-up = [];
          "Mod+K".action.focus-window-or-workspace-up = [];
          "Mod+Right".action.focus-column-right = [];
          "Mod+L".action.focus-column-right = [];
          "Mod+M" = dms [
            "processlist"
            "toggle"
          ];
          "Mod+N" = dms [
            "notifications"
            "toggle"
          ];
          "Mod+P" = sh "wl-mirror $(niri msg --json focused-output | jq -r .name)";
          "Mod+R".action.switch-preset-column-width-back = [];

          "Mod+Return".action.spawn = "alacritty";
          "Mod+Shift+C".action.center-visible-columns = [];
          "Mod+Shift+F".action.fullscreen-window = [];
          "Mod+Shift+H".action.move-column-left = [];
          "Mod+Shift+J".action.move-column-to-workspace-down = [];
          "Mod+Shift+K".action.move-column-to-workspace-up = [];
          "Mod+Shift+L".action.move-column-right = [];
          "Mod+Shift+R".action.switch-preset-column-width = [];

          "Mod+Space" = dms [
            "spotlight"
            "toggle"
          ];
          "Mod+Tab".action.toggle-overview = [];
          "Mod+V" = dms [
            "clipboard"
            "toggle"
          ];
          "Mod+W".action.close-window = [];
          "Mod+Y" = sh "alacritty -e yazi";
          "Print".action.screenshot = [];

          "XF86AudioLowerVolume" =
            sh "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-; dms ipc call audio increment 0";
          "XF86AudioMute" = dms [
            "audio"
            "mute"
          ];
          "XF86AudioPlay" = dms [
            "mpris"
            "playPause"
          ];
          "XF86AudioRaiseVolume" =
            sh "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+; dms ipc call audio increment 0";
          "XF86MonBrightnessDown" = dms [
            "brightness"
            "decrement"
            "5"
            ""
          ];
          "XF86MonBrightnessUp" = dms [
            "brightness"
            "increment"
            "5"
            ""
          ];
        }
        // lib.optionalAttrs isCenturia {
          "Ctrl+Alt+K".action.switch-layout = "next";
        };

      animations = {
        slowdown = 1.0;

        workspace-switch.kind.easing = standardBezier;
        window-open.kind.easing = standardBezier;
        window-close.kind.easing = standardBezier;
        horizontal-view-movement.kind.easing = standardBezier;
        window-movement.kind.easing = standardBezier;
        window-resize.kind.easing = standardBezier;
        overview-open-close.kind.easing = standardBezier;
        config-notification-open-close.kind.easing = standardBezier;
        exit-confirmation-open-close.kind.easing = standardBezier;
        screenshot-ui-open.kind.easing = standardBezier;
      };
    };
  };
}
# let
# monitors = [
#   "DP-1,1920x1080@60,0x0,1.5,bitdepth,10"
#   # "DP-2,3840x2160@144,0x0,1.5,transform,1,bitdepth,10"
#   # "DP-3, disable"
#   # "HDMI-A-1,1920x1080@60, 0x0, 1, mirror, DP-1"
# ];
# spawnApp = app:
#   if
#     builtins.elem app [
#       "nvim"
#       "yazi"
#       "ranger"
#     ]
#   then [
#     "alacritty"
#     "-e"
#     app
#   ]
#   else [app];
# activeMonitors =
#   builtins.filter (
#     m: let
#       parts = lib.splitString "," m;
#     in
#       (builtins.length parts) > 2
#   )
#   monitors;
# monitorSettings = builtins.listToAttrs (
#   map (
#     m: let
#       parts = lib.splitString "," m;
#       name = builtins.elemAt parts 0;
#       modeStr = builtins.elemAt parts 1;
#       posStr = builtins.elemAt parts 2;
#       scale = builtins.fromJSON (builtins.elemAt parts 3);
#       posParts = lib.splitString "x" posStr;
#       posX = lib.toInt (builtins.elemAt posParts 0);
#       posY = lib.toInt (builtins.elemAt posParts 1);
#       modeSplit = lib.splitString "@" modeStr;
#       resSplit = lib.splitString "x" (builtins.head modeSplit);
#       width = lib.toInt (builtins.head resSplit);
#       height = lib.toInt (builtins.elemAt resSplit 1);
#       refresh =
#         if (builtins.length modeSplit > 1)
#         then (builtins.fromJSON (builtins.elemAt modeSplit 1)) + 0.0
#         else 60.0;
#       isRotated = (builtins.length parts > 4) && (builtins.elemAt parts 4 == "transform");
#       rotationVal =
#         if isRotated
#         then 90
#         else 0;
#       # App launcher helper functions
#       isTui = app:
#         builtins.elem app [
#           "nvim"
#           "neovim"
#           "vim"
#           "nano"
#           "helix"
#           "yazi"
#           # "ranger"
#           # "lf"
#           # "nnn"
#           "btop"
#           # "htop"
#         ];
#       spawnApp = app:
#         if isTui app
#         then [
#           "alacritty"
#           "-e"
#           app
#         ]
#         else [app];
#     in {
#       name = name;
#       value = {
#         mode = {
#           width = width;
#           height = height;
#           refresh = refresh;
#         };
#         scale = scale;
#         position = {
#           x = posX;
#           y = posY;
#         };
#         transform = {
#           rotation = rotationVal;
#           flipped = false;
#         };
#       };
#     }
#   )
#   activeMonitors
# );
# in
# {
# config = {
# home.packages = with pkgs; [
# xwayland-satellite # X11 Support
# swww # Wallpaper
# grimblast # Screenshot tool
# slurp # Region selector for screenshots
# libnotify # Notifications
# hyprpicker # Color Picker
# wl-clipboard # Clipboard
# pavucontrol # GUI Volume Control
# brightnessctl # Laptop Brightness Keys (Fn+F keys)
# playerctl # Media Keys (Play/Pause)
# imv # Image Viewer
# mpv # Video Player
# ];
# programs.niri = {
# enable = true;
# settings = {
#   outputs."eDP-1".scale = 2.0;
# };
# };
# programs.niri = {
# settings = {
# binds = {
#   # -----------------------------------------------------------------------
#   # 🚀 APPLICATIONS
#   # -----------------------------------------------------------------------
#   # Terminal
# "Mod+Return".action.spawn = ["alacritty"];
#   # Launcher
#   # "Mod+A".action.spawn = walkerCommand;
#   # "Mod+Shift+A".action.spawn = shellLauncherCommand;
#   # Browser
#   # "Mod+B".action.spawn = ["${vars.browser}"];
#   # File Manager
#   # "Mod+F".action.spawn = spawnApp vars.fileManager;
#   # Editor
#   # "Mod+C".action.spawn = spawnApp vars.editor;
#   # -----------------------------------------------------------------------
#   # 🪟 WINDOW MANAGEMENT
#   # -----------------------------------------------------------------------
#   "Mod+Shift+C".action.close-window = [];
#   "Mod+M".action.fullscreen-window = [];
#   "Mod+Space".action.toggle-window-floating = [];
#   "Mod+Delete".action.spawn = [
#     "loginctl"
#     "lock-session"
#   ];
#   "Mod+Shift+Delete".action.quit = {
#     skip-confirmation = true;
#   };
#   # -----------------------------------------------------------------------
#   # ↔️ MOVEMENT (Hyprland Translation)
#   # -----------------------------------------------------------------------
#   # Focus
#   "Mod+Left".action.focus-column-left = [];
#   "Mod+H".action.focus-column-left = []; # Alternative
#   "Mod+Right".action.focus-column-right = [];
#   "Mod+L".action.focus-column-right = []; # Alternative
#   "Mod+Up".action.focus-window-up = [];
#   "Mod+K".action.focus-window-up = []; # Alternative
#   "Mod+Down".action.focus-window-down = [];
#   "Mod+J".action.focus-window-down = []; # Alternative
#   # Move Windows
#   "Mod+Shift+Left".action.move-column-left = [];
#   "Mod+Shift+H".action.move-column-left = []; # Alternative
#   "Mod+Shift+Right".action.move-column-right = [];
#   "Mod+Shift+L".action.move-column-right = []; # Alternative
#   "Mod+Shift+Up".action.move-window-up = [];
#   "Mod+Shift+K".action.move-window-up = []; # Alternative
#   "Mod+Shift+Down".action.move-window-down = [];
#   "Mod+Shift+J".action.move-window-down = []; # Alternative
#   # -----------------------------------------------------------------------
#   # 🔢 WORKSPACES (1-9)
#   # -----------------------------------------------------------------------
#   "Mod+1".action.focus-workspace = 1;
#   "Mod+2".action.focus-workspace = 2;
#   "Mod+3".action.focus-workspace = 3;
#   "Mod+4".action.focus-workspace = 4;
#   "Mod+5".action.focus-workspace = 5;
#   "Mod+6".action.focus-workspace = 6;
#   "Mod+7".action.focus-workspace = 7;
#   "Mod+8".action.focus-workspace = 8;
#   "Mod+9".action.focus-workspace = 9;
#   # Move Window to Workspace
#   "Mod+Shift+1".action.move-window-to-workspace = 1;
#   "Mod+Shift+2".action.move-window-to-workspace = 2;
#   "Mod+Shift+3".action.move-window-to-workspace = 3;
#   "Mod+Shift+4".action.move-window-to-workspace = 4;
#   "Mod+Shift+5".action.move-window-to-workspace = 5;
#   "Mod+Shift+6".action.move-window-to-workspace = 6;
#   "Mod+Shift+7".action.move-window-to-workspace = 7;
#   "Mod+Shift+8".action.move-window-to-workspace = 8;
#   "Mod+Shift+9".action.move-window-to-workspace = 9;
#   # -----------------------------------------------------------------------
#   # 🔈 MEDIA & BRIGHTNESS
#   # -----------------------------------------------------------------------
#   "XF86AudioRaiseVolume".action.spawn = [
#     "wpctl"
#     "set-volume"
#     "-l"
#     "1"
#     "@DEFAULT_AUDIO_SINK@"
#     "5%+"
#   ];
#   "XF86AudioLowerVolume".action.spawn = [
#     "wpctl"
#     "set-volume"
#     "@DEFAULT_AUDIO_SINK@"
#     "5%-"
#   ];
#   "XF86AudioMute".action.spawn = [
#     "wpctl"
#     "set-mute"
#     "@DEFAULT_AUDIO_SINK@"
#     "toggle"
#   ];
#   "Mod+BracketRight".action.spawn = [
#     "brightnessctl"
#     "s"
#     "10%+"
#   ];
#   "Mod+BracketLeft".action.spawn = [
#     "brightnessctl"
#     "s"
#     "10%-"
#   ];
#   # -----------------------------------------------------------------------
#   # 🔔 NOTIFICATIONS (SwayNC)
#   # -----------------------------------------------------------------------
#   # Toggle Notification Center
#   "Mod+N".action.spawn = [
#     "swaync-client"
#     "-t"
#     "-sw"
#   ];
#   # -----------------------------------------------------------------------
#   # 📸 SCREENSHOTS
#   # -----------------------------------------------------------------------
#   # Fullscreen
#   "Mod+Ctrl+3".action.spawn = [
#     "bash"
#     "-c"
#     ''
#       file="$HOME/Pictures/Screenshots/Screenshot from $(date +'%Y-%m-%d %H-%M-%S').png"
#       mkdir -p "$(dirname "$file")"
#       grim "$file"
#       wl-copy < "$file"
#       notify-send "Screenshot" "Saved to $file and copied to clipboard"
#     ''
#   ];
#   # Area Selection (Save to Pictures + Copy to Clipboard)
#   "Mod+Ctrl+4".action.spawn = [
#     "bash"
#     "-c"
#     ''
#       file="$HOME/Pictures/Screenshots/Screenshot from $(date +'%Y-%m-%d %H-%M-%S').png"
#       mkdir -p "$(dirname "$file")"
#       slurp | grim -g - "$file"
#       wl-copy < "$file"
#       notify-send "Screenshot" "Saved to $file and copied to clipboard"
#     ''
#   ];
#   # -----------------------------------------------------------------------
#   # 🛠️ UTILITIES
#   # -----------------------------------------------------------------------
#   # "Mod+Period".action.spawn = [
#   #   "walker"
#   #   "-m"
#   #   "emojis"
#   # ]; # Emoji
#   "Mod+Shift+P".action.spawn = [
#     "hyprpicker"
#     "-an"
#   ]; # Color Picker
#   # "Mod+V".action.spawn = [
#   #   "walker"
#   #   "-m"
#   #   "clipboard"
#   # ]; # Clipboard History
#   "Mod+O".action.toggle-overview = []; # Window Overview
#   "Mod+Shift+R".action.spawn = [
#     "niri"
#     "msg"
#     "action"
#     "reload-config"
#   ]; # Reload
# };
# hotkey-overlay.skip-at-startup = true;
# outputs = monitorSettings;
# layout = {
#   gaps = 12;
#   center-focused-column = "always";
#   preset-column-widths = [
#     {proportion = 0.33333;}
#     {proportion = 0.5;}
#     {proportion = 0.66667;}
#   ];
#   default-column-width = {
#     proportion = 0.5;
#   };
#   focus-ring = {
#     enable = true;
#     width = 2;
#     # active.color = colors.active;
#     # inactive.color = colors.inactive;
#   };
#   border.enable = false;
#   shadow = {
#     enable = true;
#     # color = "${colors.shadow}aa";
#   };
# };
# overview = {
#   zoom = 0.5;
# };
# environment = {
#   "NIXOS_OZONE_WL" = "1";
#   "DISPLAY" = ":0";
# }; # Disable keymap overlay at startup
# spawn-at-startup = [
#   # 1. Kill stuck portals from other sessions (Fixes slow load)
#   # {
#   #   command = [
#   #     "/bin/sh"
#   #     "-c"
#   #     "$HOME/.local/bin/init-gnome-keyring.sh"
#   #   ];
#   # }
#   # 2. CORE SERVICES
#   {command = ["xwayland-satellite"];}
#   # {command = ["${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"];}
#   # 3. DBUS UPDATE
#   # {
#   #   command = [
#   #     "dbus-update-activation-environment"
#   #     "--systemd"
#   #     "--all"
#   #   ];
#   # }
#   # 4. WALLPAPER
#   # {command = ["swww-daemon"];}
#   # {
#   #   command = [
#   #     "swww"
#   #     "img"
#   #     "${wallpaperFile}"
#   #   ];
#   # }
# ];
# ++ (map (cmd: {
#   command = [
#     "bash"
#     "-c"
#     cmd
#   ];
# }) (vars.niri_Exec-Once or []));
# };
# };
# };
# }

