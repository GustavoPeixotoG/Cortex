{ pkgs, ... }:
{
  users.users.gustavo = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Gustavo";
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };
}
