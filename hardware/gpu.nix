{config, ...}:

{
	nixpkgs.config.allowUnfree = true;
	
	services.xserver.videoDrivers = [
		"modesetting"
		"nvidia"
	];

	hardware={
		graphics = {
			enable = true;
			enable32Bit = true;
		};

		nvidia = {
			open = false;
			prime = {
				offload = {
					enable = true;
					enableOffloadCmd = true;
				};
				# sync.enable = true;
				intelBusId = "PCI:0@0:2:0";
				nvidiaBusId = "PCI:1@0:0:0";
			};

			package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
		};
	};
}
