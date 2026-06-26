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
eval $(opam env)
		'';

		shellAliases = {
			e = "nvim";
			sr = "doas su -l";
		};
	};

}
