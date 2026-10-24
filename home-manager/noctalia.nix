{ lib, ... }:

{
  programs.noctalia = {
    enable = true;
    settings = {
      theme = {
        community_palette = "Ayu Blue";
        mode = "dark";
        source = "community";
      };
      wallpaper = {
        directory = "/home/jimg/Pictures/Wallpaper";
        fill_mode = "center";
      };
      wallpaper.default.path = "/home/jimg/Pictures/Wallpaper/nix-dark.png";
      wallpaper.last.path = "/home/jimg/Pictures/Wallpaper/nix-dark.png";
      wallpaper.monitors.DP-2.path = "/home/jimg/Pictures/Wallpaper/nix-dark.png";
      wallpaper.monitors.DP-4.path = "/home/jimg/Pictures/Wallpaper/nix-dark.png";
      wallpaper.monitors.HDMI-A-1.path = "/home/jimg/Pictures/Wallpaper/nix-dark.png";
      wallpaper.monitors.HDMI-A-2.path = "/home/jimg/Pictures/Wallpaper/nix-dark.png";
    };
  };
}
