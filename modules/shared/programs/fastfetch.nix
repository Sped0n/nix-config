{pkgs, ...}: {
  programs.fastfetch = {
    enable = true;
    settings = let
      keyTemplate = {
        keyColor = "34"; # = color4
      };
    in {
      logo = {
        source = "~/.config/fastfetch/logo.png";
        type = "kitty-direct";
        height = 10;
        padding = {
          top = 1;
        };
      };

      display = {
        separator = ": ";
      };

      modules = [
        "break"
        (
          {
            type = "os";
          }
          // keyTemplate
        )
        (
          {
            type = "kernel";
          }
          // keyTemplate
        )
        (
          {
            type = "packages";
            format = "{} (nix-system)";
          }
          // keyTemplate
        )
        (
          {
            type = "shell";
          }
          // keyTemplate
        )
        (
          {
            type = "terminal";
          }
          // keyTemplate
        )
        (
          {
            type = "cpu";
          }
          // keyTemplate
        )
        (
          {
            type = "memory";
            format = "{used} / {total}";
          }
          // keyTemplate
        )
        (
          {
            type = "disk";
            key = "Disk";
            format = "{size-used} / {size-total}";
          }
          // keyTemplate
        )
        (
          {
            type = "uptime";
          }
          // keyTemplate
        )
        "break"
        "colors"
      ];
    };
  };
  xdg.configFile."fastfetch/logo.png".source =
    if pkgs.stdenv.hostPlatform.isDarwin
    then ../config/fastfetch/nix-darwin.png
    else ../config/fastfetch/nixos.png;
}
