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
	};

	environment.systemPackages = with pkgs; [
		inputs.noctalia.packages.${system}.default
		# playerctl
		# brightnessctl
		ghostty
		libnotify
		wl-clipboard

		vlc
	];
}
