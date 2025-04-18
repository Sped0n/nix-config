{vars, ...}: {
  users.users."${vars.username}" = {
    openssh.authorizedKeys.keys = [vars.tsuki.primarySSHKey];
  };

  users.users.root = {
    openssh.authorizedKeys.keys = [vars.tsuki.primarySSHKey];
  };
}
