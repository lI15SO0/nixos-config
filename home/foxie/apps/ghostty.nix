{ programs, ... }:
{
	programs.ghostty = {
		enable = true;

		enableBashIntegration = true;
		enableFishIntegration = true;
		enableZshIntegration = true;

		settings = {
			font-family = "Maple Mono NF CN";
			background-opacity = 0.9;
			background-blur = 10;
			window-vsync = true;
			confirm-close-surface = true;
			clipboard-read = "allow";
			clipboard-write = "allow";
			clipboard-trim-trailing-spaces = true;
			clipboard-paste-protection = true;
			clipboard-paste-bracketed-safe = true;
			desktop-notifications = true;
			macos-window-shadow = true;
			macos-auto-secure-input = true;
			macos-secure-input-indication = true;
			gtk-wide-tabs = false;
			gtk-titlebar = false;
			quick-terminal-autohide = true;
			cursor-style-blink = false;
			theme = "noctalia";
		};
	};
}
