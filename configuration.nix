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
  boot.extraModulePackages = [
   config.boot.kernelPackages.v4l2loopback
  ];
  networking.hostName = "thinkpad"; # Define your hostname.
  
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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
  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;
  hardware.opengl.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };
  services.blueman.enable = true;
  services.hardware.bolt.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # programs.zsh.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gennadi = {
    # shell = pkgs.zsh;
    isNormalUser = true;
    description = "gennadi";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      bruno
      dbeaver
      firefox
      alacritty
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

  nixpkgs.config.allowUnfree = true;

  environment.variables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    # hyprland stuff start
    rofi-wayland
    wofi
    waybar
    networkmanagerapplet
    # bluez
    # blueman
    pavucontrol
    gnome.nautilus
    dunst
    nwg-look
    xdg-desktop-portal-gtk
    hyprpaper
    hyprlock
    # hyprland stuff end

	onlyoffice-bin
    libreoffice
	docker-buildx

    # gnome-console

	gnome.dconf-editor
	# gnome.gnome-tweaks

	# gnomeExtensions.blur-my-shell
	# gnomeExtensions.clipboard-history
	# gnomeExtensions.forge
	# gnomeExtensions.gsconnect

	# gnumake
	php83
    python3
    zip
    unzip
  	curl
  	docker
  	git
  	# neovim
  	wl-clipboard
    wget
    cargo
  ];

# environment.gnome.excludePackages = (with pkgs; [
#     gnome-photos
#     gnome-tour
# ]) ++ (with pkgs.gnome; [
#     cheese # webcam tool
#     gnome-music
#     gnome-software
#     #gnome-terminal
#     #gedit # text editor
#     #epiphany # web browser
#     geary # email reader
#     #evince # document viewer
#     #gnome-characters
#     totem # video player
#     tali # poker game
#     iagno # go game
#     hitori # sudoku game
#     atomix # puzzle game
#     yelp # help
# ]);

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.fish.enable = true;

  programs.steam.enable = true;

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

