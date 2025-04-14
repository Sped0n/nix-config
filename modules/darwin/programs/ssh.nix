{vars, ...}: {
  imports = [
    ../../shared/programs/ssh.nix
  ];

  programs.ssh.matchBlocks."github.com".identityFile = [
    "/Users/${vars.username}/.ssh/id_github"
  ];
}
