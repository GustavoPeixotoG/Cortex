{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = "zsh /home/gustavo/Cortex/hm/motd.sh";

    shellAliases = {
      motd = "bash /home/gustavo/Cortex/hm/motd.sh";
      ssh = "kitten ssh";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ ];
      theme = "afowler";
    };
  };
}
