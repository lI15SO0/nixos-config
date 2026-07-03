{ pkgs, rust-overlay, config, ... }:
{
	programs.ccache.enable = true;

	environment.systemPackages = with pkgs; [
		# build tool
		cmake
		ninja
		gnumake
		meson
		muon
		just

		# C 
		gcc
		clang
		lldb
		gdb
		clang-tools

		# go
		go

		# python
		ty
		ruff
		uv
		python3

		# es script
		quickjs-ng
		nodejs
		deno

		# dotnet
		# dotnet-sdk_11
		dotnet-sdk_10
		mono

		# Godot
		godot-mono

		# Lua
		luajit
		lua

		# rust
		rustc
		cargo
		clippy
		rustfmt
		sccache

		# typst
		typst

		# ocaml
		opam

		# racket
		racket

		# Vcs
		git

		# java
		gradle
		openjdk

		# shader
		shader-slang

		# vulkan
		vulkan-volk
		vulkan-tools
		vulkan-headers
		vulkan-loader

		vulkan-validation-layers
		vulkan-tools-lunarg
		vulkan-extension-layer

		vulkan-utility-libraries

		spirv-tools
		glslang
		shaderc

		mesa

		# Libraries
		sdl3
		assimp
		stb
		glm
	];

	environment.sessionVariables = rec {
		VULKAN_SDK = "${pkgs.vulkan-headers}";
		VULKAN_LAYER_PATH = "${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d";
		CMAKE_PREFIX_PATH = "/run/current-system/sw";
		CMAKE_LIBRARY_PATH = "/run/current-system/sw/lib";
		CMAKE_INCLUDE_PATH = "/run/current-system/sw/include";
		PKG_CONFIG_PATH = "/run/current-system/sw/lib/pkgconfig";
	};

	# ccache
	nixpkgs.overlays = [
		(self: super: {
			ccacheWrapper = super.ccacheWrapper.override {
				extraConfig = ''
				export CCACHE_COMPRESS=1
				export CCACHE_DIR="${config.programs.ccache.cacheDir}"
				export CCACHE_UMASK=007
				export CCACHE_SLOPPINESS=random_seed
				if [ ! -d "$CCACHE_DIR" ]; then
					echo "====="
					echo "Directory '$CCACHE_DIR' does not exist"
					echo "Please create it with:"
					echo "  sudo mkdir -m0770 '$CCACHE_DIR'"
					echo "  sudo chown root:nixbld '$CCACHE_DIR'"
					echo "====="
					exit 1
				fi
				if [ ! -w "$CCACHE_DIR" ]; then
					echo "====="
					echo "Directory '$CCACHE_DIR' is not accessible for user $(whoami)"
					echo "Please verify its access permissions"
					echo "====="
					exit 1
				fi
				'';
			};
		})
	];
}
