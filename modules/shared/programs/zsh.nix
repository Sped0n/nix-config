{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    completionInit = "autoload -Uz compinit && compinit";
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      strategy = ["history" "completion"];
    };
    syntaxHighlighting = {
      enable = true;
    };
    initExtraFirst = "
      zstyle ':completion:*' menu select
      zvm_after_init_commands+=(eval \"$(atuin init zsh --disable-up-arrow)\")
    ";
    initExtra = "fastfetch";
    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];
  };
}
