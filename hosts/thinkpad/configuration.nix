{ config, pkgs, pkgs-unstable, inputs, ... }:
{
  imports = [
      ./hardware-configuration.nix
      ../../modules/usb.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.kernelParams = [ "reboot=acpi" ];
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
  services.xserver.videoDrivers = [ "amdgpu" ];

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
   # vulkan
  # hardware.driSupport.enable = true;
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
  services.power-profiles-daemon.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };

  services.blueman.enable = true;

  # thunderbolt
  services.hardware.bolt.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  users.users.gennadi = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "gennadi";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      # inputs.neovim-nightly
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.variables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [

    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default

    rofi-wayland
    wofi
    waybar
    networkmanagerapplet
    cliphist
    pavucontrol
    brightnessctl
    playerctl
    gnome.nautilus
    dunst
    nwg-look
    # xdg-desktop-portal-gtk

    pkgs-unstable.hyprpaper
    pkgs-unstable.hyprlock
    pkgs-unstable.hypridle
    pkgs-unstable.hyprshot

	  onlyoffice-bin
    libreoffice
	  docker-buildx

	  gnome.dconf-editor
    fastfetch

    gnumake
	  php
    python3
    zip
    unzip
  	curl
  	# docker
  	git
  	wl-clipboard
    wget
    cargo
  ];

  programs.mtr.enable = true;
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

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = false;
      setSocketVariable = true;
    };
  };
}

