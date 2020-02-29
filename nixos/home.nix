{ config, lib, pkgs, ... }:
{
	nixpkgs.overlays = [
		(import (builtins.fetchTarball {
			 url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
			 }))
		(import (builtins.fetchTarball {
			 url = https://github.com/colemickens/nixpkgs-wayland/archive/master.tar.gz;
			 }))
	];
	programs.home-manager =  {
		enable = true;
		path = "...";
	};
	programs.emacs = {
		enable = true;
		package = pkgs.emacsGit;
	};
	services.emacs.enable = true;
	home.packages = with pkgs; [
		kotatogram-desktop
		gopass
		kitty
		rofi
		qutebrowser
		vim

		# rust userutils
		cargo
		rustc
		bat
		exa
	];
	services.random-background = {
		enable = true;
		imageDirectory = "%h/images/wallpapers";
	};
	home.stateVersion = "19.09";
	home.keyboard = {
		layout = "us";
		variant = "dvp";
		options = ["ctrl:nocaps"];
	};
	xsession.scriptPath = ".hm-xsession";
	wayland.windowManager.sway = {
		enable = true;
		extraConfig = ''
			input * xkb_layout "us"
			input * xkb_variant "dvp"
			input * xkb_options "ctrl:nocaps"
			default_border pixel 0
			'';
		config = {
			bars = [ { position = "top"; } ];
			terminal = "kitty";
			window.border = 0;
			modifier = "Mod4";
			keybindings = let
				mod = "Mod4";
			launcher = "${pkgs.rofi}/bin/rofi -show run";
			in lib.mkOptionDefault {
				"${mod}+p" = "exec --no-startup-id ${launcher}";
				"${mod}+ampersand" = "workspace number 1";
				"${mod}+bracketleft" = "workspace number 2";
				"${mod}+braceleft" = "workspace number 3";
				"${mod}+braceright" = "workspace number 4";
				"${mod}+parenleft" = "workspace number 5";
				"${mod}+equal" = "workspace number 6";
				"${mod}+asterisk" = "workspace number 7";
				"${mod}+parenright" = "workspace number 8";
				"${mod}+plus" = "workspace number 9";
			};
		};
	};
}
