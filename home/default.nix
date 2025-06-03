{ config, lib, pkgs, ... }:

{
  imports = [
    ./config
  ];

  home.username = "jdk";
  home.homeDirectory = "/home/jdk";

  xresources.properties = {
    "Xcursor.size" = 14;
    #"Xft.dpi" = 172;
  };
#     modules.fcitx5 = {
#       enable = true;  # 这一行是必须的
#     };
  # programs.zsh.enable = true;
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

}
