{ pkgs, ... }:
{
  home.packages = with pkgs; [
    curl                      # Command line tool for transferring files with URL syntax
    discord                   # All-in-one cross-platform voice and text chat for gamers
    doomretro                 # Classic, refined DOOM source port
    ffmpeg                    # Complete, cross-platform solution to record, convert and stream audio and video
    firefox                   # Web browser built from Firefox source tree
    gh                        # GitHub CLI tool
    glibc                     # GNU C Library
    gnumake                   # Tool to control the generation of non-source files from sources
    gparted                   # Graphical disk partitioning tool
    iftop                     # Display bandwidth usage on a network interface
    jdk                       # Open-source Java Development Kit
    killall                   # No description :/
    lazygit                   # Simple terminal UI for git commands
    lm_sensors                # Tools for reading hardware sensors
    lshw                      # Provide detailed information on the hardware configuration of the machine
    mpv                       # General-purpose media player, fork of MPlayer and mplayer2
    ncdu                      # Disk usage analyzer with an ncurses interface
    neofetch                  # Fast, highly customizable system info script
    netcat                    # Free TLS/SSL implementation
    nload                     # Monitors network traffic and bandwidth usage with ncurses graphs
    nmap                      # Free and open source utility for network discovery and security auditing
    nomacs                    # Qt-based image viewer
    obs-studio                # Free and open source software for video recording and live streaming
    pciutils                  # Collection of programs for inspecting and manipulating configuration of PCI devices
    prismlauncher             # Free, open source launcher for Minecraft
    progress                  # Tool that shows the progress of coreutils programs
    qbittorrent               # Featureful free software BitTorrent client
    speedtest-cli             # Command line interface for testing internet bandwidth using speedtest.net
    stress                    # Simple workload generator for POSIX systems.
    superTuxKart              # Free 3D kart racing game
    thunderbird               # Full-featured e-mail client
    unrar                     # Utility for RAR archives
    unzip                     # Extraction utility for archives compressed in .zip format
    usbutils                  # Tools for working with USB devices, such as lsusb
    vlc                       # Cross-platform media player and streaming server
    wget                      # Tool for retrieving files using HTTP, HTTPS, and FTP
    wl-clipboard              # Command-line copy/paste utilities for Wayland
    yt-dlp                    # Command-line tool to download videos from YouTube.com and other sites (youtube-dl fork)
    zip                       # Compressor/archiver for creating and modifying zipfiles
  ];
}
