# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  unstableNixosTarball = 
    fetchTarball
      https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
  unstableNixpkgsTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs-channels/archive/nixpkgs-unstable.tar.gz;
in
{
  imports = [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #(import (builtins.fetchTarball https://github.com/rycee/home-manager/archive/release-19.09.tar.gz) {}).nixos
    ];
  nixpkgs.config.allowUnfree = true;
  security.rngd.enable = true;
  hardware.bluetooth.enable = true;
  nixpkgs.config = {
    packageOverrides = pkgs: {
      nixpkgs = import unstableNixpkgsTarball {
        config = config.nixpkgs.config;
      };
      nixos = import unstableNixosTarball {
        config = config.nixos.config;
      };
    };
  };
  i18n.defaultLocale = "en_GB.UTF-8";
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    version = 2;
    efiSupport = true;
    enableCryptodisk = true;
  };
  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/disk/by-uuid/86c1bccf-5f34-4afe-aea3-2584ef11c3f8";
      preLVM = true;
      allowDiscards = true;
    };
  };
  hardware.pulseaudio.enable = true;

  networking.hostName = "memepad"; # Define your hostname.
  networking.networkmanager.enable = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  console = {
    font = "Lat2-Terminus16";
    keyMap = "dvorak-programmer";
  };

  time.timeZone = "Europe/London";

  environment.systemPackages = with pkgs; [
    git
    gnupg


    xorg.xorgserver
    xorg.xf86videointel
  ];

  hardware.bumblebee = {
	  enable = true;
	  connectDisplay = true;
	  pmMethod = "bbswitch";
	  driver = "nouveau";
  };
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "dvp";
    xkbOptions = "ctrl:nocaps";
    libinput.enable = true;
    videoDrivers = [ "intel" ];
    desktopManager = {
	    xterm.enable = false;
    };
    displayManager.sddm.enable = true;
  };
  programs.sway.enable = true;
  hardware.opengl.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}

