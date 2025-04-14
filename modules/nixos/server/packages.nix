{pkgs}:
with pkgs; {
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
