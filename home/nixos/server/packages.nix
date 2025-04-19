{pkgs, ...}:
with pkgs; {
  imports = [
    ../../shared/packages.nix
  ];
  home.packages =
    # Core
    [
      gcc
      coreutils
      findutils
      diffutils
      gnused
      gnugrep
      gawk
      gnutar
      gzip
      bzip2
      xz
      gnumake
      patch
      zip
      unzip
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
