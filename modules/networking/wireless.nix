{ config, pkgs, lib, ... }:

{
  # 无线网络设置
  # 如果您使用 NetworkManager，这部分可能不需要
  networking.wireless.enable = false; # 使用 NetworkManager 时禁用
}