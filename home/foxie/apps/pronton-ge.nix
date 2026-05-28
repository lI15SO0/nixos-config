{ pkgs, ... }:
{
	home.file.".local/share/Steam/compatibilitytools.d/Proton-GE".source = pkgs.proton-ge-bin.steamcompattool;
}
