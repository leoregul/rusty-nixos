{
  config,
  pkgs,
  lib,
  ...
}: {
  catppuccin.lazygit.enable = true;
  catppuccin.lazygit.flavor = "frappe";

  programs.lazygit = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "lzg";
  };
}
