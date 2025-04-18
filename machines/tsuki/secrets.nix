{
  vars,
  secrets,
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
      "/home/${vars.username}/.ssh/id_agenix"
    ];

    secrets = {
      "github-ssh-key" =
        {
          path = "/home/${vars.username}/.ssh/id_github";
          file = "${secrets}/github-ssh-key.age";
        }
        // user_readable;

      "github-signing-key" =
        {
          path = "/home/${vars.username}/.ssh/pgp_github.key";
          file = "${secrets}/github-signing-key.age";
        }
        // user_readable;

      "wg0-conf" =
        {
          path = "/home/${vars.username}/.config/secrets/wg0.conf";
          file = "${secrets}/tsuki-wg0-conf.age";
        }
        // user_readable;
    };
  };
}
