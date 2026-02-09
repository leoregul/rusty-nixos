{ config, pkgs, lib, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/rusty-nixos#rusty-nixos";
      hms = "home-manager switch";
    };
  };
}
