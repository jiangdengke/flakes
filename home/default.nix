{ config, pkgs, lib, username, ... }:

{
  imports = [
    ./modules/apps
    ./modules/desktop
    ./modules/dev
    ./modules/shell
  ];

  # 基本配置
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.11"; # 使用您实际的版本

    # 基本包
    packages = with pkgs; [
      firefox
      git
      # 添加其他用户级包
    ];
  };

  # 允许 Home Manager 管理自身
  programs.home-manager.enable = true;
}