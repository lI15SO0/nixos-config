{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fd
    fzf
    nushell
    ripgrep
    starship
    zsh
    nushell
    btop
    dust
    file
    feh
  ];

  programs = {
    nushell = {
      enable = true;
      plugins = with pkgs; [
        nushellPlugins.polars
        nushellPlugins.formats
        nushellPlugins.query
        nushellPlugins.gstat
      ];
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        plugins = [ "git" ];
      };
      shellAliases = {
        e = "nvim";
      };
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    atuin = {
      enable = true;
      flags = [ "--disable-up-arrow" ];
      enableZshIntegration = true;
      settings = {
        auto_sync = false;
      };
    };
  };
}
