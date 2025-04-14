{...}: {
  boot.loader = {
    systemd-boot = {
      # Don't need to keep too many generations.
      configurationLimit = 10;
      # Pick the highest resolution for systemd-boot's console.
      consoleMode = "max";
    };
  };

  # Power management
  services = {
    power-profiles-daemon = {
      enable = true;
    };
    upower.enable = true;
  };

  # Timezone
  time.timeZone = "Asia/Singapore";
}
