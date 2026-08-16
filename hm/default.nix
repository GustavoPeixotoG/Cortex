{ inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
    ./apps.nix
    ./btop.nix
    ./fastfetch.nix
    ./ghostty.nix
    ./git.nix
    ./hyprland
    ./java.nix
    ./lexis.nix
    ./minecraft-overlay.nix
    ./nix-index.nix
    ./noctalia.nix
    ./obs.nix
    ./satty.nix
    ./stylix.nix
    ./thunderbird.nix
    ./tmux.nix
    ./user.nix
    ./yazi.nix
    ./zen-browser.nix
    ./zsh.nix
  ];

  home.stateVersion = "24.05";

}
