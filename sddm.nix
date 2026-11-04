{ pkgs, ... }:

let
  custom-sddm-astronaut =
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "astronaut";
      themeConfig = {
        # https://github.com/Keyitdev/sddm-astronaut-theme/blob/master/Themes/astronaut.conf
        Background = "Backgrounds/NixSnowy.jpg";
        FormPosition = "left";
        PartialBlur = "false";
        FullBlur = "false";
      };
    }).overrideAttrs
      (oldAttrs: {
        # Optional: Inject custom background image
        installPhase = oldAttrs.installPhase + ''
          chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
          cp ${./images/NixSnowy.jpg} \
            $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/NixSnowy.jpg
        '';
      });
in
{
  environment.systemPackages = [ custom-sddm-astronaut ];

  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
    extraPackages = [ custom-sddm-astronaut ];
  };
}
