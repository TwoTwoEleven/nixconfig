{ lib, ... }:

{
  # just reference the niri config in the repo
  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  # use https://github.com/sodiboo/niri-flake or just save a config.kdl copy in the repo

  #home-manager.options.wayland.windowManager.niri
  #wayland.windowManager.niri = {
  #  programs.niri.settings = {
  #    enable = false;

  #    output = {
  #      "HDMI-A-2" = {
  #        enable = true;
  #        scale = 1.0;
  #        mode = {
  #          width = 1920;
  #          height = 1080;
  #          refresh = 60;
  #        };
  #        transform.rotation = 90;
  #        position = {
  #          x = 0;
  #          y = -480;
  #        };
  #      };
  #    };
  #  };

  #output "DP-4" {
  #	mode "2560x1440@59.951"
  #	transform "normal"
  #scale 1
  #	position x=1080 y=0
  #}

  #output "HDMI-A-1" {
  #	mode "2560x1080@60.000"
  #	transform "normal"
  #	scale 1
  #	position x=3640 y=0
  #}

  #output "DP-2" {
  #	mode "1920x1080@60.000"
  #	transform "normal"
  #	scale 1
  #	position x=3800 y=-1080
  #}

}
