{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    xwayland-satellite # X11 Support
  ];

  programs.niri = {
  };
}
