# Personnel Computer Config 
# Chih-Kang Huang
# 26/02/2015

{ config, lib, pkgs, ... }:

with lib;

{

  imports = [
	# Include the results of the hardware scan.
	./hardware-configuration.nix
  ];



  ##### Boot #####
  boot.loader.grub = {
	enable = true;
	version = 2;
	device = "/dev/sda";
  # Define on which hard drive you want to install Grub. Set to "nodev" to
  # not install it to the MBR at all, but only install the boot menu. This is
  # handy if you have NixOS installed on a USB stick that gets a different
  # device name when you plug it in different ports or on different machines.
  # Then you install using "/dev/..." and set it to "nodev"
  };


  ##### Networking #####
  networking = {
	hostName = "nixos";
	networkmanager.enable = true;
  };
  

  ##### Users #####


  ##### TimeZone #####
  time.timeZone = "Europe/Paris";


  ##### Internationalisation #####
  i18n = {
	defaultLocale = "fr_FR.UTF-8";
	consoleKeyMap = "azerty/fr";
	consoleFont = "ter-v32n";
  };

  ##### /etc/locale.conf 
  ###environment.etc = singleton {
  ###	target = "locale.conf";
  ###	source = pkgs.writeText "locale.conf"
  ###	   ''
  ###		LANG=${config.i18n.defaultLocale}
  ###	   '';
  ###};

  

  ##### Xserver #####
  services.xserver = {
	enable = true;
	layout = "fr";
	desktopManager.default = "none";
	desktopManager.xterm.enable = false;
	windowManager.default = "xmonad";
	windowManager.xmonad.enable = true;
	windowManager.xmonad.enableContribAndExtras = true;
  };


  ##### OpenSSh #####
  services.openssh.enable = true;


  ##### Packages config #####
  nixpkgs.config = {
	allowUnfree = true;
	firefox.enableAdobeFlash = true;
  	##chromium.enablePepperFlash = true;
  };


  ##### Audio Settings #####
  hardware.pulseaudio.enable = true;

  ##### SystemPackages #####
  environment.systemPackages = with pkgs; [
	ascii
  	##chromium
	dmenu
	htop
	firefox
	firefoxWrapper
	git
	ibus
	iw
	manpages  ## for "man 2 fork" etc.
	networkmanager
	rxvt_unicode
	vim
	vlc
	wget
	wpa_supplicant
	zsh
  ];
	


  ##### Fonts #####
  fonts = {
	enableCoreFonts = true;
	enableFontDir = true;
	fonts = [
	  #pkgs.cantarell_fonts
	  pkgs.dejavu_fonts
	  #pkgs.dosemu_fonts
	  #pkgs.freefont_ttf
	  #pkgs.liberation_ttf
	  pkgs.terminus_font
	  #pkgs.ubuntu_font_family
	  #pkgs.ucsFonts
	  #pkgs.unifont
	  #pkgs.vistafonts
	  pkgs.wqy_microhei
	  pkgs.wqy_zenhei
	  #pkgs.xlibs.fontadobe100dpi
	  #pkgs.xlibs.fontadobe75dpi
	  #pkgs.xlibs.fontadobeutopia100dpi
	  #pkgs.xlibs.fontadobeutopia75dpi
	  #pkgs.xlibs.fontadobeutopiatype1
	  #pkgs.xlibs.fontarabicmisc
	  #pkgs.xlibs.fontbh100dpi
	  #pkgs.xlibs.fontbh75dpi
	  #pkgs.xlibs.fontbhlucidatypewriter100dpi
	  #pkgs.xlibs.fontbhlucidatypewriter75dpi
	  #pkgs.xlibs.fontbhttf
	  #pkgs.xlibs.fontbhtype1
	  #pkgs.xlibs.fontbitstream100dpi
	  #pkgs.xlibs.fontbitstream75dpi
	  #pkgs.xlibs.fontbitstreamtype1
	  #pkgs.xlibs.fontcronyxcyrillic
	  #pkgs.xlibs.fontcursormisc
	  #pkgs.xlibs.fontdaewoomisc
	  #pkgs.xlibs.fontdecmisc
	  #pkgs.xlibs.fontibmtype1
	  #pkgs.xlibs.fontisasmisc
	  #pkgs.xlibs.fontjismisc
	  #pkgs.xlibs.fontmicromisc
	  #pkgs.xlibs.fontmisccyrillic
	  #pkgs.xlibs.fontmiscethiopic
	  #pkgs.xlibs.fontmiscmeltho
	  #pkgs.xlibs.fontmiscmisc
	  #pkgs.xlibs.fontmuttmisc
	  #pkgs.xlibs.fontschumachermisc
	  #pkgs.xlibs.fontscreencyrillic
	  #pkgs.xlibs.fontsonymisc
	  #pkgs.xlibs.fontsunmisc
	  #pkgs.xlibs.fontwinitzkicyrillic
	  #pkgs.xlibs.fontxfree86type1
	];
  };
}
