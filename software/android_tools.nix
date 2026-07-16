{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		android-tools
		edl
		extract-dtb
		dtc
	];
}
