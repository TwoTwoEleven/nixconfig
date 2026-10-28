{ pkgs, lib, ... }:

{
  programs.vscodium = {
    enable = true;
    mutableExtensionsDir = true;

    profiles.default = {
      # extensions = [
      #   pkgs.vscode-extensions.teabyii.ayu
      #   pkgs.vscode-extensions.jnoortheen.nix-ide
      #   pkgs.vscode-extensions.rust-lang.rust-analyzer
      # ];

      keybindings = [
        {
          key = "numpad_decimal";
          command = "deleteRight";
          when = "textInputFocus";
        }
      ];

      userSettings = {
        nix = {
          serverPath = "nixd";
          enableLanguageServer = true;
          formatterPath = "nixfmt";
          serverSettings = {
            "nixd" = {
              "formatting" = {
                command = [ "nixfmt" ];
              };
            };
          };
        };
        workbench = {
          iconTheme = "ayu";
          colorTheme = "Ayu Dark Bordered";
        };
        editor = {
          fontSize = 16;
          fontFamily = "FiraCode Nerd Font";
          fontLigatures = true;
        };
      };
    };
  };
}
