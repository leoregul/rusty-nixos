{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    xwayland-satellite # X11 Support
  ];

  programs.niri = {
    settings = {
      hotkey-overlay.skip-at-startup = false;

      layout = {
        gaps = 12;
        center-focused-column = "always";
        preset-column-widths = [
          {proportion = 0.33333;}
          {proportion = 0.5;}
          {proportion = 0.66667;}
        ];
        default-column-width = {
          proportion = 0.5;
        };

        focus-ring = {
          enable = true;
          width = 2;
          # active.color = colors.active;
          # inactive.color = colors.inactive;
        };
        border.enable = false;
        shadow = {
          enable = true;
          # color = "${colors.shadow}aa";
        };
      };

      overview = {
        zoom = 0.5;
      };

      environment = {
        "NIXOS_OZONE_WL" = "1";
        "DISPLAY" = ":0";
      }; # Disable keymap overlay at startup
    };
  };
}
