{ pkgs, ... }:
{
	programs.cargo = {
		enable = true;
		settings = {
			alias = {
				br = "b -r";
				rr = "run --release";
				t = "test";
				cl = "clean";
			};
			build = {
				rustflags = "-C target-cpu=native";
				"rustc-wrapper" = "sccache";
			};
			source = {
				"crates-io" = {
					"replace-with" = "mirror";
				};
				mirror = {
						registry = "sparse+https://mirrors.cernet.edu.cn/crates.io-index/";
				};
			};
			registries = {
				mirror = {
					index = "sparse+https://mirrors.cernet.edu.cn/crates.io-index/";
				};
			};
		};
	};
}
