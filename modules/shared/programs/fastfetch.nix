{...}: {
  programs.fastfetch = {
    enable = true;
    settings = let
    in {
      logo = null;

      display = {
        separator = " ›  ";
      };

      modules = [
        "break"
        {
          type = "os";
          key = "OS  ";
          keyColor = "31";
        }
        {
          type = "kernel";
          key = "KER ";
          keyColor = "32";
        }
        {
          type = "packages";
          format = "{} (nixpkgs)";
          key = "PKG ";
          keyColor = "33";
        }
        {
          type = "shell";
          key = "SH  ";
          keyColor = "34";
        }
        {
          type = "cpu";
          key = "CPU ";
          keyColor = "35";
        }
        {
          type = "memory";
          format = "{used} / {total}";
          key = "MEM ";
          keyColor = "36";
        }
        {
          type = "uptime";
          key = "UP  ";
          keyColor = "37";
        }
        "break"
      ];
    };
  };
}
