{pkgs}:
with pkgs; let
  shared-packages = import ../shared/packages.nix {inherit pkgs;};
  codegpt = pkgs.callPackage ../../pkgs/codegpt.nix {};
in
  shared-packages
  ++ [
    # utils
    codegpt
    openocd
    gcc
    gdb
    lldb
    act
    bfg-repo-cleaner

    # python
    uv
    ruff
    basedpyright

    # go
    go
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
  ]
