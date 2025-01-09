{
  imports = [
    ./apps.nix
    ./btop.nix
    ./ghostty.nix
    ./git.nix
    ./lexis.nix
    ./minecraft-overlay.nix
    ./yazi.nix
    ./zsh.nix
  ];

  home = {
    homeDirectory = "/home/gustavo";
    stateVersion = "24.05";
    username = "gustavo";

    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "ghostty";
    };
  };

  programs.home-manager.enable = true;
}
