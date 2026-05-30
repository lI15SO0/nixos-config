{ lib, ... } :
{
	# Nix settings.
	nix = {
		settings = {
			# substituters = lib.mkForce [
			# 	"https://mirrors.cernet.edu.cn/nix-channels/store" 
			# 	"https://cache.nixos.org"
			# ];
			experimental-features = [ "nix-command" "flakes" ];
			extra-substituters = [ "https://mirrors.cernet.edu.cn/nix-channels/store" "https://noctalia.cachix.org" ];
			extra-trusted-public-keys = [
				"noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" 
				"cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
			];
		};

		gc = {
			automatic = lib.mkDefault true;
			dates = lib.mkDefault "weekly";
			options = lib.mkDefault "--delete-older-than 7d";
		};
	};

	environment.sessionVariables = rec {
		EDITOR="nvim" ;
	};

	# Locale settings
	time.timeZone = "Asia/Shanghai";
	i18n.defaultLocale = "zh_CN.UTF-8";
 }
