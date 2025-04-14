{pkgs, ...}:
with pkgs; {
  home.packages =
    [
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
      yazi
    ]
    ++ [
      # lua
      lua-language-server
      stylua
      selene

      # nix
      nixd
      alejandra
    ];
}
