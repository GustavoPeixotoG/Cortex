{
  description = "My NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lexis = {
      url = "github:EmanuelPeixoto/Lexis";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          inputs.noctalia.overlays.default
          (final: prev: {
            stable = import nixpkgs-stable {
              inherit system;
              inherit (prev) config;
            };
          })
        ];
      };

      systems = [ "gustavo" ];

      # Função para gerar uma configuração NixOS
      mkNixosSystem = name:
        nixpkgs.lib.nixosSystem {
          inherit pkgs;
          modules = [
            ./system
          ];
          specialArgs = { inherit inputs; };
        };

      # Função para gerar uma configuração do Home Manager
      mkHomeConfig = name:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./hm ];
          extraSpecialArgs = { inherit inputs; };
        };

    in {
      nixosConfigurations = {
        NixOS-Gugu = mkNixosSystem "gustavo";
      };

      homeConfigurations = nixpkgs.lib.genAttrs systems (name: mkHomeConfig name);
    };
}
