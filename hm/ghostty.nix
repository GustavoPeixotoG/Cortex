{ pkgs, ... }:
{
  home.packages = [
    pkgs.ghostty
  ];

  home.file.".config/ghostty/config".text = ''
    theme = "Builtin Dark"
    font-family = "MesloLGS Nerd Font"
  '';
}
