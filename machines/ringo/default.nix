{
  pkgs,
  agenix,
  vars,
  ...
}: {
  imports = [
    ../../modules/darwin

    ./secrets.nix
  ];

  nix.linux-builder = {
    enable = true;
    systems = ["x86_64-linux"];
    package = pkgs.darwin.linux-builder-x86_64;
  };

  home-manager = {
    users.${vars.username} = {...}: {
      imports = [
        agenix.homeManagerModules.default

        ./programs
        ./packages.nix
        ./home-secrets.nix
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
