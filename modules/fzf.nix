{
  config,
  pkgs,
  lib,
  ...
}: {
  catppuccin.fzf.enable = true;
  catppuccin.fzf.flavor = "frappe";

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
}
