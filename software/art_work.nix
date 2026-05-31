{ pkgs, ... }:
{
	# OBS-Studio
	programs.obs-studio = {
		enable = true;

		# optional Nvidia hardware acceleration
		# package = (
		# 	pkgs.obs-studio.override {
		# 		cudaSupport = true;
		# 	}
		# );

		plugins = with pkgs.obs-studio-plugins; [
			wlrobs
			obs-backgroundremoval
			obs-pipewire-audio-capture
			# obs-vaapi #optional AMD hardware acceleration
			obs-gstreamer
			obs-vkcapture
		];
	};

	environment.systemPackages = with pkgs; [
		# draw
		krita
		aseprite
		inkscape

		# fonts
		fontforge

		# 3D
		blender

		# Music
		ardour
		lmms

		# Video editor
		kdePackages.kdenlive
	];
}
