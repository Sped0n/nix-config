{vars, ...}: {
  imports = [
    ../../../shared/programs/ssh.nix
  ];

  programs.ssh.matchBlocks."github.com".identityFile = [
    "/home/${vars.username}/.ssh/id_github"
  ];
}
