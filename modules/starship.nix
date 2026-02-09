{
  config,
  pkgs,
  lib,
  ...
}: {
  catppuccin.starship.enable = true;
  catppuccin.starship.flavor = "frappe";

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = lib.mkMerge [
      (builtins.fromTOML
        (
          builtins.readFile "${pkgs.starship}/share/starship/presets/nerd-font-symbols.toml"
        ))
      {
        # here goes my custom configurations
      }
      {
        add_newline = true;
      }
    ];
  };
}
