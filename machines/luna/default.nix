{vars, ...}: {
  imports = [
    ../../modules/nixos/server
    ./system.nix
    ./disko.nix
    ./networking.nix
    ./ssh.nix
  ];

  home-manager = {
    users.${vars.username} = {...}: {
      imports = [
        ./packages.nix
        ./programs
      ];
      home = {
        enableNixpkgsReleaseCheck = false;
        stateVersion = "24.11";
      };
    };

    users.root = {...}: {
      imports = [
        ../../modules/shared/programs/ssh.nix
        ./packages.nix
      ];
      home = {
        enableNixpkgsReleaseCheck = false;
        stateVersion = "24.11";
      };
    };
  };

  system.stateVersion = "24.11";
}
