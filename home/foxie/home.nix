{ config, pkgs, ... }:
{

	imports = [
		./apps
	];

	home.username = "foxie";
	home.homeDirectory = "/home/foxie";

	home.packages = [
		
	];

	home.sessionVariables = {
		# __NV_PRIME_RENDER_OFFLOAD = "1";
		# __GLX_VENDOR_LIBRARY_NAME = "nvidia";
		# __VK_LAYER_NV_optimus = "NVIDIA_only";
	};

	home.file = {
		"${config.xdg.dataHome}/applications/steam.desktop" = {
			enable = true;
			text = let
				steamDesktop = "${pkgs.steam}/share/applications/steam.desktop";
				steamDesktopContent = builtins.readFile steamDesktop;
			in builtins.replaceStrings ["Exec="] ["Exec=nvidia-offload "] steamDesktopContent;
		};

		"${config.xdg.dataHome}/applications/firefox-devedition.desktop" = {
			enable = true;
			text = let
				firefoxDesktop = "${pkgs.firefox-devedition}/share/applications/firefox-devedition.desktop";
				firefoxDesktopContent = builtins.readFile firefoxDesktop;
			in builtins.replaceStrings ["Exec="] ["Exec=nvidia-offload "] firefoxDesktopContent;
		};
	};

	home.stateVersion = "25.11";
}
