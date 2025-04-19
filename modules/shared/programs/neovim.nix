{
  config,
  home,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = false;
  };

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink
    "${home}/.config/nix/modules/shared/config/nvim/";
}
