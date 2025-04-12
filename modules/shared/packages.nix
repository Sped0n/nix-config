{pkgs, ...}:
with pkgs; [
  # General packages for development and system management
  tlrc
  act
  openssh
  pandoc
  sqlite
  wget
  zip

  # Encryption and security tools
  age
  gnupg

  # Text and terminal utilities
  du-dust
  fd
  fzf
  htop
  iftop
  jq
  ripgrep
  tree
  unzip
  less
]
