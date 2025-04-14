{...}: {
  networking.firewall = {
    enable = true;
    trustedInterfaces = ["tailscale0"];
    allowedTCPPorts = [];
    allowedUDPPorts = [];
    allowedUDPPortRanges = [
    ];
  };

  services.tailscale = {
    enable = true;
    interfaceName = "tailscale0";
    openFirewall = true;
  };
}
