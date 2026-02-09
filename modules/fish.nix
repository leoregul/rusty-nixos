{
  config,
  pkgs,
  lib,
  ...
}: {
  # home.packages = with pkgs; [
  #   fzf
  #   zoxide
  #   starship
  # ];

  catppuccin.fish.enable = true;
  catppuccin.fish.flavor = "frappe";

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellAliases = {
      hms = "nix run home-manager -- switch --flake ~/rusty-nixos#rusty-nixos";
      nrs = "sudo nixos-rebuild switch --flake ~/rusty-nixos#rusty-nixos";
      ls = "eza --icons $eza_params";
      ll = "eza --all --long --icons $eza_params";
      lt = "eza --tree --icons $eza_params";
      zj = "zellij";
    };
  };
}
