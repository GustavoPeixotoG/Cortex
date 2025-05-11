{
  imports = [
    ./apps.nix
    ./avahi.nix
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
    ./xserver.nix
  ];

  # Hostname
  networking.hostName = "NixOS-Gugu";

  # Boot
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = false;
  };

  # Network Manager
  networking.networkmanager.enable = true;

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

  # Android Emulator
  virtualisation.waydroid.enable = true;

  system.stateVersion = "24.05";
}
