{
  description = "My NixOS flake";

  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    lexis.url = "github:EmanuelPeixoto/Lexis";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      overlay-stable = final: prev: {
        stable = import nixpkgs-stable {
          inherit (prev) system;
          config = {
            inherit (prev.config) allowUnfree;
          };
        };
      };

      mkPkgs = system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ overlay-stable ];
      };

    in {
      pkgs = forAllSystems mkPkgs;

      nixosConfigurations = {
        NixOS-Gugu = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./system
            home-manager.nixosModules.home-manager
          ];
          specialArgs = { inherit inputs; };
        };
      };

      homeConfigurations = {
        gustavo = home-manager.lib.homeManagerConfiguration {
          pkgs = mkPkgs "x86_64-linux";
          modules = [ ./hm ];
          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}
