{...}: {
  networking.firewall = {
    enable = true;
    allowPing = false;
    trustedInterfaces = ["tailscale0"];
  };

  services = {
    tailscale = {
      enable = true;
      interfaceName = "tailscale0";
      openFirewall = true;
    };
    fail2ban.enable = true;
  };
}
