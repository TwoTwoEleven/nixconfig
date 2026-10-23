{ lib, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      format = lib.concatStrings [
        "[](color_bg1)"
        "$os"
        "$username"
        "[](fg:color_bg1 bg:color_fg0)"
        "$directory"
        "[](fg:color_fg0 bg:color_bg1)"
        "$git_branch"
        "$git_status"
        "[](fg:color_bg1 bg:color_fg0)"
        "$cmd_duration"
        "[](fg:color_fg0 bg:color_bg1)"
        "$time"
        "[ ](fg:color_bg1)"
        "$all"
        "$line_break$character"
      ];

      palette = "ayu";
      palettes.ayu = {
        color_fg0 = "#E6C08A";
        color_bg1 = "#3c3836";
        color_bg3 = "#665c54";
        color_blue = "#59C2FF";
        color_blue2 = "#39bae6";
        color_aqua = "#95E6CB";
        color_green = "#AAD94C";
        color_orange = "#FF8F40";
        color_purple = "#d2a6ff";
        color_red = "#f07178";
        color_yellow = "#ffb454";
      };

      os = {
        disabled = false;
        style = "bg:color_bg1 fg:color_fg0";
      };

      username = {
        show_always = true;
        style_user = "bg:color_bg1 fg:color_fg0";
        style_root = "bg:color_bg1 fg:color_fg0";
        format = "[$user ]($style)";
      };

      directory = {
        style = "fg:color_bg1 bg:color_fg0";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      directory.substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = "󰝚 ";
        "Pictures" = " ";
        "Developer" = "󰲋 ";
      };

      git_branch = {
        symbol = " ";
        style = "bg:color_bg1";
        format = "[[ $symbol $branch ](fg:color_fg0 bg:color_bg1)]($style)";
      };

      git_status = {
        style = "bg:color_bg1";
        format = "[[(<$all_status$ahead_behind> )](fg:color_red bold bg:color_bg1)]($style)";
      };

      cmd_duration = {
        style = "bg:color_fg0";
        min_time = 0;
        show_milliseconds = true;
        format = "[[ <($duration>) ](fg:color_bg1 bg:color_fg0)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%T";
        style = "bg:color_bg1";
        format = "[[  $time ](fg:color_fg0 bg:color_bg1)]($style)";
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[➜](bold fg:color_blue)";
        error_symbol = "[✗](bold fg:color_red)";
      };

      aws = {
        symbol = " ";
      };

      azure = {
        symbol = " ";
      };

      battery = {
        full_symbol = "󰁹 ";
        charging_symbol = "󰂄 ";
        discharging_symbol = "󰂃 ";
        unknown_symbol = "󰂑 ";
        empty_symbol = "󰂎 ";
      };

      buf = {
        symbol = " ";
      };

      bun = {
        symbol = " ";
      };

      c = {
        symbol = " ";
      };

      cpp = {
        symbol = " ";
      };

      cmake = {
        symbol = " ";
      };

      cobol = {
        symbol = " ";
      };

      conda = {
        symbol = " ";
      };

      container = {
        symbol = " ";
      };

      crystal = {
        symbol = " ";
      };

      dart = {
        symbol = " ";
      };

      deno = {
        symbol = " ";
      };

      direnv = {
        symbol = " ";
      };

      directory = {
        read_only = " 󰌾";
      };

      docker_context = {
        symbol = " ";
      };

      dotnet = {
        symbol = " ";
      };

      elixir = {
        symbol = " ";
      };

      elm = {
        symbol = " ";
      };

      erlang = {
        symbol = " ";
      };

      fennel = {
        symbol = " ";
      };

      fortran = {
        symbol = " ";
      };

      fossil_branch = {
        symbol = " ";
      };

      gcloud = {
        symbol = "󱇶 ";
      };

      gleam = {
        symbol = " ";
      };

      git_commit = {
        tag_symbol = "  ";
      };

      golang = {
        symbol = " ";
      };

      gradle = {
        symbol = " ";
      };

      guix_shell = {
        symbol = " ";
      };

      haskell = {
        symbol = " ";
      };

      haxe = {
        symbol = " ";
      };

      helm = {
        symbol = " ";
      };

      hg_branch = {
        symbol = " ";
      };

      hostname = {
        ssh_symbol = " ";
      };

      java = {
        symbol = " ";
      };

      jj_bookmark = {
        symbol = " ";
      };

      julia = {
        symbol = " ";
      };

      kotlin = {
        symbol = " ";
      };

      kubernetes = {
        symbol = "󱃾 ";
      };

      lua = {
        symbol = " ";
      };

      maven = {
        symbol = " ";
      };

      memory_usage = {
        symbol = "󰍛 ";
      };

      meson = {
        symbol = "󰔷 ";
      };

      mojo = {
        symbol = "󰈸 ";
      };

      nats = {
        symbol = " ";
      };

      netns = {
        symbol = "󰛳 ";
      };

      nim = {
        symbol = " ";
      };

      nix_shell = {
        symbol = " ";
      };

      nodejs = {
        symbol = " ";
      };

      ocaml = {
        symbol = " ";
      };

      odin = {
        symbol = "󰟢 ";
      };

      opa = {
        symbol = " ";
      };

      openstack = {
        symbol = " ";
      };

      os.symbols = {
        AIX = " ";
        AlmaLinux = " ";
        Alpaquita = " ";
        Alpine = " ";
        ALTLinux = " ";
        Amazon = " ";
        Android = " ";
        AOSC = " ";
        Arch = " ";
        Artix = " ";
        Bazzite = " ";
        Bluefin = " ";
        CachyOS = " ";
        CentOS = " ";
        Debian = " ";
        DragonFly = " ";
        Elementary = " ";
        Emscripten = " ";
        EndeavourOS = " ";
        Fedora = " ";
        FreeBSD = " ";
        Garuda = " ";
        Gentoo = " ";
        HardenedBSD = "󰞌 ";
        Hurd = " ";
        Illumos = " ";
        InstantOS = " ";
        Ios = "󰀷 ";
        Kali = " ";
        KDENeon = " ";
        Linux = " ";
        Mabox = " ";
        Macos = " ";
        Manjaro = " ";
        Mariner = " ";
        MidnightBSD = " ";
        Mint = " ";
        NetBSD = " ";
        NixOS = " ";
        Nobara = " ";
        OpenBSD = " ";
        OpenCloudOS = " ";
        openEuler = " ";
        openSUSE = " ";
        OracleLinux = "󰺡 ";
        PikaOS = " ";
        Pop = " ";
        Raspbian = " ";
        Redhat = "󱄛 ";
        RedHatEnterprise = "󱄛 ";
        Redox = "󰀘 ";
        RockyLinux = " ";
        Solus = " ";
        SUSE = " ";
        Ubuntu = " ";
        Ultramarine = " ";
        Unknown = " ";
        Uos = " ";
        Void = " ";
        Windows = "󰍲 ";
        Zorin = " ";
      };

      package = {
        symbol = "󰏗 ";
      };

      perl = {
        symbol = " ";
      };

      php = {
        symbol = " ";
      };

      pijul_channel = {
        symbol = " ";
      };

      pixi = {
        symbol = "󰏗 ";
      };

      pulumi = {
        symbol = " ";
      };

      purescript = {
        symbol = " ";
      };

      python = {
        symbol = " ";
      };

      raku = {
        symbol = "󱖊 ";
      };

      red = {
        symbol = "󱍼 ";
      };

      rlang = {
        symbol = "󰟔 ";
      };

      ruby = {
        symbol = " ";
      };

      rust = {
        symbol = "󱘗 ";
      };

      scala = {
        symbol = " ";
      };

      shlvl = {
        symbol = "󰹍 ";
      };

      singularity = {
        symbol = " ";
      };

      solidity = {
        symbol = " ";
      };

      spack = {
        symbol = " ";
      };

      status = {
        symbol = " ";
      };

      sudo = {
        symbol = " ";
      };

      swift = {
        symbol = " ";
      };

      terraform = {
        symbol = " ";
      };

      vlang = {
        symbol = " ";
      };

      typst = {
        symbol = " ";
      };

      vagrant = {
        symbol = " ";
      };

      xmake = {
        symbol = " ";
      };

      zig = {
        symbol = " ";
      };
    };
  };
}
