{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		efibootmgr
		fastfetch
		pciutils

		exfatprogs
		zfs
		btrfs-progs
	];
}
