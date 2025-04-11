{...}: {
  imports = [
    ./zsh.nix
    ./starship.nix
    ./git.nix
    ./ssh.nix
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "base16";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = ["--cmd cd" "--hook pwd"];
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = false;
    settings = {
      auto_sync = true;
      sync_frequency = "1d";
      sync_address = "https://atuin.sped0n.com";
      style = "compact";
      inline_height = 10;
      invert = false;
      enter_accept = false;
    };
  };
}
