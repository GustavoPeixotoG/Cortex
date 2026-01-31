{
  imports = [
    ./apps.nix
    ./avahi.nix
    ./battery.nix
    ./bluetooth.nix
    ./firewall.nix
    ./flake-config.nix
    ./font.nix
    ./hardware-configuration.nix
    ./hotspot.nix
    ./intel.nix
    ./locale.nix
    ./ly.nix
    ./remote-build.nix
    ./sound.nix
    ./ssh.nix
    ./steam.nix
    ./swap.nix
    ./users.nix
    ./webserver.nix
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
    vnstat.enable = true;
    logind.settings.Login.HandleLidSwitch = "lock";
  };

  # Android Emulator
  virtualisation.waydroid.enable = true;

  system.stateVersion = "24.05";
}
