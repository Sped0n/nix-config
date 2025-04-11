{vars, ...}: {
  programs.ssh = {
    matchBlocks = {
      "uranus" = {
        hostname = vars.ips.uranus;
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
        hostname = vars.ips.uranus;
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
        hostname = vars.ips.neptune;
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
        hostname = vars.ips.luna;
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
