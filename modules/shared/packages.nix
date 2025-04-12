{pkgs, ...}:
with pkgs; [
  # General packages for development and system management
  just
  tlrc
  openssh
  wget
  zip
  unzip

  # Encryption and security tools
  age
  gnupg

  # Text and terminal utilities
  du-dust
  fd
  fzf
  bottom
  jq
  ripgrep
  tree
  less

  # lua
  lua-language-server
  stylua
  selene

  # nix
  nixd
  alejandra
]
