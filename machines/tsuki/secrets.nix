{
  secrets,
  home,
  ...
}: {
  age = let
    # noaccess = {
    #   mode = "0000";
    # };
    user_readable = {
      mode = "0500";
    };
  in {
    identityPaths = [
      "${home}/.config/secrets/id_agenix"
    ];

    secrets = {
      "github-ssh-key" =
        {
          path = "${home}/.ssh/id_github";
          file = "${secrets}/github-ssh-key.age";
        }
        // user_readable;

      "github-signing-key" =
        {
          path = "${home}/.config/secrets/pgp_github.key";
          file = "${secrets}/github-signing-key.age";
        }
        // user_readable;

      "wg0-conf" =
        {
          path = "${home}/.config/secrets/wg0.conf";
          file = "${secrets}/tsuki-wg0-conf.age";
        }
        // user_readable;
    };
  };
}
