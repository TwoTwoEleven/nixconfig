{ config, pkgs, ... }:

{
  # X11 settings
  services.xserver = {
    enable = true;
    xkb = { # keymap
      layout = "us";
      variant = "";
    };
    videoDrivers = [ "nvidia" ];

    # maybe help to remap keys under wayland - KP_Delete as Delete so that it's recognized by most apps
    # https://github.com/llakala/nixos/blob/13d9ebf2e21111540beaae1e938817bea8f49cd7/config/features/xkb.nix

    # Turn off all but the primary display for login (display names specific)
    displayManager.setupCommands = ''
      /run/current-system/sw/bin/xrandr --output DP-2 --off
      /run/current-system/sw/bin/xrandr --output HDMI-0 --off
      /run/current-system/sw/bin/xrandr --output HDMI-1 --off
    '';
  };

  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;

    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/linux/nvidia-x11/default.nix
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    #    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #      version = "615.78.08";
    #      sha256_64bit = "sha256-Pj9t3cLudnoIGFMAr3vjyyhuznZpjS3eNSRZl4LQf/4=";
    #      sha256_aarch64 = "sha256-UHYBE1AYHoGgMfD9AS/jX+S+N8eCDWUft6qolK9Eejc=";
    #      openSha256 = "sha256-HBINiOjL0ZJLIAJeNIBYHBnwgUXtNwPPtnFpAI1YwF4=";
    #      settingsSha256 = "sha256-inDRpG02sdDgHmlqgu/DsgK8OFdOt1fZIYyXdhlGC/c=";
    #      persistencedSha256 = "sha256-RzeR6Ldct6MUxjnXRyThdh5Y3jjMehTVg85MtwuWNX4=";
    #    };
  };

}
