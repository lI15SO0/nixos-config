{ config, pkgs, ... } :

let
	nvimRepoUrl = "https://codeberg.org/lI15SO0/nvim-config";
	nvimConfigPath = "/${config.users.users.root.home}/.config/nvim";
in 
{
	users.users.root = {
		shell = pkgs.zsh;
	};

	system.activationScripts.rootNeovimConfig = {
		text = ''
		# 确保 .config 目录存在
		mkdir -p "$(dirname ${nvimConfigPath})"

		if [[ ! -d ${nvimConfigPath} ]]; then
			${pkgs.git}/bin/git clone ${nvimRepoUrl} ${nvimConfigPath}
		else
			(cd ${nvimConfigPath} && ${pkgs.git}/bin/git pull)
		fi
		'';
		deps = [];
	};
}
