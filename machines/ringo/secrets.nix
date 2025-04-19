{
  secrets,
  home,
  ...
}: {
  age = let
    # noaccess = {
    #   mode = "0000";
    # };
    # high_security = {
    #   mode = "0500";
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

      # NOTE: disable after imported
      # "github-signing-key" =
      #   {
      #     path = "${home}/.config/secrets/pgp_github.key";
      #     file = "${secrets}/github-signing-key.age";
      #   }
      #   // user_readable;

      "uranus-ssh-key" =
        {
          path = "${home}/.ssh/id_uranus";
          file = "${secrets}/uranus-ssh-key.age";
        }
        // user_readable;

      "neptune-ssh-key" =
        {
          path = "${home}/.ssh/id_neptune";
          file = "${secrets}/neptune-ssh-key.age";
        }
        // user_readable;

      "tsuki-ssh-key" =
        {
          path = "${home}/.ssh/id_tsuki";
          file = "${secrets}/tsuki-ssh-key.age";
        }
        // user_readable;
    };
  };
}
