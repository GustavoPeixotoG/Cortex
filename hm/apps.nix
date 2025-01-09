{ pkgs, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
  home.packages = with pkgs; [
    alsa-utils
    curl
    ffmpeg
    firefox
    gcc
    git
    gparted
    htop
    iftop
    jdk
    killall
    libreoffice
    libva-utils
    lm_sensors
    lshw
    neofetch
    nload
    nmap
    pamixer
    paprefs
    pavucontrol
    pciutils
    playerctl
    pmutils
    prismlauncher
    progress
    pulseaudioFull
    # qbittorrent
    speedtest-cli
    thunderbird
    unrar
    unzip
    usbutils
    ventoy-full
    vlc
    wget
    wl-clipboard
    yazi
    yt-dlp
    zathura
    zip
  ];
}
