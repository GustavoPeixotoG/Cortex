{
  home.username = "gustavo";
  home.homeDirectory = "/home/gustavo";

  imports = [
    ./apps.nix
    ./btop.nix
    ./git.nix
    ./lexis.nix
    ./minecraft.nix
    ./zsh.nix
  ];

  home.stateVersion = "24.05";

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "konsole";
  };

  programs.home-manager.enable = true;
}
