{ config, pkgs, lib, ... }:

let
	rimeConfSource = "${config.home.homeDirectory}/.local/share/rime-conf";
in {
	i18n.inputMethod = {
		enable = true;
		type = "fcitx5";
		fcitx5.addons = with pkgs; [
			fcitx5-fluent
			fcitx5-rime
		];
	};

	home.file."${config.xdg.dataHome}/fcitx5/rime".source = 
		config.lib.file.mkOutOfStoreSymlink rimeConfSource;

	home.activation.cloneRimeConf = lib.hm.dag.entryAfter ["writeBoundary"] ''
		if [[ ! -d ${rimeConfSource} ]]; then
			${pkgs.git}/bin/git clone https://codeberg.org/lI15SO0/RimeConf.git ${rimeConfSource}
		else
			(cd ${rimeConfSource} && ${pkgs.git}/bin/git pull )
		fi
		mkdir -p ${config.xdg.dataHome}/fcitx5
	'';
}
