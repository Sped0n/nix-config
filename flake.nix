{
  description = "worst nix config on this planet";

  inputs = {
    # Core
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Misc
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
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    agenix,
    secrets,
    disko,
    nix-darwin,
    nix-homebrew,
  }: let
    vars = import "${secrets}/vars";
  in {
    darwinConfigurations."ringo" = nix-darwin.lib.darwinSystem rec {
      system = "aarch64-darwin";
      specialArgs =
        {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        }
        // inputs // {inherit vars;};
      modules = [
        home-manager.darwinModules.home-manager
        nix-homebrew.darwinModules.nix-homebrew
        agenix.darwinModules.default
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

    nixosConfigurations."tane" = nixpkgs.lib.nixosSystem rec {
      system = "aarch64-linux";
      specialArgs =
        {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        }
        // inputs // {inherit vars;};
      modules = [
        home-manager.nixosModules.home-manager
        agenix.nixosModules.default
        ./machines/tane
      ];
    };

    nixosConfigurations."tsuki" = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs =
        {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        }
        // inputs // {inherit vars;};
      modules = [
        disko.nixosModules.disko
        home-manager.nixosModules.home-manager
        ./machines/tsuki
      ];
    };
  };
}
