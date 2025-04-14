{vars, ...}: {
  users.users."${vars.username}" = {
    openssh.authorizedKeys.keys = [vars.luna.primarySSHKey];
  };

  users.users.root = {
    openssh.authorizedKeys.keys = [vars.luna.primarySSHKey];
  };
}
