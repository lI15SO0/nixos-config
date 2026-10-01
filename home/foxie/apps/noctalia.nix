{ pkgs, inputs, ... }:
{
	xdg.configFile."noctalia/config.toml".source = config/noctalia/config.toml;

    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];

    # configure options
    programs.noctalia = {
      enable = true;
	};
}
