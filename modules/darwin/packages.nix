{pkgs}:
with pkgs; let
  shared-packages = import ../shared/packages.nix {inherit pkgs;};
in
  shared-packages
  ++ [
    # misc
    openocd
    gcc
    gdb
    lldb

    # lua
    lua-language-server
    stylua
    selene

    # nix
    nixd
    alejandra

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
