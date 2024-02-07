{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      angular.ng-template
    ];

    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
  };
}
