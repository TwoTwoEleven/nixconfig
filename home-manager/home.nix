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

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      set -x EDITOR "micro"
    '';

    functions = {
      # https://unix.stackexchange.com/questions/68079/mount-cifs-network-drive-write-permissions-and-chown
      mountsmb = "sudo mount -v -t cifs -o username=$smb_user,password=$smb_pass,uid=$(id -u),gid=$(id -g) //192.168.1.248/$argv[1] /home/jimg/.$argv[1]";
    };
    shellAliases = {
      nixrs = "sudo nixos-rebuild switch --flake ~/.config/nixos";
      nixrsu = "sudo nixos-rebuild switch --upgrade --flake ~/.config/nixos";
      nixcode = "codium ~/.config/nixos";
      nixgit = "gitui --directory ~/.config/nixos";
      nixclean = "nh clean all --ask";
      msmb = "mountsmb backups-jim; mountsmb cll; mountsmb media";
      usmb = "sudo umount ~/.backups-jim; sudo umount ~/.cll; sudo umount ~/.media";
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

  home.stateVersion = "26.05";
}
