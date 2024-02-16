{pkgs, config, ...}: {
  programs.vscode = {
    enable = true;

    userSettings = with config.stylix.fonts;{
      "terminal.integrated.fontFamily" = "'${monospace.name}'";
      "editor.fontFamily" = "'${monospace.name}'";
    };

    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      angular.ng-template
    ];

    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
  };
}
