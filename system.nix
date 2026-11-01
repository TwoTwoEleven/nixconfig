{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # hostname
  networking.networkmanager.enable = true;

  time.timeZone = "America/Phoenix";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable CUPS to print documents.
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
    ];
  };
  hardware.printers = {
    ensureDefaultPrinter = "Epson-ET-3850";
    ensurePrinters = [
      {
        deviceUri = "ipp://192.168.1.8/ipp/print";
        location = "home";
        name = "Epson-ET-3850";
        model = "everywhere";
      }
    ];
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };

  services.mpd = {
    enable = true;
    user = "jimg";
    startWhenNeeded = true;
    settings = {
      #bind_to_address = "127.0.0.1";
      bind_to_address = "/tmp/mpd_socket";
      music_directory = /home/jimg/.backups/Music;
      audio_output = [
        {
          type = "pipewire";
          name = "My PipeWire Output";
        }
        {
          type = "fifo";
          name = "my_fifo";
          path = "/tmp/mpd.fifo";
          format = "44100:16:2";
        }
      ];
    };
  };
  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/1000"; # User-id 1000 must match above user. MPD will look inside this directory for the PipeWire socket.
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  users.users."jimg" = {
    isNormalUser = true;
    description = "jimg";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

}
