{ config, pkgs, lib, ... }:

let
	nvimRepoUrl = "https://codeberg.org/lI15SO0/nvim-config";
	nvimConfigPath = "${config.home.homeDirectory}/.config/nvim";
in 
{
	programs.neovim = {
		enable = false;
		defaultEditor = true;
	};

	home.activation = {
		syncNeovimConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
			if [[ ! -d ${nvimConfigPath} ]]; then
				${pkgs.git}/bin/git clone ${nvimRepoUrl} ${nvimConfigPath}
			else
				(cd ${nvimConfigPath} && ${pkgs.git}/bin/git pull )
			fi
		'';
	};
}
