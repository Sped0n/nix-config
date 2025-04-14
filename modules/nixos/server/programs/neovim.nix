{
  config,
  vars,
  ...
}: let
in {
  imports = [
    ../../../shared/programs/neovim.nix
  ];

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink
    "/home/${vars.username}/.config/nix/modules/shared/config/nvim/";
}
