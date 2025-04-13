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
    home-manager,
    agenix,
    secrets,
    nix-darwin,
    nix-homebrew,
  }: let
    vars = import "${secrets}/vars";
    specialArgs =
      inputs // {inherit vars;};
  in {
    imports = ["${secrets}/vars"];
    darwinConfigurations."ringo-ii" = nix-darwin.lib.darwinSystem {
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
        ./machines/ringo-ii.nix
      ];
    };
  };
}
