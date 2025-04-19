{...}: {
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    daemon.settings = {
      "iptables" = false;
    };
  };
}
