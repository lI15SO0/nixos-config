{ pkgs, ... }:
{
	programs.firefox = {
		enable = true;
		package = pkgs.firefox-bin;
	};
	
	programs.chromium.enable = true;

	environment.systemPackages = with pkgs; [
		aria2
		wget
		filezilla
		chromium
	];
}
