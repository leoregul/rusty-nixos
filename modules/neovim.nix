{
  config,
  pkgs,
  lib,
  ...
}: {
  catppuccin.nvim.enable = true;
  catppuccin.nvim.flavor = "frappe";

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
