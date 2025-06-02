{ config, lib, pkgs, ... }:

{
  config = {
    # 安装JetBrains Mono Nerd Font
    home.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];

    # 启用Kitty终端
    programs.kitty = {
      enable = true;
      settings = {
        shell = "/etc/profiles/per-user/jdk/bin/zsh";
      };
      # 方式1: 使用xdg.configFile链接外部配置文件
      # 使用这种方式时, Home Manager不会自动生成kitty.conf
    };

    # 链接外部的kitty.conf文件到Home Manager管理的配置目录
    xdg.configFile."kitty/kitty.conf".source = ./kitty.conf;

    # 注意：确保kitty.conf文件与kitty.nix位于同一目录下
    # 或者指定完整路径，如：
    # xdg.configFile."kitty/kitty.conf".source = /path/to/your/kitty.conf;
  };
}
