{pkgs, ...}: let
  codegpt = pkgs.callPackage ../../pkgs/codegpt.nix {};
in
  with pkgs; {
    imports = [
      ../../modules/nixos/server/packages.nix
    ];

    home.packages =
      # Core
      [
        vim
        gcc
      ]
      ++
      # Others
      [
        codegpt
      ];
  }
