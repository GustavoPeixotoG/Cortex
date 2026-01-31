{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      mesa
      intel-vaapi-driver  # driver correto para Ivy Bridge
      libva-vdpau-driver
      libvdpau-va-gl
      intel-compute-runtime # OpenCL opcional
    ];

    extraPackages32 = with pkgs.pkgsi686Linux; [
      mesa
      intel-vaapi-driver
    ];
  };

  environment.systemPackages = with pkgs; [
    libva-utils        # Testes VAAPI
    vulkan-tools       # Testes Vulkan
    intel-gpu-tools    # Diagnóstico da GPU Intel
    mesa-demos         # Inclui glxinfo
    clinfo             # OpenCL info (opcional)
    apitrace           # Análise de chamadas GL
  ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "i965";
    VDPAU_DRIVER = "va_gl";
    __GLX_VENDOR_LIBRARY_NAME = "mesa";
  };

  boot.kernelParams = [
    "i915.enable_guc=0"     # Desativa GuC, não suportado pela HD 4000
    "i915.semaphores=1"     # Ajuda com renderização em alguns casos
    "i915.enable_psr=0"     # Evita flickering e black screens
  ];
}

