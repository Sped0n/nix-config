{
  lib,
  pkgs,
  specialArgs,
  vars,
  ...
}: {
  # Nixpkgs
  nixpkgs = {
    config = {
      allowUnfree = true;
    };

    overlays =
      # Apply each overlay found in the /overlays directory
      let
        path = ../../overlays;
      in
        with builtins;
          map (n: import (path + ("/" + n)))
          (filter (n:
            match ".*\\.nix" n
            != null
            || pathExists (path + ("/" + n + "/default.nix")))
          (attrNames (readDir path)))
          ++ [];
  };

  # Nix
  nix = {
    package = pkgs.nix;
    settings = {
      trusted-users = ["${vars.username}"];
      experimental-features = "nix-command flakes";
    };
    gc = {
      automatic = true;
      interval = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
      dates = lib.mkIf pkgs.stdenv.hostPlatform.isLinux "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # Home manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = specialArgs;
  };

  # Zsh
  programs.zsh.enable = true;
  environment = {
    shells = [pkgs.zsh];
  };
}
