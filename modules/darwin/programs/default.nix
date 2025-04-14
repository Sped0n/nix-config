{...}: {
  imports = [
    ../../shared/programs

    ./ssh.nix
    ./neovim.nix
    ./fastfetch.nix
    ./ghostty.nix
  ];
}
