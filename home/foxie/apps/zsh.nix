{ programs, ... }:
{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		enableAutosuggestions = true;
		enableSyntaxHighlighting = true;
		oh-my-zsh = {
			enable = true;
			plugins = [ "git" ];
		};
		initContent = ''
eval "$(starship init zsh)"
		'';

		shellAliases = {
			e = "nvim";
			sr = "doas su -l";
		};
	};

}
