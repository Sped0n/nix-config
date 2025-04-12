{
  pkgs,
  config,
  vars,
  ...
}: let
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink
    (
      if pkgs.stdenv.hostPlatform.isDarwin
      then "/Users/${vars.username}/.config/nix/modules/shared/config/nvim/"
      else "/home/${vars.username}/.config/nix/modules/shared/config/nvim/"
    );
}
