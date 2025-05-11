{
  services.power-profiles-daemon.enable = false;
  services.xserver = {
    enable = true;

    xkb = {
      layout = "br";
      variant = "";
      model = "";
    };

    displayManager.lightdm.enable = true;
    desktopManager.cinnamon.enable = true;
  };
}
