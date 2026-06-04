{ ... } :
{
	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	services = {
		openssh.enable = true;

		printing.enable = true;

		libinput.enable = true;

		pipewire = {
			enable = true;
			pulse.enable = true;
		};

		avahi = {
			enable = true;
			nssmdns4 = true;
			# openFirewall = true;
			publish = {
				enable = true;
				userServices = true;
				addresses = true;
			};

		};
		blueman.enable = true;

		systembus-notify.enable = true;

		tuned.enable = true;

		upower.enable = true;
	};

	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};
}
