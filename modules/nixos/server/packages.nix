{pkgs, ...}:
with pkgs; {
  imports = [
    ../../shared/packages.nix
  ];
  home.packages =
    # Core
    [
      docker
      docker-compose
    ]
    ++
    # Utils
    [
      nali
    ]
    ++
    # Others
    [
      restic
      rclone
      beszel
    ];
}
