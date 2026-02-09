{
  config,
  pkgs,
  ...
}: let
  dotfiles = "${config.home.homeDirectory}/rusty-nixos/config";
  createSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    qtile = "qtile";
  };
in {
  imports = [
    ./modules/niri.nix
    ./modules/alacritty.nix
    ./modules/bash.nix
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/bat.nix
    ./modules/helix.nix
    ./modules/neovim.nix
    ./modules/fzf.nix
    ./modules/eza.nix
    ./modules/zoxide.nix
    ./modules/yazi.nix
    ./modules/starship.nix
    ./modules/lazygit.nix
    ./modules/fastfetch.nix
    ./modules/btop.nix
    ./modules/zellij.nix
  ];

  home.username = "igor";
  home.homeDirectory = "/home/igor";
  home.stateVersion = "25.11";

  xdg.configFile =
    builtins.mapAttrs
    (name: subpath: {
      source = createSymlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

  home.packages = with pkgs; [
    ripgrep
    fd
    duf
  ];
}
