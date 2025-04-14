{vars, ...}: {
  # Interface
  networking = {
    hostName = "luna";
    interfaces.eth0.ipv4.addresses = [
      {
        address = vars.luna.ipv4;
        prefixLength = 24;
      }
    ];
    defaultGateway = {
      address = vars.luna.ipv4Gateway;
      interface = "eth0";
    };
    interfaces.eth0.ipv6.addresses = [
      {
        address = vars.luna.ipv6;
        prefixLength = 64;
      }
    ];
    defaultGateway6 = {
      address = vars.luna.ipv6Gateway;
      interface = "eth0";
    };
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
      "2606:4700:4700::1111"
      "2001:4860:4860::8888"
    ];
  };

  # Wireguard
  services.wg-quick = {
    enable = true;
    configFile = "/etc/wireguard/wg0.conf";
    autostart = true;
  };

  # Tailscale
  systemd.services.tailscale.after = "wg-quick@wg0.service";

  # Cloudflared
  services.cloudflared = {
    enable = true;
  };
}
