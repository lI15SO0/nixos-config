{ lib, ... } :
{
  # Nix settings.
  nix={
    settings= {
      substituters = [ "https://mirrors.cernet.edu.cn/nix-channels/store" ];
      experimental-features = [ "nix-command" "flakes" ];
	  extra-substituters = [ "https://noctalia.cachix.org" ];
	  extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
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
