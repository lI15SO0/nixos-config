{ pkgs, ... }:
{
	networking = {
		bridges.br0 = {
			interfaces = [];
			rstp = true;
		};
		nftables.enable = true;

	};

	virtualisation={
		incus = {
			enable = true;
		};

		libvirtd = {
			enable = true;
			qemu = {
				package = pkgs.qemu_kvm;
				vhostUserPackages = with pkgs; [ virtiofsd ];
			};

		};
	};

	environment.systemPackages = with pkgs; [ dnsmasq ];

	programs.virt-manager.enable = true;
}
