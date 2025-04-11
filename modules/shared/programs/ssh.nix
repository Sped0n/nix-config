{
  pkgs,
  lib,
  vars,
  ...
}: {
  programs.ssh = {
    enable = true;
    includes = [
      (
        lib.mkIf pkgs.stdenv.hostPlatform.isLinux
        "/home/${vars.username}/.ssh/config_external"
      )
      (
        lib.mkIf pkgs.stdenv.hostPlatform.isDarwin
        "/Users/${vars.username}/.ssh/config_external"
      )
    ];
    matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
        user = "git";
        identityFile = [
          (
            lib.mkIf pkgs.stdenv.hostPlatform.isLinux
            "/home/${vars.username}/.ssh/id_github"
          )
          (
            lib.mkIf pkgs.stdenv.hostPlatform.isDarwin
            "/Users/${vars.username}/.ssh/id_github"
          )
        ];
        extraOptions = {
          "TCPKeepAlive" = "yes";
          "AddKeysToAgent" = "yes";
        };
      };
    };
  };
}
