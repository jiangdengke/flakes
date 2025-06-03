{ config, pkgs, lib, ... }:

{
  # 微信配置
  home.packages = with pkgs; [
    wechat-uos
    # 或使用其他微信客户端
  ];
}