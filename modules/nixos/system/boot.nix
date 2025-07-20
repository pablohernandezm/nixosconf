{ pkgs, ... }:
{
  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  # Use zen kernel.
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
}
