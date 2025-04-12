{...}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };
  xdg.configFile."zellij/config.kdl".source = ../config/zellij.kdl;
}
