{vars, ...}: {
  imports = [
    ../../modules/darwin
  ];

  nix.enable = false; # For nix-darwin and determinate compatbility

  home-manager = {
    users.${vars.username} = {...}: {
      imports = [
        ./programs
        ./packages.nix
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
