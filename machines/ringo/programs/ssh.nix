{
  config,
  vars,
  ...
}: {
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
          config.age.secrets."uranus-ssh-key".path
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
          config.age.secrets."github-ssh-key".path
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
          config.age.secrets."neptune-ssh-key".path
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
          config.age.secrets."luna-ssh-key".path
        ];
        extraOptions = {
          "TCPKeepAlive" = "yes";
          "AddKeysToAgent" = "yes";
        };
      };
    };
  };
}
