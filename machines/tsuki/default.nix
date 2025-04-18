{
  agenix,
  vars,
  ...
}: {
  imports = [
    ../../modules/nixos/server

    ./system.nix
    ./disko.nix
    ./networking.nix
    ./sshd.nix
  ];

  home-manager = {
    users.${vars.username} = {...}: {
      imports = [
        agenix.homeManagerModules.default

        ./packages.nix
        ./programs
        ./secrets.nix
      ];
      home = {
        enableNixpkgsReleaseCheck = false;
        stateVersion = "24.11";
      };
    };

    users.root = {...}: {
      imports = [
        agenix.homeManagerModules.default

        ../../modules/shared/programs/ssh.nix
        ./packages.nix
        ./secrets.nix
      ];
      home = {
        enableNixpkgsReleaseCheck = false;
        stateVersion = "24.11";
      };
    };
  };

  system.stateVersion = "24.11";
}
