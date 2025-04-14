{pkgs, ...}: let
  codegpt = pkgs.callPackage ../../pkgs/codegpt.nix {};
in
  with pkgs; {
    imports = [
      ../../modules/shared/packages.nix
    ];
    home.packages =
      [
        # Core
        gcc
      ]
      ++ [
        # Others
        codegpt
      ];
  }
