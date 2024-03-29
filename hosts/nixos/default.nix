{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ../common
    ./hardware.nix
    ./greetd.nix
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
      nixosConfig = config;
    };
    users.bnch = import ../../home/bnch;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [xdg-desktop-portal-gtk xdg-desktop-portal-wlr];
  };

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  nixpkgs.config.allowUnfree = true;

  security.sudo.wheelNeedsPassword = false;
  security.pam.services.swaylock = {};

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  console = {
    #   font = "Lat2-Terminus16";
    keyMap = "be-latin1";
    #   useXkbConfig = true; # use xkb.options in tty.
  };

  programs.dconf.enable = true;
  programs.light.enable = true;
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse.enable = true;
    jack.enable = true;
  };
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bnch = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
    #   packages = with pkgs; [
    #     firefox
    #     tree
    #   ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #   wget
    gnomeExtensions.tiling-assistant
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
