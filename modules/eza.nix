{
  config,
  pkgs,
  lib,
  ...
}: {
  catppuccin.eza.enable = true;
  catppuccin.eza.flavor = "frappe";

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = "auto";
    git = false;
  };
}
