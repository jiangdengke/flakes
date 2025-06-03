{ config, pkgs, lib, ... }:

{
  imports = [
    ./qq.nix
    ./wechat.nix
    ./alacritty.nix
    # 添加其他应用程序配置
  ];
}