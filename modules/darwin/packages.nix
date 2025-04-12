{pkgs}:
with pkgs; let
  shared-packages = import ../shared/packages.nix {inherit pkgs;};
in
  shared-packages
  ++ [
    openocd
    gcc
    gdb
    lldb
    act

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
