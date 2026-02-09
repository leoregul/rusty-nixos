{
  config,
  pkgs,
  lib,
  ...
}: {
  catppuccin.zellij.enable = true;
  catppuccin.zellij.flavor = "frappe";

  programs.zellij = {
    enable = true;
    enableFishIntegration = false;
    exitShellOnExit = false;
  };
}
