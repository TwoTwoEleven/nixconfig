{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system.nix
    ./xserver.nix
    ./sddm.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;
  programs.niri.enable = true;
  programs.bash.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
  
  environment.systemPackages = with pkgs; [
    fuzzel
    noctalia
    vivaldi
    vivaldi-ffmpeg-codecs
    ghostty
    dust
    micro
    btop
    fastfetch
    bat
    ripgrep
    git
    hexyl
    man-db
    starship
    stress
    # xdg-utils
    discord
    vscodium
    dysk
    wget
    #neovim
    bitwarden-cli
    nh # nixos helper
    yazi # disk navigator
    kew # music player
    lsd # ls with icons/colors
    zoxide # smarter cd
    remmina # RDP client
    pinta # draing program like Paint.NET
    # kicad
    # orca-slicer

    nixd
    nixfmt

    rustup
  ];

  # nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}
