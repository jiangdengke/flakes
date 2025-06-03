{ config, pkgs, lib, ... }:

{
  # QQ 配置
  home.packages = with pkgs; [
    qq
    # 或使用其他QQ客户端
  ];
}