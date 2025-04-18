{
  agenix,
  vars,
  ...
}: {
  imports = [
    ../../modules/darwin
  ];

  nix.linux-builder = {
    enable = true;
    systems = ["x86_64-linux" "aarch64-linux"];
    ephemeral = true;
    maxJobs = 1;
    config = {
      boot.binfmt.emulatedSystems = ["x86_64-linux"];
      virtualisation = {
        darwin-builder = {
          diskSize = 30 * 1024;
          memorySize = 6 * 1024;
        };
        cores = 4;
      };
    };
  };

  home-manager = {
    users.${vars.username} = {...}: {
      imports = [
        agenix.homeManagerModules.default

        ./programs
        ./packages.nix
        ./secrets.nix
      ];
      home = {
        enableNixpkgsReleaseCheck = false;
        stateVersion = "24.11";
      };
    };
  };

  homebrew.masApps = {
    "WeChat" = 836500024;
    "WhatsApp Messenger" = 310633997;
    "Endel" = 1346247457;
    "Photomator" = 1444636541;
    "VidHub" = 1659622164;
  };
}
