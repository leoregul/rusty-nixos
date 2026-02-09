{
  config,
  pkgs,
  lib,
  ...
}: {
  catppuccin.bat.enable = true;
  catppuccin.bat.flavor = "frappe";

  programs.bat = {
    enable = true;
  };
}
