{
  pkgs,
  vars,
  ...
}: {
  imports = [
    ../../modules/darwin
    ../../modules/shared
    ../../modules/darwin/secrets.nix
  ];

  nix = {
    package = pkgs.nix;
    enable = false; # For nix-darwin and determinate compatbility
    settings = {
      trusted-users = ["${vars.username}"];
      experimental-features = "nix-command flakes";
    };
  };

  environment = {
    shells = [pkgs.zsh];
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  fonts = {
    packages = with pkgs; [
      lilex
    ];
  };
}
