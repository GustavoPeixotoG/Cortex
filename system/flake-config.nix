{ config, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.sessionVariables.NH_FLAKE = "${config.users.users.gustavo.home}/.config/Cortex";
}
