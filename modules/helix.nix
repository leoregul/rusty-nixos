{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    nil
    nixd
    alejandra
  ];

  catppuccin.helix.enable = true;
  catppuccin.helix.flavor = "frappe";

  programs.helix = {
    enable = true;
    defaultEditor = true;
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "alejandra";
      }
    ];
  };
}
