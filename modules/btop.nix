{
  config,
  pkgs,
  lib,
  ...
}: {
  catppuccin.btop.enable = true;
  catppuccin.btop.flavor = "frappe";

  programs.btop = {
    enable = true;
  };
}
