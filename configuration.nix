{ config, pkgs, inputs, ... }:
let 
    unstable = import <nixos-unstable> {config.allowUnfree = true;};
in {
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "thinkpad"; # Define your hostname.
  
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services.flatpak.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];
  
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gennadi = {
    isNormalUser = true;
    description = "gennadi";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      bruno
      dbeaver
      firefox
      wezterm
      jetbrains.phpstorm
      teams-for-linux
      spotify
      slack
      google-chrome
      _1password-gui
    ];
  };

  home-manager = {
  	extraSpecialArgs = { inherit inputs; };
	users = {
		"gennadi" = import ./home.nix;
	};
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	
	docker-buildx

	gnome.dconf-editor
	gnome.gnome-tweaks
	gnomeExtensions.blur-my-shell
	gnomeExtensions.clipboard-history
	gnomeExtensions.forge
	gnomeExtensions.gsconnect

	gnumake
	php83
  	curl
  	docker
  	git
  	neovim
  	wl-clipboard
        wget
  ];

environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    #gnome-terminal
    #gedit # text editor
    #epiphany # web browser
    geary # email reader
    #evince # document viewer
    #gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
    yelp # help
]);

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
   networking.firewall.allowedTCPPorts = [
     9003 # xdebug
  ];

  system.stateVersion = "23.11"; # Did you read the comment?
  virtualisation.docker.enable = true;
}

