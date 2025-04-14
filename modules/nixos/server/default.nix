{
  vars,
  specialArgs,
  ...
}: {
  import = [
    ../base/default.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = specialArgs;
    users.${vars.username} = {pkgs, ...}: {
      imports = [
        ./programs
        ../shared/programs
      ];
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix {};
        stateVersion = "24.11";
      };
    };
  };
}
