{ config, pkgs, lib, inputs, username, ... }:

{
  imports = [
    # 系统模块
    ../modules/core
    ../modules/users
    ../modules/networking
    ../modules/services
    ../modules/dae
  ];

  # 特定于该主机的配置
  networking.hostName = "MyNixOS";

  # 用户配置
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    shell = pkgs.zsh;
  };

  # niri 窗口管理器
  programs.niri.enable = true;
  xdg.portal.wlr.enable = true;

  # 固定的系统版本标识
  system.stateVersion = "25.11"; # 使用您的实际版本
}