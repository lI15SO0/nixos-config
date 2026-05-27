{ pkgs, ... }:
{
	# programs.nushell.enable = true;
	environment.systemPackages = with pkgs;[
		fd
		fzf
		nushell
		ripgrep
		starship
		zsh
		nushell
		btop
		dust
		file
		feh
	];

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestions.enable = true;
		syntaxHighlighting.enable = true;
		ohMyZsh = {
			enable = true;
			plugins = [ "git" "z" ];
		};
		shellAliases = {
			e = "nvim";
		};
	};
}
