{ pkgs, ... }:
{

	fonts.packages = with pkgs; [
		maple-mono.NF-CN
		maple-mono.NF-CN-unhinted
	];
}
