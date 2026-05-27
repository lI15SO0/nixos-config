{ pkgs,... }:
{
	programs.nano.enable = false;
	environment.systemPackages = with pkgs; [
		neovim
		emacs
		vim

		tree-sitter
	];
}
