{
  config,
  pkgs,
  lib,
  ...
}: {
  catppuccin.alacritty.enable = true;
  catppuccin.alacritty.flavor = "frappe";

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 17;
        normal = {
          family = "CaskaydiaCove Nerd Font";
          style = "Regualr";
        };
      };
      terminal = {
        shell = {
          program = "fish";
          args = [];
        };
      };
      window = {
        startup_mode = "Maximized";
        decorations = "None";
      };
    };
  };
}
