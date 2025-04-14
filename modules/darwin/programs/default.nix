{...}: {
  imports = [
    ../../shared/programs
    ./ghostty.nix
  ];

  programs.mise = {
    enable = true;
    enableZshIntegration = true;
    globalConfig = {
      settings = {
        disable_hints = ["python_multi"];
        trusted_config_paths = ["~"];
      };
    };
  };
}
