{
  description = "NixOS flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    lexis.url = "github:EmanuelPeixoto/Lexis";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

  in {
    nixosConfigurations = {
      NixOS-Gugu = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./system
          home-manager.nixosModules.home-manager
        ];
        specialArgs = { inherit inputs; };
      };

    };
    homeConfigurations = {
      gustavo = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hm ];
        extraSpecialArgs = { inherit inputs; };
      };
    };
  };
}
