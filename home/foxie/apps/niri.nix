{ pkgs, ... }:
{
	xdg.configFile."niri/config.kdl".source = ./config/niri/config.kdl;

	home.packages = with pkgs; [
		xwayland-satellite
	];

	home.sessionVariables = {
		DISPLAY=":0";
	};
}
