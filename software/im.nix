{ pkgs, ... }:
{
	i18n.inputMethod = {
		enable = true;
		type = "fcitx5";
		fcitx5.addons = with pkgs; [
			fcitx5-fluent
			fcitx5-rime
		];
	};
}
