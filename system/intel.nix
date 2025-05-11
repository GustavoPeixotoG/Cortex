{ pkgs, ... }:
{
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      mesa
      libglvnd
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];

    extraPackages32 = with pkgs.pkgsi686Linux; [
      mesa
      libglvnd
      vaapiIntel
    ];
  };

  environment.systemPackages = with pkgs; [
    libva-utils
    vulkan-tools
    intel-gpu-tools
    apitrace
  ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
    VDPAU_DRIVER = "va_gl";
    GBM_BACKEND = "intel-ipc";
    __GLX_VENDOR_LIBRARY_NAME = "intel";
  };}
