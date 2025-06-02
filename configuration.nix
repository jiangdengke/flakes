{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
#	users.users.jdk.isNormalUser = true;
  programs.zsh.enable = true;

  users.users.jdk = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # 启用sudo权限
    # 其他用户设置...
  };
  services.daed = {
      enable = true;

      openFirewall = {
        enable = true;
        port = 12345;
      };

      /* default options

      package = inputs.daeuniverse.packages.x86_64-linux.daed;
      configDir = "/etc/daed";
      listen = "127.0.0.1:2023";

      */
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.jdk = import ./home;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking = {
    wireless.enable = false;
    wireless.iwd.enable = true;
  	hostName = "MyNixOS";
	networkmanager = {
		enable = true;
	};
  };
  i18n = {
	defaultLocale = "zh_CN.UTF-8";

	inputMethod = {
		enable = true;
		type = "fcitx5";
		fcitx5.addons = with pkgs; [
            fcitx5-rime
            fcitx5-chinese-addons
            fcitx5-table-extra
            fcitx5-pinyin-moegirl
            fcitx5-pinyin-zhwiki
		];
	};
  };
  fonts = {
  	enableDefaultPackages = true;
	packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-emoji
		noto-fonts-extra
		jetbrains-mono
		wqy_microhei
		wqy_zenhei
		xorg.fontadobe75dpi
	];

  };
  time.timeZone = "Asia/Shanghai";


  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  environment.systemPackages = with pkgs; [

    git

    firefox
    chromium
    localsend
    discord
    vlc
    alacritty
    qbittorrent
    neofetch
    fastfetch
    daed
    neovim





    networkmanager
    pulseaudio
    sof-firmware
    alsa-firmware
    alsa-ucm-conf
    alsa-utils
    pavucontrol

  ];
  environment.variables.EDITOR = "nvim";
nix.settings.substituters = [
	"https://mirrors.cernet.edu.cn/nix-channels/store"
];
  system.stateVersion = "25.11"; # Did you read the comment?

}

