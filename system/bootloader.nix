{ config, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  boot={
    loader = {
      efi.efiSysMountPoint = "/boot";
      efi.canTouchEfiVariables = true;
      timeout = 3;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = false;
        efiInstallAsRemovable = false;
      };
    };

    # kernelPackages = pkgs.zfs.lastestCompatibleLinuxPackages;
  };
}
