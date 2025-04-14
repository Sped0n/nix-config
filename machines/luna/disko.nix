{lib, ...}: {
  disko.devices = {
    disk = {
      my-disk = {
        device = "/vda/vda1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "500M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "btrfs";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };

  # Workarounds
  fileSystems."/" = {
    fsType = lib.mkForce "btrfs";
    device = lib.mkForce "/dev/disk/by-partlabel/disk-main-root";
  };
}
