{ pkgs, ... }:

let
  custom-sddm-astronaut =
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "astronaut";
      themeConfig = {
        # https://github.com/Keyitdev/sddm-astronaut-theme/blob/master/Themes/astronaut.conf
        # Customize colors and settings
        # HeaderTextColor = "#d5c4a1";
        Background = "Backgrounds/nix-dark.png";
        FormPosition = "left";
        PartialBlur = "";
      };
    }).overrideAttrs
      (oldAttrs: {
        # Optional: Inject custom background image
        installPhase = oldAttrs.installPhase + ''
          chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
          cp ${./images/nix-dark.png} \
            $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/nix-dark.png
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
