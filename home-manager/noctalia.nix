{ lib, ... }:

{
  programs.noctalia = {
    enable = true;
    settings = {
      weather = {
        unit = "imperial";
      };

      calendar = {
        enabled = true;

        account.personal = {
          type = "google";
        };
      };

      keybinds = {
        delete = [
          "Delete"
          "KP_Delete"
        ];
      };

      location.address = "Apache Junction, AZ";

      desktop_widgets = {
        schema_version = 2;
        widget_order = [
          "desktop-widget-0000000000000001"
          "desktop-widget-0000000000000002"
        ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget.desktop-widget-0000000000000001 = {
          box_height = 192.0;
          box_width = 464.0;
          cx = 1576.0;
          cy = 508.0;
          output = "DP-2";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "clock";
          settings = {
            background = false;
            clock_style = "digital";
          };
        };
        widget.desktop-widget-0000000000000002 = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 1580.0;
          cy = 844.0;
          output = "DP-2";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "calendar";
          settings = {
            background = false;
            font_family = "FiraCode Nerd Font";
          };
        };
      };

      lockscreen_widgets = {
        enabled = false;
        schema_version = 2;
        widget_order = [
          "lockscreen-login-box@HDMI-A-1"
          "lockscreen-login-box@DP-2"
          "lockscreen-login-box@HDMI-A-2"
          "lockscreen-login-box@DP-4"
        ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };

        widget."lockscreen-login-box@DP-2" = {
          box_height = 196.0;
          box_width = 810.0;
          cx = 960.0;
          cy = 898.0;
          output = "DP-2";
          placement_height = 1080.0;
          placement_width = 1920.0;
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };

        widget."lockscreen-login-box@DP-4" = {
          box_height = 196.0;
          box_width = 810.0;
          cx = 1280.0;
          cy = 1258.0;
          output = "DP-4";
          placement_height = 1440.0;
          placement_width = 2560.0;
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };

        widget."lockscreen-login-box@HDMI-A-1" = {
          box_height = 196.0;
          box_width = 810.0;
          cx = 1280.0;
          cy = 898.0;
          output = "HDMI-A-1";
          placement_height = 1080.0;
          placement_width = 2560.0;
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };

        widget."lockscreen-login-box@HDMI-A-2" = {
          box_height = 196.0;
          box_width = 810.0;
          cx = 540.0;
          cy = 1738.0;
          output = "HDMI-A-2";
          placement_height = 1920.0;
          placement_width = 1080.0;
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };
      };

      idle = {
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];
        behavior = {
          lock = {
            action = "lock";
            enabled = false;
            timeout = 600.0;
          };
          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = false;
            timeout = 900.0;
          };
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 660.0;
          };
        };
      };

      theme = {
        community_palette = "Ayu Blue";
        mode = "dark";
        source = "community";
      };

      wallpaper = {
        directory = "/home/jimg/Pictures/Wallpaper";
        fill_mode = "center";
        default.path = "/home/jimg/Pictures/Wallpaper/nix-dark.png";
        last.path = "/home/jimg/Pictures/Wallpaper/nix-dark.png";
        monitors = {
          DP-2.path = "/home/jimg/Pictures/Wallpaper/nix-dark.png";
          DP-4.path = "/home/jimg/Pictures/Wallpaper/nix-dark.png";
          HDMI-A-1.path = "/home/jimg/Pictures/Wallpaper/nix-dark.png";
          HDMI-A-2.path = "/home/jimg/Pictures/Wallpaper/nix-dark.png";
        };
      };
    };
  };
}
