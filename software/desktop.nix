{ pkgs, inputs, ... }:
{
	programs = {
		niri = {
			enable = true;
		};
		xwayland = {
			enable = true;
		};
	};

	services = {
		displayManager.ly.enable = true;

		gvfs.enable = true; # Enable usb driver auto mount.
		devmon.enable = true;
		udisks2.enable = true;
	};

	environment.systemPackages = with pkgs; [
		inputs.noctalia.packages.${system}.default
		# playerctl
		# brightnessctl
		ghostty
		libnotify
		wl-clipboard

		vlc

		pcmanfm
		lxmenu-data
		shared-mime-info
	];
}
