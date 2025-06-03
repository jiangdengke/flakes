{ config, pkgs, lib, ... }:

{
  imports = [
    ./niri.nix
    # 添加其他桌面环境配置
  ];
}