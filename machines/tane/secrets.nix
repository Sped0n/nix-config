{
  pkgs,
  vars,
  secrets,
  agenix,
  ...
}: {
  imports = [
    agenix.nixosModules.default
  ];

  environment.systemPackages = [
    agenix.packages."${pkgs.system}".default
  ];

  age = let
    noaccess = {
      mode = "0000";
      owner = "root";
    };
    high_security = {
      mode = "0500";
      owner = "root";
    };
    user_readable = {
      mode = "0500";
      owner = "${vars.username}";
    };
  in {
    identityPaths = [
      "/home/${vars.username}/.ssh/id_agenix"
    ];

    secrets = {
      "github-ssh-key" =
        {
          path = "/Users/${vars.username}/.ssh/id_github";
          file = "${secrets}/github-ssh-key.age";
        }
        // user_readable;

      "github-signing-key" =
        {
          path = "/Users/${vars.username}/.ssh/pgp_github.key";
          file = "${secrets}/github-signing-key.age";
        }
        // user_readable;
    };
  };
}
