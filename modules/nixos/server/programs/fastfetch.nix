{...}: {
  imports = [
    ../../../shared/programs/fastfetch.nix
  ];

  xdg.configFile."fastfetch/logo.png".source =
    ../../../shared/config/fastfetch/nixos.png;
}
