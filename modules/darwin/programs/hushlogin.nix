{vars, ...}: {
  home.file."/Users/${vars.username}/.hushlogin" = {
    source = ../config/hushlogin;
  };
}
