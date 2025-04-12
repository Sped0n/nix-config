{
  config,
  pkgs,
  vars,
  specialArgs,
  ...
}: {
  imports = [
    ./system.nix
    ./secrets.nix
  ];

  users.users.${vars.username} = {
    name = "${vars.username}";
    home = "/Users/${vars.username}";
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  homebrew = {
    enable = true;
    casks = pkgs.callPackage ./casks.nix {};
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    # These app IDs are from using the mas CLI app
    # mas = mac app store
    # https://github.com/mas-cli/mas
    #
    # $ nix shell nixpkgs#mas
    # $ mas search <app name>
    #
    # If you have previously added these apps to your Mac App Store profile (but not installed them on this system),
    # you may receive an error message "Redownload Unavailable with This Apple ID".
    # This message is safe to ignore. (https://github.com/dustinlyons/nixos-config/issues/83)
    masApps = {
      # FIXME: mas is broken on macOS 15.4
      #"Bitwarden" = 1352778147;
      #"WeChat" = 836500024;
      #"WhatsApp Messenger" = 310633997;
      #"Endel" = 1346247457;
      #"Windows App" = 1295203466;
      #"Dropover" = 1355679052;
      #"Microsoft Word" = 462054704;
      #"Microsoft Excel" = 462058435;
      #"Microsoft PowerPoint" = 462062816;
      #"Microsoft Outlook" = 985367838;
      #"Microsoft OneDrive" = 823766827;
      #"PDFgear" = 6469021132;
      #"Photomator" = 1444636541;
      #"VidHub" = 1659622164;
    };
  };

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
