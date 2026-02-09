{
  config,
  pkgs,
  lib,
  ...
}: {
  catppuccin.yazi.enable = true;
  catppuccin.yazi.flavor = "frappe";

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      mgr = {
        show_hidden = true;
      };
    };
  };
}
