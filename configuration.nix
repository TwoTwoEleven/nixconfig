{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system.nix
    ./xserver.nix
    ./sddm.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code # Nerd Fonts: Programming ligatures, extension of Fira Mono font, enlarged operators
  ];

  programs.niri.enable = true; # Scrollable-tiling Wayland compositor
  programs.bash.enable = true; # GNU Bourne-Again Shell, the de facto standard shell on Linux (for interactive use)

  environment.systemPackages = with pkgs; [
    # System apps
    noctalia # Sleek, customizable desktop shell crafted for Wayland
    fuzzel # Wayland-native application launcher, similar to rofi’s drun mode
    ghostty # Fast, native, feature-rich terminal emulator pushing modern features
    starship # Minimal, blazing fast, and extremely customizable prompt for any shell

    # CLI apps
    dust # du, but more intuitive
    micro # Modern and intuitive terminal-based text editor
    btop # Monitor of resources
    fastfetch # Actively maintained, feature-rich and performance oriented, neofetch like system information tool
    bat # Cat(1) clone with syntax highlighting and Git integration
    ripgrep # Utility that combines the usability of The Silver Searcher with the raw speed of grep
    hexyl # Command-line hex viewer
    man-db # Implementation of the standard Unix documentation system accessed using the man command
    stress # Simple workload generator for POSIX systems. It imposes a configurable amount of CPU, memory, I/O, and disk stress on the system
    # xdg-utils
    dysk # Get information on your mounted disks
    wget # Tool for retrieving files using HTTP, HTTPS, and FTP
    #neovim
    bitwarden-cli # Secure and free password manager for all of your devices
    nh # Yet another nix cli helper
    yazi # Blazing fast terminal file manager written in Rust, based on async I/O
    kew # Command-line music player for Linux
    lsd # Next gen ls command
    zoxide # Fast cd command that learns your habits

    # GUI apps
    discord # All-in-one cross-platform voice and text chat for gamers
    # freefilesync # Open Source File Synchronization & Backup Software
    pinta # Drawing/editing program modeled after Paint.NET
    remmina # Remote desktop client written in GTK
    vivaldi # Browser for our Friends, powerful and personal
    vivaldi-ffmpeg-codecs # Additional support for proprietary codecs for Vivaldi and other chromium based tools
    # kicad # Open Source Electronics Design Automation suite
    # orca-slicer # G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.)

    # coding packages
    vscodium # Open source source code editor developed by Microsoft for Windows, Linux and macOS (VS Code without MS branding/telemetry/licensing)
    nixd # Feature-rich Nix language server interoperating with C++ nix
    #nixfmt # Official formatter for Nix code
    nixfmt-rs # Rust reimplementation of nixfmt that produces byte-identical output to the Haskell original

    rustup # Rust toolchain installer
    git # Distributed version control system
    gitui # Blazing fast terminal-ui for Git written in Rust
  ];

  # nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}
