{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		csharp-ls
		vscode-langservers-extracted
		fsautocomplete
		glsl_analyzer
		lua-language-server
		mesonlsp
		neocmakelsp
		rust-analyzer
		taplo
		yaml-language-server
		zls
	];
}
