{pkgs, ...}: let
  codegpt = pkgs.callPackage ../../pkgs/codegpt.nix {};
in
  with pkgs; {
    imports = [
      ../../modules/darwin/packages.nix
    ];

    home.packages =
      # Core
      [
        docker
        openocd
        qemu
        cmake
        gcc
        gdb
        lldb
      ]
      ++
      # Utils
      [
        bfg-repo-cleaner
        codegpt
        hyperfine
        act
        ast-grep
        minicom
        nali
        tokei
      ]
      ++
      # Languages supports
      [
        # python
        uv
        ruff
        basedpyright

        # go
        gopls
        gofumpt

        # rust
        rustup

        # c/cpp
        clang-tools
        neocmakelsp

        # typescript
        vtsls
        eslint
        pnpm

        # zig
        zls
      ]
      ++
      # Others
      [
        ffmpeg
        imagemagick
        restic
      ];
  }
