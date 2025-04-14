{vars, ...}: {
  programs.ssh = {
    includes = [
      "~/.orbstack/ssh/config"
    ];
    matchBlocks = {
      "uranus" = {
        hostname = vars.uranus.ipv4;
        port = 12222;
        user = "${vars.username}";
        identityFile = [
          "/Users/${vars.username}/.ssh/id_uranus"
        ];
        extraOptions = {
          "TCPKeepAlive" = "yes";
          "AddKeysToAgent" = "yes";
        };
      };

      "gitea" = {
        hostname = vars.uranus.ipv4;
        port = 12222;
        user = "git";
        identityFile = [
          "/Users/${vars.username}/.ssh/id_github"
        ];
        extraOptions = {
          "TCPKeepAlive" = "yes";
          "AddKeysToAgent" = "yes";
        };
      };

      "neptune" = {
        hostname = vars.neptune.ipv4;
        port = 12222;
        user = "${vars.username}";
        identityFile = [
          "/Users/${vars.username}/.ssh/id_neptune"
        ];
        extraOptions = {
          "TCPKeepAlive" = "yes";
          "AddKeysToAgent" = "yes";
        };
      };

      "luna" = {
        hostname = vars.luna.ipv4;
        port = 12222;
        user = "${vars.username}";
        identityFile = [
          "/Users/${vars.username}/.ssh/id_luna"
        ];
        extraOptions = {
          "TCPKeepAlive" = "yes";
          "AddKeysToAgent" = "yes";
        };
      };
    };
  };
}
