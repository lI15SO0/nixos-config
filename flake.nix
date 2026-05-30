{
	description = "Nixos config flake";

	inputs = {
		# nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		# nixpkgs.url = "git+https://mirrors.cernet.edu.cn/nixpkgs.git?ref=nixos-unstable&shallow=1";
		# nixpkgs.url = "git+https://mirrors.nju.edu.cn/git/nixpkgs.git?ref=nixos-unstable&shallow=1";
		nixpkgs.url = "git+http://lunarserver.local:3000/MIRROR/nixpkgs/?ref=nixos-unstable&shallow=1";

		home-manager = {
			# url = "github:nix-community/home-manager";
			url = "git+http://lunarserver.local:3000/MIRROR/home-manager?shallow=1";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		noctalia = {
			# url = "github:noctalia-dev/noctalia-shell";
			url = "git+http://lunarserver.local:3000/MIRROR/noctalia-shell?ref=main&shallow=1";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs: {
		nixosConfigurations = { 
			deploy = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs;};
				modules = [
					./configuration.nix
				];
			};
		};
	};
}
