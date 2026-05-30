{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		wineWow64Packages.stable
		vkd3d
		dxvk
		winetricks
	];
}
