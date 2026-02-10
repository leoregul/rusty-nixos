{
  description = "Rusty NixOS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    catppuccin,
    niri,
    ...
  }: {
    nixosConfigurations.rusty-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        catppuccin.nixosModules.catppuccin
        niri.nixosModules.niri
        {
          nixpkgs.overlays = [niri.overlays.niri];
        }
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            sharedModules = [
              catppuccin.homeModules.catppuccin
            ];
            users.igor = {
              imports = [
                ./home.nix
                # catppuccin.homeModules.catppuccin
                # niri.homeModules.niri
              ];
            };
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
