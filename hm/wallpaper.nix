{ config, pkgs, ... }:
let
  wallpaperScript = import ./scripts/xwallpaper.nix { inherit config pkgs; };
in
{
  home.packages = with pkgs; [
    xwallpaper
    wallpaperScript
  ];

  systemd.user.services.xwallpaper = {
    Unit = {
      Description = "Randomize wallpaper on X11 session start";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${wallpaperScript}/bin/wallpaper";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
