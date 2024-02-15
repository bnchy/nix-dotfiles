{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-index-database.hmModules.nix-index
  ];

  home.packages = [pkgs.comma];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    bash = {
      enable = true;
      shellAliases = {
        snrs = "sudo nixos-rebuild switch --flake /etc/nixos";
      };
    };
  };
}
