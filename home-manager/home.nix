{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./starship.nix
    ./niri/niri.nix
    ./noctalia.nix
    ./vscodium.nix
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

  # example to add a subtree from git root folder to subtree prefix folder
  # git subtree add --prefix home-manager/yazi/ayu-dark.yazi https://github.com/kmlupreti/ayu-dark.yazi main --squash
  # to update subtree from git root folder
  # git subtree pull --prefix home-manager/yazi/ayu-dark.yazi https://github.com/kmlupreti/ayu-dark.yazi main --squash
  programs.yazi = {
    enable = true;
    flavors = {
      ayu-dark = ./yazi/ayu-dark.yazi;
    };
    theme = {
      flavor = {
        dark = "ayu-dark";
        light = "ayu-dark";
      };
    };
  };

  # git
# git config --local user.email "gunkjunk@gmail.com"
# git config --local user.name "TwoTwoEleven"
# git config --global init.defaultBranch main
# git config --list

  # fastfetch

  home.stateVersion = "26.05";
}
