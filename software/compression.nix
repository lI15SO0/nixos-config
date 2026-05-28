{ pkgs, ... }:
{
	environment.systemPackages = with pkgs;[
		unzip
		p7zip
	];
}
