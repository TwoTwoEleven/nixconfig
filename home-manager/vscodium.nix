{ lib, ... }:

{
  programs.vscodium = {
    enable = true;
    mutableExtensionsDir = true;

    profiles.default = {
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

  #   {
  #   "nix.serverPath": "nixd",
  #   "nix.enableLanguageServer": true,
  #   "nix.formatterPath": "nixfmt",
  #   // LSP config can be passed via the ``nix.serverSettings.{lsp}`` as shown below.
  #   "nix.serverSettings": {
  #     // check https://github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md for all nixd config
  #     "nixd": {
  #       "formatting": {
  #         "command": ["nixfmt"],
  #       },
  # //      "options": {
  #         // By default, this entry will be read from `import <nixpkgs> { }`.
  #         // You can write arbitrary Nix expressions here, to produce valid "options" declaration result.
  #         // Tip: for flake-based configuration, utilize `builtins.getFlake`
  # //        "nixos": {
  # //          "expr": "(builtins.getFlake \"/etc/nixos\").nixosConfigurations.<name>.options",
  # //        },
  # //        "home-manager": {
  # //          "expr": "(builtins.getFlake \"/home/jimg/.nixconfig\").homeConfigurations.<name>.options",
  # //        },
  # //        // Tip: use ${workspaceFolder} variable to define path
  # //        "nix-darwin": {
  # //          "expr": "(builtins.getFlake \"${workspaceFolder}/path/to/flake\").darwinConfigurations.<name>.options",
  # //        },
  # //      },
  #     }
  #   },
  #   "workbench.iconTheme": "ayu",
  #   "workbench.colorTheme": "Ayu Dark Bordered",
  #   "editor.fontSize": 16,
  #   "editor.fontFamily": "FiraCode Nerd Font",
  #   "editor.fontLigatures": false
  # }

}
