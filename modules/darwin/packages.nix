{pkgs}:
with pkgs; let
  shared-packages = import ../shared/packages.nix {inherit pkgs;};
  codegpt = pkgs.callPackage ../../pkgs/codegpt.nix {};
in
  shared-packages
  ++
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
    prettierd
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
  ]
