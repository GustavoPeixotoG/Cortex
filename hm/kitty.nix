{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "MesloLGS Nerd Font";
      font_size = 11;
    };
  };
}
