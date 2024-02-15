{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    userSettings = {
      "glassit.alpha" = 225;
    };

    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      angular.ng-template
      (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
        mktplcRef = {
          publisher = "s-nlf-fh";
          name = "glassit";
          version = "0.2.6";
          sha256 = "sha256-LcAomgK91hnJWqAW4I0FAgTOwr8Kwv7ZhvGCgkokKuY=";
        };
      })
    ];

    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
  };
}
