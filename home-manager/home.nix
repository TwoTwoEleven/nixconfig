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
    sessionVariables = {
      DISPLAY = ":0";
      EDITOR = "micro";
    };
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

  # remmina connection files
  xdg.dataFile."remmina/nd_rdp_nd-dev-nogpu_192-168-1-121.remmina".source = ./remmina/nd_rdp_nd-dev-nogpu_192-168-1-121.remmina;

  # fastfetch

  home.stateVersion = "26.05";
}
