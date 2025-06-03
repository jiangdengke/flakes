{ config, pkgs, lib, ... }:

{
  # 用户和组设置
  users.mutableUsers = false;

  # 默认用户配置在 hosts/mySystem.nix 中定义
}