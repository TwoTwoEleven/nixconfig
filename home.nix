{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./starship.nix
  ];

  programs.home-manager.enable = true;
  home = {
    username = "jimg";
    homeDirectory = "/home/jimg";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      nixrs = "sudo nixos-rebuild switch --flake ~/.nixconfig";
      nixrsu = "sudo nixos-rebuild switch --upgrade --flake ~/.nixconfig";
    };
  };

  programs.ghostty = {
    enable = true;
    settings = {
      background-opacity = 0.85;
      theme = "Ayu";
      font-family = "FiraCode Nerd Font";
      font-size = 14;
    };
  };

  # niri

  # noctalia

  # git

  # fastfetch

  # vscodium

  # yazi
  programs.yazi = {
    enable = true;
    flavors = {
      ayu-dark = ./yazi/ayu-dark.yazi;
      #ayu-dark = "kmlupreti/ayu-dark";
    };
    theme = {
      flavor = {
        dark = "ayu-dark";
        light = "ayu-dark";
      };
    };
    #extraPackages = [
    #  kmlupreti/ayu-dark
    #];
  };

  home.stateVersion = "26.05";
}
