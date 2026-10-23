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

  home.stateVersion = "26.05";
}
