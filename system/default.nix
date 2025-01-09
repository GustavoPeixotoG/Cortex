{
  imports = [
    ./apps.nix
    ./firewall.nix
    ./flake-config.nix
    ./font.nix
    ./hardware-configuration.nix
    ./hotspot.nix
    ./intel.nix
    ./locale.nix
    ./sound.nix
    ./steam.nix
    ./swap.nix
    ./users.nix
  ];

  # Hostname
  networking.hostName = "NixOS-Gugu";

  # Boot
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = false;

  # Networking
  networking.networkmanager.enable = true;

  services.xserver = {
    enable = true;

    layout = "br";
    xkbVariant = "";
    xkbModel = "";

    displayManager.lightdm.enable = true;
    desktopManager.cinnamon.enable = true;
  };

  programs = {
    dconf.enable = true;
    zsh.enable = true;
  };

  services = {
    blueman.enable = true;
    openssh.enable = true;
    vnstat.enable = true;
    logind.lidSwitch = "lock";
  };

  system.stateVersion = "24.05";
}
