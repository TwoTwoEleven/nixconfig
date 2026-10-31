{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./fish.nix
    ./niri/niri.nix
    ./noctalia.nix
    ./rmpc.nix
    ./starship.nix
    ./vscodium.nix
  ];

  programs.home-manager.enable = true;
  home = {
    username = "jimg";
    homeDirectory = "/home/jimg";
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      command = "fish --login --interactive";
      shell-integration = "fish";
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
  xdg.dataFile."remmina/nd_rdp_nd-dev-nogpu_192-168-1-121.remmina".source =
    ./remmina/nd_rdp_nd-dev-nogpu_192-168-1-121.remmina;

  # fastfetch

  # fuzzel

  # neovim
  programs.neovim = {
    enable = true;
    plugins = [
      pkgs.vimPlugins.ayu-vim
      pkgs.vimPlugins.vim-nix
      pkgs.vimPlugins.neo-tree-nvim
    ];
    #extraConfig = ''
    #  set termguicolors
    #  let ayucolor="dark"
    #  colorscheme = ayu
    #'';
  };

  # sound visualizer
  programs.cava = {
    enable = true;
    settings = {
      general.framerate = 60;
      input.method = "fifo";
      input.source = "/tmp/mpd.fifo";
      smoothing.noise_reduction = 77;
      color = {
        background = "'#000000'";
        foreground = "'#FFFFFF'";
      };
    };
  };

  home.stateVersion = "26.05";
}
