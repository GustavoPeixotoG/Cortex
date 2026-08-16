{
  imports = [
    ./apps.nix
    ./avahi.nix
    ./battery.nix
    ./bluetooth.nix
    ./firewall.nix
    ./flake-config.nix
    ./hardware-configuration.nix
    ./hotspot.nix
    ./hyprland.nix
    ./intel.nix
    ./locale.nix
    ./ly.nix
    ./moonlight-mic.nix
    ./sound.nix
    ./ssh.nix
    ./steam.nix
    ./swap.nix
    ./users.nix
    ./webserver.nix
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
    hyprland.enable = true;
    zsh.enable = true;
  };

  services = {
    vnstat.enable = true;
    logind.settings.Login.HandleLidSwitch = "lock";
  };

  # Android Emulator
  virtualisation.waydroid.enable = true;

  system.stateVersion = "24.05";
}
