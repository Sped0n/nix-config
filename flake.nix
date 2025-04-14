{
  description = "worst nix config on this planet";

  inputs = {
    # Core
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    secrets = {
      url = "git+ssh://git@github.com/Sped0n/nix-secrets";
      flake = false;
    };

    # NixOS
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Darwin
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    agenix,
    secrets,
    disko,
    nix-darwin,
    nix-homebrew,
    nixos-generators,
  }: let
    vars = import "${secrets}/vars";
    specialArgs =
      inputs // {inherit vars;};
  in {
    darwinConfigurations."ringo" = nix-darwin.lib.darwinSystem {
      inherit specialArgs;
      system = "aarch64-darwin";
      modules = [
        home-manager.darwinModules.home-manager
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "${vars.username}";
          };
        }
        ./machines/ringo
      ];
    };

    nixosConfigurations."tane" = nixpkgs.lib.nixosSystem {
      inherit specialArgs;
      system = "aarch64-linux";
      modules = [
        home-manager.nixosModules.home-manager
        ./machines/tane
      ];
    };

    nixosConfigurations."luna" = nixpkgs.lib.nixosSystem {
      inherit specialArgs;
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        home-manager.nixosModules.home-manager
        ./machines/luna
      ];
    };

    nixosConfiguration."lunaISO" = nixos-generators.nixosGenerate {
      inherit specialArgs;
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        home-manager.nixosModules.home-manager
        ./machines/luna
      ];
      format = "raw";
    };
  };
}
