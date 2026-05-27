{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
	  ./hardware-configuration.nix
      ./hardware/gpu.nix
    ];
}
